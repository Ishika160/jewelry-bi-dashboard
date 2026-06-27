<?php
/**
 * Configuration File
 * Loads environment variables and sets up application constants
 */

// Define absolute path to project root
define('ROOT_DIR', dirname(__DIR__));

// Simple .env parser function
function loadEnv($filePath) {
    if (!file_exists($filePath)) {
        return false;
    }
    
    $lines = file($filePath, FILE_IGNORE_NEW_LINES | FILE_SKIP_EMPTY_LINES);
    foreach ($lines as $line) {
        if (strpos(trim($line), '#') === 0) {
            continue; // Skip comments
        }
        
        list($name, $value) = explode('=', $line, 2);
        $name = trim($name);
        $value = trim($value, ' "');
        
        if (!array_key_exists($name, $_SERVER) && !array_key_exists($name, $_ENV)) {
            putenv(sprintf('%s=%s', $name, $value));
            $_ENV[$name] = $value;
            $_SERVER[$name] = $value;
        }
    }
    return true;
}

// Load the .env file
loadEnv(ROOT_DIR . '/.env');

// Set Timezone
date_default_timezone_set($_ENV['TIMEZONE'] ?? 'Asia/Kolkata');

// Define global app settings as constants for easy access
define('APP_NAME', $_ENV['APP_NAME'] ?? 'Jewelry BI Dashboard');
define('APP_URL', $_ENV['APP_URL'] ?? 'http://localhost');
define('APP_ENV', $_ENV['APP_ENV'] ?? 'development');
