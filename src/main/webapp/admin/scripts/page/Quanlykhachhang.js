// Refactored to controller-style setup functions (like Blog.js)

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

function setupCustomerEditHandlers() {
    const editForm = document.getElementById('updateForm');
    const editableInputs = document.querySelectorAll('.field-input');
    const cancelBtn = document.querySelector('.cancel-btn');

    if (!editableInputs) return;

    // store original values for cancel
    editableInputs.forEach(input => input.dataset.original = input.value);
    const originalAvatarSrc = document.getElementById('avatar-preview')?.src || '';

    // icon-click edit handler removed — inputs are editable by default

    // cancel button
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

    // ensure readonly removed before submit so server receives values
    if (editForm) {
        editForm.addEventListener('submit', function () {
            editableInputs.forEach(input => input.removeAttribute('readonly'));
        });
    }

    // fallback global submit helper (used by some templates)
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

// Delete handled by inline form in JSP; no client helper required.

document.addEventListener('DOMContentLoaded', function () {
    setupCustomerImagePreview();
    setupCustomerEditHandlers();
});