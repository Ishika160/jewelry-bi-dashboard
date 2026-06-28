<?php
$currentPage = $_SERVER['REQUEST_URI'];
$currentUser = getCurrentUser();
$userName = $currentUser ? $currentUser['full_name'] : 'User';
$userRole = $currentUser ? ucfirst($currentUser['role']) : '';
$avatarColor = $currentUser ? $currentUser['avatar_color'] : '#d4af37';
$avatarInitial = strtoupper(substr($userName, 0, 1));
?>
<!-- Sidebar -->
<aside class="sidebar bg-surface border-end " id="sidebar">
    <div class="d-flex align-items-center justify-content-center py-4 border-bottom ">
        <i class="bi bi-gem text-primary fs-3 me-2"></i>
        <h5 class="mb-0 fw-bold d-none d-md-block text-body">Jewelry BI</h5>
    </div>
    
    <div class="p-3">
        <ul class="nav nav-pills flex-column gap-2">
            <li class="nav-item">
                <a href="<?= APP_URL ?>modules/dashboard/" class="nav-link text-body <?= strpos($currentPage, '/modules/dashboard') !== false ? 'active' : '' ?>">
                    <i class="bi bi-speedometer2 me-2"></i> <span class="d-none d-md-inline">Dashboard</span>
                </a>
            </li>
            
            <li class="nav-item mt-2">
                <small class="text-muted fw-bold px-3 d-none d-md-block text-uppercase">Advanced BI</small>
            </li>
            <li class="nav-item">
                <a href="<?= APP_URL ?>modules/predictions/" class="nav-link text-warning fw-semibold <?= strpos($currentPage, '/modules/predictions') !== false ? 'active' : '' ?>">
                    <i class="bi bi-robot me-2"></i> <span class="d-none d-md-inline">AI Predictions</span>
                </a>
            </li>
            <li class="nav-item">
                <a href="<?= APP_URL ?>modules/analytics/" class="nav-link text-body <?= strpos($currentPage, '/modules/analytics') !== false ? 'active' : '' ?>">
                    <i class="bi bi-grid-3x3-gap me-2"></i> <span class="d-none d-md-inline">Heatmaps</span>
                </a>
            </li>
            
            <li class="nav-item mt-2">
                <small class="text-muted fw-bold px-3 d-none d-md-block text-uppercase">Core Modules</small>
            </li>
            <li class="nav-item">
                <a href="<?= APP_URL ?>modules/sales/" class="nav-link text-body <?= strpos($currentPage, '/modules/sales') !== false ? 'active' : '' ?>">
                    <i class="bi bi-graph-up me-2"></i> <span class="d-none d-md-inline">Sales Analytics</span>
                </a>
            </li>
            <li class="nav-item">
                <a href="<?= APP_URL ?>modules/inventory/" class="nav-link text-body <?= strpos($currentPage, '/modules/inventory') !== false ? 'active' : '' ?>">
                    <i class="bi bi-box-seam me-2"></i> <span class="d-none d-md-inline">Inventory</span>
                </a>
            </li>
            <li class="nav-item">
                <a href="<?= APP_URL ?>modules/customers/" class="nav-link text-body <?= strpos($currentPage, '/modules/customers') !== false ? 'active' : '' ?>">
                    <i class="bi bi-people me-2"></i> <span class="d-none d-md-inline">Customers</span>
                </a>
            </li>

            <li class="nav-item mt-4">
                <small class="text-muted fw-bold px-3 d-none d-md-block text-uppercase">Actions</small>
            </li>
            <li class="nav-item">
                <a href="<?= APP_URL ?>modules/inventory/#restock" class="nav-link text-body <?= strpos($currentPage, '/restock') !== false ? 'active' : '' ?>">
                    <i class="bi bi-arrow-repeat me-2"></i> <span class="d-none d-md-inline">Restock Alerts</span>
                </a>
            </li>
            <li class="nav-item">
                <a href="<?= APP_URL ?>modules/reports/" class="nav-link text-body <?= strpos($currentPage, '/modules/reports') !== false ? 'active' : '' ?>">
                    <i class="bi bi-file-earmark-text me-2"></i> <span class="d-none d-md-inline">Reports</span>
                </a>
            </li>
        </ul>
    </div>
