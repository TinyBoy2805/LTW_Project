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

// Script preview ảnh đại diện
function setupBlogImagePreview() {
  var input = document.querySelector('input[name="thumbnail"]');
  var thumbs = document.querySelector('.thumbs');
  if (input && thumbs) {
    input.addEventListener('change', function(e) {
      if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function(ev) {
          var oldImg = thumbs.querySelector('img');
          if (oldImg) oldImg.remove();
          var img = document.createElement('img');
          img.src = ev.target.result;
          img.style.maxWidth = '120px';
          img.style.maxHeight = '80px';
          img.style.marginTop = '8px';
          thumbs.appendChild(img);
        };
        reader.readAsDataURL(input.files[0]);
      }
    });
  }
}

// Script chuyển tab cho blog
function setupBlogTabs() {
  var tabBtns = document.querySelectorAll('.tab-btn');
  var tabPanels = document.querySelectorAll('.tab-panel');
  var contentPanel = document.querySelector('.content__panel');
  var searchFilter = document.querySelector('.search__filter');
  tabBtns.forEach(function(btn) {
    btn.addEventListener('click', function() {
      tabBtns.forEach(function(b) { b.classList.remove('active'); });
      tabPanels.forEach(function(p) { p.classList.remove('active'); });
      btn.classList.add('active');
      var panel = document.querySelector('.tab-panel[data-panel="' + btn.dataset.tab + '"]');
      if (panel) panel.classList.add('active');
      if (btn.dataset.tab === 'create') {
        contentPanel.classList.add('creating');
        if (searchFilter) searchFilter.style.display = 'none';
      } else {
        contentPanel.classList.remove('creating');
        if (searchFilter) searchFilter.style.display = '';
      }
    });
  });
}

document.addEventListener('DOMContentLoaded', function() {
  setupBlogImagePreview();
  setupBlogTabs();
});