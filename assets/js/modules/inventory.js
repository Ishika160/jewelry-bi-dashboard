/**
 * Inventory Module Scripts
 */

let statusChartInstance = null;
let currentTab = 'overview';

document.addEventListener('DOMContentLoaded', () => {
    let hash = window.location.hash;
    if (hash && ['#overview', '#deadstock', '#restock'].includes(hash)) {
        currentTab = hash.substring(1);
        
        // Update UI to show the correct tab
        const tabBtn = document.querySelector(`button[data-bs-target="${hash}"]`);
        if (tabBtn) {
            // Remove active classes from all tabs
            document.querySelectorAll('.nav-link').forEach(t => t.classList.remove('active'));
            document.querySelectorAll('.tab-pane').forEach(t => t.classList.remove('show', 'active'));
            
            // Add active class to target tab
            tabBtn.classList.add('active');
            document.querySelector(hash).classList.add('show', 'active');
        }
    }
    
    loadInventoryData(currentTab);

    const tabEls = document.querySelectorAll('button[data-bs-toggle="tab"]');
    tabEls.forEach(tab => {
        tab.addEventListener('shown.bs.tab', event => {
            const targetId = event.target.getAttribute('data-bs-target').substring(1);
            currentTab = targetId;
            loadInventoryData(targetId);
        });
    });
});

async function loadInventoryData(action = currentTab) {
    const loader = document.getElementById('loader');
    const content = document.getElementById('inventoryContent');
    
    try {
        if (!loader.classList.contains('d-none')) {
            // initial load
        }
        
        const response = await fetch(`/api/inventory.php?action=${action}`);
        const result = await response.json();
        
        if (!result.success) throw new Error(result.message);
        
        const data = result.data;
        
        if (action === 'overview') {
            document.getElementById('summary-products').textContent = data.summary.total_products.toLocaleString();
            document.getElementById('summary-items').textContent = data.summary.total_items.toLocaleString();
            document.getElementById('summary-value').textContent = formatCurrency(data.summary.total_value);
            
            renderInventoryTable(data.inventory);
            renderStatusChart(data.status_distribution);
        } 
        else if (action === 'deadstock') {
            renderDeadStockTable(data.deadstock);
        }
        else if (action === 'restock') {
            renderRestockTable(data.restock);
        }
        
        loader.classList.add('d-none');
        content.classList.remove('d-none');
        
    } catch (error) {
        console.error('Failed to load inventory data:', error);
    }
}

function renderInventoryTable(items) {
    const tbody = document.getElementById('inventoryTable');
    tbody.innerHTML = '';
    
    items.forEach(item => {
        const tr = document.createElement('tr');
        
        let badgeClass = 'bg-success';
        if (item.stock_status === 'Low Stock') badgeClass = 'bg-warning text-dark';
        if (item.stock_status === 'Out of Stock') badgeClass = 'bg-danger';
        if (item.stock_status === 'Overstock') badgeClass = 'bg-info text-dark';
        
        tr.innerHTML = `
            <td class="ps-4 fw-medium text-primary">${item.sku}</td>
            <td class="fw-semibold">${item.product_name}</td>
            <td class="text-muted">${item.category_name}</td>
            <td class="fw-bold">${item.quantity_in_stock}</td>
            <td class="pe-4"><span class="badge ${badgeClass} rounded-pill">${item.stock_status}</span></td>
        `;
        tbody.appendChild(tr);
    });
}

function renderStatusChart(data) {
    const ctx = document.getElementById('statusChart').getContext('2d');
    
    if (statusChartInstance) statusChartInstance.destroy();
    
    const labels = data.map(item => item.stock_status);
    const counts = data.map(item => item.count);
    
    const colors = labels.map(status => {
        if (status === 'In Stock') return '#22c55e'; // success
        if (status === 'Low Stock') return '#f59e0b'; // warning
        if (status === 'Out of Stock') return '#ef4444'; // danger
        return '#38bdf8'; // info
    });
    
    statusChartInstance = new Chart(ctx, {
        type: 'doughnut',
        data: {
            labels: labels,
            datasets: [{
                data: counts,
                backgroundColor: colors,
                borderWidth: 0,
                hoverOffset: 4
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            cutout: '70%',
            plugins: {
                legend: { position: 'bottom', labels: { usePointStyle: true, padding: 20 } }
            }
        }
    });
}

function renderDeadStockTable(items) {
    const tbody = document.getElementById('deadStockTable');
    tbody.innerHTML = '';
    
    if (items.length === 0) {
        tbody.innerHTML = '<tr><td colspan="5" class="text-center text-muted py-4">No dead stock found!</td></tr>';
        return;
    }
    
    items.forEach(item => {
        const days = item.days_since_last_sale === null ? 'Never sold' : `${item.days_since_last_sale} days`;
        const tr = document.createElement('tr');
        tr.innerHTML = `
            <td class="ps-4 fw-medium text-primary">${item.sku}</td>
            <td class="fw-semibold">${item.product_name}</td>
            <td class="text-muted">${item.category_name}</td>
            <td><span class="badge bg-secondary">${item.quantity_in_stock} in stock</span></td>
            <td class="pe-4 fw-bold text-danger">${days}</td>
        `;
        tbody.appendChild(tr);
    });
}

function renderRestockTable(items) {
    const tbody = document.getElementById('restockTable');
    tbody.innerHTML = '';
    
    if (items.length === 0) {
        tbody.innerHTML = '<tr><td colspan="5" class="text-center text-muted py-4">All stock levels are healthy!</td></tr>';
        return;
    }
    
    items.forEach(item => {
        const qtyClass = item.quantity_in_stock === 0 ? 'text-danger' : 'text-warning';
        const tr = document.createElement('tr');
        tr.innerHTML = `
            <td class="ps-4 fw-medium text-primary">${item.sku}</td>
            <td class="fw-semibold">${item.product_name}</td>
            <td class="fw-bold ${qtyClass}">${item.quantity_in_stock}</td>
            <td class="text-muted">${item.reorder_level}</td>
            <td class="pe-4"><span class="badge bg-primary fs-6">+${item.recommended_quantity}</span></td>
        `;
        tbody.appendChild(tr);
    });
}
