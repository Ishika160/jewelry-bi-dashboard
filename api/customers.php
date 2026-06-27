<?php
/**
 * Customers API Endpoint
 */
require_once '../includes/db.php';

header('Content-Type: application/json');

try {
    $action = $_GET['action'] ?? 'overview';
    $data = [];

    switch ($action) {
        case 'overview':
            // High level summary
            $stmt = $pdo->query("
                SELECT 
                    COUNT(*) as total_customers,
                    SUM(CASE WHEN customer_type = 'VIP' THEN 1 ELSE 0 END) as vip_customers,
                    SUM(CASE WHEN customer_type = 'Premium' THEN 1 ELSE 0 END) as premium_customers
                FROM customers
            ");
            $summary = $stmt->fetch();
            
            $stmt2 = $pdo->query("SELECT AVG(avg_order_value) as average_clv FROM v_customer_value WHERE avg_order_value > 0");
            $summary['average_clv'] = $stmt2->fetchColumn();
            $data['summary'] = $summary;

            // Customer Segments (VIP, Premium, Regular)
            $stmt = $pdo->query("
                SELECT customer_type as segment, COUNT(*) as count 
                FROM customers 
                GROUP BY customer_type
            ");
            $data['segments'] = $stmt->fetchAll();

            // Customer List with Favorite Metal Calculation
            $stmt = $pdo->query("
                SELECT c.customer_code, c.customer_name, c.city, c.customer_type, 
                       cv.total_orders, cv.total_spent,
                       (
                           SELECT p.metal_type 
                           FROM sale_items si
                           JOIN sales s ON si.sale_id = s.sale_id
                           JOIN products p ON si.product_id = p.product_id
                           WHERE s.customer_id = c.customer_id
                           GROUP BY p.metal_type
                           ORDER BY COUNT(*) DESC
                           LIMIT 1
                       ) as favorite_metal
                FROM customers c
                LEFT JOIN v_customer_value cv ON c.customer_id = cv.customer_id
                ORDER BY cv.total_spent DESC
                LIMIT 50
            ");
            $data['customers'] = $stmt->fetchAll();
            break;

        default:
            throw new Exception("Invalid action specified.");
    }

    echo json_encode([
        'success' => true,
        'data' => $data
    ]);

} catch (Exception $e) {
    http_response_code(500);
    echo json_encode(['success' => false, 'message' => $e->getMessage()]);
}
