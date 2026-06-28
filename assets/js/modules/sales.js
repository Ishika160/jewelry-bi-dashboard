/**
 * Sales Module Scripts
 */

let monthlyChartInstance = null;
let categoryChartInstance = null;
let currentTab = 'overview';

document.addEventListener('DOMContentLoaded', () => {
    // Initial load
    loadSalesData('overview');

    // Tab Listeners
    const tabEls = document.querySelectorAll('button[data-bs-toggle="tab"]');
    tabEls.forEach(tab => {
        tab.addEventListener('shown.bs.tab', event => {
            const targetId = event.target.getAttribute('data-bs-target').substring(1);
            currentTab = targetId;
            loadSalesData(targetId);
        });
    });
});

async function loadSalesData(action = 'overview') {
    const loader = document.getElementById('loader');
    const content = document.getElementById('salesContent');
    
    try {
        if (!loader.classList.contains('d-none')) {
            // Only show full loader on initial load or manual refresh
        }
        
        const response = await fetch(window.APP_URL + `api/sales.php?action=${action}`);
        const result = await response.json();
        
        if (!result.success) throw new Error(result.message);
        
        const data = result.data;
        
        if (action === 'overview') {
            document.getElementById('summary-revenue').textContent = formatCurrency(data.summary.revenue);
            document.getElementById('summary-orders').textContent = data.summary.orders.toLocaleString();
            document.getElementById('summary-aov').textContent = formatCurrency(data.summary.aov);
            renderTransactions(data.transactions);
        } 
        else if (action === 'monthly') {
            renderMonthlyChart(data.monthly_trend);
        }
        else if (action === 'category') {
            renderCategoryChart(data.category_performance);
            renderCategoryList(data.category_performance);
        }
        
        loader.classList.add('d-none');
        content.classList.remove('d-none');
        
    } catch (error) {
        console.error('Failed to load sales data:', error);
    }
}

function renderTransactions(transactions) {
    const tbody = document.getElementById('transactionsTable');
    tbody.innerHTML = '';
    
    transactions.forEach(t => {
        const tr = document.createElement('tr');
        
        let badgeClass = 'bg-secondary';
        if (t.payment_status === 'Paid') badgeClass = 'bg-success';
        if (t.payment_status === 'Pending') badgeClass = 'bg-warning text-dark';
        if (t.payment_status === 'Partial') badgeClass = 'bg-info text-dark';
        
        let methodIcon = 'bi-cash';
        if (t.payment_method === 'Card') methodIcon = 'bi-credit-card';
        if (t.payment_method === 'UPI') methodIcon = 'bi-phone';
        if (t.payment_method === 'Bank Transfer') methodIcon = 'bi-bank';
        
        tr.innerHTML = `
            <td class="ps-4 fw-medium text-primary">${t.invoice_number}</td>
            <td class="text-muted">${t.sale_date}</td>
            <td>${t.customer_name || 'Walk-in'}</td>
            <td><i class="bi ${methodIcon} me-2 text-muted"></i>${t.payment_method}</td>
            <td class="fw-bold">${formatCurrency(t.total_amount)}</td>
            <td class="pe-4"><span class="badge ${badgeClass} rounded-pill">${t.payment_status}</span></td>
        `;
        tbody.appendChild(tr);
    });
}

function renderMonthlyChart(data) {
    const ctx = document.getElementById('monthlyChart').getContext('2d');
    
    if (monthlyChartInstance) {
        monthlyChartInstance.destroy();
    }
    
    const labels = data.map(item => item.sale_month);
    const revenue = data.map(item => item.total_revenue);
    const orders = data.map(item => item.total_orders);
    
    monthlyChartInstance = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: labels,
            datasets: [
                {
                    label: 'Revenue (₹)',
                    data: revenue,
                    backgroundColor: '#6366f1',
                    borderRadius: 4,
                    yAxisID: 'y'
                },
                {
                    label: 'Orders',
                    data: orders,
                    type: 'line',
                    borderColor: '#38bdf8',
                    backgroundColor: '#38bdf8',
                    borderWidth: 3,
                    pointRadius: 4,
                    yAxisID: 'y1'
                }
            ]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            interaction: {
                mode: 'index',
                intersect: false,
            },
            scales: {
                y: {
                    type: 'linear',
                    display: true,
                    position: 'left',
                    grid: { color: 'rgba(255, 255, 255, 0.05)' }
                },
                y1: {
                    type: 'linear',
                    display: true,
                    position: 'right',
                    grid: { display: false }
                },
                x: {
                    grid: { display: false }
                }
            }
        }
    });
}

function renderCategoryChart(data) {
    const ctx = document.getElementById('categorySalesChart').getContext('2d');
    
    if (categoryChartInstance) {
        categoryChartInstance.destroy();
    }
    
    const labels = data.map(item => item.category_name);
    const revenue = data.map(item => item.revenue);
    
    categoryChartInstance = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: labels,
            datasets: [{
                label: 'Revenue (₹)',
                data: revenue,
                backgroundColor: [
                    'rgba(99, 102, 241, 0.8)',
                    'rgba(56, 189, 248, 0.8)',
                    'rgba(45, 212, 191, 0.8)',
                    'rgba(167, 139, 250, 0.8)',
                    'rgba(244, 114, 182, 0.8)',
                    'rgba(251, 191, 36, 0.8)'
                ],
                borderRadius: 6
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            indexAxis: 'y', // horizontal bar chart
            plugins: {
                legend: { display: false }
            },
            scales: {
                x: {
                    grid: { color: 'rgba(255, 255, 255, 0.05)' }
                },
                y: {
                    grid: { display: false }
                }
            }
        }
    });
}

function renderCategoryList(data) {
    const list = document.getElementById('categoryList');
    list.innerHTML = '';
    
    const totalRev = data.reduce((sum, item) => sum + parseFloat(item.revenue), 0);
    
    data.forEach((cat, index) => {
        const percent = ((cat.revenue / totalRev) * 100).toFixed(1);
        const li = document.createElement('li');
        li.className = 'list-group-item bg-transparent px-4 py-3 border-dark text-white' + (index === 0 ? ' border-top-0 pt-0' : '') + (index === data.length - 1 ? ' border-bottom-0 pb-0' : '');
        
        li.innerHTML = `
            <div class="d-flex justify-content-between align-items-center mb-2">
                <span class="fw-semibold">${cat.category_name}</span>
                <span class="fw-bold">${formatCurrency(cat.revenue)}</span>
            </div>
            <div class="d-flex justify-content-between align-items-center small text-muted mb-1">
                <span>${cat.units} units sold</span>
                <span>${percent}%</span>
            </div>
            <div class="progress" style="height: 6px;">
                <div class="progress-bar bg-primary" style="width: ${percent}%"></div>
            </div>
        `;
        list.appendChild(li);
    });
}
