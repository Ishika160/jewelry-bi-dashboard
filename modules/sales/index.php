<?php
require_once '../../includes/db.php';
$extra_js = '/assets/js/modules/sales.js';
require_once '../../includes/header.php';
require_once '../../includes/sidebar.php';
?>

<div class="p-4">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <div>
            <h4 class="fw-bold mb-1">Sales Analytics</h4>
            <p class="text-muted mb-0">Comprehensive breakdown of your revenue</p>
        </div>
        <button class="btn btn-primary" onclick="loadSalesData()"><i class="bi bi-arrow-clockwise me-2"></i>Refresh</button>
    </div>

    <!-- Navigation Tabs -->
    <ul class="nav nav-tabs  mb-4" id="salesTabs" role="tablist">
        <li class="nav-item" role="presentation">
            <button class="nav-link active bg-transparent text-body" id="overview-tab" data-bs-toggle="tab" data-bs-target="#overview" type="button" role="tab">Overview</button>
        </li>
        <li class="nav-item" role="presentation">
            <button class="nav-link bg-transparent text-muted" id="monthly-tab" data-bs-toggle="tab" data-bs-target="#monthly" type="button" role="tab">Monthly Trends</button>
        </li>
        <li class="nav-item" role="presentation">
            <button class="nav-link bg-transparent text-muted" id="category-tab" data-bs-toggle="tab" data-bs-target="#category" type="button" role="tab">By Category</button>
        </li>
    </ul>

    <!-- Loading State -->
    <div id="loader" class="text-center py-5">
        <div class="spinner-border text-primary" role="status">
            <span class="visually-hidden">Loading...</span>
        </div>
    </div>

    <!-- Tab Content -->
    <div class="tab-content d-none" id="salesContent">
        
        <!-- OVERVIEW TAB -->
        <div class="tab-pane fade show active" id="overview" role="tabpanel">
            <div class="row g-4 mb-4">
                <div class="col-12 col-md-4">
                    <div class="card border-0 shadow-sm glass h-100 p-3">
                        <div class="card-body">
                            <h6 class="text-muted text-uppercase mb-2">Total Lifetime Revenue</h6>
                            <h3 class="fw-bold text-primary mb-0" id="summary-revenue">₹0</h3>
                        </div>
                    </div>
                </div>
                <div class="col-12 col-md-4">
                    <div class="card border-0 shadow-sm glass h-100 p-3">
                        <div class="card-body">
                            <h6 class="text-muted text-uppercase mb-2">Total Orders</h6>
                            <h3 class="fw-bold text-info mb-0" id="summary-orders">0</h3>
                        </div>
                    </div>
                </div>
                <div class="col-12 col-md-4">
                    <div class="card border-0 shadow-sm glass h-100 p-3">
                        <div class="card-body">
                            <h6 class="text-muted text-uppercase mb-2">Average Order Value</h6>
                            <h3 class="fw-bold text-success mb-0" id="summary-aov">₹0</h3>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Transactions Table -->
            <div class="card border-0 shadow-sm">
                <div class="card-header bg-transparent  p-4 d-flex justify-content-between align-items-center">
                    <h5 class="fw-bold mb-0">Recent Transactions</h5>
                    <button class="btn btn-sm btn-outline-secondary"><i class="bi bi-download me-2"></i>Export CSV</button>
                </div>
                <div class="card-body p-0">
                    <div class="table-responsive">
                        <table class="table table-hover table-borderless align-middle mb-0 text-nowrap">
                            <thead class=" bg-transparent">
                                <tr>
                                    <th class="ps-4">Invoice</th>
                                    <th>Date</th>
                                    <th>Customer</th>
                                    <th>Method</th>
                                    <th>Amount</th>
                                    <th class="pe-4">Status</th>
                                </tr>
                            </thead>
                            <tbody id="transactionsTable">
                                <!-- Dynamic rows -->
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <!-- MONTHLY TAB -->
        <div class="tab-pane fade" id="monthly" role="tabpanel">
            <div class="card border-0 shadow-sm mb-4">
                <div class="card-body p-4">
                    <h5 class="fw-bold mb-4">Monthly Revenue Trend</h5>
                    <div style="height: 400px;">
                        <canvas id="monthlyChart"></canvas>
                    </div>
                </div>
            </div>
        </div>

        <!-- CATEGORY TAB -->
        <div class="tab-pane fade" id="category" role="tabpanel">
            <div class="row g-4">
                <div class="col-12 col-lg-8">
                    <div class="card border-0 shadow-sm h-100">
                        <div class="card-body p-4">
                            <h5 class="fw-bold mb-4">Revenue by Category</h5>
                            <div style="height: 400px;">
                                <canvas id="categorySalesChart"></canvas>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-12 col-lg-4">
                    <div class="card border-0 shadow-sm h-100">
                        <div class="card-header bg-transparent  p-4">
                            <h5 class="fw-bold mb-0">Category Breakdown</h5>
                        </div>
                        <div class="card-body p-0">
                            <ul class="list-group list-group-flush" id="categoryList">
                                <!-- Dynamic rows -->
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<?php require_once '../../includes/footer.php'; ?>
