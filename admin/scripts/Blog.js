// Tabs và modal chỉnh sửa cho trang Blog
document.addEventListener('DOMContentLoaded', function () {
  // Tabs
  const tabButtons = document.querySelectorAll('.tab-btn');
  const panels = document.querySelectorAll('.tab-panel');
  const contentPanel = document.querySelector('.content__panel');


  // Also force layout widths to ensure the create form uses more horizontal space.
  // This helps when other styles (or caching) make the panel too narrow.
  (function forceLayout() {
    const createContent = document.getElementById('blog-content');
    const contentPanelEl = document.querySelector('.content__panel');
    const contentMain = document.querySelector('.content');
    const container = document.querySelector('.container');
    const leftPanel = document.querySelector('.left-panel');

    if (createContent) {
      createContent.style.width = '100%';
      createContent.style.height = '80px';
      createContent.style.resize = 'none';
      createContent.style.overflow = 'auto';
    }

    if (contentPanelEl) {
      contentPanelEl.style.width = 'auto';
      contentPanelEl.style.maxWidth = '1200px';
      contentPanelEl.style.margin = '0 24px';
    }
    if (contentMain) contentMain.style.width = '100%';
    if (container) container.style.width = '100%';
    if (leftPanel) {
      leftPanel.style.flex = '3';
      leftPanel.style.width = 'auto';
    }
    // also ensure the form-wrap is centered and sized
    const formWrap = document.querySelector('.form-wrap');
    const rightPanel = document.querySelector('.right-panel');
    if (formWrap) {
      formWrap.style.maxWidth = '1100px';
      formWrap.style.margin = '0 auto';
      formWrap.style.width = '100%';
    }
    if (leftPanel) {
      leftPanel.style.flex = '0 0 660px';
      leftPanel.style.width = '660px';
    }
    if (rightPanel) {
      rightPanel.style.flex = '0 0 340px';
      rightPanel.style.width = '340px';
    }
  })();

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
  }
  tabButtons.forEach(btn => {
    btn.addEventListener('click', () => showPanel(btn.dataset.tab));
  });
  // Khi ấn vào thẻ blog -> mở modal chỉnh sửa
  const blogDetail = document.querySelector('.blog-detail');
  let activeCard = null;

  function formatDateForInput(dateStr) {
    // cố gắng phân tích các chuỗi ngày như 12/11/2025 hoặc yyyy-mm-dd; trả về yyyy-mm-dd cho input
    if (!dateStr) return '';
    // nếu chứa '/', giả sử dd/mm/yyyy
    if (dateStr.indexOf('/') > -1) {
      const parts = dateStr.split('/').map(s=>s.trim());
      if (parts.length === 3) {
        const [d,m,y] = parts;
        return `${y.padStart(4,'0')}-${m.padStart(2,'0')}-${d.padStart(2,'0')}`;
      }
    }
    // fallback: thử Date
    const d = new Date(dateStr);
    if (!isNaN(d)) {
      return d.toISOString().slice(0,10);
    }
    return '';
  }

  function openBlogEditor(card) {
    activeCard = card;
    const title = card.querySelector('.card-title')?.textContent || '';
    const badge = card.querySelector('.card-badge')?.textContent || '';
    const meta = card.querySelector('.card-meta')?.textContent || '';
    const excerpt = card.querySelector('.card-excerpt')?.textContent || '';

    // dữ liệu meta dự kiến như "Bởi: Author — dd/mm/yyyy"
    let author = '';
    let date = '';
    if (meta) {
      const parts = meta.split('—');
      if (parts.length >= 2) {
        author = parts[0].replace('Bởi:','').trim();
        date = parts[1].trim();
      } else {
        author = meta.replace('Bởi:','').trim();
      }
    }

    // điền dữ liệu vào modal
    if (!blogDetail) return;
    blogDetail.querySelector('.detail-subject').textContent = title || 'Tiêu đề bài viết';
    blogDetail.querySelector('.detail-sender').textContent = author || '';
    blogDetail.querySelector('.detail-date').textContent = date || '';
    blogDetail.querySelector('.edit-title').value = title;
    blogDetail.querySelector('.edit-author').value = author;
    // đặt select category theo giá trị (so khớp options)
    const sel = blogDetail.querySelector('.edit-category');
    for (const opt of sel.options) { if (opt.text === badge) { opt.selected = true; } }
  blogDetail.querySelector('.edit-date').value = formatDateForInput(date);
  // Normalize excerpt: remove stray newlines and collapse multiple spaces so the
  // textarea doesn't display unexpected hard line breaks coming from the
  // source HTML or stored content.
  const normalized = (excerpt || '').replace(/\r?\n+/g, ' ').replace(/\s+/g, ' ').trim();
  blogDetail.querySelector('.edit-content').value = normalized;

    blogDetail.classList.add('show');
    blogDetail.setAttribute('aria-hidden','false');
  }

  function closeBlogEditor() {
    if (!blogDetail) return;
    blogDetail.classList.remove('show');
    blogDetail.setAttribute('aria-hidden','true');
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