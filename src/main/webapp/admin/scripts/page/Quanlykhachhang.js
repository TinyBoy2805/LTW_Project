// Xử lý submit đổi mật khẩu từ modal
window.submitChangePassword = function() {
    try {
        const newPwd = document.getElementById('new_password_modal').value;
        const confirmPwd = document.getElementById('confirm_password_modal').value;
        // Kiểm tra xác nhận
        if (newPwd !== confirmPwd) {
            showNotifyModal('Mật khẩu xác nhận không khớp!');
            return;
        }
        // Kiểm tra độ mạnh mật khẩu
        if (newPwd.length < 10) {
            showNotifyModal('Độ dài tối thiểu là 10 kí tự');
            return;
        }
        if (!/[0-9]/.test(newPwd)) {
            showNotifyModal('Mật khẩu phải bao gồm số');
            return;
        }
        if (!/[!@#$%^&*()_+\-=\[\]{};':"\\|,.<>/?]/.test(newPwd)) {
            showNotifyModal('Mật khẩu phải bao gồm kí tự đặc biệt');
            return;
        }
        // Nếu hợp lệ thì submit
        const hiddenNew = document.getElementById('new_password_hidden');
        const hiddenConfirm = document.getElementById('confirm_password_hidden');
        const hiddenId = document.getElementById('change_password_id_hidden');
        if (hiddenNew && hiddenConfirm) {
            hiddenNew.value = newPwd;
            hiddenConfirm.value = confirmPwd;
        }
        if (hiddenId) hiddenId.value = document.querySelector('[name="id"]').value;
        const hiddenForm = document.getElementById('change-password-form');
        if (hiddenForm) {
            hiddenForm.submit();
        }
    } catch (e) {
        console.error('submitChangePassword error', e);
    }
}

function showNotifyModal(msg) {
    var notifyModal = document.getElementById('notifyModal');
    var notifyMessage = document.getElementById('notifyMessage');
    var notifyOkBtn = document.getElementById('notifyOkBtn');
    if (notifyModal && notifyMessage && notifyOkBtn) {
        notifyMessage.textContent = msg;
        notifyModal.style.display = 'flex';
        notifyOkBtn.onclick = function() {
            notifyModal.style.display = 'none';
        };
    }
}
// Hiển thị và ẩn modal đổi mật khẩu
window.showChangePasswordModal = function() {
    document.getElementById('changePasswordModal').style.display = 'flex';
}
window.hideChangePasswordModal = function() {
    document.getElementById('changePasswordModal').style.display = 'none';
}

// Hiển thị modal thông báo 
document.addEventListener('DOMContentLoaded', function () {
    var msgDiv = document.querySelector('.update-info-section [data-success-message]');
    var errDiv = document.querySelector('.update-info-section [data-error-message]');
    var notifyModal = document.getElementById('notifyModal');
    var notifyMessage = document.getElementById('notifyMessage');
    var notifyOkBtn = document.getElementById('notifyOkBtn');
    var message = '';
    if (msgDiv && msgDiv.textContent.trim()) {
        message = msgDiv.textContent.trim();
    } else if (errDiv && errDiv.textContent.trim()) {
        message = errDiv.textContent.trim();
    }
    if (message && notifyModal && notifyMessage && notifyOkBtn) {
        notifyMessage.textContent = message;
        notifyModal.style.display = 'flex';
        notifyOkBtn.onclick = function() {
            notifyModal.style.display = 'none';
            window.location.href = window.location.pathname + window.location.search;
        };
    }
});
// Đổi ảnh đại diện khách hàng và hiển thị preview
function setupCustomerImagePreview() {
    const input = document.getElementById('avatar');
    const avatarPreview = document.getElementById('avatar-preview');
    if (!input || !avatarPreview) return;
    input.addEventListener('change', function (event) {
        const file = event.target.files && event.target.files[0];
        if (!file) return;
        const reader = new FileReader();
        reader.onload = function (e) {
            avatarPreview.src = e.target.result;
        };
        reader.readAsDataURL(file);
    });
}
// Thiết lập chức năng chỉnh sửa thông tin khách hàng
function setupCustomerEditHandlers() {
    const editForm = document.getElementById('updateForm');
    const editableInputs = document.querySelectorAll('.field-input');
    const cancelBtn = document.querySelector('.cancel-btn');

    if (!editableInputs) return;

    editableInputs.forEach(input => input.dataset.original = input.value);
    const originalAvatarSrc = document.getElementById('avatar-preview')?.src || '';

    if (cancelBtn) {
        cancelBtn.addEventListener('click', function (e) {
            e.preventDefault();
            editableInputs.forEach(input => {
                input.value = input.dataset.original;
            });
            const avatarPreview = document.getElementById('avatar-preview');
            const avatarInput = document.getElementById('avatar');
            if (avatarPreview) avatarPreview.src = originalAvatarSrc;
            if (avatarInput) avatarInput.value = '';
        });
    }

    // Trước khi submit, bỏ thuộc tính readonly để gửi dữ liệu
    if (editForm) {
        editForm.addEventListener('submit', function () {
            editableInputs.forEach(input => input.removeAttribute('readonly'));
        });
    }

    // Hàm submit form từ nút Lưu thay vì nút submit mặc định
    window.submitCustomerEditForm = function (btn) {
        try {
            editableInputs.forEach(input => input.removeAttribute('readonly'));
            if (btn && btn instanceof Element) btn.disabled = true;
            if (editForm) editForm.submit();
        } catch (e) {
            console.error('submitCustomerEditForm error', e);
        }
        return false;
    };
}

// Khởi tạo khi DOM load xong
document.addEventListener('DOMContentLoaded', function () {
    setupCustomerImagePreview();
    setupCustomerEditHandlers();
});