const menuToggle = document.getElementById('menu__action');
const sidebar = document.querySelector('.sidebar'); 
const dashboard = document.querySelector('.dashboard');

if (menuToggle && sidebar && dashboard) {
    menuToggle.addEventListener('click', () => {
        sidebar.classList.toggle('collapsed');
        dashboard.classList.toggle('collapsed');
    });
}

