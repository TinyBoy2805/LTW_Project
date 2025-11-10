// expand and shrink sidebar
const menuToggle = document.getElementById('menu__action');
const sidebar = document.querySelector('.sidebar');
const maincomponent = document.querySelector('.main');

// Add/remove class collapsed to sidebar and container to css when shrink or expand the sidebar
if (menuToggle && sidebar && maincomponent) {
    menuToggle.addEventListener('click', () => {
        sidebar.classList.toggle('collapsed');
        maincomponent.classList.toggle('collapsed');
    });
}