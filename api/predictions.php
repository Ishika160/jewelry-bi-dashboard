<?php
require_once '../includes/db.php';
header('Content-Type: application/json');

try {
    $stmt = $pdo->query("
        SELECT 
            df.forecast_month, 
            p.product_name, 
            p.sku, 
            c.category_name,
            i.quantity_in_stock,
            df.predicted_sales_qty,
            df.confidence_score,
            (df.predicted_sales_qty - i.quantity_in_stock) as shortage_risk
        FROM demand_forecasts df
        JOIN products p ON df.product_id = p.product_id
        JOIN categories c ON p.category_id = c.category_id
        LEFT JOIN inventory i ON p.product_id = i.product_id
        ORDER BY shortage_risk DESC
    ");
    $predictions = $stmt->fetchAll();

    echo json_encode([
        'success' => true,
        'data' => $predictions
    ]);
} catch (Exception $e) {
    http_response_code(500);
    echo json_encode(['success' => false, 'message' => $e->getMessage()]);
}
