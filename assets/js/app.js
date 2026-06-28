/**
 * Global JavaScript Helpers
 */

// Sidebar & Theme Toggle
document.addEventListener('DOMContentLoaded', () => {
    const sidebarToggle = document.getElementById('sidebarToggle');
    const sidebar = document.getElementById('sidebar');
    
    if (sidebarToggle && sidebar) {
        sidebarToggle.addEventListener('click', () => {
            sidebar.classList.toggle('show');
        });
    }

    // Theme Toggle Logic
    const themeToggleBtn = document.getElementById('themeToggle');
    const htmlElement = document.documentElement;
    const themeIcon = themeToggleBtn ? themeToggleBtn.querySelector('i') : null;

    // Load saved theme
    const savedTheme = localStorage.getItem('theme') || 'dark';
    htmlElement.setAttribute('data-bs-theme', savedTheme);
    if (themeIcon) {
        themeIcon.className = savedTheme === 'dark' ? 'bi bi-moon-stars fs-5' : 'bi bi-sun fs-5';
    }

    if (themeToggleBtn) {
        themeToggleBtn.addEventListener('click', () => {
            const currentTheme = htmlElement.getAttribute('data-bs-theme');
            const newTheme = currentTheme === 'dark' ? 'light' : 'dark';
            
            htmlElement.setAttribute('data-bs-theme', newTheme);
            localStorage.setItem('theme', newTheme);
            
            themeIcon.className = newTheme === 'dark' ? 'bi bi-moon-stars fs-5' : 'bi bi-sun fs-5';
        });
    }

    // Logout Handler
    const logoutLink = document.getElementById('logoutLink');
    if (logoutLink) {
        logoutLink.addEventListener('click', async (e) => {
            e.preventDefault();
            try {
                await fetch(window.APP_URL + 'api/auth.php?action=logout');
            } catch (err) {
                // Proceed to redirect even if fetch fails
            }
            window.location.href = '/login.php';
        });
    }
});

// Format Currency
function formatCurrency(value) {
    return new Intl.NumberFormat('en-IN', {
        style: 'currency',
        currency: 'INR',
        maximumFractionDigits: 0
    }).format(value);
}

// Global Chart Defaults
if (typeof Chart !== 'undefined') {
    Chart.defaults.color = getComputedStyle(document.documentElement).getPropertyValue('--bs-text-muted').trim() || '#94a3b8';
    Chart.defaults.font.family = "'Inter', sans-serif";
    Chart.defaults.plugins.tooltip.backgroundColor = getComputedStyle(document.documentElement).getPropertyValue('--bs-surface').trim() || 'rgba(15, 23, 42, 0.9)';
    Chart.defaults.plugins.tooltip.titleColor = getComputedStyle(document.documentElement).getPropertyValue('--bs-body-color').trim() || '#f8fafc';
    Chart.defaults.plugins.tooltip.bodyColor = getComputedStyle(document.documentElement).getPropertyValue('--bs-body-color').trim() || '#f8fafc';
    Chart.defaults.plugins.tooltip.padding = 10;
    Chart.defaults.plugins.tooltip.cornerRadius = 8;
    Chart.defaults.plugins.tooltip.borderColor = getComputedStyle(document.documentElement).getPropertyValue('--bs-glass-border').trim() || 'rgba(255,255,255,0.1)';
    Chart.defaults.plugins.tooltip.borderWidth = 1;
}
