# 📏 Coding Standards & File Organization

## Jewelry Business Intelligence System

> Bootstrap-first approach with minimal custom CSS. Clean, systematic, easy-to-understand code.

---

## 🎯 Core Principle

> **Use Bootstrap 5 classes for EVERYTHING possible. Write custom CSS ONLY when Bootstrap cannot do it.**

---

## 📁 Folder Structure

```
jwellery/
│
├── index.php                          # Entry point → redirects to dashboard
│
├── assets/                            # All static files
│   │
│   ├── css/
│   │   ├── variables.css              # CSS custom properties (colors, fonts)
│   │   └── custom.css                 # ONLY styles Bootstrap can't handle
│   │
│   ├── js/
│   │   ├── app.js                     # Global JS (sidebar toggle, helpers)
│   │   ├── charts.js                  # Chart.js helper functions
│   │   └── modules/
│   │       ├── dashboard.js           # Dashboard-specific JS
│   │       ├── sales.js               # Sales page JS
│   │       ├── inventory.js           # Inventory page JS
│   │       └── customers.js           # Customers page JS
│   │
│   └── images/
│       ├── logo.png                   # App logo
│       └── favicon.ico                # Browser favicon
│
├── includes/                          # Shared PHP components
│   ├── config.php                     # DB credentials + app settings
│   ├── db.php                         # PDO connection (single file)
│   ├── header.php                     # <head> + navbar (Bootstrap)
│   ├── sidebar.php                    # Sidebar navigation (Bootstrap)
│   └── footer.php                     # Footer + script tags
│
├── modules/                           # Page modules (1 folder = 1 feature)
│   │
│   ├── dashboard/
│   │   └── index.php                  # Main dashboard with KPI cards
│   │
│   ├── sales/
│   │   ├── index.php                  # Sales overview
│   │   ├── daily.php                  # Daily breakdown
│   │   ├── monthly.php                # Monthly trends
│   │   └── yearly.php                 # Yearly comparison
│   │
│   ├── inventory/
│   │   ├── index.php                  # Stock overview
│   │   ├── deadstock.php              # Dead stock list
│   │   └── restock.php                # Restock recommendations
│   │
│   ├── customers/
│   │   ├── index.php                  # Customer overview
│   │   ├── segments.php               # Segmentation
│   │   └── premium.php                # Premium/VIP customers
│   │
│   └── reports/
│       ├── index.php                  # Report selection
│       └── export.php                 # CSV export handler
│
├── api/                               # JSON API endpoints
│   ├── dashboard.php                  # Dashboard KPI data
│   ├── sales.php                      # Sales data
│   ├── inventory.php                  # Inventory data
│   └── customers.php                  # Customer data
│
├── sql/                               # Database files
│   ├── schema.sql                     # CREATE TABLE statements
│   └── seed_data.sql                  # INSERT dummy data
│
└── data/                              # Original Excel files (reference)
    ├── Dummy_Jewellery_Inventory.xlsx
    ├── Jaipur_Focused_Customer_Report.xlsx
    └── Jewellery_Sales_Report_2024_2026_Sorted.xlsx
```

