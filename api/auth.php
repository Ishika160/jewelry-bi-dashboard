<?php
/**
 * Auth API Endpoint
 * Handles login and logout via AJAX
 */
require_once '../includes/db.php';

header('Content-Type: application/json');

$action = $_GET['action'] ?? $_POST['action'] ?? '';

switch ($action) {
    case 'login':
        handleLogin();
        break;
    case 'logout':
        handleLogout();
        break;
    case 'check':
        handleCheck();
        break;
    default:
        http_response_code(400);
        echo json_encode(['success' => false, 'message' => 'Invalid action']);
}

function handleLogin(): void {
    global $pdo;
    
    // Only accept POST
    if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
        http_response_code(405);
        echo json_encode(['success' => false, 'message' => 'Method not allowed']);
        return;
    }

    // Get input (support both form data and JSON)
    $input = json_decode(file_get_contents('php://input'), true);
    $username = $input['username'] ?? $_POST['username'] ?? '';
    $password = $input['password'] ?? $_POST['password'] ?? '';

    if (empty($username) || empty($password)) {
        http_response_code(400);
        echo json_encode(['success' => false, 'message' => 'Username and password are required']);
        return;
    }

    $result = loginUser($username, $password, $pdo);
    
    if ($result['success']) {
        echo json_encode([
            'success' => true,
            'message' => 'Login successful',
            'redirect' => '/modules/dashboard/',
            'user' => getCurrentUser()
        ]);
    } else {
        http_response_code(401);
        echo json_encode($result);
    }
}

function handleLogout(): void {
    global $pdo;
    logoutUser($pdo);
    echo json_encode(['success' => true, 'message' => 'Logged out successfully', 'redirect' => '/login.php']);
}

function handleCheck(): void {
    if (isLoggedIn()) {
        echo json_encode(['success' => true, 'logged_in' => true, 'user' => getCurrentUser()]);
    } else {
        echo json_encode(['success' => true, 'logged_in' => false]);
    }
}
