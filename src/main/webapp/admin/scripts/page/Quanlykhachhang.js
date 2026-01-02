// Chỉnh sửa thông tin khách hàng
document.querySelectorAll('.field-input').forEach((input) => {
  input.addEventListener('click', function() {
    if (input.hasAttribute('readonly')) {
      input.removeAttribute('readonly');
      input.removeAttribute('disabled');
      input.focus();
      input.classList.add('editing');
    }
  });
});

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

// Xử lý nút Cập nhật
document.querySelector('.update-info-btn').addEventListener('click', function() {
  editableInputs.forEach(input => {
    input.setAttribute('readonly', true);
    input.classList.remove('editing');
    input.dataset.original = input.value;
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
