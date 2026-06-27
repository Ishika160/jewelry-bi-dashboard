# 🚀 Setup Guide — Jewelry Business Intelligence System

> Step-by-step instructions to set up the development environment using DDEV.

---

## 📋 Prerequisites

### 1. Install Docker Desktop

DDEV requires Docker to run containers for PHP, MySQL, and web server.

**Linux (Ubuntu/Debian):**

```bash
# Install Docker
sudo apt-get update
sudo apt-get install -y docker.io docker-compose-plugin

# Add your user to docker group
sudo usermod -aG docker $USER

# Restart your session or run:
newgrp docker

# Verify installation
docker --version
```

**Windows/Mac:**
- Download and install [Docker Desktop](https://www.docker.com/products/docker-desktop/)
- Ensure Docker is running before proceeding

---

### 2. Install DDEV

**Linux:**

```bash
# Install DDEV via official script
curl -fsSL https://ddev.com/install.sh | bash

# Verify installation
ddev version
```

**Windows (WSL2):**

```bash
# Inside WSL2 terminal
curl -fsSL https://ddev.com/install.sh | bash
```

**macOS (Homebrew):**

```bash
brew install ddev/ddev/ddev
```

---

### 3. Install Git

```bash
# Linux
sudo apt-get install -y git

# Verify
git --version
```

---

## 🏗️ Project Setup

### Step 1: Clone or Navigate to Project

```bash
# If cloning from repository
git clone <repository-url>
cd jwellery

# If starting from existing directory
cd /path/to/jwellery
```

---

### Step 2: Initialize DDEV

```bash
# Configure DDEV for the project
ddev config --project-type=php --docroot=. --php-version=8.1

# This creates .ddev/config.yaml with settings:
# - Project name: jwellery
# - PHP version: 8.1
# - Database: MySQL 8.0
# - Web server: nginx-fpm
```

**Expected `.ddev/config.yaml`:**

```yaml
name: jwellery
type: php
docroot: "."
php_version: "8.1"
webserver_type: nginx-fpm
database:
  type: mysql
  version: "8.0"
router_http_port: "80"
router_https_port: "443"
```

---

### Step 3: Start DDEV

```bash
# Start the development environment
ddev start

# Expected output:
# Starting jwellery...
# Successfully started jwellery
# Project can be reached at https://jwellery.ddev.site
```

**What DDEV starts:**
- 🌐 **Web Server** (nginx) — serves PHP files
- 🐘 **PHP 8.1** — processes backend logic
- 🗄️ **MySQL 8.0** — database server
- 📊 **phpMyAdmin** — database management UI

---

### Step 4: Verify Environment

```bash
# Check DDEV status
ddev describe

# Test PHP
ddev exec php --version

# Test MySQL connection
ddev mysql -e "SELECT VERSION();"

# Open in browser
ddev launch
```

---

## 🗄️ Database Setup

### Step 5: Create Database Schema

```bash
# Import the schema
ddev mysql < sql/schema.sql

# Verify tables were created
ddev mysql -e "SHOW TABLES;"
```

**Expected tables:**
- `categories`
- `products`
- `inventory`
- `customers`
- `sales`
- `sale_items`

---

### Step 6: Import Dummy Data

```bash
# Import seed data (converted from Excel files)
ddev mysql < sql/seed_data.sql

# Verify data import
ddev mysql -e "SELECT COUNT(*) AS total_products FROM products;"
ddev mysql -e "SELECT COUNT(*) AS total_customers FROM customers;"
ddev mysql -e "SELECT COUNT(*) AS total_sales FROM sales;"
```

---

### Step 7: Access phpMyAdmin

```bash
# Open phpMyAdmin in browser
ddev launch -p

# Or visit: https://jwellery.ddev.site:8037
```

Use phpMyAdmin to:
- Browse imported data
- Run custom queries
- Verify table relationships

---

## 🌐 Accessing the Application

| Service | URL |
|---------|-----|
| **Main Application** | `https://jwellery.ddev.site` |
| **phpMyAdmin** | `https://jwellery.ddev.site:8037` |
| **Mailpit** (email testing) | `https://jwellery.ddev.site:8026` |

---

## 🔧 DDEV Common Commands

| Command | Description |
|---------|-------------|
| `ddev start` | Start the project |
| `ddev stop` | Stop the project |
| `ddev restart` | Restart all containers |
| `ddev describe` | Show project info & URLs |
| `ddev launch` | Open project in browser |
| `ddev mysql` | Open MySQL CLI |
| `ddev ssh` | SSH into web container |
| `ddev logs` | View container logs |
| `ddev snapshot` | Create database snapshot |
| `ddev snapshot restore` | Restore database snapshot |
| `ddev poweroff` | Stop all DDEV projects |

---

## 🗂️ PHP Configuration

The project uses the following PHP configuration:

```php
// includes/config.php

<?php
/**
 * Database Configuration
 * DDEV automatically provides these environment variables
 */

$db_host = 'db';           // DDEV MySQL container hostname
$db_name = 'db';           // Default DDEV database name
$db_user = 'db';           // Default DDEV database user
$db_pass = 'db';           // Default DDEV database password
$db_port = 3306;           // MySQL port

// Application settings
$app_name = 'Jewelry BI Dashboard';
$app_version = '1.0.0';
$app_url = 'https://jwellery.ddev.site';

// Timezone
date_default_timezone_set('Asia/Kolkata');
```

> **Note:** DDEV uses `db` as the default hostname, username, password, and database name. No external database configuration is needed.

---

## ⚠️ Troubleshooting

### Docker not running
```bash
# Check Docker status
sudo systemctl status docker

# Start Docker
sudo systemctl start docker
```

### Port conflicts
```bash
# Change DDEV router ports
ddev config --router-http-port=8080 --router-https-port=8443
ddev restart
```

### Database connection issues
```bash
# Restart database container
ddev restart

# Check MySQL status
ddev exec mysqladmin ping -h db -u db -pdb
```

### Permission issues
```bash
# Fix file permissions
chmod -R 755 .
```

### Reset everything
```bash
# Full reset
ddev delete -O
ddev config --project-type=php --docroot=. --php-version=8.1
ddev start
ddev mysql < sql/schema.sql
ddev mysql < sql/seed_data.sql
```

---

## 🔄 Development Workflow

```
1. Start DDEV         →  ddev start
2. Write PHP/HTML/CSS  →  Edit files in VS Code
3. View changes        →  Refresh browser (auto-served by DDEV)
4. Check database      →  ddev mysql or phpMyAdmin
5. Stop when done      →  ddev stop
```

> **Hot Reload:** Changes to PHP, HTML, CSS, and JS files are served immediately — no build step required.

---

## 📝 Next Steps

After setup is complete:

1. ✅ Open `https://jwellery.ddev.site` in your browser
2. ✅ Verify the dashboard loads correctly
3. ✅ Check phpMyAdmin for data integrity
4. ✅ Begin module development (see [MODULES.md](MODULES.md))
