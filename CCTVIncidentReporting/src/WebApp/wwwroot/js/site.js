// Global site JavaScript
document.addEventListener('DOMContentLoaded', function () {
    // Add any global scripts here
    
    // Show loading state on form submission
    const forms = document.querySelectorAll('form[method="post"]');
    forms.forEach(form => {
        form.addEventListener('submit', function () {
            const buttons = this.querySelectorAll('button[type="submit"]');
            buttons.forEach(btn => {
                btn.disabled = true;
                btn.style.opacity = '0.6';
            });
        });
    });

    // Clear search query on clear button click
    const clearButtons = document.querySelectorAll('a[href*="?"]');
    clearButtons.forEach(btn => {
        if (btn.textContent.includes('Clear')) {
            btn.addEventListener('click', function (e) {
                // Allow default navigation
            });
        }
    });
});
