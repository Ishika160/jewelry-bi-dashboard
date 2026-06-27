<?php
require_once '../../includes/db.php';
$extra_js = '/assets/js/modules/customers.js';
require_once '../../includes/header.php';
require_once '../../includes/sidebar.php';
?>

<div class="p-4">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <div>
            <h4 class="fw-bold mb-1">Customer Management</h4>
            <p class="text-muted mb-0">Analytics and Customer Lifetime Value</p>
        </div>
        <button class="btn btn-primary" onclick="loadCustomerData()"><i class="bi bi-arrow-clockwise me-2"></i>Refresh</button>
    </div>

    <div id="loader" class="text-center py-5">
        <div class="spinner-border text-primary" role="status"></div>
    </div>

    <!-- Content -->
    <div class="d-none" id="customerContent">
        <!-- KPIs -->
        <div class="row g-4 mb-4">
            <div class="col-12 col-md-3">
                <div class="card border-0 shadow-sm glass h-100 p-3">
                    <div class="card-body">
                        <h6 class="text-muted text-uppercase mb-2">Total Customers</h6>
                        <h3 class="fw-bold text-primary mb-0" id="summary-total">0</h3>
                    </div>
                </div>
            </div>
            <div class="col-12 col-md-3">
                <div class="card border-0 shadow-sm glass h-100 p-3 border-start border-warning border-4">
                    <div class="card-body">
                        <h6 class="text-muted text-uppercase mb-2">VIP Customers</h6>
                        <h3 class="fw-bold text-warning mb-0" id="summary-vip">0</h3>
                    </div>
                </div>
            </div>
            <div class="col-12 col-md-3">
                <div class="card border-0 shadow-sm glass h-100 p-3 border-start border-info border-4">
                    <div class="card-body">
                        <h6 class="text-muted text-uppercase mb-2">Premium Customers</h6>
                        <h3 class="fw-bold text-info mb-0" id="summary-premium">0</h3>
                    </div>
                </div>
            </div>
            <div class="col-12 col-md-3">
                <div class="card border-0 shadow-sm glass h-100 p-3">
                    <div class="card-body">
                        <h6 class="text-muted text-uppercase mb-2">Avg. Order Value</h6>
                        <h3 class="fw-bold text-success mb-0" id="summary-aov">₹0</h3>
                    </div>
                </div>
            </div>
        </div>

        <div class="row g-4 mb-4">
            <!-- Chart -->
            <div class="col-12 col-lg-4">
                <div class="card border-0 shadow-sm h-100">
                    <div class="card-body p-4">
                        <h5 class="fw-bold mb-4">Customer Segmentation</h5>
                        <div style="height: 300px;">
                            <canvas id="segmentChart"></canvas>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Table -->
            <div class="col-12 col-lg-8">
                <div class="card border-0 shadow-sm h-100">
                    <div class="card-header bg-transparent  p-4 d-flex justify-content-between align-items-center">
                        <h5 class="fw-bold mb-0">Top Customers (By Lifetime Value)</h5>
                    </div>
                    <div class="card-body p-0">
                        <div class="table-responsive" style="max-height: 400px;">
                            <table class="table table-hover table-borderless align-middle mb-0 text-nowrap">
                                <thead class=" bg-transparent sticky-top">
                                    <tr>
                                        <th class="ps-4">Code</th>
                                        <th>Name</th>
                                        <th>City</th>
                                        <th>Orders</th>
                                        <th>Segment</th>
                                        <th class="pe-4">Total Spent</th>
                                    </tr>
                                </thead>
                                <tbody id="customerTable"></tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<?php require_once '../../includes/footer.php'; ?>
