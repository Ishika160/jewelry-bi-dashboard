/**
 * Settings Page JavaScript
 * Profile management, user CRUD, password change, system info
 */

document.addEventListener('DOMContentLoaded', () => {
    loadSystemInfo();
    loadActivityLog();
    
    // Load users if admin tab exists
    if (document.getElementById('usersTable')) {
        loadUsers();
    }

    // Profile Form
    document.getElementById('profileForm')?.addEventListener('submit', async (e) => {
        e.preventDefault();
        const data = {
            full_name: document.getElementById('settingsFullName').value,
            email: document.getElementById('settingsEmail').value
        };

        const res = await apiPost('/api/settings.php?action=update_profile', data);
        showToast('profileToast', res.message, res.success);

        if (res.success) {
            document.getElementById('displayName').textContent = data.full_name;
            // Update navbar name
            const navName = document.querySelector('.nav-user-name');
            if (navName) navName.textContent = data.full_name;

            // Immediately refresh notifications and activity log
            if (typeof loadNotifications === 'function') loadNotifications();
            if (typeof loadActivityLog === 'function') loadActivityLog();
        }
    });

    // Password Form
    document.getElementById('passwordForm')?.addEventListener('submit', async (e) => {
        e.preventDefault();
        const data = {
            current_password: document.getElementById('currentPassword').value,
            new_password: document.getElementById('newPasswordSec').value,
            confirm_password: document.getElementById('confirmPassword').value
        };

        const res = await apiPost('/api/settings.php?action=change_password', data);
        showToast('passwordToast', res.message, res.success);

        if (res.success) {
            document.getElementById('passwordForm').reset();
        }
    });

    // Create User Form
    document.getElementById('createUserForm')?.addEventListener('submit', async (e) => {
        e.preventDefault();
        const data = {
            username: document.getElementById('newUsername').value,
            full_name: document.getElementById('newFullName').value,
            email: document.getElementById('newEmail').value,
            password: document.getElementById('newPassword').value,
            role: document.getElementById('newRole').value
        };

        const res = await apiPost('/api/settings.php?action=create_user', data);
        showToast('createUserToast', res.message, res.success);

        if (res.success) {
            document.getElementById('createUserForm').reset();
            loadUsers();
        }
    });
});

// ── Load Users ──
async function loadUsers() {
    try {
        const res = await fetch('/api/settings.php?action=users');
        const data = await res.json();
        
        if (!data.success) return;

        const tbody = document.getElementById('usersTable');
        const count = document.getElementById('userCount');
        count.textContent = data.users.length;

        tbody.innerHTML = data.users.map(u => `
            <tr>
                <td class="ps-4">
                    <div class="d-flex align-items-center">
                        <div class="settings-avatar-sm me-2" style="background-color: ${u.avatar_color};">
                            ${u.full_name.charAt(0).toUpperCase()}
                        </div>
                        <div>
                            <div class="fw-semibold">${escapeHtml(u.full_name)}</div>
                            <small class="text-muted">@${escapeHtml(u.username)}</small>
                        </div>
                    </div>
                </td>
                <td><span class="badge ${u.role === 'admin' ? 'bg-warning-subtle text-warning' : 'bg-info-subtle text-info'}">${u.role}</span></td>
                <td class="text-muted small">${u.last_login ? new Date(u.last_login).toLocaleDateString('en-IN') : 'Never'}</td>
                <td>
                    <span class="badge ${u.is_active ? 'bg-success-subtle text-success' : 'bg-danger-subtle text-danger'}">
                        ${u.is_active ? 'Active' : 'Disabled'}
                    </span>
                </td>
                <td class="pe-4">
                    <button class="btn btn-sm btn-outline-secondary" onclick="toggleUser(${u.user_id})" title="${u.is_active ? 'Disable' : 'Enable'} user">
                        <i class="bi ${u.is_active ? 'bi-person-dash' : 'bi-person-check'}"></i>
                    </button>
                </td>
            </tr>
        `).join('');
    } catch (e) {
        console.error('Failed to load users:', e);
    }
}

// ── Toggle User ──
async function toggleUser(userId) {
    if (!confirm('Are you sure you want to change this user\'s status?')) return;
    
    const res = await apiPost('/api/settings.php?action=toggle_user', { user_id: userId });
    if (res.success) loadUsers();
}

