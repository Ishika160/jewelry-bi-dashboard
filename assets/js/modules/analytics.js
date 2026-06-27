/**
 * Analytics Module Scripts (Heatmap)
 */

document.addEventListener('DOMContentLoaded', () => {
    loadHeatmap();
});

async function loadHeatmap() {
    try {
        const response = await fetch('/api/analytics.php');
        const result = await response.json();
        
        if (!result.success) throw new Error(result.message);
        
        renderHeatmap(result.data);
    } catch (error) {
        console.error('Error loading heatmap:', error);
    }
}

function renderHeatmap(data) {
    const ctx = document.getElementById('heatmapChart').getContext('2d');
    
    const months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
    
    new Chart(ctx, {
        type: 'matrix',
        data: {
            datasets: [{
                label: 'Revenue Heatmap',
                data: data.matrix,
                backgroundColor: function(context) {
                    const value = context.dataset.data[context.dataIndex].v;
                    // Calculate opacity based on max value (alpha between 0.1 and 1.0)
                    const alpha = Math.max(0.1, value / data.max_val);
                    return `rgba(99, 102, 241, ${alpha})`;
                },
                borderWidth: 1,
                borderColor: 'rgba(255, 255, 255, 0.05)',
                width: function({chart}) {
                    return (chart.chartArea || {}).width / 12 - 4; // 12 months, minus padding
                },
                height: function({chart}) {
                    return (chart.chartArea || {}).height / data.categories.length - 4;
                }
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            plugins: {
                legend: { display: false },
                tooltip: {
                    callbacks: {
                        title: function(context) {
                            const item = context[0].raw;
                            return `${months[item.x]} - ${item.category}`;
                        },
                        label: function(context) {
                            const item = context.raw;
                            return ` Revenue: ${formatCurrency(item.v)}`;
                        }
                    }
                }
            },
            scales: {
                x: {
                    type: 'category',
                    labels: months,
                    ticks: { display: true },
                    grid: { display: false }
                },
                y: {
                    type: 'category',
                    labels: data.categories,
                    offset: true,
                    ticks: { display: true },
                    grid: { display: false }
                }
            }
        }
    });
}
