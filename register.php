<?php
/**
 * Registration Page
 * Allows new users to create an account.
 * The first user created becomes an 'admin', subsequent users are 'viewer' by default.
 */
require_once 'includes/config.php';
require_once 'includes/auth.php';

// If already logged in, go to dashboard
if (isLoggedIn()) {
    header('Location: ' . APP_URL . 'modules/dashboard/');
    exit;
}

// Check if users table exists and has users
try {
    $host = $_ENV['DB_HOST'] ?? 'db';
    $dbname = $_ENV['DB_NAME'] ?? 'db';
    $user = $_ENV['DB_USER'] ?? 'db';
    $pass = $_ENV['DB_PASS'] ?? 'db';
    $port = $_ENV['DB_PORT'] ?? 3306;
    $dsn = "mysql:host={$host};port={$port};dbname={$dbname};charset=utf8mb4";
    $pdo = new PDO($dsn, $user, $pass, [
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC
    ]);

    // Check if users table exists
    $tableExists = false;
    try {
        $pdo->query("SELECT 1 FROM users LIMIT 1");
        $tableExists = true;
    } catch (Exception $e) {
        $tableExists = false;
    }

    // If table exists, check if users already exist
    $hasUsers = false;
    if ($tableExists) {
        $stmt = $pdo->query("SELECT COUNT(*) FROM users");
        $hasUsers = (int)$stmt->fetchColumn() > 0;
    }

    // Determine role based on if users exist
    $defaultRole = $hasUsers ? 'viewer' : 'admin';

} catch (Exception $e) {
    $dbError = $e->getMessage();
}

