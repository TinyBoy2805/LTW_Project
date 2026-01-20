// Lưu giá trị ban đầu của tất cả input
const editableInputs = document.querySelectorAll('.field-input');
editableInputs.forEach(input => {
  input.dataset.original = input.value;
});

// Xử lý nút Hủy
document.querySelector('.cancel-btn').addEventListener('click', function() {
  editableInputs.forEach(input => {
    input.value = input.dataset.original;
    input.setAttribute('readonly', true);
    input.classList.remove('editing');
  });
});

// Xử lý toggle switch
document.querySelectorAll('.toggle-switch').forEach(toggleSwitch => {
  const toggleInput = toggleSwitch.querySelector('.toggle-input');
  const toggleSlider = toggleSwitch.querySelector('.toggle-slider');
  
  toggleSlider.addEventListener('click', () => {
    toggleInput.checked = !toggleInput.checked;
  });
});
// Xử lý xóa tài khoản khách hàng
function handleDelete(id, name) {
    if (confirm(`Bạn có chắc chắn muốn xóa tài khoản "${name}"?`)) {
        document.getElementById('delete-id').value = id;
        document.getElementById('hidden-delete-form').submit();
    }
}