### Rules:
- **1 folder = 1 feature** (dashboard, sales, inventory, customers, reports)
- **1 file = 1 purpose** (never mix dashboard + sales in same file)
- **includes/** = reusable parts (header, footer, sidebar, config)
- **api/** = returns JSON only (no HTML)
- **modules/** = returns HTML pages (includes header/sidebar/footer)

---

## 🎨 CSS Strategy: Bootstrap First

### Rule: Use Bootstrap classes directly in HTML

```html
<!-- ✅ CORRECT: Use Bootstrap classes -->
<div class="card shadow-sm border-0 rounded-3">
    <div class="card-body p-4">
        <h5 class="card-title text-muted fs-6 fw-semibold text-uppercase">
            Total Revenue
        </h5>
        <p class="display-6 fw-bold text-primary mb-0">₹1,54,20,000</p>
        <span class="badge bg-success-subtle text-success mt-2">
            <i class="bi bi-arrow-up"></i> 12.5%
        </span>
    </div>
</div>

<!-- ❌ WRONG: Creating custom classes for things Bootstrap already does -->
<div class="revenue-card">
    <h5 class="revenue-title">Total Revenue</h5>
    <p class="revenue-value">₹1,54,20,000</p>
</div>
```

### When Custom CSS IS Needed

Only write custom CSS for things Bootstrap **cannot** do:

| Need | Bootstrap Can Do? | Custom CSS? |
|------|:-:|:-:|
| Card layout, padding, margins | ✅ Yes | ❌ No |
| Grid system (rows, cols) | ✅ Yes | ❌ No |
| Tables (striped, hover, responsive) | ✅ Yes | ❌ No |
| Buttons, badges, alerts | ✅ Yes | ❌ No |
| Spacing (m-3, p-4, gap-3) | ✅ Yes | ❌ No |
| Text colors, font sizes | ✅ Yes | ❌ No |
| Navbar, sidebar, dropdowns | ✅ Yes | ❌ No |
| Dark theme colors | ⚠️ Partial | ✅ variables.css |
| Sidebar width & transitions | ❌ No | ✅ custom.css |
| Chart container sizing | ❌ No | ✅ custom.css |
| KPI card gradient borders | ❌ No | ✅ custom.css |
| Custom scrollbar styling | ❌ No | ✅ custom.css |
| Glassmorphism effects | ❌ No | ✅ custom.css |

### CSS File Structure

#### `assets/css/variables.css` — Theme Variables Only (~30 lines)

```css
/* === Theme Variables === */
:root {
    --bs-body-bg: #0f172a;
    --bs-body-color: #f8fafc;
    --bs-card-bg: #1e293b;
    --bs-border-color: rgba(99, 102, 241, 0.15);

    /* Custom properties Bootstrap doesn't have */
    --sidebar-width: 260px;
    --sidebar-collapsed: 70px;
    --header-height: 64px;
}
```

#### `assets/css/custom.css` — Only What Bootstrap Can't Do (~100-150 lines max)

```css
/* === Layout (Bootstrap can't do fixed sidebar) === */
.sidebar { width: var(--sidebar-width); transition: width 0.3s; }
.main-content { margin-left: var(--sidebar-width); }

/* === Chart containers (Bootstrap has no chart support) === */
.chart-wrapper { position: relative; height: 300px; }

/* === Custom card effects (beyond Bootstrap) === */
.kpi-card { border-left: 4px solid var(--bs-primary); }
.kpi-card:hover { transform: translateY(-2px); }

/* === Scrollbar (browser-specific) === */
::-webkit-scrollbar { width: 6px; }
```

> **Target: custom.css should be under 150 lines.** If it's growing beyond that, you're probably not using Bootstrap enough.

---

## 🐘 PHP Coding Standards

### File Template

Every PHP page follows this structure:

```php
<?php
/**
 * Page: Dashboard
 * Module: dashboard
 * Description: Main KPI dashboard with charts
 */

// 1. Include config & database
require_once '../../includes/config.php';
require_once '../../includes/db.php';

// 2. Fetch data
$totalRevenue = getTotalRevenue($pdo);
$totalOrders  = getTotalOrders($pdo);

// 3. Include header (starts HTML)
require_once '../../includes/header.php';
require_once '../../includes/sidebar.php';
?>

<!-- 4. Page content (Bootstrap HTML) -->
<main class="main-content">
    <div class="container-fluid p-4">

        <h1 class="h3 fw-bold mb-4">Dashboard</h1>

        <!-- KPI Cards Row -->
        <div class="row g-4 mb-4">
            <div class="col-xl-3 col-md-6">
                <!-- Card content -->
            </div>
        </div>

    </div>
</main>

