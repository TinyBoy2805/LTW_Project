//Sidebar toggle
(function(){
  //Khởi tạo toggle sidebar
  function initSidebarToggle(){
    const btn = document.querySelector('.sidebar-toggle');
    const sidebar = document.querySelector('.sidebar');
    if(!btn) { console.warn('UuDai.js: sidebar-toggle not found'); return; }

    //Cập nhật trạng thái hiển thị
    function setStates(collapsed){
      btn.setAttribute('aria-expanded', collapsed ? 'true' : 'false');
      if(sidebar) sidebar.setAttribute('aria-hidden', collapsed ? 'true' : 'false');
    }

    //Khôi phục trạng thái
    try{
      const stored = localStorage.getItem('ud_sidebar_collapsed');
      if(stored === '1'){
        document.body.classList.add('sidebar-collapsed');
        setStates(true);
      } else {
        setStates(false);
      }
    }catch(e){ setStates(false); }

    //Hàm toggle công khai
    window.toggleSidebar = function(){
      const collapsed = document.body.classList.toggle('sidebar-collapsed');
      setStates(collapsed);
      try{ localStorage.setItem('ud_sidebar_collapsed', collapsed ? '1' : '0'); }catch(e){}
      return collapsed;
    };

    //Sự kiện click
    btn.addEventListener('click', function(){ window.toggleSidebar(); });
    btn.addEventListener('keydown', function(e){ if(e.key === 'Enter' || e.key === ' ') { e.preventDefault(); btn.click(); } });
  }

  function initAll(){ initSidebarToggle(); }
  if(document.readyState === 'loading') document.addEventListener('DOMContentLoaded', initAll);
  else initAll();
})();

//Lọc email quan trọng
(function(){
  function initImportantFilter(){
    //Lấy các phần tử cần thiết, không có thì bỏ qua
    const btnImportant = document.querySelector('.tabs [data-filter="important"]');
    const btnAll = document.querySelector('.tabs [data-filter="all"]');
    const mailList = document.querySelector('.mail-list');
    if(!mailList || !btnImportant) return;
    //Ẩn các thư không có class "selected", hiển thị các thư có class "selected"
    function showOnlySelected(){
      mailList.querySelectorAll('.mail-row').forEach(function(row){
        if(!row.classList.contains('selected')) row.classList.add('hidden');
        else row.classList.remove('hidden');
      });
    }
    // Xóa class hidden để hiển thị tất cả thư quan trọng
    function showAll(){
      mailList.querySelectorAll('.mail-row').forEach(function(row){ row.classList.remove('hidden'); });
    }
    // Khi nhấn nút Important
    // Cập nhật trạng thái active cho tabs, gọi showOnlySelected để ẩn các thư không quan trọng
      btnImportant.addEventListener('click', function(){
      if(btnAll){ btnAll.classList.remove('active'); btnAll.setAttribute('aria-selected','false'); }
      btnImportant.classList.add('active'); btnImportant.setAttribute('aria-selected','true');
      showOnlySelected();
    });
    // Khi nhấn nút All
    // Cập nhật trạng thái active cho tabs, gọi showAll để hiển thị tất cả thư
      if(btnAll) btnAll.addEventListener('click', function(){
      btnAll.classList.add('active'); btnAll.setAttribute('aria-selected','true');
      btnImportant.classList.remove('active'); btnImportant.setAttribute('aria-selected','false');
      showAll();
    });
  }
  //Nếu trang đã tải xong thì khởi tạo ngay, nếu chưa thì đợi sự kiện DOMContentLoaded
  if(document.readyState === 'loading') document.addEventListener('DOMContentLoaded', initImportantFilter);
  else initImportantFilter();
})();


//Xem email chi tiết/phản hồi 
(function(){
  document.addEventListener('DOMContentLoaded', function(){
       //Lấy các phần tử cần thiết, không có thì bỏ qua
    const mailList = document.querySelector('.mail-list');
    const detail = document.querySelector('.mail-detail');
    if(!mailList || !detail) return;
       //Mỗi khi người dùng click vào bên trong .mail-list, hàm này sẽ chạy.
    mailList.addEventListener('click', function(e){
      //Nếu người dùng click vào checkbox hoặc biểu tượng sao, bỏ qua.
      if(e.target.closest('.check-wrap') || e.target.tagName === 'INPUT' || e.target.closest('.star')) return;
      //Xác định hàng email được click
      const row = e.target.closest('.mail-row'); if(!row) return;
      //Lấy thông tin hàng email và hiển thị trong panel chi tiết
      detail.querySelector('.detail-subject').textContent = row.querySelector('.mail-subject strong')?.textContent || '';
      detail.querySelector('.detail-sender').textContent = row.querySelector('.mail-sender')?.textContent || '';
      detail.querySelector('.detail-date').textContent = row.querySelector('.mail-date')?.textContent || '';
      detail.querySelector('.detail-message').textContent = row.querySelector('.mail-subject .preview')?.textContent || '';
      detail.classList.add('show'); detail.setAttribute('aria-hidden','false');
    });
  });
})();

// Đóng panel chi tiết email
(function(){
  document.addEventListener('DOMContentLoaded', function(){
    const detail = document.querySelector('.mail-detail');
    if(!detail) return;

    function closeDetail(e){
      if (e && typeof e.preventDefault === 'function') e.preventDefault();
      detail.classList.remove('show');
      detail.setAttribute('aria-hidden','true');
    }
    const closeBtn = detail.querySelector('.detail-close');
    if (closeBtn) closeBtn.addEventListener('click', closeDetail);
    // Đóng bằng cách nhấp vào biểu tượng đóng
    document.addEventListener('click', function(e){
      if (e.target && e.target.closest && e.target.closest('.detail-close')) {
        closeDetail(e);
      }
    });
    // Đóng bằng phím Escape
    document.addEventListener('keydown', function(e){ if (e.key === 'Escape') closeDetail(e); });
  });
})();

