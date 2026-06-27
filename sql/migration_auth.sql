-- ============================================================
-- Jewelry BI — Auth Migration
-- Adds users + activity_log tables
-- Run: ddev mysql < sql/migration_auth.sql
-- ============================================================

USE db;

-- ============================================================
-- 1. USERS — Application users with role-based access
-- ============================================================
DROP TABLE IF EXISTS activity_log;
DROP TABLE IF EXISTS users;

CREATE TABLE users (
    user_id       INT AUTO_INCREMENT PRIMARY KEY,
    username      VARCHAR(50)  NOT NULL UNIQUE,
    full_name     VARCHAR(200) NOT NULL,
    email         VARCHAR(200) DEFAULT NULL,
    password_hash VARCHAR(255) NOT NULL,
    role          ENUM('admin','viewer') NOT NULL DEFAULT 'viewer',
    avatar_color  VARCHAR(7)   DEFAULT '#d4af37' COMMENT 'Hex color for avatar circle',
    is_active     TINYINT(1)   DEFAULT 1,
    last_login    DATETIME     DEFAULT NULL,
    created_at    DATETIME     DEFAULT CURRENT_TIMESTAMP,
    updated_at    DATETIME     DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    INDEX idx_username (username),
    INDEX idx_role (role)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- ============================================================
-- 2. ACTIVITY_LOG — Audit trail for user actions
-- ============================================================
CREATE TABLE activity_log (
    log_id      INT AUTO_INCREMENT PRIMARY KEY,
    user_id     INT DEFAULT NULL,
    action      VARCHAR(100) NOT NULL COMMENT 'e.g. login, logout, export, view_page',
    details     TEXT DEFAULT NULL,
    ip_address  VARCHAR(45)  DEFAULT NULL,
    created_at  DATETIME     DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_activity_user
        FOREIGN KEY (user_id) REFERENCES users(user_id)
        ON DELETE SET NULL ON UPDATE CASCADE,

    INDEX idx_user (user_id),
    INDEX idx_action (action),
    INDEX idx_created (created_at)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- ============================================================
-- 3. FIRST USER — Created via /register.php (web-based registration page)
-- No hardcoded users — the registration page uses PHP password_hash()
-- to securely hash the password at runtime.
-- ============================================================

SELECT 'Auth migration completed successfully! Visit /register.php to register your admin account.' AS status;
