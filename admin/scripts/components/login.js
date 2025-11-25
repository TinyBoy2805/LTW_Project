document.addEventListener('DOMContentLoaded', () => {
    // 1. Lấy các phần tử cần thiết
    const adminCheckbox = document.getElementById('adminCheckbox');
    const loginButton = document.getElementById('loginButton');
    const headerRole = document.getElementById('headerRole');

    // Các đường dẫn chuyển hướng
    const ADMIN_URL = './admin/pages/dashboard.html';
    const CUSTOMER_URL = './customer/pages/Home.html';

    // 2. Hàm cập nhật trạng thái và đường dẫn
    const updateLoginState = () => {
        const isChecked = adminCheckbox.checked;

        // CHỈ CẬP NHẬT href: Đảm bảo chuyển hướng luôn xảy ra
        loginButton.href = isChecked ? ADMIN_URL : CUSTOMER_URL;
    };

    // 3. Gán sự kiện cho checkbox (Cập nhật href khi trạng thái thay đổi)
    adminCheckbox.addEventListener('change', updateLoginState);

    // 4. Thiết lập trạng thái ban đầu khi tải trang
    updateLoginState();
});