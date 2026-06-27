<?php
/**
 * Login Page — Jewelry BI Dashboard
 * Standalone page with glassmorphism design
 */
require_once 'includes/config.php';
require_once 'includes/auth.php';

// If already logged in, redirect to dashboard
if (isLoggedIn()) {
    header('Location: /modules/dashboard/');
    exit;
}
?>
<!DOCTYPE html>
<html lang="en" data-bs-theme="dark">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login — <?= defined('APP_NAME') ? APP_NAME : 'Jewelry BI Dashboard' ?></title>
    <meta name="description" content="Sign in to the Jewelry Business Intelligence Dashboard to access analytics, reports, and insights.">

    <!-- Google Fonts: Inter -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">

    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
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

        /* ── Animated Gradient Background ── */
        .login-bg {
            position: fixed;
            inset: 0;
            z-index: 0;
            background: linear-gradient(135deg, #0a0a0a 0%, #1a0f00 25%, #0a0a0a 50%, #0d1117 75%, #0a0a0a 100%);
            background-size: 400% 400%;
            animation: gradientShift 15s ease infinite;
        }

        @keyframes gradientShift {
            0%   { background-position: 0% 50%; }
            50%  { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        /* ── Floating Particles ── */
        .particles {
            position: fixed;
            inset: 0;
            z-index: 1;
            pointer-events: none;
            overflow: hidden;
        }

        .particle {
            position: absolute;
            width: 4px;
            height: 4px;
            background: radial-gradient(circle, rgba(212,175,55,0.8), transparent);
            border-radius: 50%;
            animation: floatUp linear infinite;
        }

        .particle:nth-child(1)  { left: 10%; animation-duration: 12s; animation-delay: 0s; width: 3px; height: 3px; }
        .particle:nth-child(2)  { left: 20%; animation-duration: 15s; animation-delay: 2s; width: 5px; height: 5px; }
        .particle:nth-child(3)  { left: 35%; animation-duration: 10s; animation-delay: 4s; width: 2px; height: 2px; }
        .particle:nth-child(4)  { left: 50%; animation-duration: 18s; animation-delay: 1s; width: 4px; height: 4px; }
        .particle:nth-child(5)  { left: 65%; animation-duration: 14s; animation-delay: 3s; width: 3px; height: 3px; }
        .particle:nth-child(6)  { left: 75%; animation-duration: 11s; animation-delay: 5s; width: 6px; height: 6px; }
        .particle:nth-child(7)  { left: 85%; animation-duration: 16s; animation-delay: 2s; width: 2px; height: 2px; }
        .particle:nth-child(8)  { left: 5%;  animation-duration: 13s; animation-delay: 6s; width: 4px; height: 4px; }
        .particle:nth-child(9)  { left: 45%; animation-duration: 17s; animation-delay: 1s; width: 3px; height: 3px; }
        .particle:nth-child(10) { left: 90%; animation-duration: 12s; animation-delay: 4s; width: 5px; height: 5px; }

        @keyframes floatUp {
            0%   { transform: translateY(100vh) rotate(0deg); opacity: 0; }
            10%  { opacity: 1; }
            90%  { opacity: 1; }
            100% { transform: translateY(-10vh) rotate(720deg); opacity: 0; }
        }

        /* ── Ambient Gold Glow ── */
        .glow-orb {
            position: fixed;
            border-radius: 50%;
            filter: blur(80px);
            z-index: 0;
            pointer-events: none;
        }
        .glow-orb-1 {
            width: 400px; height: 400px;
            background: rgba(212,175,55,0.08);
            top: -100px; right: -100px;
            animation: orbFloat 8s ease-in-out infinite;
        }
        .glow-orb-2 {
            width: 300px; height: 300px;
            background: rgba(212,175,55,0.05);
            bottom: -80px; left: -80px;
            animation: orbFloat 10s ease-in-out infinite reverse;
        }

        @keyframes orbFloat {
            0%, 100% { transform: translate(0, 0); }
            50%      { transform: translate(30px, -30px); }
        }

        /* ── Login Card — Glassmorphism ── */
        .login-card {
            position: relative;
            z-index: 10;
            width: 100%;
            max-width: 420px;
            padding: 2.5rem;
            border-radius: 20px;
            background: rgba(17, 17, 17, 0.6);
            backdrop-filter: blur(20px) saturate(150%);
            -webkit-backdrop-filter: blur(20px) saturate(150%);
            border: 1px solid rgba(212, 175, 55, 0.12);
            box-shadow:
                0 8px 32px rgba(0, 0, 0, 0.4),
                0 0 80px rgba(212, 175, 55, 0.03),
                inset 0 1px 0 rgba(255, 255, 255, 0.05);
            animation: cardSlideIn 0.6s cubic-bezier(0.16, 1, 0.3, 1) forwards;
            opacity: 0;
            transform: translateY(20px);
        }

        @keyframes cardSlideIn {
            to { opacity: 1; transform: translateY(0); }
        }

        /* ── Gem Logo ── */
        .login-logo {
            width: 64px;
            height: 64px;
            border-radius: 16px;
            background: linear-gradient(135deg, #d4af37, #b8860b);
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 1.5rem;
            box-shadow: 0 4px 20px rgba(212, 175, 55, 0.3);
            animation: logoPulse 3s ease-in-out infinite;
        }

        @keyframes logoPulse {
            0%, 100% { box-shadow: 0 4px 20px rgba(212, 175, 55, 0.3); }
            50%      { box-shadow: 0 4px 30px rgba(212, 175, 55, 0.5); }
        }

        .login-logo i { font-size: 1.8rem; color: #fff; }

        .login-title {
            font-size: 1.5rem;
            font-weight: 700;
            text-align: center;
            margin-bottom: 0.25rem;
            background: linear-gradient(135deg, #f8f9fa, #d4af37);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        .login-subtitle {
            text-align: center;
            color: #6b7280;
            font-size: 0.875rem;
            margin-bottom: 2rem;
        }

        /* ── Form Inputs ── */
        .form-floating {
            margin-bottom: 1rem;
        }

        .form-floating .form-control {
            background: rgba(255, 255, 255, 0.04);
            border: 1px solid rgba(255, 255, 255, 0.08);
            border-radius: 12px;
            color: #f8f9fa;
            font-size: 0.95rem;
            padding: 1rem 1rem 1rem 3rem;
            height: 56px;
            transition: all 0.3s ease;
        }

        .form-floating .form-control:focus {
            background: rgba(255, 255, 255, 0.06);
            border-color: rgba(212, 175, 55, 0.5);
            box-shadow: 0 0 0 3px rgba(212, 175, 55, 0.1);
            outline: none;
        }

        .form-floating label {
            color: #6b7280;
            padding-left: 3rem;
        }

        .form-floating .form-control:focus ~ label,
        .form-floating .form-control:not(:placeholder-shown) ~ label {
            color: #d4af37;
            transform: scale(0.8) translateY(-0.6rem) translateX(0.15rem);
        }

        .input-icon {
            position: absolute;
            left: 1rem;
            top: 50%;
            transform: translateY(-50%);
            color: #6b7280;
            z-index: 5;
            font-size: 1.1rem;
            transition: color 0.3s;
            pointer-events: none;
        }

        .form-floating:focus-within .input-icon { color: #d4af37; }

        /* ── Password Toggle ── */
        .password-toggle {
            position: absolute;
            right: 1rem;
            top: 50%;
            transform: translateY(-50%);
            z-index: 5;
            background: none;
            border: none;
            color: #6b7280;
            cursor: pointer;
            padding: 4px;
            transition: color 0.3s;
        }
        .password-toggle:hover { color: #d4af37; }

        /* ── Remember Me ── */
        .form-check-input {
            background-color: rgba(255,255,255,0.1);
            border-color: rgba(255,255,255,0.15);
        }
        .form-check-input:checked {
            background-color: #d4af37;
            border-color: #d4af37;
        }
        .form-check-label { color: #9ca3af; font-size: 0.875rem; }

        /* ── Login Button ── */
        .btn-login {
            width: 100%;
            padding: 0.85rem;
            border: none;
            border-radius: 12px;
            font-weight: 600;
            font-size: 1rem;
            color: #0a0a0a;
            background: linear-gradient(135deg, #d4af37, #f0d060);
            cursor: pointer;
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
            margin-top: 0.5rem;
        }

        .btn-login:hover {
            transform: translateY(-1px);
            box-shadow: 0 8px 25px rgba(212, 175, 55, 0.35);
            color: #0a0a0a;
        }

        .btn-login:active {
            transform: translateY(0);
        }

        .btn-login:disabled {
            opacity: 0.7;
            cursor: not-allowed;
            transform: none;
        }

        .btn-login .spinner-border {
            width: 1.2rem;
            height: 1.2rem;
            border-width: 2px;
        }

        /* ── Error Alert ── */
        .login-error {
            background: rgba(220, 38, 38, 0.1);
            border: 1px solid rgba(220, 38, 38, 0.2);
            border-radius: 12px;
            padding: 0.75rem 1rem;
            color: #fca5a5;
            font-size: 0.875rem;
            display: none;
            animation: shakeError 0.4s ease;
        }

        .login-error.show { display: flex; align-items: center; gap: 0.5rem; }

        @keyframes shakeError {
            0%, 100% { transform: translateX(0); }
            20% { transform: translateX(-8px); }
            40% { transform: translateX(8px); }
            60% { transform: translateX(-4px); }
            80% { transform: translateX(4px); }
        }

        /* ── Footer ── */
        .login-footer {
            text-align: center;
            margin-top: 1.5rem;
            color: #4b5563;
            font-size: 0.75rem;
        }

        /* ── Responsive ── */
        @media (max-width: 480px) {
            .login-card {
                margin: 1rem;
                padding: 2rem 1.5rem;
            }
        }
    </style>
</head>
<body>
    <!-- Animated Background -->
    <div class="login-bg"></div>
    <div class="glow-orb glow-orb-1"></div>
    <div class="glow-orb glow-orb-2"></div>

    <!-- Floating Particles -->
    <div class="particles">
        <div class="particle"></div>
        <div class="particle"></div>
        <div class="particle"></div>
        <div class="particle"></div>
        <div class="particle"></div>
        <div class="particle"></div>
        <div class="particle"></div>
        <div class="particle"></div>
        <div class="particle"></div>
        <div class="particle"></div>
    </div>

    <!-- Login Card -->
    <div class="login-card">
        <!-- Logo -->
        <div class="login-logo">
            <i class="bi bi-gem"></i>
        </div>

        <h1 class="login-title">Jewelry BI</h1>
        <p class="login-subtitle">Sign in to your analytics dashboard</p>

        <!-- Error Message -->
        <div class="login-error mb-3" id="loginError">
            <i class="bi bi-exclamation-circle"></i>
            <span id="errorText">Invalid credentials</span>
        </div>

        <!-- Login Form -->
        <form id="loginForm" autocomplete="on">
            <div class="form-floating position-relative">
                <i class="bi bi-person input-icon"></i>
                <input type="text" class="form-control" id="username" name="username"
                       placeholder="Username" required autofocus autocomplete="username">
                <label for="username">Username</label>
            </div>

            <div class="form-floating position-relative">
                <i class="bi bi-lock input-icon"></i>
                <input type="password" class="form-control" id="password" name="password"
                       placeholder="Password" required autocomplete="current-password">
                <label for="password">Password</label>
                <button type="button" class="password-toggle" id="togglePassword" tabindex="-1">
                    <i class="bi bi-eye"></i>
                </button>
            </div>

            <div class="d-flex justify-content-between align-items-center mb-3">
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" id="rememberMe">
                    <label class="form-check-label" for="rememberMe">Remember me</label>
                </div>
            </div>

            <button type="submit" class="btn btn-login" id="loginBtn">
                <span class="btn-text">Sign In</span>
                <span class="btn-loading d-none">
                    <span class="spinner-border spinner-border-sm me-2" role="status"></span>
                    Signing in...
                </span>
            </button>
        </form>

        <div class="text-center mt-3">
            <span style="color: #6b7280; font-size: 0.875rem;">Don't have an account?</span>
            <a href="/register.php" style="color: #d4af37; text-decoration: none; font-weight: 600; font-size: 0.875rem; margin-left: 4px;">Register</a>
        </div>

        <div class="login-footer">
            <p class="mb-0">Jewelry Business Intelligence System</p>
            <p class="mb-0 mt-1">© <?= date('Y') ?> — BCA Final Year Project</p>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

    <script>
        const form = document.getElementById('loginForm');
        const loginBtn = document.getElementById('loginBtn');
        const errorBox = document.getElementById('loginError');
        const errorText = document.getElementById('errorText');
        const togglePass = document.getElementById('togglePassword');
        const passInput = document.getElementById('password');

        // Toggle password visibility
        togglePass.addEventListener('click', () => {
            const type = passInput.type === 'password' ? 'text' : 'password';
            passInput.type = type;
            togglePass.querySelector('i').className = type === 'password' ? 'bi bi-eye' : 'bi bi-eye-slash';
        });

        // Handle login form submission
        form.addEventListener('submit', async (e) => {
            e.preventDefault();
            
            // Show loading state
            loginBtn.disabled = true;
            loginBtn.querySelector('.btn-text').classList.add('d-none');
            loginBtn.querySelector('.btn-loading').classList.remove('d-none');
            errorBox.classList.remove('show');

            const username = document.getElementById('username').value.trim();
            const password = document.getElementById('password').value;

            try {
                const response = await fetch('/api/auth.php?action=login', {
                    method: 'POST',
                    headers: { 'Content-Type': 'application/json' },
                    body: JSON.stringify({ username, password })
                });

                const data = await response.json();

                if (data.success) {
                    // Success — redirect with a small delay for UX
                    loginBtn.querySelector('.btn-loading').innerHTML = '<i class="bi bi-check-circle me-2"></i>Success! Redirecting...';
                    setTimeout(() => {
                        window.location.href = data.redirect || '/modules/dashboard/';
                    }, 500);
                } else {
                    // Error
                    errorText.textContent = data.message || 'Invalid username or password';
                    errorBox.classList.add('show');
                    
                    // Reset button
                    loginBtn.disabled = false;
                    loginBtn.querySelector('.btn-text').classList.remove('d-none');
                    loginBtn.querySelector('.btn-loading').classList.add('d-none');
                    
                    // Shake the card
                    document.querySelector('.login-card').style.animation = 'none';
                    setTimeout(() => {
                        document.querySelector('.login-card').style.animation = '';
                    }, 10);
                }
            } catch (err) {
                errorText.textContent = 'Network error. Please try again.';
                errorBox.classList.add('show');
                loginBtn.disabled = false;
                loginBtn.querySelector('.btn-text').classList.remove('d-none');
                loginBtn.querySelector('.btn-loading').classList.add('d-none');
            }
        });

        // Clear error on input
        document.querySelectorAll('.form-control').forEach(input => {
            input.addEventListener('input', () => errorBox.classList.remove('show'));
        });
    </script>
</body>
</html>
