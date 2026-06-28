<?php
require_once '../../includes/db.php';
require_once '../../includes/header.php';
require_once '../../includes/sidebar.php';
?>

<div class="p-4">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <div>
            <h4 class="fw-bold mb-1">Reports & Exports</h4>
            <p class="text-muted mb-0">Export or print system data</p>
        </div>
        <button class="btn btn-outline-secondary btn-print no-print" onclick="window.print()">
            <i class="bi bi-printer me-2"></i>Print This Page
        </button>
    </div>

    <div class="row g-4">
        <!-- Sales Report -->
        <div class="col-12 col-md-6 col-lg-4">
            <div class="card border-0 shadow-sm h-100">
                <div class="card-body p-4 text-center">
                    <div class="bg-primary bg-opacity-10 rounded-circle d-inline-flex p-3 mb-3">
                        <i class="bi bi-graph-up text-primary fs-2"></i>
                    </div>
                    <h5 class="fw-bold">Sales Report</h5>
                    <p class="text-muted small mb-4">Export full transaction history including customer details, products, and totals.</p>
                    <div class="d-flex gap-2">
                        <a href="export.php?type=sales" class="btn btn-primary flex-grow-1"><i class="bi bi-download me-2"></i>CSV</a>
                        <button class="btn btn-outline-primary" onclick="printReport('sales')" title="Print Sales Report"><i class="bi bi-printer"></i></button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Inventory Report -->
        <div class="col-12 col-md-6 col-lg-4">
            <div class="card border-0 shadow-sm h-100">
                <div class="card-body p-4 text-center">
                    <div class="bg-success bg-opacity-10 rounded-circle d-inline-flex p-3 mb-3">
                        <i class="bi bi-box-seam text-success fs-2"></i>
                    </div>
                    <h5 class="fw-bold">Inventory Status</h5>
                    <p class="text-muted small mb-4">Export current stock levels, values, and stock status for all products.</p>
                    <div class="d-flex gap-2">
                        <a href="export.php?type=inventory" class="btn btn-success flex-grow-1"><i class="bi bi-download me-2"></i>CSV</a>
                        <button class="btn btn-outline-success" onclick="printReport('inventory')" title="Print Inventory Report"><i class="bi bi-printer"></i></button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Customer Report -->
        <div class="col-12 col-md-6 col-lg-4">
            <div class="card border-0 shadow-sm h-100">
                <div class="card-body p-4 text-center">
                    <div class="bg-warning bg-opacity-10 rounded-circle d-inline-flex p-3 mb-3">
                        <i class="bi bi-people text-warning fs-2"></i>
                    </div>
                    <h5 class="fw-bold">Customer CLV</h5>
                    <p class="text-muted small mb-4">Export customer demographics, segments, and lifetime value data.</p>
                    <div class="d-flex gap-2">
                        <a href="export.php?type=customers" class="btn btn-warning flex-grow-1 text-dark"><i class="bi bi-download me-2"></i>CSV</a>
                        <button class="btn btn-outline-warning" onclick="printReport('customers')" title="Print Customer Report"><i class="bi bi-printer"></i></button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Quick Print Cards -->
        <div class="col-12">
            <div class="card border-0 shadow-sm">
                <div class="card-header bg-transparent p-4">
                    <h5 class="fw-bold mb-0"><i class="bi bi-printer me-2"></i>Quick Print</h5>
                </div>
                <div class="card-body p-4">
                    <p class="text-muted mb-3">Print any module's current view directly from the browser. Navigate to the page and use the print button.</p>
                    <div class="row g-3">
                        <div class="col-6 col-md-3">
                            <a href="<?= APP_URL ?>modules/dashboard/" class="btn btn-outline-secondary w-100 py-3">
                                <i class="bi bi-speedometer2 d-block fs-3 mb-1"></i>
                                <small>Dashboard</small>
                            </a>
                        </div>
                        <div class="col-6 col-md-3">
                            <a href="<?= APP_URL ?>modules/sales/" class="btn btn-outline-secondary w-100 py-3">
                                <i class="bi bi-graph-up d-block fs-3 mb-1"></i>
                                <small>Sales</small>
                            </a>
                        </div>
                        <div class="col-6 col-md-3">
                            <a href="<?= APP_URL ?>modules/inventory/" class="btn btn-outline-secondary w-100 py-3">
                                <i class="bi bi-box-seam d-block fs-3 mb-1"></i>
                                <small>Inventory</small>
                            </a>
                        </div>
                        <div class="col-6 col-md-3">
                            <a href="<?= APP_URL ?>modules/customers/" class="btn btn-outline-secondary w-100 py-3">
                                <i class="bi bi-people d-block fs-3 mb-1"></i>
                                <small>Customers</small>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
function printReport(type) {
    const pages = {
        sales: '/modules/sales/',
        inventory: '/modules/inventory/',
        customers: '/modules/customers/'
    };
    
    // Open the module page in a new window and trigger print
    const printWin = window.open(pages[type], '_blank');
    printWin.addEventListener('load', () => {
        setTimeout(() => printWin.print(), 500);
    });
}
</script>

<?php require_once '../../includes/footer.php'; ?>
