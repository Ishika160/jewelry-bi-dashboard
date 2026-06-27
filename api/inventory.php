<?php
/**
 * Inventory API Endpoint
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
                    COUNT(*) as total_products,
                    SUM(quantity_in_stock) as total_items,
                    SUM(stock_value) as total_value
                FROM v_inventory_status
            ");
            $data['summary'] = $stmt->fetch();
            
            // Full inventory list
            $stmt = $pdo->query("
                SELECT * FROM v_inventory_status
                ORDER BY quantity_in_stock ASC
            ");
            $data['inventory'] = $stmt->fetchAll();
            
            // Stock Status Distribution for pie chart
            $stmt = $pdo->query("
                SELECT stock_status, COUNT(*) as count 
                FROM v_inventory_status 
                GROUP BY stock_status
            ");
            $data['status_distribution'] = $stmt->fetchAll();
            break;

        case 'deadstock':
            // Products not sold in 90+ days
            $stmt = $pdo->query("
                SELECT p.product_name, p.sku, c.category_name, i.quantity_in_stock, 
                       vpp.last_sold_date, vpp.days_since_last_sale
                FROM products p
                JOIN categories c ON p.category_id = c.category_id
                JOIN inventory i ON p.product_id = i.product_id
                LEFT JOIN v_product_performance vpp ON p.product_id = vpp.product_id
                WHERE i.quantity_in_stock > 0 
                AND (vpp.days_since_last_sale > 90 OR vpp.days_since_last_sale IS NULL)
                ORDER BY vpp.days_since_last_sale DESC, i.quantity_in_stock DESC
            ");
            $data['deadstock'] = $stmt->fetchAll();
            break;
            
        case 'restock':
            // Products below reorder level
            $stmt = $pdo->query("
                SELECT p.product_name, p.sku, c.category_name, i.quantity_in_stock, i.reorder_level,
                       (i.reorder_level * 2) - i.quantity_in_stock AS recommended_quantity
                FROM products p
                JOIN categories c ON p.category_id = c.category_id
                JOIN inventory i ON p.product_id = i.product_id
                WHERE i.quantity_in_stock <= i.reorder_level
                ORDER BY i.quantity_in_stock ASC
            ");
            $data['restock'] = $stmt->fetchAll();
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
