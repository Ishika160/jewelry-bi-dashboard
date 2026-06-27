<?php
/**
 * Dashboard API Endpoint
 * Returns KPI data and chart data for the dashboard
 */

require_once '../includes/db.php';

header('Content-Type: application/json');

try {
    $data = [
        'kpis' => [],
        'charts' => []
    ];

    // 1. KPIs
    // Total Revenue
    $stmt = $pdo->query("SELECT SUM(total_amount) AS total FROM sales");
    $data['kpis']['total_revenue'] = (float)$stmt->fetchColumn() ?: 0;

    // Total Orders
    $stmt = $pdo->query("SELECT COUNT(*) AS total FROM sales");
    $data['kpis']['total_orders'] = (int)$stmt->fetchColumn();

    // Total Customers
    $stmt = $pdo->query("SELECT COUNT(*) AS total FROM customers");
    $data['kpis']['total_customers'] = (int)$stmt->fetchColumn();

    // Inventory Value
    $stmt = $pdo->query("SELECT SUM(stock_value) AS total FROM v_inventory_status");
    $data['kpis']['inventory_value'] = (float)$stmt->fetchColumn() ?: 0;
    
    // Gross Profit (Total Revenue - Total Cost Price of sold items)
    $stmt = $pdo->query("
        SELECT 
            SUM(si.total_price) - SUM(si.quantity * p.cost_price) AS gross_profit
        FROM sale_items si
        JOIN products p ON si.product_id = p.product_id
    ");
    $data['kpis']['gross_profit'] = (float)$stmt->fetchColumn() ?: 0;
    
    // Net Profit (Assume 50% of Gross Profit goes to operational expenses)
    $data['kpis']['net_profit'] = $data['kpis']['gross_profit'] * 0.50;
    
    // Monthly Growth (Current Month vs Previous Month)
    $stmt = $pdo->query("
        SELECT 
            SUM(CASE WHEN MONTH(sale_date) = MONTH(CURDATE()) AND YEAR(sale_date) = YEAR(CURDATE()) THEN total_amount ELSE 0 END) AS curr_month,
            SUM(CASE WHEN MONTH(sale_date) = MONTH(DATE_SUB(CURDATE(), INTERVAL 1 MONTH)) AND YEAR(sale_date) = YEAR(DATE_SUB(CURDATE(), INTERVAL 1 MONTH)) THEN total_amount ELSE 0 END) AS prev_month
        FROM sales
        WHERE sale_date >= DATE_SUB(DATE_FORMAT(CURDATE() ,'%Y-%m-01'), INTERVAL 1 MONTH)
    ");
    $growth = $stmt->fetch();
    $curr = (float)$growth['curr_month'];
    $prev = (float)$growth['prev_month'];
    $data['kpis']['monthly_growth'] = $prev > 0 ? round((($curr - $prev) / $prev) * 100, 2) : 100.0;

    // 2. Charts
    // Monthly Revenue Trend
    $stmt = $pdo->query("
        SELECT sale_month, total_revenue 
        FROM v_sales_summary 
        ORDER BY sale_year, sale_month_num
        LIMIT 12
    ");
    $data['charts']['monthly_revenue'] = $stmt->fetchAll();

    // Category-wise Sales
    $stmt = $pdo->query("
        SELECT 
            c.category_name, 
            SUM(si.total_price) AS total_revenue
        FROM sale_items si
        JOIN products p ON si.product_id = p.product_id
        JOIN categories c ON p.category_id = c.category_id
        GROUP BY c.category_id
        ORDER BY total_revenue DESC
    ");
    $data['charts']['category_sales'] = $stmt->fetchAll();

    // Payment Methods
    $stmt = $pdo->query("
        SELECT payment_method, COUNT(*) AS count
        FROM sales
        GROUP BY payment_method
    ");
    $data['charts']['payment_methods'] = $stmt->fetchAll();

    // 3. Tables / Lists
    // Recent Sales (Last 5 transactions)
    $stmt = $pdo->query("
        SELECT s.invoice_number, s.sale_date, c.customer_name, s.total_amount, s.payment_status
        FROM sales s
        LEFT JOIN customers c ON s.customer_id = c.customer_id
        ORDER BY s.sale_date DESC, s.sale_id DESC
        LIMIT 5
    ");
    $data['tables']['recent_sales'] = $stmt->fetchAll();

    // Top Products
    $stmt = $pdo->query("
        SELECT product_name, units_sold, total_revenue 
        FROM v_product_performance 
        ORDER BY units_sold DESC 
        LIMIT 5
    ");
    $data['tables']['top_products'] = $stmt->fetchAll();

    echo json_encode([
        'success' => true,
        'data' => $data,
        'message' => 'Dashboard data loaded successfully',
        'timestamp' => date('Y-m-d\TH:i:s\Z')
    ]);

} catch (Exception $e) {
    http_response_code(500);
    echo json_encode([
        'success' => false,
        'message' => $e->getMessage(),
        'data' => null
    ]);
}
