<?php
require_once '../../includes/db.php';
$extra_js = '/assets/js/modules/inventory.js';
require_once '../../includes/header.php';
require_once '../../includes/sidebar.php';
?>

<div class="p-4">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <div>
            <h4 class="fw-bold mb-1">Inventory Management</h4>
            <p class="text-muted mb-0">Track stock levels and reorder alerts</p>
        </div>
        <button class="btn btn-primary" onclick="loadInventoryData()"><i class="bi bi-arrow-clockwise me-2"></i>Refresh</button>
    </div>

    <!-- Navigation Tabs -->
    <ul class="nav nav-tabs  mb-4" id="inventoryTabs" role="tablist">
        <li class="nav-item" role="presentation">
            <button class="nav-link active bg-transparent text-body" data-bs-toggle="tab" data-bs-target="#overview" type="button">Overview</button>
        </li>
        <li class="nav-item" role="presentation">
            <button class="nav-link bg-transparent text-danger" data-bs-toggle="tab" data-bs-target="#deadstock" type="button">Dead Stock</button>
        </li>
        <li class="nav-item" role="presentation">
            <button class="nav-link bg-transparent text-warning" data-bs-toggle="tab" data-bs-target="#restock" type="button">Restock Alerts</button>
        </li>
    </ul>

    <div id="loader" class="text-center py-5">
        <div class="spinner-border text-primary" role="status"></div>
    </div>

    <!-- Tab Content -->
    <div class="tab-content d-none" id="inventoryContent">
        
        <!-- OVERVIEW TAB -->
        <div class="tab-pane fade show active" id="overview">
            <div class="row g-4 mb-4">
                <div class="col-12 col-md-4">
                    <div class="card border-0 shadow-sm glass h-100 p-3">
                        <div class="card-body">
                            <h6 class="text-muted text-uppercase mb-2">Total Products (SKUs)</h6>
                            <h3 class="fw-bold text-info mb-0" id="summary-products">0</h3>
                        </div>
                    </div>
                </div>
                <div class="col-12 col-md-4">
                    <div class="card border-0 shadow-sm glass h-100 p-3">
                        <div class="card-body">
                            <h6 class="text-muted text-uppercase mb-2">Total Items in Stock</h6>
                            <h3 class="fw-bold text-primary mb-0" id="summary-items">0</h3>
                        </div>
                    </div>
                </div>
                <div class="col-12 col-md-4">
                    <div class="card border-0 shadow-sm glass h-100 p-3">
                        <div class="card-body">
                            <h6 class="text-muted text-uppercase mb-2">Total Stock Value</h6>
                            <h3 class="fw-bold text-success mb-0" id="summary-value">₹0</h3>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row g-4 mb-4">
                <div class="col-12 col-lg-8">
                    <div class="card border-0 shadow-sm">
                        <div class="card-header bg-transparent  p-4">
                            <h5 class="fw-bold mb-0">Live Inventory Status</h5>
                        </div>
                        <div class="card-body p-0">
                            <div class="table-responsive" style="max-height: 500px;">
                                <table class="table table-hover table-borderless align-middle mb-0 text-nowrap">
                                    <thead class=" bg-transparent sticky-top">
                                        <tr>
                                            <th class="ps-4">SKU</th>
                                            <th>Product Name</th>
                                            <th>Category</th>
                                            <th>Stock</th>
                                            <th class="pe-4">Status</th>
                                        </tr>
                                    </thead>
                                    <tbody id="inventoryTable"></tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-12 col-lg-4">
                    <div class="card border-0 shadow-sm h-100">
                        <div class="card-body p-4">
                            <h5 class="fw-bold mb-4">Stock Health</h5>
                            <div style="height: 300px;">
                                <canvas id="statusChart"></canvas>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- DEAD STOCK TAB -->
        <div class="tab-pane fade" id="deadstock">
            <div class="card border-0 shadow-sm">
                <div class="card-header bg-transparent  p-4">
                    <h5 class="fw-bold text-danger mb-0">Dead Stock (No sales in 90+ days)</h5>
                </div>
                <div class="card-body p-0">
                    <div class="table-responsive">
                        <table class="table table-hover table-borderless align-middle mb-0 text-nowrap">
                            <thead class=" bg-transparent">
                                <tr>
                                    <th class="ps-4">SKU</th>
                                    <th>Product Name</th>
                                    <th>Category</th>
                                    <th>Qty In Stock</th>
                                    <th class="pe-4">Days Since Last Sale</th>
                                </tr>
                            </thead>
                            <tbody id="deadStockTable"></tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <!-- RESTOCK TAB -->
        <div class="tab-pane fade" id="restock">
            <div class="card border-0 shadow-sm">
                <div class="card-header bg-transparent  p-4">
                    <h5 class="fw-bold text-warning mb-0">Restock Recommendations</h5>
                </div>
                <div class="card-body p-0">
                    <div class="table-responsive">
                        <table class="table table-hover table-borderless align-middle mb-0 text-nowrap">
                            <thead class=" bg-transparent">
                                <tr>
                                    <th class="ps-4">SKU</th>
                                    <th>Product Name</th>
                                    <th>Current Qty</th>
                                    <th>Reorder Level</th>
                                    <th class="pe-4">Recommended Order</th>
                                </tr>
                            </thead>
                            <tbody id="restockTable"></tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        
    </div>
</div>

<?php require_once '../../includes/footer.php'; ?>