<?php
// 5. Include footer (closes HTML)
require_once '../../includes/footer.php';
?>
```

### Naming Conventions

| Item | Convention | Example |
|------|-----------|---------|
| PHP files | lowercase, snake_case | `dead_stock.php` → NO, `deadstock.php` → YES |
| PHP variables | camelCase | `$totalRevenue`, `$avgOrderValue` |
| PHP functions | camelCase | `getTotalRevenue()`, `getDeadStock()` |
| Database tables | lowercase, snake_case | `sale_items`, `customers` |
| Database columns | lowercase, snake_case | `total_amount`, `sale_date` |
| CSS custom properties | kebab-case | `--sidebar-width`, `--header-height` |
| JS variables | camelCase | `revenueChart`, `salesData` |
| JS functions | camelCase | `loadDashboard()`, `renderChart()` |
| File/folder names | lowercase | `dashboard/`, `sales/`, `index.php` |

### Database Queries — Always Use PDO Prepared Statements

```php
// ✅ CORRECT: Prepared statement
function getSalesByMonth($pdo, $year) {
    $sql = "SELECT 
                DATE_FORMAT(sale_date, '%Y-%m') AS month,
                SUM(total_amount) AS revenue,
                COUNT(*) AS orders
            FROM sales 
            WHERE YEAR(sale_date) = ?
            GROUP BY month
            ORDER BY month";

    $stmt = $pdo->prepare($sql);
    $stmt->execute([$year]);
    return $stmt->fetchAll(PDO::FETCH_ASSOC);
}

// ❌ WRONG: String concatenation
$result = $pdo->query("SELECT * FROM sales WHERE YEAR(sale_date) = $year");
```

### Function Organization in `db.php`

```php
<?php
/**
 * Database Connection & Helper Functions
 */

// --- Connection ---
function getConnection() {
    $dsn = "mysql:host=db;dbname=db;charset=utf8mb4";
    return new PDO($dsn, 'db', 'db', [
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC
    ]);
}

$pdo = getConnection();

// --- Dashboard Functions ---
function getTotalRevenue($pdo) { /* ... */ }
function getTotalOrders($pdo) { /* ... */ }
function getTotalCustomers($pdo) { /* ... */ }

// --- Sales Functions ---
function getSalesByMonth($pdo, $year) { /* ... */ }
function getBestSellers($pdo, $limit = 10) { /* ... */ }

// --- Inventory Functions ---
function getInventoryStatus($pdo) { /* ... */ }
function getDeadStock($pdo, $days = 90) { /* ... */ }
function getRestockRecommendations($pdo) { /* ... */ }

// --- Customer Functions ---
function getCustomerSegments($pdo) { /* ... */ }
function getPremiumCustomers($pdo) { /* ... */ }
```

---

## 📊 JavaScript Standards

### Bootstrap + Chart.js Loading (via CDN)

In `includes/header.php`:
```html
<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Bootstrap Icons -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">
<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
<!-- Theme variables + minimal custom CSS -->
<link href="/assets/css/variables.css" rel="stylesheet">
<link href="/assets/css/custom.css" rel="stylesheet">
```

In `includes/footer.php`:
```html
<!-- Bootstrap JS Bundle (includes Popper) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Chart.js -->
<script src="https://cdn.jsdelivr.net/npm/chart.js@4.4.7/dist/chart.umd.min.js"></script>
<!-- App JS -->
<script src="/assets/js/app.js"></script>
```

### Chart.js Helper Pattern

```javascript
// assets/js/charts.js

/**
 * Create a standardized chart
 * @param {string} canvasId - Canvas element ID
 * @param {string} type - Chart type (bar, line, doughnut, etc.)
 * @param {object} data - Chart data object
 * @returns {Chart} Chart instance
 */
function createChart(canvasId, type, data) {
    const ctx = document.getElementById(canvasId);
    if (!ctx) return null;

    return new Chart(ctx, {
        type: type,
        data: data,
        options: getDefaultOptions(type)
    });
}

// Standard color palette for all charts
const CHART_COLORS = {
    primary:  '#6366f1',
    success:  '#22c55e',
    warning:  '#f59e0b',
    danger:   '#ef4444',
    info:     '#06b6d4',
    purple:   '#a855f7',
    pink:     '#ec4899',
    orange:   '#f97316'
};
```

### AJAX Pattern — Fetch API

```javascript
// ✅ CORRECT: Clean fetch pattern
async function loadDashboardData() {
    try {
        const response = await fetch('/api/dashboard.php');
        const data = await response.json();
        
        // Update KPI cards
        document.getElementById('totalRevenue').textContent = formatCurrency(data.kpis.total_revenue);
        document.getElementById('totalOrders').textContent = data.kpis.total_orders;
        
        // Render charts
        createChart('revenueChart', 'line', data.charts.monthly_revenue);
    } catch (error) {
        console.error('Failed to load dashboard:', error);
    }
}

