// Script cơ bản để chuyển đổi giữa form Đăng nhập và Đăng ký
document.querySelectorAll('.tab-list__button').forEach(button => {
    button.addEventListener('click', function () {
        // Loại bỏ active khỏi tất cả các nút và form
        document.querySelectorAll('.tab-list__button').forEach(btn => btn.classList.remove('tab-list__button--active'));
        document.querySelectorAll('.auth-form').forEach(form => form.classList.remove('auth-form--active'));
        document.querySelectorAll('.auth-form').forEach(form => form.classList.add('auth-form--hidden'));

        // Thêm active vào nút được click
        this.classList.add('tab-list__button--active');

        // Hiển thị form tương ứng
        const targetFormId = this.getAttribute('data-form') + '-form';
        const targetForm = document.getElementById(targetFormId);
        if (targetForm) {
            targetForm.classList.add('auth-form--active');
            targetForm.classList.remove('auth-form--hidden');
        }
    });
});

// Redirect on login submit based on admin checkbox
(function () {
    const loginForm = document.getElementById('login-form');
    if (!loginForm) return;
    loginForm.addEventListener('submit', function (ev) {
        ev.preventDefault();
        // Lấy giá trị của checkbox admin (sử dụng ID đã đổi)
        const isAdmin = !!this.querySelector('#admin-checkbox')?.checked;

        if (isAdmin) {
            // redirect to admin dashboard (same folder)
            // Lưu ý: Đường dẫn cần được chỉnh sửa nếu cấu trúc folder khác với dự kiến
            window.location.href = '../../../admin/pages/dashboard.html';
        } else {
            // redirect to customer home
            // Lưu ý: Đường dẫn cần được chỉnh sửa nếu cấu trúc folder khác với dự kiến
            window.location.href = '../../customer/pages/Home.html';
        }
    });
})();