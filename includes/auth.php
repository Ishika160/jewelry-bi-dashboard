<?php
/**
 * Authentication & Session Management
 * Handles login, logout, session security, and activity logging.
 */
require_once __DIR__ . '/config.php';

/**
 * Start a secure PHP session
 */
function startSecureSession() {
    if (session_status() === PHP_SESSION_NONE) {
        session_set_cookie_params([
            'lifetime' => 86400,      // 24 hours
            'path'     => '/',
            'secure'   => isset($_SERVER['HTTPS']),
            'httponly'  => true,
            'samesite'  => 'Lax'
        ]);
        session_start();
    }
}

// Auto-start session when this file is included
startSecureSession();

/**
 * Check if the current user is logged in
 */
function isLoggedIn(): bool {
    return isset($_SESSION['user_id']) && !empty($_SESSION['user_id']);
}

/**
 * Redirect to login page if not authenticated.
 * Call this at the top of any protected page.
 */
function requireLogin(): void {
    if (!isLoggedIn()) {
        // If it's an API request, return JSON 401
        if (strpos($_SERVER['REQUEST_URI'] ?? '', '/api/') !== false) {
            header('Content-Type: application/json');
            http_response_code(401);
            echo json_encode(['success' => false, 'message' => 'Authentication required']);
            exit;
        }
        // Otherwise redirect to login page
        header('Location: /login.php');
        exit;
    }
}

/**
 * Login a user with username and password
 * @return array ['success' => bool, 'message' => string]
 */
function loginUser(string $username, string $password, PDO $pdo): array {
    $stmt = $pdo->prepare("SELECT * FROM users WHERE username = ? AND is_active = 1");
    $stmt->execute([$username]);
    $user = $stmt->fetch();

    if (!$user) {
        return ['success' => false, 'message' => 'Invalid username or password'];
    }

    if (!password_verify($password, $user['password_hash'])) {
        return ['success' => false, 'message' => 'Invalid username or password'];
    }

    // Set session variables
    $_SESSION['user_id']    = $user['user_id'];
    $_SESSION['username']   = $user['username'];
    $_SESSION['full_name']  = $user['full_name'];
    $_SESSION['email']      = $user['email'];
    $_SESSION['role']       = $user['role'];
    $_SESSION['avatar_color'] = $user['avatar_color'];
    $_SESSION['login_time'] = time();

    // Update last_login timestamp
    $stmt = $pdo->prepare("UPDATE users SET last_login = NOW() WHERE user_id = ?");
    $stmt->execute([$user['user_id']]);

    // Log the login activity
    logActivity('login', 'User logged in successfully', $pdo, $user['user_id']);

    return ['success' => true, 'message' => 'Login successful'];
}

/**
 * Logout the current user
 */
function logoutUser(PDO $pdo): void {
    if (isLoggedIn()) {
        logActivity('logout', 'User logged out', $pdo);
    }
    
    $_SESSION = [];
    
    if (ini_get('session.use_cookies')) {
        $params = session_get_cookie_params();
        setcookie(session_name(), '', time() - 42000,
            $params['path'], $params['domain'],
            $params['secure'], $params['httponly']
        );
    }
    
    session_destroy();
}

/**
 * Get the current logged-in user's data
 * @return array|null
 */
function getCurrentUser(): ?array {
    if (!isLoggedIn()) return null;
    
    return [
        'user_id'      => $_SESSION['user_id'],
        'username'     => $_SESSION['username'],
        'full_name'    => $_SESSION['full_name'],
        'email'        => $_SESSION['email'] ?? '',
        'role'         => $_SESSION['role'],
        'avatar_color' => $_SESSION['avatar_color'] ?? '#d4af37',
    ];
}

/**
 * Check if the current user is an admin
 */
function isAdmin(): bool {
    return isLoggedIn() && ($_SESSION['role'] ?? '') === 'admin';
}

/**
 * Log an activity to the activity_log table
 */
function logActivity(string $action, string $details = '', ?PDO $pdo = null, ?int $userId = null): void {
    if ($pdo === null) return;
    
    $userId = $userId ?? ($_SESSION['user_id'] ?? null);
    $ip = $_SERVER['REMOTE_ADDR'] ?? '127.0.0.1';
    
    try {
        $stmt = $pdo->prepare("INSERT INTO activity_log (user_id, action, details, ip_address) VALUES (?, ?, ?, ?)");
        $stmt->execute([$userId, $action, $details, $ip]);
    } catch (Exception $e) {
        // Silently fail — don't break the app if logging fails
    }
}
