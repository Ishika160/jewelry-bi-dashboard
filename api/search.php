<?php
/**
 * Global Search API Endpoint
 * Searches across products, customers, and sales
 */
require_once '../includes/db.php';

header('Content-Type: application/json');

$query = trim($_GET['q'] ?? '');

if (strlen($query) < 2) {
    echo json_encode(['success' => true, 'results' => [], 'total' => 0]);
    exit;
}

$searchTerm = "%{$query}%";
$results = [];

try {
    // 1. Search Products
    $stmt = $pdo->prepare("
        SELECT p.product_id, p.product_name, p.sku, c.category_name, p.selling_price
        FROM products p
        JOIN categories c ON p.category_id = c.category_id
        WHERE p.product_name LIKE ? OR p.sku LIKE ? OR c.category_name LIKE ?
        LIMIT 5
    ");
    $stmt->execute([$searchTerm, $searchTerm, $searchTerm]);
    $products = $stmt->fetchAll();

    foreach ($products as $p) {
        $results[] = [
            'category' => 'Products',
            'icon'     => 'bi-gem',
            'title'    => $p['product_name'],
            'subtitle' => $p['sku'] . ' · ' . $p['category_name'] . ' · ₹' . number_format($p['selling_price']),
            'link'     => '/modules/inventory/',
        ];
    }

    // 2. Search Customers
    $stmt = $pdo->prepare("
        SELECT customer_id, customer_name, customer_code, city, email, customer_type
        FROM customers
        WHERE customer_name LIKE ? OR customer_code LIKE ? OR city LIKE ? OR email LIKE ?
        LIMIT 5
    ");
    $stmt->execute([$searchTerm, $searchTerm, $searchTerm, $searchTerm]);
    $customers = $stmt->fetchAll();

    foreach ($customers as $c) {
        $badge = $c['customer_type'] === 'VIP' ? '⭐ VIP' : ($c['customer_type'] === 'Premium' ? '💎 Premium' : '');
        $results[] = [
            'category' => 'Customers',
            'icon'     => 'bi-person',
            'title'    => $c['customer_name'] . ($badge ? " {$badge}" : ''),
            'subtitle' => $c['customer_code'] . ' · ' . ($c['city'] ?? 'N/A'),
            'link'     => '/modules/customers/',
        ];
    }

    // 3. Search Sales (by invoice number or customer name)
    $stmt = $pdo->prepare("
        SELECT s.sale_id, s.invoice_number, s.sale_date, s.total_amount, c.customer_name
        FROM sales s
        LEFT JOIN customers c ON s.customer_id = c.customer_id
        WHERE s.invoice_number LIKE ? OR c.customer_name LIKE ?
        ORDER BY s.sale_date DESC
        LIMIT 5
    ");
    $stmt->execute([$searchTerm, $searchTerm]);
    $sales = $stmt->fetchAll();

    foreach ($sales as $s) {
        $results[] = [
            'category' => 'Sales',
            'icon'     => 'bi-receipt',
            'title'    => $s['invoice_number'],
            'subtitle' => ($s['customer_name'] ?? 'Walk-in') . ' · ₹' . number_format($s['total_amount']) . ' · ' . $s['sale_date'],
            'link'     => '/modules/sales/',
        ];
    }

    echo json_encode([
        'success' => true,
        'results' => $results,
        'total'   => count($results),
        'query'   => $query
    ]);

} catch (Exception $e) {
    http_response_code(500);
    echo json_encode(['success' => false, 'message' => $e->getMessage(), 'results' => []]);
}
