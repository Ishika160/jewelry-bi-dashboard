<?php
/**
 * Entry Point — Routes to setup, login, or dashboard
 */
require_once 'includes/config.php';
require_once 'includes/auth.php';

// If logged in, go to dashboard
if (isLoggedIn()) {
    header('Location: /modules/dashboard/');
    exit;
}

// Check if any users exist — if not, redirect to setup
try {
    $host = $_ENV['DB_HOST'] ?? 'db';
    $dbname = $_ENV['DB_NAME'] ?? 'db';
    $user = $_ENV['DB_USER'] ?? 'db';
    $pass = $_ENV['DB_PASS'] ?? 'db';
    $port = $_ENV['DB_PORT'] ?? 3306;
    $dsn = "mysql:host={$host};port={$port};dbname={$dbname};charset=utf8mb4";
    $pdo = new PDO($dsn, $user, $pass, [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION]);

    $tableExists = false;
    try {
        $pdo->query("SELECT 1 FROM users LIMIT 1");
        $tableExists = true;
    } catch (Exception $e) {
        // Table doesn't exist — redirect to setup
        header('Location: /register.php');
        exit;
    }

    if ($tableExists) {
        $stmt = $pdo->query("SELECT COUNT(*) FROM users");
        if ((int)$stmt->fetchColumn() === 0) {
            header('Location: /register.php');
            exit;
        }
    }
} catch (Exception $e) {
    // If DB fails, let login page handle the error display
}

// Users exist, redirect to login
header('Location: /login.php');
exit;
