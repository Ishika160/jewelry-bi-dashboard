import mysql.connector
from mysql.connector import Error
import numpy as np
from sklearn.linear_model import LinearRegression
import sys
import datetime
import os

# Get DB Port (DDEV exposed port on host)
# Using sys.argv if provided, else default to standard 3306
host = '127.0.0.1'
port = sys.argv[1] if len(sys.argv) > 1 else '3306'

try:
    print(f"Connecting to MySQL at {host}:{port}...")
    connection = mysql.connector.connect(
        host=host,
        port=port,
        database='db',
        user='db',
        password='db'
    )
    
    if connection.is_connected():
        print("Successfully connected to the database")
        cursor = connection.cursor(dictionary=True)
        
        # 1. Get all products that have sales history
        cursor.execute("""
            SELECT p.product_id, p.product_name 
            FROM products p
            JOIN sale_items si ON p.product_id = si.product_id
            GROUP BY p.product_id
        """)
        products = cursor.fetchall()
        
        # Clear old forecasts
        cursor.execute("TRUNCATE TABLE demand_forecasts")
        connection.commit()
        
        # Target month is the next month
        today = datetime.date.today()
        if today.month == 12:
            target_month = f"{today.year + 1}-01"
        else:
            target_month = f"{today.year}-{today.month + 1:02d}"
            
        print(f"Generating predictions for {target_month} using Linear Regression...")
        
        forecast_count = 0
        
        for product in products:
            pid = product['product_id']
            
            # Fetch monthly sales for this product
            cursor.execute("""
                SELECT 
                    DATE_FORMAT(s.sale_date, '%Y-%m') as sale_month,
                    SUM(si.quantity) as total_qty
                FROM sales s
                JOIN sale_items si ON s.sale_id = si.sale_id
                WHERE si.product_id = %s
                GROUP BY sale_month
                ORDER BY sale_month ASC
            """, (pid,))
            
            history = cursor.fetchall()
            
            if len(history) < 2:
                # Not enough data for regression, just use the last month's qty or 1
                pred_qty = history[0]['total_qty'] if len(history) == 1 else 1
                confidence = 0.50
            else:
                # Prepare data for sklearn LinearRegression
                # X = time index (0, 1, 2, ...), y = total_qty
                X = np.array(range(len(history))).reshape(-1, 1)
                y = np.array([row['total_qty'] for row in history])
                
                model = LinearRegression()
                model.fit(X, y)
                
                # Predict for the next time index
                next_index = np.array([[len(history)]])
                pred = model.predict(next_index)[0]
                
                # Can't predict negative demand, and round up to whole unit
                pred_qty = max(1, int(round(pred)))
                
                # Basic confidence score based on R^2
                r2 = model.score(X, y) if len(history) > 2 else 0.60
                # Clamp confidence between 0.3 and 0.95 for realism
                confidence = max(0.30, min(0.95, r2))
                
            # Insert prediction
            cursor.execute("""
                INSERT INTO demand_forecasts (product_id, forecast_month, predicted_sales_qty, confidence_score)
                VALUES (%s, %s, %s, %s)
            """, (pid, target_month, pred_qty, confidence))
            
            forecast_count += 1
            
        connection.commit()
        print(f"Successfully generated {forecast_count} AI demand predictions!")
        
except Error as e:
    print(f"Error while connecting to MySQL: {e}")
finally:
    if 'connection' in locals() and connection.is_connected():
        cursor.close()
        connection.close()
        print("MySQL connection is closed")
