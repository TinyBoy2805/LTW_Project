// Xử lý cập nhật và hủy trên trang quản lý blog chi tiết

document.addEventListener('DOMContentLoaded', function () {
  const btnUpdate = document.getElementById('btn-update');
  const btnCancel = document.getElementById('cancel-blog');
  if (btnUpdate) {
    btnUpdate.onclick = function(e) {
      e.preventDefault();
      document.querySelector('#update-form input[name=title]').value = document.getElementById('edit-title').value;
      document.querySelector('#update-form input[name=url]').value = document.getElementById('edit-link').value;
      document.querySelector('#update-form input[name=created_at]').value = document.getElementById('edit-date').value;
      document.querySelector('#update-form textarea[name=content]').value = document.getElementById('edit-content').value;
      document.querySelector('#update-form input[name=thumbnail]').value = document.getElementById('blog-image').src;
      document.getElementById('update-form').submit();
    };
  }
  if (btnCancel) {
    btnCancel.onclick = function() {
      window.location.reload();
    };
  }
});
