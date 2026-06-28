/**
 * Customer Module Scripts
 */

let segmentChartInstance = null;

document.addEventListener('DOMContentLoaded', () => {
    loadCustomerData();
});

async function loadCustomerData() {
    const loader = document.getElementById('loader');
    const content = document.getElementById('customerContent');
    
    try {
        const response = await fetch(window.APP_URL + `api/customers.php`);
        const result = await response.json();
        
        if (!result.success) throw new Error(result.message);
        
        const data = result.data;
        
        // KPIs
        document.getElementById('summary-total').textContent = data.summary.total_customers.toLocaleString();
        document.getElementById('summary-vip').textContent = data.summary.vip_customers.toLocaleString();
        document.getElementById('summary-premium').textContent = data.summary.premium_customers.toLocaleString();
        document.getElementById('summary-aov').textContent = formatCurrency(data.summary.average_clv);
        
        renderSegmentChart(data.segments);
        renderCustomerTable(data.customers);
        
        loader.classList.add('d-none');
        content.classList.remove('d-none');
        
    } catch (error) {
        console.error('Failed to load customer data:', error);
    }
}

function renderSegmentChart(data) {
    const ctx = document.getElementById('segmentChart').getContext('2d');
    if (segmentChartInstance) segmentChartInstance.destroy();
    
    const labels = data.map(item => item.segment);
    const counts = data.map(item => item.count);
    
    const colors = labels.map(seg => {
        if (seg === 'VIP') return '#fbbf24'; // Warning/Gold
        if (seg === 'Premium') return '#38bdf8'; // Info/Blue
        return '#64748b'; // Slate/Regular
    });
    
    segmentChartInstance = new Chart(ctx, {
        type: 'pie',
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
            plugins: {
                legend: { position: 'bottom', labels: { usePointStyle: true, padding: 20 } }
            }
        }
    });
}

function renderCustomerTable(items) {
    const tbody = document.getElementById('customerTable');
    tbody.innerHTML = '';
    
    items.forEach(item => {
        const tr = document.createElement('tr');
        
        let badgeClass = 'bg-secondary';
        if (item.customer_type === 'VIP') badgeClass = 'bg-warning text-dark';
        if (item.customer_type === 'Premium') badgeClass = 'bg-info text-dark';
        
        let metalClass = 'bg-light text-dark border';
        if (item.favorite_metal === 'Gold') metalClass = 'bg-warning text-dark border-warning';
        if (item.favorite_metal === 'Silver') metalClass = 'bg-secondary text-white';
        if (item.favorite_metal === 'Platinum') metalClass = 'bg-dark text-white';
        if (item.favorite_metal === 'Diamond') metalClass = 'bg-info text-white';
        
        const metalBadge = item.favorite_metal ? `<span class="badge ${metalClass} rounded-pill ms-2"><i class="bi bi-gem me-1"></i>${item.favorite_metal} Buyer</span>` : '';
        
        tr.innerHTML = `
            <td class="ps-4 fw-medium text-primary">${item.customer_code}</td>
            <td class="fw-semibold">${item.customer_name}</td>
            <td class="text-muted">${item.city || 'N/A'}</td>
            <td>${item.total_orders || 0}</td>
            <td><span class="badge ${badgeClass} rounded-pill">${item.customer_type}</span>${metalBadge}</td>
            <td class="pe-4 fw-bold text-success">${formatCurrency(item.total_spent || 0)}</td>
        `;
        tbody.appendChild(tr);
    });
}
