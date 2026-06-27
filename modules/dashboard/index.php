<?php
require_once '../../includes/db.php';
$extra_js = '/assets/js/modules/dashboard.js';
require_once '../../includes/header.php';
require_once '../../includes/sidebar.php';
?>

<div class="p-4">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h4 class="fw-bold mb-0">Dashboard Overview</h4>
        <button class="btn btn-primary" onclick="loadDashboardData()"><i class="bi bi-arrow-clockwise me-2"></i>Refresh</button>
    </div>

    <!-- Loading State -->
    <div id="loader" class="text-center py-5">
        <div class="spinner-border text-primary" role="status">
            <span class="visually-hidden">Loading...</span>
        </div>
        <p class="text-muted mt-3">Fetching live data...</p>
    </div>

    <!-- Dashboard Content (Hidden until loaded) -->
    <div id="dashboardContent" class="d-none">
        
        <!-- KPI Cards -->
        <div class="row g-4 mb-4">
            <!-- Revenue -->
            <div class="col-12 col-md-4 col-xl-2">
                <div class="card border-0 shadow-sm glass h-100">
                    <div class="card-body p-3">
                        <div class="d-flex align-items-center mb-2">
                            <div class="bg-primary bg-opacity-10 rounded-3 p-2 me-2">
                                <i class="bi bi-currency-rupee text-primary fs-5"></i>
                            </div>
                            <span class="text-muted fw-semibold small text-uppercase" style="font-size: 0.7rem;">Revenue</span>
                        </div>
                        <h4 class="fw-bold mb-1 text-truncate" id="kpi-revenue" title="0">₹0</h4>
                        <span class="badge bg-success-subtle text-success mt-1" id="kpi-growth"><i class="bi bi-graph-up me-1"></i> 0%</span>
                    </div>
                </div>
            </div>
            
            <!-- Gross Profit -->
            <div class="col-12 col-md-4 col-xl-2">
                <div class="card border-0 shadow-sm glass h-100">
                    <div class="card-body p-3">
                        <div class="d-flex align-items-center mb-2">
                            <div class="bg-success bg-opacity-10 rounded-3 p-2 me-2">
                                <i class="bi bi-piggy-bank text-success fs-5"></i>
                            </div>
                            <span class="text-muted fw-semibold small text-uppercase" style="font-size: 0.7rem;">Gross Profit</span>
                        </div>
                        <h4 class="fw-bold mb-1 text-truncate" id="kpi-gross">₹0</h4>
                    </div>
                </div>
            </div>
            
            <!-- Net Profit -->
            <div class="col-12 col-md-4 col-xl-2">
                <div class="card border-0 shadow-sm glass h-100 border-start border-success border-4">
                    <div class="card-body p-3">
                        <div class="d-flex align-items-center mb-2">
                            <div class="bg-success bg-opacity-10 rounded-3 p-2 me-2">
                                <i class="bi bi-wallet2 text-success fs-5"></i>
                            </div>
                            <span class="text-muted fw-semibold small text-uppercase" style="font-size: 0.7rem;">Net Profit</span>
                        </div>
                        <h4 class="fw-bold mb-1 text-truncate" id="kpi-net">₹0</h4>
                    </div>
                </div>
            </div>
            
            <!-- Orders -->
            <div class="col-12 col-md-4 col-xl-2">
                <div class="card border-0 shadow-sm glass h-100">
                    <div class="card-body p-3">
                        <div class="d-flex align-items-center mb-2">
                            <div class="bg-info bg-opacity-10 rounded-3 p-2 me-2">
                                <i class="bi bi-bag-check text-info fs-5"></i>
                            </div>
                            <span class="text-muted fw-semibold small text-uppercase" style="font-size: 0.7rem;">Orders</span>
                        </div>
                        <h4 class="fw-bold mb-1" id="kpi-orders">0</h4>
                    </div>
                </div>
            </div>
            
            <!-- Customers -->
            <div class="col-12 col-md-4 col-xl-2">
                <div class="card border-0 shadow-sm glass h-100">
                    <div class="card-body p-3">
                        <div class="d-flex align-items-center mb-2">
                            <div class="bg-warning bg-opacity-10 rounded-3 p-2 me-2">
                                <i class="bi bi-people text-warning fs-5"></i>
                            </div>
                            <span class="text-muted fw-semibold small text-uppercase" style="font-size: 0.7rem;">Customers</span>
                        </div>
                        <h4 class="fw-bold mb-1" id="kpi-customers">0</h4>
                    </div>
                </div>
            </div>
            
            <!-- Inventory Value -->
            <div class="col-12 col-md-4 col-xl-2">
                <div class="card border-0 shadow-sm glass h-100">
                    <div class="card-body p-3">
                        <div class="d-flex align-items-center mb-2">
                            <div class="bg-danger bg-opacity-10 rounded-3 p-2 me-2">
                                <i class="bi bi-box-seam text-danger fs-5"></i>
                            </div>
                            <span class="text-muted fw-semibold small text-uppercase" style="font-size: 0.7rem;">Stock Value</span>
                        </div>
                        <h4 class="fw-bold mb-1 text-truncate" id="kpi-inventory">₹0</h4>
                    </div>
                </div>
            </div>
        </div>

        <!-- Charts Row -->
        <div class="row g-4 mb-4">
            <!-- Revenue Line Chart -->
            <div class="col-12 col-lg-8">
                <div class="card border-0 shadow-sm h-100">
                    <div class="card-body p-4">
                        <h5 class="fw-bold mb-4">Revenue Trend (Last 12 Months)</h5>
                        <div style="height: 300px;">
                            <canvas id="revenueChart"></canvas>
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- Category Doughnut Chart -->
            <div class="col-12 col-lg-4">
                <div class="card border-0 shadow-sm h-100">
                    <div class="card-body p-4">
                        <h5 class="fw-bold mb-4">Sales by Category</h5>
                        <div style="height: 300px;" class="d-flex justify-content-center">
                            <canvas id="categoryChart"></canvas>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Tables Row -->
        <div class="row g-4 mb-4">
            <!-- Recent Sales Table -->
            <div class="col-12 col-lg-8">
                <div class="card border-0 shadow-sm h-100">
                    <div class="card-header bg-transparent  p-4 d-flex justify-content-between align-items-center">
                        <h5 class="fw-bold mb-0">Recent Sales</h5>
                        <a href="/modules/sales/" class="btn btn-sm btn-outline-primary">View All</a>
                    </div>
                    <div class="card-body p-0">
                        <div class="table-responsive">
                            <table class="table table-hover table-borderless align-middle mb-0 text-nowrap">
                                <thead class=" bg-transparent">
                                    <tr>
                                        <th class="ps-4">Invoice</th>
                                        <th>Date</th>
                                        <th>Customer</th>
                                        <th>Amount</th>
                                        <th class="pe-4">Status</th>
                                    </tr>
                                </thead>
                                <tbody id="recentSalesTable">
                                    <!-- Dynamic rows -->
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Top Products -->
            <div class="col-12 col-lg-4">
                <div class="card border-0 shadow-sm h-100">
                    <div class="card-header bg-transparent  p-4">
                        <h5 class="fw-bold mb-0">Top Products</h5>
                    </div>
                    <div class="card-body p-4">
                        <ul class="list-group list-group-flush" id="topProductsList">
                            <!-- Dynamic items -->
                        </ul>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>

<?php require_once '../../includes/footer.php'; ?>
