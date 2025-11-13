// expand and shrink sidebar
// SỬA ĐỔI: Tìm nút bằng class 'sidebar-toggle' thay vì ID cũ
const menuToggle = document.querySelector('.sidebar-toggle');
const sidebar = document.querySelector('.sidebar');
const maincomponent = document.querySelector('.main');

// Add/remove class collapsed to sidebar and container to css when shrink or expand the sidebar
if (menuToggle && sidebar && maincomponent) {
    menuToggle.addEventListener('click', () => {
        sidebar.classList.toggle('collapsed');
        maincomponent.classList.toggle('collapsed');
    });
}