// Handle registration POST
$error = '';
$success = false;

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $username = trim($_POST['username'] ?? '');
    $fullName = trim($_POST['full_name'] ?? '');
    $email    = trim($_POST['email'] ?? '');
    $password = $_POST['password'] ?? '';
    $confirmPassword = $_POST['confirm_password'] ?? '';

    if (empty($username) || empty($fullName) || empty($password)) {
        $error = 'Username, full name, and password are required.';
    } elseif (strlen($password) < 6) {
        $error = 'Password must be at least 6 characters.';
    } elseif ($password !== $confirmPassword) {
        $error = 'Passwords do not match.';
    } elseif (!$tableExists) {
        $error = 'Users table does not exist. Run: ddev mysql < sql/migration_auth.sql';
    } else {
        try {
            $hash = password_hash($password, PASSWORD_DEFAULT);
            $role = isset($defaultRole) ? $defaultRole : 'viewer';
            $stmt = $pdo->prepare("INSERT INTO users (username, full_name, email, password_hash, role, avatar_color) VALUES (?, ?, ?, ?, ?, '#d4af37')");
            $stmt->execute([$username, $fullName, $email, $hash, $role]);
            
            // Log the setup activity
            $userId = $pdo->lastInsertId();
            $stmt = $pdo->prepare("INSERT INTO activity_log (user_id, action, details, ip_address) VALUES (?, 'registration', 'New account created via registration page', ?)");
            $stmt->execute([$userId, $_SERVER['REMOTE_ADDR'] ?? '127.0.0.1']);
            
            $success = true;
        } catch (Exception $e) {
            $error = 'Registration failed: ' . $e->getMessage();
        }
    }
}
?>
<!DOCTYPE html>
<html lang="en" data-bs-theme="dark">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register — <?= defined('APP_NAME') ? APP_NAME : 'Jewelry BI Dashboard' ?></title>

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

    <style>
        *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }

        body {
            font-family: 'Inter', sans-serif;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            overflow: hidden;
            background: #0a0a0a;
        }

        .setup-bg {
            position: fixed;
            inset: 0;
            z-index: 0;
            background: linear-gradient(135deg, #0a0a0a 0%, #0d1a00 25%, #0a0a0a 50%, #001a0d 75%, #0a0a0a 100%);
            background-size: 400% 400%;
            animation: gradientShift 15s ease infinite;
        }

        @keyframes gradientShift {
            0%   { background-position: 0% 50%; }
            50%  { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        .glow-orb {
            position: fixed;
            border-radius: 50%;
            filter: blur(80px);
            z-index: 0;
            pointer-events: none;
        }
        .glow-orb-1 {
            width: 400px; height: 400px;
            background: rgba(52, 211, 153, 0.06);
            top: -100px; left: -100px;
            animation: orbFloat 8s ease-in-out infinite;
        }
        .glow-orb-2 {
            width: 300px; height: 300px;
            background: rgba(212, 175, 55, 0.04);
            bottom: -80px; right: -80px;
            animation: orbFloat 10s ease-in-out infinite reverse;
        }

        @keyframes orbFloat {
            0%, 100% { transform: translate(0, 0); }
            50%      { transform: translate(30px, -30px); }
        }

        .setup-card {
            position: relative;
            z-index: 10;
            width: 100%;
            max-width: 480px;
            padding: 2.5rem;
            border-radius: 20px;
            background: rgba(17, 17, 17, 0.6);
            backdrop-filter: blur(20px) saturate(150%);
            -webkit-backdrop-filter: blur(20px) saturate(150%);
            border: 1px solid rgba(52, 211, 153, 0.12);
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.4);
            animation: cardSlideIn 0.6s cubic-bezier(0.16, 1, 0.3, 1) forwards;
            opacity: 0;
            transform: translateY(20px);
        }

        @keyframes cardSlideIn {
            to { opacity: 1; transform: translateY(0); }
        }

        .setup-logo {
            width: 64px;
            height: 64px;
            border-radius: 16px;
            background: linear-gradient(135deg, #34d399, #059669);
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 1.5rem;
            box-shadow: 0 4px 20px rgba(52, 211, 153, 0.3);
        }
        .setup-logo i { font-size: 1.8rem; color: #fff; }

        .register-link { color: #34d399; text-decoration: none; font-weight: 600; font-size: 0.875rem; transition: opacity 0.2s; }
        .register-link:hover { opacity: 0.8; }

        .setup-title {
            font-size: 1.5rem;
            font-weight: 700;
            text-align: center;
            margin-bottom: 0.25rem;
            background: linear-gradient(135deg, #f8f9fa, #34d399);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        .setup-subtitle {
            text-align: center;
            color: #6b7280;
            font-size: 0.875rem;
            margin-bottom: 2rem;
        }

        .form-floating .form-control {
            background: rgba(255, 255, 255, 0.04);
            border: 1px solid rgba(255, 255, 255, 0.08);
            border-radius: 12px;
            color: #f8f9fa;
            font-size: 0.95rem;
            height: 56px;
            transition: all 0.3s ease;
        }

        .form-floating .form-control:focus {
            background: rgba(255, 255, 255, 0.06);
            border-color: rgba(52, 211, 153, 0.5);
            box-shadow: 0 0 0 3px rgba(52, 211, 153, 0.1);
        }

        .form-floating label { color: #6b7280; }
        .form-floating .form-control:focus ~ label,
        .form-floating .form-control:not(:placeholder-shown) ~ label {
            color: #34d399;
        }

        .btn-setup {
            width: 100%;
            padding: 0.85rem;
            border: none;
            border-radius: 12px;
            font-weight: 600;
            font-size: 1rem;
            color: #0a0a0a;
            background: linear-gradient(135deg, #34d399, #059669);
            cursor: pointer;
            transition: all 0.3s ease;
            margin-top: 0.5rem;
        }
        .btn-setup:hover {
            transform: translateY(-1px);
            box-shadow: 0 8px 25px rgba(52, 211, 153, 0.35);
            color: #0a0a0a;
        }

        .setup-error {
            background: rgba(220, 38, 38, 0.1);
            border: 1px solid rgba(220, 38, 38, 0.2);
            border-radius: 12px;
            padding: 0.75rem 1rem;
            color: #fca5a5;
            font-size: 0.875rem;
        }

        .setup-success {
            background: rgba(52, 211, 153, 0.1);
            border: 1px solid rgba(52, 211, 153, 0.2);
            border-radius: 12px;
            padding: 1.5rem;
            text-align: center;
        }

        .setup-footer {
            text-align: center;
            margin-top: 1.5rem;
            color: #4b5563;
            font-size: 0.75rem;
        }

        .step-badge {
            background: rgba(52, 211, 153, 0.1);
            border: 1px solid rgba(52, 211, 153, 0.2);
            border-radius: 8px;
            padding: 0.5rem 0.75rem;
            font-size: 0.75rem;
            color: #34d399;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            margin-bottom: 1.5rem;
        }

        @media (max-width: 480px) {
            .setup-card { margin: 1rem; padding: 2rem 1.5rem; }
        }
    </style>
</head>
<body>
    <div class="setup-bg"></div>
    <div class="glow-orb glow-orb-1"></div>
    <div class="glow-orb glow-orb-2"></div>

    <div class="setup-card">
        <div class="setup-logo">
            <i class="bi bi-shield-lock"></i>
        </div>

        <h1 class="setup-title">Registration</h1>
        <p class="setup-subtitle">Create a new account to access the dashboard</p>

        <?php if (isset($dbError)): ?>
            <div class="setup-error mb-3">
                <i class="bi bi-exclamation-circle me-2"></i>
                <strong>Database Error:</strong> <?= htmlspecialchars($dbError) ?>
                <br><small class="mt-1 d-block">Run: <code>ddev mysql &lt; sql/migration_auth.sql</code></small>
            </div>
        <?php elseif (!$tableExists): ?>
            <div class="setup-error mb-3">
                <i class="bi bi-exclamation-circle me-2"></i>
                <strong>Users table not found.</strong>
                <br><small class="mt-1 d-block">Run: <code>ddev mysql &lt; sql/migration_auth.sql</code></small>
            </div>
        <?php elseif ($success): ?>
            <div class="setup-success">
                <i class="bi bi-check-circle-fill text-success fs-1 d-block mb-3"></i>
                <h5 class="fw-bold text-success">Registration Successful!</h5>
                <p class="text-muted mb-3">Your account is ready. You can now sign in.</p>
                <a href="/login.php" class="btn btn-setup">
                    <i class="bi bi-box-arrow-in-right me-2"></i>Go to Login
                </a>
            </div>
        <?php else: ?>
            <div class="text-center mb-3">
                <span class="step-badge">
                    <i class="bi bi-1-circle-fill"></i>
                    Join the platform — register your account
                </span>
            </div>

            <?php if ($error): ?>
                <div class="setup-error mb-3">
                    <i class="bi bi-exclamation-circle me-2"></i><?= htmlspecialchars($error) ?>
                </div>
            <?php endif; ?>

            <form method="POST" action="">
                <div class="form-floating mb-3">
                    <input type="text" class="form-control" id="username" name="username" placeholder="Username" required
                           value="<?= htmlspecialchars($_POST['username'] ?? '') ?>">
                    <label for="username">Username</label>
                </div>

                <div class="form-floating mb-3">
                    <input type="text" class="form-control" id="full_name" name="full_name" placeholder="Full Name" required
                           value="<?= htmlspecialchars($_POST['full_name'] ?? '') ?>">
                    <label for="full_name">Full Name</label>
                </div>

                <div class="form-floating mb-3">
                    <input type="email" class="form-control" id="email" name="email" placeholder="Email (optional)"
                           value="<?= htmlspecialchars($_POST['email'] ?? '') ?>">
                    <label for="email">Email (optional)</label>
                </div>

                <div class="form-floating mb-3">
                    <input type="password" class="form-control" id="password" name="password" placeholder="Password" required minlength="6">
                    <label for="password">Password (min 6 characters)</label>
                </div>

                <div class="form-floating mb-3">
                    <input type="password" class="form-control" id="confirm_password" name="confirm_password" placeholder="Confirm Password" required>
                    <label for="confirm_password">Confirm Password</label>
                </div>

                <button type="submit" class="btn btn-setup">
                    <i class="bi bi-person-plus me-2"></i>Create Account
                </button>
            </form>

            <div class="text-center mt-3">
                <span style="color: #6b7280; font-size: 0.875rem;">Already have an account?</span>
                <a href="/login.php" class="register-link" style="margin-left: 4px;">Sign In</a>
            </div>
        <?php endif; ?>

        <div class="setup-footer">
            <p class="mb-0">Jewelry Business Intelligence System</p>
            <p class="mb-0 mt-1">© <?= date('Y') ?> — BCA Final Year Project</p>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
