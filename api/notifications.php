<?php
/**
 * Notifications API Endpoint
 * Returns stock alerts, dead stock warnings, and system notifications
 */
require_once '../includes/db.php';

header('Content-Type: application/json');

$action = $_GET['action'] ?? 'list';

switch ($action) {
    case 'list':
        getNotifications();
        break;
    default:
        echo json_encode(['success' => true, 'notifications' => []]);
}

function getNotifications(): void {
    global $pdo;
    $notifications = [];

    try {
        // 1. Out of Stock Products
        $stmt = $pdo->query("
            SELECT product_name, sku 
            FROM v_inventory_status 
            WHERE quantity_in_stock = 0
            LIMIT 5
        ");
        $outOfStock = $stmt->fetchAll();
        foreach ($outOfStock as $item) {
            $notifications[] = [
                'type'      => 'danger',
                'icon'      => 'bi-exclamation-triangle-fill',
                'title'     => 'Out of Stock',
                'message'   => $item['product_name'] . ' (' . $item['sku'] . ')',
                'link'      => '/modules/inventory/',
                'time'      => 'Now',
                'unix_time' => time()
            ];
        }

        // 2. Low Stock Products
        $stmt = $pdo->query("
            SELECT product_name, sku, quantity_in_stock, reorder_level
            FROM v_inventory_status 
            WHERE quantity_in_stock > 0 AND quantity_in_stock <= reorder_level
            LIMIT 5
        ");
        $lowStock = $stmt->fetchAll();
        foreach ($lowStock as $item) {
            $notifications[] = [
                'type'      => 'warning',
                'icon'      => 'bi-exclamation-circle',
                'title'     => 'Low Stock Alert',
                'message'   => $item['product_name'] . ' — only ' . $item['quantity_in_stock'] . ' left',
                'link'      => '/modules/inventory/',
                'time'      => 'Now',
                'unix_time' => time() - 1 // Slightly older than out of stock
            ];
        }

        // 3. Dead Stock (not sold in 90+ days)
        $stmt = $pdo->query("
            SELECT product_name, sku, days_since_last_sale
            FROM v_product_performance 
            WHERE days_since_last_sale > 90
            ORDER BY days_since_last_sale DESC
            LIMIT 3
        ");
        $deadStock = $stmt->fetchAll();
        foreach ($deadStock as $item) {
            $notifications[] = [
                'type'      => 'secondary',
                'icon'      => 'bi-archive',
                'title'     => 'Dead Stock',
                'message'   => $item['product_name'] . ' — ' . $item['days_since_last_sale'] . ' days unsold',
                'link'      => '/modules/inventory/#deadstock',
                'time'      => $item['days_since_last_sale'] . 'd ago',
                'unix_time' => time() - ($item['days_since_last_sale'] * 86400)
            ];
        }

        // 4. Sales Milestones
        $stmt = $pdo->query("SELECT SUM(total_amount) AS total FROM sales");
        $totalRevenue = (float)$stmt->fetchColumn();

        $milestones = [10000000, 5000000, 1000000, 500000, 100000];
        foreach ($milestones as $milestone) {
            if ($totalRevenue >= $milestone) {
                $formatted = '₹' . number_format($milestone / 100000, 0) . 'L';
                $notifications[] = [
                    'type'      => 'success',
                    'icon'      => 'bi-trophy-fill',
                    'title'     => 'Milestone Reached!',
                    'message'   => 'Revenue crossed ' . $formatted,
                    'link'      => '/modules/dashboard/',
                    'time'      => 'Achieved',
                    'unix_time' => time() - 2 // High priority, effectively "Now"
                ];
                break; // Only show the highest achieved milestone
            }
        }

        // 5. Recent Activity (last 3)
        $stmt = $pdo->query("
            SELECT al.action, al.details, al.created_at, u.full_name
            FROM activity_log al
            LEFT JOIN users u ON al.user_id = u.user_id
            ORDER BY al.created_at DESC
            LIMIT 3
        ");
        $activities = $stmt->fetchAll();
        foreach ($activities as $act) {
            $timeAgo = getTimeAgo($act['created_at']);
            $notifications[] = [
                'type'      => 'info',
                'icon'      => 'bi-person-circle',
                'title'     => ucfirst($act['action']),
                'message'   => ($act['full_name'] ?? 'System') . ' — ' . $act['details'],
                'link'      => '#',
                'time'      => $timeAgo,
                'unix_time' => strtotime($act['created_at'])
            ];
        }

        // Sort chronologically (recent one at top, old one at bottom)
        usort($notifications, function($a, $b) {
            return $b['unix_time'] <=> $a['unix_time'];
        });

        echo json_encode([
            'success'       => true,
            'notifications' => $notifications,
            'count'         => count($notifications)
        ]);

    } catch (Exception $e) {
        echo json_encode([
            'success'       => false,
            'message'       => $e->getMessage(),
            'notifications' => [],
            'count'         => 0
        ]);
    }
}

function getTimeAgo(string $datetime): string {
    $now  = new DateTime();
    $past = new DateTime($datetime);
    $diff = $now->diff($past);

    if ($diff->d > 0) return $diff->d . 'd ago';
    if ($diff->h > 0) return $diff->h . 'h ago';
    if ($diff->i > 0) return $diff->i . 'm ago';
    return 'Just now';
}
