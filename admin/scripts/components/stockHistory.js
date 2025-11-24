document.addEventListener('DOMContentLoaded', () => {
    const openBtn = document.getElementById('stock__history__btn');
    const closeBtn = document.getElementById('stock__history__close');
    const overlay = document.getElementById('stock__history__overlay');

    // Xử lý mở Overlay
    if (openBtn && overlay) {
        openBtn.addEventListener('click', () => {
            overlay.classList.remove('hidden'); // Xóa class 'hidden' để hiện Overlay
        });
    }

    // Xử lý đóng Overlay bằng nút X
    if (closeBtn && overlay) {
        closeBtn.addEventListener('click', () => {
            overlay.classList.add('hidden'); // Thêm class 'hidden' để ẩn Overlay
        });
    }

    // Xử lý đóng Overlay khi click ra ngoài
    if (overlay) {
        overlay.addEventListener('click', (e) => {
            if (e.target === overlay) {
                overlay.classList.add('hidden');
            }
        });
    }
});