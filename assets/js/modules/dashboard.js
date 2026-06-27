/**
 * Dashboard Module Scripts
 * Fetches data from API and renders charts
 */

let revenueChartInstance = null;
let categoryChartInstance = null;

// Initialize on page load
document.addEventListener('DOMContentLoaded', () => {
    loadDashboardData();
});

async function loadDashboardData() {
    const loader = document.getElementById('loader');
    const content = document.getElementById('dashboardContent');
    
    try {
        // Show loader
        loader.classList.remove('d-none');
        content.classList.add('d-none');
        
        // Fetch data
        const response = await fetch('/api/dashboard.php');
        const result = await response.json();
        
        if (!result.success) throw new Error(result.message);
        
        const data = result.data;
        
        document.getElementById('kpi-revenue').textContent = formatCurrency(data.kpis.total_revenue);
        document.getElementById('kpi-gross').textContent = formatCurrency(data.kpis.gross_profit);
        document.getElementById('kpi-net').textContent = formatCurrency(data.kpis.net_profit);
        document.getElementById('kpi-orders').textContent = data.kpis.total_orders.toLocaleString();
        document.getElementById('kpi-customers').textContent = data.kpis.total_customers.toLocaleString();
        document.getElementById('kpi-inventory').textContent = formatCurrency(data.kpis.inventory_value);
        
        const growthBadge = document.getElementById('kpi-growth');
        const growth = data.kpis.monthly_growth;
        if (growth >= 0) {
            growthBadge.className = 'badge bg-success-subtle text-success mt-2';
            growthBadge.innerHTML = `<i class="bi bi-graph-up me-1"></i> ${growth}%`;
        } else {
            growthBadge.className = 'badge bg-danger-subtle text-danger mt-2';
            growthBadge.innerHTML = `<i class="bi bi-graph-down me-1"></i> ${Math.abs(growth)}%`;
        }
        
        // 2. Render Charts
        renderRevenueChart(data.charts.monthly_revenue);
        renderCategoryChart(data.charts.category_sales);
        
        // 3. Render Tables
        renderRecentSales(data.tables.recent_sales);
        renderTopProducts(data.tables.top_products);
        
        // Show content
        loader.classList.add('d-none');
        content.classList.remove('d-none');
        
    } catch (error) {
        console.error('Failed to load dashboard data:', error);
        loader.innerHTML = `
            <div class="alert alert-danger mx-auto" style="max-width: 500px;">
                <i class="bi bi-exclamation-triangle me-2"></i> Failed to load dashboard data. <br>
                <small>${error.message}</small>
            </div>
        `;
    }
}

function renderRevenueChart(data) {
    const ctx = document.getElementById('revenueChart').getContext('2d');
    
    if (revenueChartInstance) {
        revenueChartInstance.destroy();
    }
    
    // Format data for chart
    const labels = data.map(item => item.sale_month);
    const values = data.map(item => item.total_revenue);
    
    revenueChartInstance = new Chart(ctx, {
        type: 'line',
        data: {
            labels: labels,
            datasets: [{
                label: 'Revenue (₹)',
                data: values,
                borderColor: '#6366f1',
                backgroundColor: 'rgba(99, 102, 241, 0.1)',
                borderWidth: 3,
                pointBackgroundColor: '#1e293b',
                pointBorderColor: '#6366f1',
                pointBorderWidth: 2,
                pointRadius: 4,
                pointHoverRadius: 6,
                fill: true,
                tension: 0.4 // smooth curves
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            plugins: {
                legend: { display: false }
            },
            scales: {
                y: {
                    beginAtZero: true,
                    grid: { color: 'rgba(255, 255, 255, 0.05)' },
                    ticks: {
                        callback: function(value) {
                            if (value >= 10000000) return '₹' + (value / 10000000).toFixed(1) + 'Cr';
                            if (value >= 100000) return '₹' + (value / 100000).toFixed(1) + 'L';
                            return '₹' + (value / 1000).toFixed(1) + 'K';
                        }
                    }
                },
                x: {
                    grid: { display: false }
                }
            }
        }
    });
}

function renderCategoryChart(data) {
    const ctx = document.getElementById('categoryChart').getContext('2d');
    
    if (categoryChartInstance) {
        categoryChartInstance.destroy();
    }
    
    const labels = data.map(item => item.category_name);
    const values = data.map(item => item.total_revenue);
    
    categoryChartInstance = new Chart(ctx, {
        type: 'doughnut',
        data: {
            labels: labels,
            datasets: [{
                data: values,
                backgroundColor: [
                    '#6366f1', // Primary
                    '#38bdf8', // Info
                    '#a78bfa', // Purple
                    '#2dd4bf', // Teal
                    '#f472b6', // Pink
                    '#fbbf24'  // Amber
                ],
                borderWidth: 0,
                hoverOffset: 4
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            cutout: '75%',
            plugins: {
                legend: {
                    position: 'bottom',
                    labels: {
                        usePointStyle: true,
                        padding: 20
                    }
                }
            }
        }
    });
}

function renderRecentSales(sales) {
    const tbody = document.getElementById('recentSalesTable');
    tbody.innerHTML = '';
    
    if (!sales || sales.length === 0) {
        tbody.innerHTML = '<tr><td colspan="5" class="text-center text-muted py-4">No recent sales found</td></tr>';
        return;
    }
    
    sales.forEach(sale => {
        const tr = document.createElement('tr');
        
        // Status Badge Logic
        let badgeClass = 'bg-secondary';
        if (sale.payment_status === 'Paid') badgeClass = 'bg-success';
        if (sale.payment_status === 'Pending') badgeClass = 'bg-warning text-dark';
        if (sale.payment_status === 'Partial') badgeClass = 'bg-info text-dark';
        
        tr.innerHTML = `
            <td class="ps-4 fw-medium">${sale.invoice_number}</td>
            <td class="text-muted">${sale.sale_date}</td>
            <td>${sale.customer_name || 'Walk-in Customer'}</td>
            <td class="fw-bold">${formatCurrency(sale.total_amount)}</td>
            <td class="pe-4"><span class="badge ${badgeClass} rounded-pill">${sale.payment_status}</span></td>
        `;
        tbody.appendChild(tr);
    });
}

function renderTopProducts(products) {
    const list = document.getElementById('topProductsList');
    list.innerHTML = '';
    
    if (!products || products.length === 0) {
        list.innerHTML = '<li class="list-group-item bg-transparent text-muted text-center py-4 border-0">No product data</li>';
        return;
    }
    
    products.forEach((product, index) => {
        const li = document.createElement('li');
        li.className = 'list-group-item bg-transparent px-0 border-dark d-flex justify-content-between align-items-center' + (index === 0 ? ' border-top-0 pt-0' : '') + (index === products.length - 1 ? ' border-bottom-0 pb-0' : '');
        
        li.innerHTML = `
            <div class="d-flex align-items-center">
                <div class="bg-surface rounded p-2 me-3 d-flex align-items-center justify-content-center" style="width: 40px; height: 40px;">
                    <span class="fw-bold text-muted">#${index + 1}</span>
                </div>
                <div>
                    <h6 class="mb-0 fw-semibold text-truncate" style="max-width: 180px;" title="${product.product_name}">${product.product_name}</h6>
                    <small class="text-muted">${product.units_sold} units sold</small>
                </div>
            </div>
            <div class="fw-bold text-primary">
                ${formatCurrency(product.total_revenue)}
            </div>
        `;
        list.appendChild(li);
    });
}
