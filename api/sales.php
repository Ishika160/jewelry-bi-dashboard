<?php
/**
 * Sales API Endpoint
 * Returns sales data based on filters (daily, monthly, yearly, category)
 */
require_once '../includes/db.php';

header('Content-Type: application/json');

try {
    $action = $_GET['action'] ?? 'overview';
    $data = [];

    switch ($action) {
        case 'overview':
            // High level summary
            $stmt = $pdo->query("SELECT SUM(total_amount) AS revenue, COUNT(*) AS orders, AVG(total_amount) as aov FROM sales");
            $data['summary'] = $stmt->fetch();
            
            // Recent Transactions
            $stmt = $pdo->query("
                SELECT s.invoice_number, s.sale_date, c.customer_name, s.total_amount, s.payment_status, s.payment_method
                FROM sales s
                LEFT JOIN customers c ON s.customer_id = c.customer_id
                ORDER BY s.sale_date DESC, s.sale_id DESC
                LIMIT 15
            ");
            $data['transactions'] = $stmt->fetchAll();
            break;

        case 'monthly':
            // Monthly Trend
            $stmt = $pdo->query("
                SELECT sale_month, total_revenue, total_orders 
                FROM v_sales_summary 
                ORDER BY sale_year, sale_month_num
            ");
            $data['monthly_trend'] = $stmt->fetchAll();
            break;
            
        case 'category':
            // Category Performance
            $stmt = $pdo->query("
                SELECT c.category_name, SUM(si.total_price) as revenue, SUM(si.quantity) as units
                FROM sale_items si
                JOIN categories c ON si.product_id = c.category_id
                GROUP BY c.category_id
                ORDER BY revenue DESC
            ");
            $data['category_performance'] = $stmt->fetchAll();
            break;

        default:
            throw new Exception("Invalid action specified.");
    }

    echo json_encode([
        'success' => true,
        'data' => $data,
        'message' => 'Sales data loaded successfully'
    ]);

} catch (Exception $e) {
    http_response_code(500);
    echo json_encode([
        'success' => false,
        'message' => $e->getMessage(),
        'data' => null
    ]);
}
