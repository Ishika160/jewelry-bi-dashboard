<?php
require_once '../../includes/db.php';
$extra_js = '/assets/js/modules/analytics.js';
require_once '../../includes/header.php';
require_once '../../includes/sidebar.php';
?>

<div class="p-4">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <div>
            <h4 class="fw-bold mb-1"><i class="bi bi-grid-3x3-gap text-primary me-2"></i>Heatmap Analytics</h4>
            <p class="text-muted mb-0">Visual activity clusters across categories and time</p>
        </div>
    </div>

    <div class="card border-0 shadow-sm">
        <div class="card-header bg-transparent  p-4">
            <h5 class="fw-bold mb-0">Category Sales by Month (Revenue Intensity)</h5>
        </div>
        <div class="card-body p-4">
            <div style="height: 500px; width: 100%;">
                <canvas id="heatmapChart"></canvas>
            </div>
            
            <!-- Custom Legend / Scale -->
            <div class="d-flex justify-content-center align-items-center mt-4">
                <span class="small text-muted me-2">Low</span>
                <div style="width: 200px; height: 12px; background: linear-gradient(to right, rgba(99, 102, 241, 0.1), rgba(99, 102, 241, 1)); border-radius: 6px;"></div>
                <span class="small text-muted ms-2">High Revenue</span>
            </div>
        </div>
    </div>
</div>

<?php require_once '../../includes/footer.php'; ?>
