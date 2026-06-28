/**
 * Predictions Module Scripts
 */

document.addEventListener('DOMContentLoaded', () => {
    loadPredictions();
});

async function loadPredictions() {
    const tbody = document.getElementById('predictionsTable');
    
    try {
        const response = await fetch(window.APP_URL + 'api/predictions.php');
        const result = await response.json();
        
        if (!result.success) throw new Error(result.message);
        
        tbody.innerHTML = '';
        
        if (result.data.length === 0) {
            tbody.innerHTML = '<tr><td colspan="7" class="text-center text-muted py-5">No prediction data found. Run the Python AI script first!</td></tr>';
            return;
        }
        
        result.data.forEach(item => {
            const tr = document.createElement('tr');
            
            // Confidence rendering
            const confPercent = Math.round(item.confidence_score * 100);
            let confColor = 'success';
            if (confPercent < 70) confColor = 'warning';
            if (confPercent < 40) confColor = 'danger';
            
            const confHtml = `
                <div class="d-flex align-items-center justify-content-center">
                    <span class="me-2 small">${confPercent}%</span>
                    <div class="progress" style="width: 50px; height: 6px;">
                        <div class="progress-bar bg-${confColor}" style="width: ${confPercent}%"></div>
                    </div>
                </div>
            `;
            
            // Shortage Risk Action
            let actionBadge = '<span class="badge bg-success-subtle text-success">Stock Adequate</span>';
            if (item.shortage_risk > 0) {
                actionBadge = `<span class="badge bg-danger"><i class="bi bi-exclamation-triangle me-1"></i> Order +${item.shortage_risk} units</span>`;
            } else if (item.shortage_risk == 0) {
                actionBadge = '<span class="badge bg-warning text-dark">Order +2 (Safety Margin)</span>';
            }
            
            tr.innerHTML = `
                <td class="ps-4 fw-medium text-primary">${item.sku}</td>
                <td class="fw-semibold">${item.product_name}</td>
                <td class="text-muted">${item.category_name}</td>
                <td class="text-center fw-bold text-info">${item.quantity_in_stock}</td>
                <td class="text-center fw-bold fs-5 text-warning">${item.predicted_sales_qty}</td>
                <td class="text-center">${confHtml}</td>
                <td class="pe-4">${actionBadge}</td>
            `;
            tbody.appendChild(tr);
        });
        
    } catch (error) {
        console.error('Failed to load predictions:', error);
        tbody.innerHTML = `<tr><td colspan="7" class="text-center text-danger py-4">Error loading AI data: ${error.message}</td></tr>`;
    }
}