</aside>

<!-- Main Content Area -->
<div class="flex-grow-1 d-flex flex-column" style="min-width: 0;">
    <!-- Top Navbar -->
    <header class="bg-surface border-bottom py-3 px-4 d-flex justify-content-between align-items-center sticky-top" style="z-index: 1050;">
        <button class="btn btn-outline-secondary border-0 d-md-none" id="sidebarToggle">
            <i class="bi bi-list fs-4"></i>
        </button>

        <!-- Global Search Bar -->
        <div class="search-wrapper position-relative d-none d-md-block ms-3 flex-grow-1" style="max-width: 400px;">
            <div class="position-relative">
                <i class="bi bi-search position-absolute top-50 translate-middle-y ms-3 text-muted"></i>
                <input type="text" class="form-control form-control-sm ps-5 search-input" id="globalSearch"
                       placeholder="Search products, customers, sales... (Ctrl+K)"
                       autocomplete="off">
                <kbd class="search-kbd position-absolute top-50 translate-middle-y end-0 me-2 d-none d-lg-inline-block">/</kbd>
            </div>
            <!-- Search Results Dropdown -->
            <div class="search-results d-none" id="searchResults"></div>
        </div>

        <div class="ms-auto d-flex align-items-center">
            <span class="text-muted me-3 d-none d-lg-inline"><i class="bi bi-clock me-1"></i>Data updated: Today</span>
            
            <!-- Theme Toggle -->
            <button class="btn btn-outline-secondary border-0 me-2" id="themeToggle" title="Toggle Dark/Light Mode">
                <i class="bi bi-moon-stars fs-5"></i>
            </button>

            <!-- Notification Bell -->
            <div class="dropdown me-2">
                <button class="btn btn-outline-secondary border-0 position-relative" type="button" data-bs-toggle="dropdown" data-bs-auto-close="outside" id="notifBtn">
                    <i class="bi bi-bell fs-5"></i>
                    <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger d-none" id="notifBadge" style="font-size: 0.65rem;">
                        0
                    </span>
                </button>
                <ul class="dropdown-menu dropdown-menu-end notification-dropdown shadow-lg" style="width: 360px; max-height: 420px; overflow-y: auto;" id="notifList">
                    <li class="px-3 py-4 text-center text-muted">
                        <div class="spinner-border spinner-border-sm text-primary" role="status"></div>
                        <span class="small ms-2">Loading alerts...</span>
                    </li>
                </ul>
            </div>
            
            <!-- User Dropdown -->
            <div class="dropdown">
                <button class="btn btn-outline-secondary border-0 dropdown-toggle d-flex align-items-center" type="button" data-bs-toggle="dropdown">
                    <div class="navbar-avatar me-2" style="background-color: <?= htmlspecialchars($avatarColor) ?>;">
                        <?= $avatarInitial ?>
                    </div>
                    <span class="nav-user-name d-none d-md-inline"><?= htmlspecialchars($userName) ?></span>
                </button>
                <ul class="dropdown-menu dropdown-menu-end">
                    <li class="px-3 py-2">
                        <div class="fw-semibold"><?= htmlspecialchars($userName) ?></div>
                        <small class="text-muted"><?= $userRole ?></small>
                    </li>
                    <li><hr class="dropdown-divider"></li>
                    <li><a class="dropdown-item" href="<?= APP_URL ?>modules/settings/"><i class="bi bi-gear me-2"></i>Settings</a></li>
                    <li><hr class="dropdown-divider"></li>
                    <li><a class="dropdown-item text-danger" href="#" id="logoutLink"><i class="bi bi-box-arrow-right me-2"></i>Logout</a></li>
                </ul>
            </div>
        </div>
    </header>
