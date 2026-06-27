<?php
/**
 * CSV Export Handler
 */
require_once '../../includes/db.php';

$type = $_GET['type'] ?? '';

if (!in_array($type, ['sales', 'inventory', 'customers'])) {
    die("Invalid report type");
}

$filename = "JewelryBI_{$type}_Report_" . date('Ymd_His') . ".csv";

// Headers for download
header('Content-Type: text/csv; charset=utf-8');
header("Content-Disposition: attachment; filename=\"$filename\"");
header('Pragma: no-cache');
header('Expires: 0');

$output = fopen('php://output', 'w');

if ($type === 'sales') {
    fputcsv($output, ['Invoice Number', 'Sale Date', 'Customer Name', 'Payment Method', 'Payment Status', 'Subtotal', 'Tax Amount', 'Total Amount']);
    
    $stmt = $pdo->query("
        SELECT s.invoice_number, s.sale_date, c.customer_name, s.payment_method, s.payment_status, 
               s.subtotal, s.tax_amount, s.total_amount
        FROM sales s
        LEFT JOIN customers c ON s.customer_id = c.customer_id
        ORDER BY s.sale_date DESC
    ");
    
    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
        fputcsv($output, $row);
    }
}
elseif ($type === 'inventory') {
    fputcsv($output, ['Product ID', 'SKU', 'Product Name', 'Category', 'Quantity in Stock', 'Reorder Level', 'Selling Price', 'Stock Value', 'Status']);
    
    $stmt = $pdo->query("SELECT * FROM v_inventory_status ORDER BY quantity_in_stock ASC");
    
    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
        fputcsv($output, $row);
    }
}
elseif ($type === 'customers') {
    fputcsv($output, ['Customer Code', 'Customer Name', 'City', 'Type', 'Total Orders', 'Total Spent', 'Avg Order Value', 'First Purchase', 'Last Purchase']);
    
    $stmt = $pdo->query("SELECT * FROM v_customer_value ORDER BY total_spent DESC");
    
    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
        // Remove customer_id from output array (it's the first col in view)
        unset($row['customer_id'], $row['gender'], $row['customer_lifespan_days']); 
        fputcsv($output, $row);
    }
}

fclose($output);
exit;
