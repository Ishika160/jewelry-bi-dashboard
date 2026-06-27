<?php
/**
 * Database Connection & Global Helper Functions
 */
require_once __DIR__ . '/config.php';
require_once __DIR__ . '/auth.php';

// Require login for all pages that include db.php
// (except API auth endpoint which handles its own auth)
$requestUri = $_SERVER['REQUEST_URI'] ?? '';
if (strpos($requestUri, '/api/auth.php') === false) {
    requireLogin();
}

function getConnection() {
    $host = $_ENV['DB_HOST'] ?? 'db';
    $dbname = $_ENV['DB_NAME'] ?? 'db';
    $user = $_ENV['DB_USER'] ?? 'db';
    $pass = $_ENV['DB_PASS'] ?? 'db';
    $port = $_ENV['DB_PORT'] ?? 3306;

    $dsn = "mysql:host={$host};port={$port};dbname={$dbname};charset=utf8mb4";
    
    try {
        $pdo = new PDO($dsn, $user, $pass, [
            PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
            PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
            PDO::ATTR_EMULATE_PREPARES   => false,
        ]);
        return $pdo;
    } catch (PDOException $e) {
        // Return JSON error if it's an API request
        if (strpos($_SERVER['REQUEST_URI'] ?? '', '/api/') !== false) {
            header('Content-Type: application/json');
            echo json_encode(['success' => false, 'message' => 'Database connection failed']);
            exit;
        }
        die("Database Connection Failed: " . $e->getMessage());
    }
}

// Initialize global PDO instance
$pdo = getConnection();

/**
 * Format currency to Indian Rupees
 */
function formatCurrency($amount) {
    return '₹ ' . preg_replace("/(\d+?)(?=(\d\d)+(\d)(?!\d))(\.\\d+)?/i", "$1,", $amount);
}
