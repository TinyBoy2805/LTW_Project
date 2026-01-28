// Định dạng số tiền realtime cho input VNĐ
function formatVND(value) {
  value = value.replace(/[^\d]/g, '');
  if (!value) return '';
  return value.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

document.addEventListener('DOMContentLoaded', function() {
  // Xử lý chip (nếu có)
  const chips = document.querySelectorAll('.chips .chip');
  chips.forEach(chip => {
    chip.addEventListener('click', function() {
      this.classList.toggle('active');
    });
  });

  // Định dạng VNĐ cho các input tiền tệ
  document.querySelectorAll('.currency-input').forEach(function(input) {
    // Hiển thị lại format khi load
    input.value = formatVND(input.value);
    input.addEventListener('input', function(e) {
      var cursor = input.selectionStart;
      var oldLength = input.value.length;
      var raw = input.value.replace(/[^\d]/g, '');
      input.value = formatVND(input.value);
      // Giữ vị trí con trỏ
      var newLength = input.value.length;
      input.setSelectionRange(cursor + (newLength - oldLength), cursor + (newLength - oldLength));
    });
    // Khi submit form, bỏ dấu phẩy để gửi số thuần
    input.form && input.form.addEventListener('submit', function() {
      input.value = input.value.replace(/[^\d]/g, '');
    });
  });
});
// Handle chip selection for category chips
document.addEventListener('DOMContentLoaded', function() {
  const chips = document.querySelectorAll('.chips .chip');
  
  chips.forEach(chip => {
    chip.addEventListener('click', function() {
      this.classList.toggle('active');
    });
  });
});
