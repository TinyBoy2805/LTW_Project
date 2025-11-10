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

//Lọc khách hàng VIP
(function(){
  function initVipFilter(){
    //Lấy các phần tử cần thiết, không có thì bỏ qua
    const tabs = Array.from(document.querySelectorAll('.tabs button[data-filter]'));
    const customers = document.querySelector('.customers');
    if(!tabs.length || !customers) return;
    //Lấy tất cả thẻ khách hàng
    const cards = Array.from(customers.querySelectorAll('.card'));
    //Ẩn các thẻ không có class "vip", hiển thị các thẻ có class "vip"
    function showOnlyVip(){
      cards.forEach(c => c.classList.toggle('hidden', !c.classList.contains('vip')));
    }
    // Xóa class hidden để hiển thị tất cả thẻ khách hàng
    function showAll(){
      cards.forEach(c => c.classList.remove('hidden'));
    }
    //Xử lý sự kiện click trên các tab
    tabs.forEach(btn => {
      btn.addEventListener('click', function(){
        tabs.forEach(b => { b.classList.toggle('active', b === btn); b.setAttribute('aria-selected', b === btn ? 'true' : 'false'); });
        const filter = btn.getAttribute('data-filter') || 'all';
        if(filter === 'vip') showOnlyVip();
        else showAll();
      });
    });
    //Cập nhật trạng thái ban đầu từ tab active
    const active = tabs.find(t => t.classList.contains('active')) || tabs[0];
    if(active){
      const f = active.getAttribute('data-filter') || 'all';
      if(f === 'vip') showOnlyVip();
      else showAll();
    }
  }

  if(document.readyState === 'loading') document.addEventListener('DOMContentLoaded', initVipFilter);
  else initVipFilter();
})();
