document.addEventListener('DOMContentLoaded', () => {
    const openBtn = document.getElementById('stock__history__btn');
    const closeBtn = document.getElementById('stock__history__close');
    const overlay = document.getElementById('stock__history__overlay');

    if (openBtn && overlay) {
        openBtn.addEventListener('click', () => {
            overlay.classList.remove('hidden');
        });
    }

    if (closeBtn && overlay) {
        closeBtn.addEventListener('click', () => {
            overlay.classList.add('hidden');
        });
    }

    if (overlay) {
        overlay.addEventListener('click', (e) => {
            if (e.target === overlay) {
                overlay.classList.add('hidden');
            }
        });
    }
});