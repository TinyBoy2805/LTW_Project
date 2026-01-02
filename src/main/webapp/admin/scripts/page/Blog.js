// Tabs và điều hướng tới trang quản lý bài viết
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

  // Xử lý click vào blog card để chuyển tới trang quản lý
  const blogCards = document.querySelectorAll('.blog-card.blog-clickable');
  blogCards.forEach(card => {
    card.addEventListener('click', function() {
      // Lấy dữ liệu từ card
      const title = this.querySelector('.card-title')?.textContent || '';
      const content = this.querySelector('.card-excerpt')?.textContent || '';
      const date = this.querySelector('.card-meta')?.textContent?.replace('Ngày: ', '') || '';
      const link = this.querySelector('.card-link')?.textContent || '';
      const image = this.querySelector('.card__figure img')?.src || '';

      // Tạo URL query parameters
      const params = new URLSearchParams({
        title: title,
        content: content,
        date: date,
        link: link,
        image: image
      });

      // Chuyển hướng tới trang QuanLyBlog
      window.location.href = './QuanLyBlog.jsp?' + params.toString();
    });

    // Thêm cursor pointer cho phép tương tác
    card.style.cursor = 'pointer';
  });

});