// ── Load System Info ──
async function loadSystemInfo() {
    try {
        const res = await fetch('/api/settings.php?action=system_info');
        const data = await res.json();
        if (!data.success) return;

        const info = data.info;
        document.getElementById('systemInfo').innerHTML = `
            <div class="row g-3">
                <div class="col-6">
                    <div class="p-3 rounded-3" style="background: rgba(var(--bs-primary-rgb), 0.08);">
                        <small class="text-muted d-block">Application</small>
                        <strong>${escapeHtml(info.app_name)}</strong>
                    </div>
                </div>
                <div class="col-6">
                    <div class="p-3 rounded-3" style="background: rgba(var(--bs-primary-rgb), 0.08);">
                        <small class="text-muted d-block">Environment</small>
                        <strong>${escapeHtml(info.environment)}</strong>
                    </div>
                </div>
                <div class="col-6">
                    <div class="p-3 rounded-3" style="background: rgba(var(--bs-primary-rgb), 0.08);">
                        <small class="text-muted d-block">PHP Version</small>
                        <strong>${escapeHtml(info.php_version)}</strong>
                    </div>
                </div>
                <div class="col-6">
                    <div class="p-3 rounded-3" style="background: rgba(var(--bs-primary-rgb), 0.08);">
                        <small class="text-muted d-block">Timezone</small>
                        <strong>${escapeHtml(info.timezone)}</strong>
                    </div>
                </div>
            </div>
        `;

        // DB Stats
        if (info.tables) {
            const tableIcons = {
                products: 'bi-gem', categories: 'bi-tags', inventory: 'bi-box-seam',
                customers: 'bi-people', sales: 'bi-receipt', sale_items: 'bi-bag',
                users: 'bi-person-lock'
            };
            document.getElementById('dbStats').innerHTML = Object.entries(info.tables).map(([table, count]) => `
                <div class="d-flex justify-content-between align-items-center py-2 border-bottom">
                    <span><i class="bi ${tableIcons[table] || 'bi-table'} me-2 text-primary"></i>${table}</span>
                    <span class="badge bg-primary-subtle text-primary">${count.toLocaleString()} rows</span>
                </div>
            `).join('');
        }
    } catch (e) {
        console.error('Failed to load system info:', e);
    }
}

// ── Load Activity Log ──
async function loadActivityLog() {
    try {
        const res = await fetch('/api/notifications.php?action=list');
        const data = await res.json();
        
        const activityItems = data.notifications?.filter(n => n.type === 'info') || [];
        const logEl = document.getElementById('activityLog');
        
        if (activityItems.length === 0) {
            logEl.innerHTML = '<li class="list-group-item text-muted text-center py-3">No recent activity</li>';
            return;
        }

        logEl.innerHTML = activityItems.map(a => `
            <li class="list-group-item d-flex justify-content-between align-items-start px-0">
                <div>
                    <i class="bi ${a.icon} me-2 text-info"></i>
                    <strong>${escapeHtml(a.title)}</strong>
                    <div class="text-muted small">${escapeHtml(a.message)}</div>
                </div>
                <small class="text-muted">${a.time}</small>
            </li>
        `).join('');
    } catch (e) {
        console.error('Failed to load activity log:', e);
    }
}

// ── Helpers ──

async function apiPost(url, data) {
    try {
        const res = await fetch(url, {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify(data)
        });
        return await res.json();
    } catch (e) {
        return { success: false, message: 'Network error' };
    }
}

function showToast(elementId, message, isSuccess) {
    const el = document.getElementById(elementId);
    if (!el) return;
    el.className = `alert ${isSuccess ? 'alert-success' : 'alert-danger'} mb-3`;
    el.innerHTML = `<i class="bi ${isSuccess ? 'bi-check-circle' : 'bi-exclamation-circle'} me-2"></i>${escapeHtml(message)}`;
    el.classList.remove('d-none');
    
    if (isSuccess) {
        setTimeout(() => el.classList.add('d-none'), 3000);
    }
}

function escapeHtml(text) {
    if (!text) return '';
    const div = document.createElement('div');
    div.textContent = text;
    return div.innerHTML;
}
