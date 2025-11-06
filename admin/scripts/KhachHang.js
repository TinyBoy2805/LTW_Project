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

  if(document.readyState === 'loading') document.addEventListener('DOMContentLoaded', initSidebarToggle);
  else initSidebarToggle();
})();
