// Tabs và modal chỉnh sửa cho trang Blog
document.addEventListener('DOMContentLoaded', function () {
  // Tabs
  const tabButtons = document.querySelectorAll('.tab-btn');
  const panels = document.querySelectorAll('.tab-panel');
  const contentPanel = document.querySelector('.content__panel');
  // Hiển thị panel theo tên
  function showPanel(name) {
    panels.forEach(p => {
      if (p.dataset.panel === name) {
        p.classList.add('active');
      } else {
        p.classList.remove('active');
      }
    });
    tabButtons.forEach(b => b.classList.toggle('active', b.dataset.tab === name));
    // Cập nhật class cho content panel
    if (contentPanel) {
      contentPanel.classList.toggle('creating', name === 'create');
    }
    // Ẩn/hiện thanh tìm kiếm/lọc phụ thuộc tab
    const searchFilter = document.querySelector('.search__filter');
    if (searchFilter) {
      // Ẩn thanh lọc khi đang ở tab 'create' (Tạo Blog), hiện ở tab 'blogs'
      searchFilter.style.display = (name === 'create') ? 'none' : '';
    }
  }
  tabButtons.forEach(btn => {
    btn.addEventListener('click', () => showPanel(btn.dataset.tab));
  });
  // Đảm bảo trạng thái ban đầu khớp với tab đang active (nếu có)
  const initialActive = document.querySelector('.tab-btn.active');
  if (initialActive) showPanel(initialActive.dataset.tab);

});