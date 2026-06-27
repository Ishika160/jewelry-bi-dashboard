<?php
require_once '../../includes/db.php';
$extra_js = '/assets/js/modules/settings.js';
require_once '../../includes/header.php';
require_once '../../includes/sidebar.php';

$user = getCurrentUser();
$isAdmin = isAdmin();
?>

<div class="p-4">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <div>
            <h4 class="fw-bold mb-1">Settings</h4>
            <p class="text-muted mb-0">Manage your profile, users, and preferences</p>
        </div>
    </div>

    <!-- Settings Tabs -->
    <ul class="nav nav-tabs mb-4" id="settingsTabs" role="tablist">
        <li class="nav-item" role="presentation">
            <button class="nav-link active bg-transparent text-body" id="profile-tab" data-bs-toggle="tab" data-bs-target="#profile" type="button" role="tab">
                <i class="bi bi-person me-2"></i>Profile
            </button>
        </li>
        <?php if ($isAdmin): ?>
        <li class="nav-item" role="presentation">
            <button class="nav-link bg-transparent text-muted" id="users-tab" data-bs-toggle="tab" data-bs-target="#users" type="button" role="tab">
                <i class="bi bi-people me-2"></i>Manage Users
            </button>
        </li>
        <?php endif; ?>
        <li class="nav-item" role="presentation">
            <button class="nav-link bg-transparent text-muted" id="security-tab" data-bs-toggle="tab" data-bs-target="#security" type="button" role="tab">
                <i class="bi bi-shield-lock me-2"></i>Security
            </button>
        </li>
        <li class="nav-item" role="presentation">
            <button class="nav-link bg-transparent text-muted" id="about-tab" data-bs-toggle="tab" data-bs-target="#about" type="button" role="tab">
                <i class="bi bi-info-circle me-2"></i>About
            </button>
        </li>
    </ul>

    <!-- Tab Content -->
    <div class="tab-content" id="settingsContent">

        <!-- PROFILE TAB -->
        <div class="tab-pane fade show active" id="profile" role="tabpanel">
            <div class="row g-4">
                <div class="col-12 col-lg-4">
                    <div class="card border-0 shadow-sm h-100">
                        <div class="card-body p-4 text-center">
                            <div class="settings-avatar mx-auto mb-3" id="profileAvatar" style="background-color: <?= htmlspecialchars($user['avatar_color']) ?>;">
                                <?= strtoupper(substr($user['full_name'], 0, 1)) ?>
                            </div>
                            <h5 class="fw-bold mb-1" id="displayName"><?= htmlspecialchars($user['full_name']) ?></h5>
                            <span class="badge bg-primary-subtle text-primary"><?= ucfirst($user['role']) ?></span>
                            <p class="text-muted mt-2 mb-0 small">@<?= htmlspecialchars($user['username']) ?></p>
                        </div>
                    </div>
                </div>
                <div class="col-12 col-lg-8">
                    <div class="card border-0 shadow-sm">
                        <div class="card-header bg-transparent p-4">
                            <h5 class="fw-bold mb-0">Profile Information</h5>
                        </div>
                        <div class="card-body p-4">
                            <!-- Toast for feedback -->
                            <div id="profileToast" class="alert d-none mb-3" role="alert"></div>

                            <form id="profileForm">
                                <div class="mb-3">
                                    <label class="form-label text-muted">Username</label>
                                    <input type="text" class="form-control" value="<?= htmlspecialchars($user['username']) ?>" disabled>
                                    <div class="form-text">Username cannot be changed</div>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label text-muted" for="settingsFullName">Full Name</label>
                                    <input type="text" class="form-control" id="settingsFullName" name="full_name" value="<?= htmlspecialchars($user['full_name']) ?>" required>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label text-muted" for="settingsEmail">Email Address</label>
                                    <input type="email" class="form-control" id="settingsEmail" name="email" value="<?= htmlspecialchars($user['email'] ?? '') ?>">
                                </div>
                                <div class="mb-3">
                                    <label class="form-label text-muted">Role</label>
                                    <input type="text" class="form-control" value="<?= ucfirst($user['role']) ?>" disabled>
                                </div>
                                <button type="submit" class="btn btn-primary">
                                    <i class="bi bi-check2 me-2"></i>Save Changes
                                </button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <?php if ($isAdmin): ?>
        <!-- MANAGE USERS TAB -->
        <div class="tab-pane fade" id="users" role="tabpanel">
            <div class="row g-4">
                <!-- Create User Form -->
                <div class="col-12 col-lg-4">
                    <div class="card border-0 shadow-sm">
                        <div class="card-header bg-transparent p-4">
                            <h5 class="fw-bold mb-0"><i class="bi bi-person-plus me-2"></i>Add New User</h5>
                        </div>
                        <div class="card-body p-4">
                            <div id="createUserToast" class="alert d-none mb-3" role="alert"></div>
                            <form id="createUserForm">
                                <div class="mb-3">
                                    <label class="form-label text-muted" for="newUsername">Username</label>
                                    <input type="text" class="form-control" id="newUsername" name="username" required>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label text-muted" for="newFullName">Full Name</label>
                                    <input type="text" class="form-control" id="newFullName" name="full_name" required>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label text-muted" for="newEmail">Email</label>
                                    <input type="email" class="form-control" id="newEmail" name="email">
                                </div>
                                <div class="mb-3">
                                    <label class="form-label text-muted" for="newPassword">Password</label>
                                    <input type="password" class="form-control" id="newPassword" name="password" required minlength="6">
                                </div>
                                <div class="mb-3">
                                    <label class="form-label text-muted" for="newRole">Role</label>
                                    <select class="form-select" id="newRole" name="role">
                                        <option value="viewer">Viewer (Read-Only)</option>
                                        <option value="admin">Admin (Full Access)</option>
                                    </select>
                                </div>
                                <button type="submit" class="btn btn-primary w-100">
                                    <i class="bi bi-person-plus me-2"></i>Create User
                                </button>
                            </form>
                        </div>
                    </div>
                </div>

                <!-- Users List -->
                <div class="col-12 col-lg-8">
                    <div class="card border-0 shadow-sm">
                        <div class="card-header bg-transparent p-4 d-flex justify-content-between align-items-center">
                            <h5 class="fw-bold mb-0">All Users</h5>
                            <span class="badge bg-primary" id="userCount">0</span>
                        </div>
                        <div class="card-body p-0">
                            <div class="table-responsive">
                                <table class="table table-hover table-borderless align-middle mb-0">
                                    <thead class="bg-transparent">
                                        <tr>
                                            <th class="ps-4">User</th>
                                            <th>Role</th>
                                            <th>Last Login</th>
                                            <th>Status</th>
                                            <th class="pe-4">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody id="usersTable">
                                        <tr><td colspan="5" class="text-center py-4 text-muted">Loading...</td></tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <?php endif; ?>

        <!-- SECURITY TAB -->
        <div class="tab-pane fade" id="security" role="tabpanel">
            <div class="row g-4">
                <div class="col-12 col-lg-6">
                    <div class="card border-0 shadow-sm">
                        <div class="card-header bg-transparent p-4">
                            <h5 class="fw-bold mb-0"><i class="bi bi-key me-2"></i>Change Password</h5>
                        </div>
                        <div class="card-body p-4">
                            <div id="passwordToast" class="alert d-none mb-3" role="alert"></div>
                            <form id="passwordForm">
                                <div class="mb-3">
                                    <label class="form-label text-muted" for="currentPassword">Current Password</label>
                                    <input type="password" class="form-control" id="currentPassword" name="current_password" required>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label text-muted" for="newPasswordSec">New Password</label>
                                    <input type="password" class="form-control" id="newPasswordSec" name="new_password" required minlength="6">
                                    <div class="form-text">Minimum 6 characters</div>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label text-muted" for="confirmPassword">Confirm New Password</label>
                                    <input type="password" class="form-control" id="confirmPassword" name="confirm_password" required>
                                </div>
                                <button type="submit" class="btn btn-warning">
                                    <i class="bi bi-shield-check me-2"></i>Update Password
                                </button>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="col-12 col-lg-6">
                    <div class="card border-0 shadow-sm">
                        <div class="card-header bg-transparent p-4">
                            <h5 class="fw-bold mb-0"><i class="bi bi-clock-history me-2"></i>Recent Activity</h5>
                        </div>
                        <div class="card-body p-4">
                            <ul class="list-group list-group-flush" id="activityLog">
                                <li class="list-group-item text-muted">Loading activity...</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- ABOUT TAB -->
        <div class="tab-pane fade" id="about" role="tabpanel">
            <div class="row g-4">
                <div class="col-12 col-lg-6">
                    <div class="card border-0 shadow-sm">
                        <div class="card-header bg-transparent p-4">
                            <h5 class="fw-bold mb-0"><i class="bi bi-cpu me-2"></i>System Information</h5>
                        </div>
                        <div class="card-body p-4" id="systemInfo">
                            <div class="text-muted">Loading system info...</div>
                        </div>
                    </div>
                </div>
                <div class="col-12 col-lg-6">
                    <div class="card border-0 shadow-sm">
                        <div class="card-header bg-transparent p-4">
                            <h5 class="fw-bold mb-0"><i class="bi bi-database me-2"></i>Database Statistics</h5>
                        </div>
                        <div class="card-body p-4" id="dbStats">
                            <div class="text-muted">Loading database stats...</div>
                        </div>
                    </div>
                </div>
                <div class="col-12">
                    <div class="card border-0 shadow-sm">
                        <div class="card-body p-4">
                            <div class="d-flex align-items-center mb-3">
                                <div class="settings-avatar me-3" style="background: linear-gradient(135deg, #d4af37, #b8860b); width:48px; height:48px; font-size:1.2rem;">
                                    <i class="bi bi-gem text-white"></i>
                                </div>
                                <div>
                                    <h5 class="fw-bold mb-0">Jewelry Business Intelligence System</h5>
                                    <p class="text-muted mb-0">Version 1.0.0 — BCA Final Year Project</p>
                                </div>
                            </div>
                            <hr>
                            <div class="row text-muted small">
                                <div class="col-md-4"><strong>Frontend:</strong> Bootstrap 5.3 + Chart.js 4.x</div>
                                <div class="col-md-4"><strong>Backend:</strong> PHP <?= PHP_VERSION ?></div>
                                <div class="col-md-4"><strong>Database:</strong> MySQL 8.x</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>

<?php require_once '../../includes/footer.php'; ?>
