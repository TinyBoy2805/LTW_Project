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
<<<<<<< HEAD
    // Ẩn/hiện thanh tìm kiếm/lọc phụ thuộc tab
    const searchFilter = document.querySelector('.search__filter');
    if (searchFilter) {
      // Ẩn thanh lọc khi đang ở tab 'create' (Tạo Blog), hiện ở tab 'blogs'
      searchFilter.style.display = (name === 'create') ? 'none' : '';
    }
=======
>>>>>>> fde10e231e2f566d6bd809a5f494693c22c2f1d6
  }
  tabButtons.forEach(btn => {
    btn.addEventListener('click', () => showPanel(btn.dataset.tab));
  });
<<<<<<< HEAD
  // đảm bảo trạng thái ban đầu khớp với tab đang active (nếu có)
  const initialActive = document.querySelector('.tab-btn.active');
  if (initialActive) showPanel(initialActive.dataset.tab);
=======
>>>>>>> fde10e231e2f566d6bd809a5f494693c22c2f1d6
  // Khi ấn vào thẻ blog -> mở modal chỉnh sửa
  const blogDetail = document.querySelector('.blog-detail');
  let activeCard = null;

  function formatDateForInput(dateStr) {
    // cố gắng phân tích các chuỗi ngày như 12/11/2025 hoặc yyyy-mm-dd; trả về yyyy-mm-dd cho input
    if (!dateStr) return '';
    // nếu chứa '/', giả sử dd/mm/yyyy
    if (dateStr.indexOf('/') > -1) {
      const parts = dateStr.split('/').map(s => s.trim());
      if (parts.length === 3) {
        const [d, m, y] = parts;
        return `${y.padStart(4, '0')}-${m.padStart(2, '0')}-${d.padStart(2, '0')}`;
      }
    }
    // fallback: thử Date
    const d = new Date(dateStr);
    if (!isNaN(d)) {
      return d.toISOString().slice(0, 10);
    }
    return '';
  }

  function openBlogEditor(card) {
    activeCard = card;
    const title = card.querySelector('.card-title')?.textContent || '';
<<<<<<< HEAD
    const meta = card.querySelector('.card-meta')?.textContent || '';
    const rawExcerpt = card.querySelector('.card-excerpt')?.textContent || '';
    const excerpt = rawExcerpt.replace(/\s+/g, ' ').trim();
    const linkEl = card.querySelector('.card-link');
    const link = linkEl ? (linkEl.getAttribute('href') || linkEl.textContent.trim()) : '';
    let date = '';
    if (meta) {
      const m = meta.match(/(\d{1,2}\/\d{1,2}\/\d{4})|(\d{4}-\d{2}-\d{2})/);
      if (m) date = m[0];
=======
    const badge = card.querySelector('.card-badge')?.textContent || '';
    const meta = card.querySelector('.card-meta')?.textContent || '';
    const excerpt = card.querySelector('.card-excerpt')?.textContent || '';

    // dữ liệu meta dự kiến như "Bởi: Author — dd/mm/yyyy"
    let author = '';
    let date = '';
    if (meta) {
      const parts = meta.split('—');
      if (parts.length >= 2) {
        author = parts[0].replace('Bởi:', '').trim();
        date = parts[1].trim();
      } else {
        author = meta.replace('Bởi:', '').trim();
      }
>>>>>>> fde10e231e2f566d6bd809a5f494693c22c2f1d6
    }

    // điền dữ liệu vào modal
    if (!blogDetail) return;
<<<<<<< HEAD
    blogDetail.querySelector('.detail-subject').textContent = (title || 'Tiêu đề bài viết').trim();
    // clear sender (author) since author is not used in new workflow
    blogDetail.querySelector('.detail-sender').textContent = '';
    blogDetail.querySelector('.detail-date').textContent = date || '';
    blogDetail.querySelector('.edit-title').value = title;
    const editLink = blogDetail.querySelector('.edit-link');
    if (editLink) editLink.value = link || '';
    blogDetail.querySelector('.edit-date').value = formatDateForInput(date);
    const editContent = blogDetail.querySelector('.edit-content');
    if (editContent) editContent.value = excerpt;

    // If this card is a draft, change the save button to 'Đăng' and mark as publish mode
    const saveBtn = blogDetail.querySelector('.edit-save');
    const badge = card.querySelector('.card-badge');
    const isDraft = badge && (badge.classList.contains('draft') || /nháp/i.test(badge.textContent || ''));
    if (saveBtn) {
      saveBtn.textContent = isDraft ? 'Đăng' : 'Cập nhật';
      saveBtn.dataset.publish = isDraft ? '1' : '0';
    }
=======
    blogDetail.querySelector('.detail-subject').textContent = title || 'Tiêu đề bài viết';
    blogDetail.querySelector('.detail-sender').textContent = author || '';
    blogDetail.querySelector('.detail-date').textContent = date || '';
    blogDetail.querySelector('.edit-title').value = title;
    blogDetail.querySelector('.edit-author').value = author;
    // đặt select category theo giá trị (so khớp options)
    const sel = blogDetail.querySelector('.edit-category');
    for (const opt of sel.options) { if (opt.text === badge) { opt.selected = true; } }
    blogDetail.querySelector('.edit-date').value = formatDateForInput(date);
    // chuẩn hóa nội dung excerpt để loại bỏ nhiều dòng và khoảng trắng thừa
    const normalized = (excerpt || '').replace(/\r?\n+/g, ' ').replace(/\s+/g, ' ').trim();
    blogDetail.querySelector('.edit-content').value = normalized;
>>>>>>> fde10e231e2f566d6bd809a5f494693c22c2f1d6

    blogDetail.classList.add('show');
    blogDetail.setAttribute('aria-hidden', 'false');
  }

  function closeBlogEditor() {
    if (!blogDetail) return;
    blogDetail.classList.remove('show');
    blogDetail.setAttribute('aria-hidden', 'true');
    activeCard = null;
  }

  // gán sự kiện click cho các thẻ blog
  const cards = document.querySelectorAll('.blog-card');
  cards.forEach(card => {
    card.addEventListener('click', () => openBlogEditor(card));
  });

  //Nút đóng modal chỉnh sửa blog
  if (blogDetail) {
    // giữ cho nút đóng hoạt động, đồng thời thêm trình xử lý ủy quyền và hỗ trợ phím Escape
    const closeBtn = blogDetail.querySelector('.detail-close');
    if (closeBtn) closeBtn.addEventListener('click', closeBlogEditor);

    // Đóng bằng cách nhấp vào biểu tượng đóng
    document.addEventListener('click', function (e) {
      if (e.target && e.target.closest && e.target.closest('.detail-close')) {
        closeBlogEditor();
      }
    });

    // Đóng bằng phím Escape
    document.addEventListener('keydown', function (e) {
      if (e.key === 'Escape') closeBlogEditor();
    });
  }
});