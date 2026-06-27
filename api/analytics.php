<?php
require_once '../includes/db.php';
header('Content-Type: application/json');

try {
    // We want a matrix: X = Month (1-12), Y = Category, Value = Total Revenue
    $stmt = $pdo->query("
        SELECT 
            c.category_name,
            MONTH(s.sale_date) as month_num,
            SUM(si.total_price) as revenue
        FROM sales s
        JOIN sale_items si ON s.sale_id = si.sale_id
        JOIN categories c ON si.product_id = c.category_id
        GROUP BY c.category_id, month_num
    ");
    $data = $stmt->fetchAll();

    // Reformat for Chart.js Matrix: array of {x, y, v}
    $matrix = [];
    $max_val = 0;
    
    // Get unique categories for Y axis mapping
    $stmt_cat = $pdo->query("SELECT category_name FROM categories");
    $categories = $stmt_cat->fetchAll(PDO::FETCH_COLUMN);
    
    foreach ($data as $row) {
        $val = floatval($row['revenue']);
        if ($val > $max_val) $max_val = $val;
        
        $matrix[] = [
            'x' => intval($row['month_num']) - 1, // 0-indexed for Chart.js months
            'y' => array_search($row['category_name'], $categories),
            'v' => $val,
            'category' => $row['category_name']
        ];
    }

    echo json_encode([
        'success' => true,
        'data' => [
            'matrix' => $matrix,
            'categories' => $categories,
            'max_val' => $max_val
        ]
    ]);
} catch (Exception $e) {
    http_response_code(500);
    echo json_encode(['success' => false, 'message' => $e->getMessage()]);
}
