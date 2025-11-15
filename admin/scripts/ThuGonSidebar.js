// Expand/collapse sidebar script
// Select elements
const menuToggle = document.querySelector('.sidebar-toggle');
const sidebar = document.querySelector('.sidebar');
const maincomponent = document.querySelector('.main');

// Toggle sidebar and main component classes on click
if (menuToggle && sidebar && maincomponent) {
    menuToggle.addEventListener('click', () => {
        sidebar.classList.toggle('collapsed');
        maincomponent.classList.toggle('collapsed');
    });
}