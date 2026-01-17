// Chỉnh sửa thông tin blog
document.querySelectorAll('.blog-field-input').forEach((input) => {
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
const editableBlogInputs = document.querySelectorAll('.blog-field-input');
editableBlogInputs.forEach(input => {
  input.dataset.original = input.value;
});

// Xử lý nút Hủy
document.querySelector('.blog-cancel-btn')?.addEventListener('click', function() {
  editableBlogInputs.forEach(input => {
    input.value = input.dataset.original;
    input.setAttribute('readonly', true);
    input.classList.remove('editing');
  });
});

// Xử lý nút Cập nhật
document.querySelector('.blog-update-btn')?.addEventListener('click', function() {
  editableBlogInputs.forEach(input => {
    input.setAttribute('readonly', true);
    input.classList.remove('editing');
    input.dataset.original = input.value;
  });
});

// Xử lý xóa blog
function handleDeleteBlog(id, title) {
  if (confirm(`Bạn có chắc chắn muốn xóa bài viết "${title}"?`)) {
    document.getElementById('delete-blog-id').value = id;
    document.getElementById('hidden-delete-blog-form').submit();
  }
}

// Tìm kiếm blog chỉ theo tiêu đề
const blogSearchInput = document.getElementById('blog__search__input');
if (blogSearchInput) {
  blogSearchInput.addEventListener('input', function() {
    const keyword = blogSearchInput.value.trim().toLowerCase();
    document.querySelectorAll('.blog-card').forEach(card => {
      const title = (card.querySelector('.card-title')?.textContent || '').toLowerCase();
      card.style.display = title.includes(keyword) ? '' : 'none';
    });
  });
}