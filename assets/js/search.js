/**
 * Global Search
 * Searches across products, customers, and sales with debouncing
 */

let searchSelectedIndex = -1;

document.addEventListener('DOMContentLoaded', () => {
    const searchInput   = document.getElementById('globalSearch');
    const searchResults = document.getElementById('searchResults');
    
    if (!searchInput || !searchResults) return;

    let debounceTimer = null;

    // Debounced search
    searchInput.addEventListener('input', (e) => {
        const query = e.target.value.trim();
        searchSelectedIndex = -1;
        
        clearTimeout(debounceTimer);

        if (query.length < 2) {
            searchResults.classList.add('d-none');
            searchResults.innerHTML = '';
            return;
        }

        debounceTimer = setTimeout(() => performSearch(query), 300);
    });

    // Keyboard navigation
    searchInput.addEventListener('keydown', (e) => {
        const items = searchResults.querySelectorAll('.search-result-item');
        
        if (e.key === 'ArrowDown') {
            e.preventDefault();
            searchSelectedIndex = Math.min(searchSelectedIndex + 1, items.length - 1);
            highlightSearchItem(items);
        } else if (e.key === 'ArrowUp') {
            e.preventDefault();
            searchSelectedIndex = Math.max(searchSelectedIndex - 1, 0);
            highlightSearchItem(items);
        } else if (e.key === 'Enter' && searchSelectedIndex >= 0) {
            e.preventDefault();
            items[searchSelectedIndex]?.click();
        } else if (e.key === 'Escape') {
            searchResults.classList.add('d-none');
            searchInput.blur();
        }
    });

    // Click-away to dismiss
    document.addEventListener('click', (e) => {
        if (!e.target.closest('.search-wrapper')) {
            searchResults.classList.add('d-none');
        }
    });

    // Re-show results on focus if has content
    searchInput.addEventListener('focus', () => {
        if (searchResults.innerHTML.trim() && searchInput.value.trim().length >= 2) {
            searchResults.classList.remove('d-none');
        }
    });

    // Keyboard shortcut: Ctrl+K or / to focus search
    document.addEventListener('keydown', (e) => {
        if ((e.ctrlKey && e.key === 'k') || (e.key === '/' && document.activeElement.tagName !== 'INPUT' && document.activeElement.tagName !== 'TEXTAREA')) {
            e.preventDefault();
            searchInput.focus();
            searchInput.select();
        }
    });
});

async function performSearch(query) {
    const searchResults = document.getElementById('searchResults');

    try {
        const res = await fetch(`/api/search.php?q=${encodeURIComponent(query)}`);
        const data = await res.json();

        if (!data.success || data.results.length === 0) {
            searchResults.innerHTML = `
                <div class="search-empty py-3 text-center text-muted">
                    <i class="bi bi-search d-block mb-1"></i>
                    <small>No results for "${escapeHtmlSearch(query)}"</small>
                </div>
            `;
            searchResults.classList.remove('d-none');
            return;
        }

        // Group results by category
        const grouped = {};
        data.results.forEach(r => {
            if (!grouped[r.category]) grouped[r.category] = [];
            grouped[r.category].push(r);
        });

        let html = '';
        for (const [category, items] of Object.entries(grouped)) {
            html += `<div class="search-category px-3 py-1"><small class="text-muted fw-bold text-uppercase">${category}</small></div>`;
            items.forEach(item => {
                const highlightedTitle = highlightSearchMatch(item.title, query);
                const highlightedSub   = highlightSearchMatch(item.subtitle, query);
                html += `
                    <a href="${item.link}" class="search-result-item d-flex align-items-center px-3 py-2 text-decoration-none">
                        <i class="bi ${item.icon} me-3 text-primary fs-5"></i>
                        <div class="min-width-0 flex-grow-1">
                            <div class="fw-semibold small text-body">${highlightedTitle}</div>
                            <div class="text-muted small text-truncate">${highlightedSub}</div>
                        </div>
                    </a>
                `;
            });
        }

        // Shortcut hint
        html += `
            <div class="search-footer px-3 py-2 border-top d-flex justify-content-between">
                <small class="text-muted"><kbd>↑↓</kbd> navigate · <kbd>↵</kbd> select · <kbd>esc</kbd> close</small>
                <small class="text-muted">${data.total} results</small>
            </div>
        `;

        searchResults.innerHTML = html;
        searchResults.classList.remove('d-none');

    } catch (e) {
        console.error('Search failed:', e);
    }
}

function highlightSearchItem(items) {
    items.forEach((item, i) => {
        item.classList.toggle('search-highlight', i === searchSelectedIndex);
    });
    items[searchSelectedIndex]?.scrollIntoView({ block: 'nearest' });
}

function highlightSearchMatch(text, query) {
    if (!text || !query) return text || '';
    const escaped = query.replace(/[.*+?^${}()|[\]\\]/g, '\\$&');
    const regex = new RegExp(`(${escaped})`, 'gi');
    return escapeHtmlSearch(text).replace(regex, '<mark class="bg-warning bg-opacity-25 rounded px-0">$1</mark>');
}

function escapeHtmlSearch(text) {
    if (!text) return '';
    const div = document.createElement('div');
    div.textContent = text;
    return div.innerHTML;
}