// Helper: Format number as Indian currency
function formatCurrency(amount) {
    return '₹' + new Intl.NumberFormat('en-IN').format(amount);
}
```

---

## 📝 HTML Standards

### Use Bootstrap Components Directly

```html
<!-- KPI Card: 100% Bootstrap classes, zero custom CSS needed -->
<div class="col-xl-3 col-md-6">
    <div class="card border-0 shadow-sm rounded-3 h-100">
        <div class="card-body p-4">
            <div class="d-flex align-items-center mb-3">
                <div class="bg-primary bg-opacity-10 rounded-3 p-2 me-3">
                    <i class="bi bi-currency-rupee text-primary fs-4"></i>
                </div>
                <span class="text-muted fw-semibold small text-uppercase">
                    Total Revenue
                </span>
            </div>
            <h3 class="fw-bold mb-1" id="totalRevenue">₹0</h3>
            <span class="badge bg-success-subtle text-success">
                <i class="bi bi-arrow-up"></i> 12.5% vs last month
            </span>
        </div>
    </div>
</div>
```

### Bootstrap Grid for Layouts

```html
<!-- Dashboard layout: Bootstrap grid, NO custom CSS -->
<div class="row g-4 mb-4">
    <!-- KPI Cards: 4 columns on XL, 2 on MD, 1 on mobile -->
    <div class="col-xl-3 col-md-6"><!-- Card 1 --></div>
    <div class="col-xl-3 col-md-6"><!-- Card 2 --></div>
    <div class="col-xl-3 col-md-6"><!-- Card 3 --></div>
    <div class="col-xl-3 col-md-6"><!-- Card 4 --></div>
</div>

<div class="row g-4 mb-4">
    <!-- Charts: 2 columns on LG, 1 on mobile -->
    <div class="col-lg-8"><!-- Revenue chart --></div>
    <div class="col-lg-4"><!-- Category pie chart --></div>
</div>

<div class="row g-4">
    <!-- Tables: Full width -->
    <div class="col-12"><!-- Recent sales table --></div>
</div>
```

### Bootstrap Tables

```html
<!-- ✅ Use Bootstrap table classes, NOT custom table styling -->
<div class="table-responsive">
    <table class="table table-hover align-middle">
        <thead class="table-dark">
            <tr>
                <th>Product</th>
                <th>Category</th>
                <th>Stock</th>
                <th>Status</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>Gold Chain 22K</td>
                <td><span class="badge bg-primary">Chain</span></td>
                <td>15</td>
                <td><span class="badge bg-success">In Stock</span></td>
            </tr>
        </tbody>
    </table>
</div>
```

---

## 🔄 API Response Format

All API endpoints return consistent JSON:

```json
{
    "success": true,
    "data": { },
    "message": "Data loaded successfully",
    "timestamp": "2026-06-26T18:00:00Z"
}
```

Error response:
```json
{
    "success": false,
    "data": null,
    "message": "Invalid parameter: year",
    "timestamp": "2026-06-26T18:00:00Z"
}
```

---

## ✅ Code Review Checklist

Before committing any file, verify:

- [ ] **Bootstrap first:** No custom CSS for things Bootstrap handles
- [ ] **custom.css < 150 lines:** If more, refactor to use Bootstrap
- [ ] **PDO prepared statements:** No raw SQL with variables
- [ ] **File structure:** Each file is in the correct folder
- [ ] **Comments:** Every PHP file has a header comment
- [ ] **Consistent naming:** camelCase (PHP/JS), snake_case (DB)
- [ ] **No inline styles:** Use Bootstrap classes or custom.css
- [ ] **Responsive:** Test at 1920px, 1366px, 768px, 375px
- [ ] **Clean indentation:** 4 spaces for PHP, 2 spaces for HTML/CSS/JS
