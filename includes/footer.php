    </div> <!-- End Main Content Area -->
</div> <!-- End Main Wrapper -->

<!-- Print Footer (only visible when printing) -->
<div class="print-footer">
    Jewelry Business Intelligence System — Confidential Report — Page generated on <?= date('d/m/Y') ?>
</div>

<!-- Bootstrap JS Bundle -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Chart.js -->
<script src="https://cdn.jsdelivr.net/npm/chart.js@4.4.1/dist/chart.umd.min.js"></script>
<!-- Chart.js Matrix Plugin for Heatmaps -->
<script src="https://cdn.jsdelivr.net/npm/chartjs-chart-matrix@2.0.1/dist/chartjs-chart-matrix.min.js"></script>

<!-- Custom Scripts -->
<script src="<?= APP_URL ?>assets/js/app.js"></script>

<!-- Global Feature Scripts -->
<script src="<?= APP_URL ?>assets/js/notifications.js"></script>
<script src="<?= APP_URL ?>assets/js/search.js"></script>

<!-- Module Specific Scripts -->
<?php if(isset($extra_js)): ?>
    <script src="<?= APP_URL . ltrim($extra_js, '/') ?>"></script>
<?php endif; ?>

</body>
</html>
