/**
 * Notification System
 * Fetches alerts and renders the notification dropdown
 */

document.addEventListener('DOMContentLoaded', () => {
    loadNotifications();
    // Auto-refresh every 60 seconds
    setInterval(loadNotifications, 60000);
});

async function loadNotifications() {
    const badge = document.getElementById('notifBadge');
    const list  = document.getElementById('notifList');
    
    if (!badge || !list) return;

    try {
        const res = await fetch('/api/notifications.php?action=list');
        const data = await res.json();

        if (!data.success) {
            console.error('Notification API Error:', data.message);
            return;
        }

        const notifications = data.notifications || [];
        const dismissed = JSON.parse(localStorage.getItem('dismissedNotifs') || '[]');
        
        // Filter out dismissed notifications
        const active = notifications.filter(n => {
            const key = n.title + n.message;
            return !dismissed.includes(key);
        });

        // Update badge
        if (active.length > 0) {
            badge.textContent = active.length > 9 ? '9+' : active.length;
            badge.classList.remove('d-none');
        } else {
            badge.classList.add('d-none');
        }

        // Render notifications
        if (active.length === 0) {
            list.innerHTML = `
                <li class="px-3 py-4 text-center text-muted">
                    <i class="bi bi-check-circle fs-4 d-block mb-2"></i>
                    <span class="small">All caught up! No new alerts.</span>
                </li>
            `;
            return;
        }

        list.innerHTML = active.slice(0, 8).map((n, i) => `
            <li>
                <a class="dropdown-item d-flex align-items-start py-2 px-3 notif-item" href="${n.link}" data-index="${i}">
                    <div class="notif-icon-wrap bg-${n.type}-subtle text-${n.type} me-3 mt-1">
                        <i class="bi ${n.icon}"></i>
                    </div>
                    <div class="flex-grow-1 min-width-0">
                        <div class="d-flex justify-content-between">
                            <strong class="small">${escapeHtmlNotif(n.title)}</strong>
                            <small class="text-muted ms-2 text-nowrap">${n.time}</small>
                        </div>
                        <p class="mb-0 text-muted small text-truncate">${escapeHtmlNotif(n.message)}</p>
                    </div>
                    <button class="btn btn-sm border-0 text-muted ms-2 notif-dismiss" onclick="dismissNotif(event, '${escapeAttr(n.title + n.message)}')" title="Dismiss">
                        <i class="bi bi-x"></i>
                    </button>
                </a>
            </li>
        `).join('');

        // Add "Clear All" button
        list.innerHTML += `
            <li><hr class="dropdown-divider my-1"></li>
            <li>
                <div class="d-flex justify-content-between px-3 py-2">
                    <a href="/modules/inventory/" class="small text-primary text-decoration-none">View Inventory</a>
                    <button class="btn btn-sm btn-link text-muted p-0 small" onclick="clearAllNotifs()">Clear All</button>
                </div>
            </li>
        `;

    } catch (e) {
        console.error('Failed to load notifications:', e);
    }
}

function dismissNotif(event, key) {
    event.preventDefault();
    event.stopPropagation();
    
    const dismissed = JSON.parse(localStorage.getItem('dismissedNotifs') || '[]');
    dismissed.push(key);
    localStorage.setItem('dismissedNotifs', JSON.stringify(dismissed));
    
    loadNotifications();
}

function clearAllNotifs() {
    // Store all current notification keys as dismissed
    const badge = document.getElementById('notifBadge');
    badge?.classList.add('d-none');
    
    // Clear and set a timestamp so we know when "clear all" was clicked
    localStorage.setItem('notifsClearedAt', Date.now().toString());
    localStorage.setItem('dismissedNotifs', '[]');
    
    const list = document.getElementById('notifList');
    if (list) {
        list.innerHTML = `
            <li class="px-3 py-4 text-center text-muted">
                <i class="bi bi-check-circle fs-4 d-block mb-2"></i>
                <span class="small">All caught up! No new alerts.</span>
            </li>
        `;
    }
}

function escapeHtmlNotif(text) {
    if (!text) return '';
    const div = document.createElement('div');
    div.textContent = text;
    return div.innerHTML;
}

function escapeAttr(text) {
    return text.replace(/'/g, "\\'").replace(/"/g, '&quot;');
}
