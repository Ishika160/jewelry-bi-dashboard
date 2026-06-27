<?php
require_once '../../includes/db.php';
$extra_js = '/assets/js/modules/predictions.js';
require_once '../../includes/header.php';
require_once '../../includes/sidebar.php';
?>

<div class="p-4">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <div>
            <h4 class="fw-bold mb-1"><i class="bi bi-robot text-primary me-2"></i>AI Demand Prediction</h4>
            <p class="text-muted mb-0">Linear Regression forecasting based on historical sales</p>
        </div>
        <button class="btn btn-outline-primary" onclick="loadPredictions()"><i class="bi bi-arrow-clockwise me-2"></i>Refresh Data</button>
    </div>

    <!-- Info Alert -->
    <div class="alert alert-info border-0 shadow-sm glass d-flex align-items-center" role="alert">
        <i class="bi bi-info-circle-fill fs-4 me-3 text-info"></i>
        <div>
            <strong>How it works:</strong> The Python AI module analyzes past sales trends using scikit-learn and predicts the exact quantity of each product you will need for the upcoming month.
        </div>
    </div>

    <!-- Table -->
    <div class="card border-0 shadow-sm mt-4">
        <div class="card-header bg-transparent  p-4 d-flex justify-content-between align-items-center">
            <h5 class="fw-bold mb-0">Predicted Demand vs Current Stock (Next 30 Days)</h5>
        </div>
        <div class="card-body p-0">
            <div class="table-responsive" style="max-height: 600px;">
                <table class="table table-hover table-borderless align-middle mb-0 text-nowrap">
                    <thead class=" bg-transparent sticky-top">
                        <tr>
                            <th class="ps-4">SKU</th>
                            <th>Product Name</th>
                            <th>Category</th>
                            <th class="text-center">Current Stock</th>
                            <th class="text-center">Predicted Demand</th>
                            <th class="text-center">AI Confidence</th>
                            <th class="pe-4">Action Recommended</th>
                        </tr>
                    </thead>
                    <tbody id="predictionsTable">
                        <tr>
                            <td colspan="7" class="text-center py-5 text-muted">
                                <div class="spinner-border spinner-border-sm text-primary me-2" role="status"></div> Loading AI predictions...
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<?php require_once '../../includes/footer.php'; ?>
