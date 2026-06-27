<?php
/**
 * Settings API Endpoint
 * Profile management, password change, user administration
 */
require_once '../includes/db.php';

header('Content-Type: application/json');

$action = $_GET['action'] ?? $_POST['action'] ?? '';
$input  = json_decode(file_get_contents('php://input'), true) ?? $_POST;

switch ($action) {
    case 'profile':
        getProfile();
        break;
    case 'update_profile':
        updateProfile($input);
        break;
    case 'change_password':
        changePassword($input);
        break;
    case 'users':
        getUsers();
        break;
    case 'create_user':
        createUser($input);
        break;
    case 'toggle_user':
        toggleUser($input);
        break;
    case 'system_info':
        getSystemInfo();
        break;
    default:
        http_response_code(400);
        echo json_encode(['success' => false, 'message' => 'Invalid action']);
}

// ── Profile ──

function getProfile(): void {
    global $pdo;
    $user = getCurrentUser();
    
    $stmt = $pdo->prepare("SELECT user_id, username, full_name, email, role, avatar_color, last_login, created_at FROM users WHERE user_id = ?");
    $stmt->execute([$user['user_id']]);
    $profile = $stmt->fetch();

    echo json_encode(['success' => true, 'profile' => $profile]);
}

function updateProfile(array $input): void {
    global $pdo;
    
    if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
        http_response_code(405);
        echo json_encode(['success' => false, 'message' => 'Method not allowed']);
        return;
    }

    $user = getCurrentUser();
    $fullName = trim($input['full_name'] ?? '');
    $email    = trim($input['email'] ?? '');

    if (empty($fullName)) {
        echo json_encode(['success' => false, 'message' => 'Full name is required']);
        return;
    }

    $stmt = $pdo->prepare("UPDATE users SET full_name = ?, email = ? WHERE user_id = ?");
    $stmt->execute([$fullName, $email, $user['user_id']]);

    // Update session
    $_SESSION['full_name'] = $fullName;
    $_SESSION['email']     = $email;

    logActivity('profile_update', 'Updated profile information', $pdo);

    echo json_encode(['success' => true, 'message' => 'Profile updated successfully']);
}

function changePassword(array $input): void {
    global $pdo;

    if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
        http_response_code(405);
        echo json_encode(['success' => false, 'message' => 'Method not allowed']);
        return;
    }

    $user = getCurrentUser();
    $currentPassword = $input['current_password'] ?? '';
    $newPassword     = $input['new_password'] ?? '';
    $confirmPassword = $input['confirm_password'] ?? '';

    if (empty($currentPassword) || empty($newPassword)) {
        echo json_encode(['success' => false, 'message' => 'All password fields are required']);
        return;
    }

    if ($newPassword !== $confirmPassword) {
        echo json_encode(['success' => false, 'message' => 'New passwords do not match']);
        return;
    }

    if (strlen($newPassword) < 6) {
        echo json_encode(['success' => false, 'message' => 'Password must be at least 6 characters']);
        return;
    }

    // Verify current password
    $stmt = $pdo->prepare("SELECT password_hash FROM users WHERE user_id = ?");
    $stmt->execute([$user['user_id']]);
    $hash = $stmt->fetchColumn();

    if (!password_verify($currentPassword, $hash)) {
        echo json_encode(['success' => false, 'message' => 'Current password is incorrect']);
        return;
    }

    // Update password
    $newHash = password_hash($newPassword, PASSWORD_DEFAULT);
    $stmt = $pdo->prepare("UPDATE users SET password_hash = ? WHERE user_id = ?");
    $stmt->execute([$newHash, $user['user_id']]);

    logActivity('password_change', 'Changed password', $pdo);

    echo json_encode(['success' => true, 'message' => 'Password changed successfully']);
}

// ── User Management (Admin Only) ──

function getUsers(): void {
    global $pdo;

    if (!isAdmin()) {
        http_response_code(403);
        echo json_encode(['success' => false, 'message' => 'Access denied']);
        return;
    }

    $stmt = $pdo->query("SELECT user_id, username, full_name, email, role, avatar_color, is_active, last_login, created_at FROM users ORDER BY created_at ASC");
    $users = $stmt->fetchAll();

    echo json_encode(['success' => true, 'users' => $users]);
}

function createUser(array $input): void {
    global $pdo;

    if (!isAdmin()) {
        http_response_code(403);
        echo json_encode(['success' => false, 'message' => 'Access denied']);
        return;
    }

    $username = trim($input['username'] ?? '');
    $fullName = trim($input['full_name'] ?? '');
    $email    = trim($input['email'] ?? '');
    $password = $input['password'] ?? '';
    $role     = $input['role'] ?? 'viewer';

    if (empty($username) || empty($fullName) || empty($password)) {
        echo json_encode(['success' => false, 'message' => 'Username, full name, and password are required']);
        return;
    }

    // Check if username exists
    $stmt = $pdo->prepare("SELECT COUNT(*) FROM users WHERE username = ?");
    $stmt->execute([$username]);
    if ($stmt->fetchColumn() > 0) {
        echo json_encode(['success' => false, 'message' => 'Username already exists']);
        return;
    }

    $hash = password_hash($password, PASSWORD_DEFAULT);
    $colors = ['#d4af37', '#38bdf8', '#2dd4bf', '#a78bfa', '#f472b6', '#fb923c', '#34d399'];
    $color = $colors[array_rand($colors)];

    $stmt = $pdo->prepare("INSERT INTO users (username, full_name, email, password_hash, role, avatar_color) VALUES (?, ?, ?, ?, ?, ?)");
    $stmt->execute([$username, $fullName, $email, $hash, $role, $color]);

    logActivity('create_user', "Created user: {$username} ({$role})", $pdo);

    echo json_encode(['success' => true, 'message' => "User '{$username}' created successfully"]);
}

function toggleUser(array $input): void {
    global $pdo;

    if (!isAdmin()) {
        http_response_code(403);
        echo json_encode(['success' => false, 'message' => 'Access denied']);
        return;
    }

    $userId = (int)($input['user_id'] ?? 0);
    $user = getCurrentUser();

    if ($userId === $user['user_id']) {
        echo json_encode(['success' => false, 'message' => 'You cannot disable your own account']);
        return;
    }

    $stmt = $pdo->prepare("UPDATE users SET is_active = NOT is_active WHERE user_id = ?");
    $stmt->execute([$userId]);

    logActivity('toggle_user', "Toggled user status for user_id: {$userId}", $pdo);

    echo json_encode(['success' => true, 'message' => 'User status updated']);
}

// ── System Info ──

function getSystemInfo(): void {
    global $pdo;

    $info = [
        'php_version'   => PHP_VERSION,
        'app_name'      => defined('APP_NAME') ? APP_NAME : 'Jewelry BI',
        'environment'   => defined('APP_ENV') ? APP_ENV : 'development',
        'timezone'      => date_default_timezone_get(),
    ];

    // DB stats
    $tables = ['products', 'categories', 'inventory', 'customers', 'sales', 'sale_items', 'users'];
    foreach ($tables as $table) {
        try {
            $stmt = $pdo->query("SELECT COUNT(*) FROM {$table}");
            $info['tables'][$table] = (int)$stmt->fetchColumn();
        } catch (Exception $e) {
            $info['tables'][$table] = 0;
        }
    }

    echo json_encode(['success' => true, 'info' => $info]);
}
