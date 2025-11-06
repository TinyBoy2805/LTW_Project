//Sidebar toggle 
(function(){
  function initSidebarToggle(){
    const btn = document.querySelector('.sidebar-toggle');
    const sidebar = document.querySelector('.sidebar');
    if(!btn) { console.warn('KhachHang.js: sidebar-toggle not found'); return; }

    function setStates(collapsed){
      btn.setAttribute('aria-expanded', collapsed ? 'true' : 'false');
      if(sidebar) sidebar.setAttribute('aria-hidden', collapsed ? 'true' : 'false');
    }

    //Khôi phục trạng thái
    try{
      const stored = localStorage.getItem('kh_sidebar_collapsed');
      if(stored === '1'){
        document.body.classList.add('sidebar-collapsed');
        setStates(true);
      } else {
        setStates(false);
      }
    }catch(e){ setStates(false); }

    //Thu gọn sidebar
    window.toggleSidebar = function(){
      const collapsed = document.body.classList.toggle('sidebar-collapsed');
      setStates(collapsed);
      try{ localStorage.setItem('kh_sidebar_collapsed', collapsed ? '1' : '0'); }catch(e){}
      return collapsed;
    };

    btn.addEventListener('click', function(){ window.toggleSidebar(); });
    btn.addEventListener('keydown', function(e){ if(e.key==='Enter' || e.key===' ') { e.preventDefault(); btn.click(); } });
  }

//Lọc khách hàng VIP
  function initTabs(){
    const tabs = Array.from(document.querySelectorAll('.tabs button[data-filter]'));
    const customers = document.querySelector('.customers');
    if(!tabs.length || !customers) return;

    function applyFilter(filter){
      if(filter === 'vip') customers.classList.add('vip-filter');
      else customers.classList.remove('vip-filter');
    }

    tabs.forEach(btn => {
      btn.addEventListener('click', function(){
        tabs.forEach(b => { b.classList.toggle('active', b === btn); b.setAttribute('aria-selected', b === btn ? 'true' : 'false'); });
        const filter = btn.getAttribute('data-filter') || 'all';
        applyFilter(filter);
      });
    //Truy cập bàn phím
      btn.addEventListener('keydown', function(e){ if(e.key === 'Enter' || e.key === ' ') { e.preventDefault(); btn.click(); } });
    });

    //Áp dụng bộ lọc ban đầu từ tab đang hoạt động
    const active = tabs.find(t => t.classList.contains('active')) || tabs[0];
    if(active) applyFilter(active.getAttribute('data-filter'));
  }

  function initAll(){ initSidebarToggle(); initTabs(); }

  if(document.readyState === 'loading') document.addEventListener('DOMContentLoaded', initAll);
  else initAll();
})();
