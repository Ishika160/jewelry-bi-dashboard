<?php
require_once 'includes/config.php';
$pdo = new PDO('mysql:host=' . $_ENV['DB_HOST'] . ';dbname=' . $_ENV['DB_NAME'], $_ENV['DB_USER'], $_ENV['DB_PASS'], [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION]);

$stmt = $pdo->query("SELECT * FROM activity_log ORDER BY log_id DESC LIMIT 5");
$logs = $stmt->fetchAll(PDO::FETCH_ASSOC);

$stmt2 = $pdo->query("SELECT COUNT(*) FROM activity_log");
$count = $stmt2->fetchColumn();

echo "Total Logs: $count\n";
print_r($logs);
