//Sidebar toggle
(function(){
  // Khởi tạo toggle sidebar
  function initSidebarToggle(){
    const btn = document.querySelector('.sidebar-toggle');
    const sidebar = document.querySelector('.sidebar');
    if(!btn) { console.warn('UuDai.js: sidebar-toggle not found'); return; }

    // Cập nhật trạng thái hiển thị
    function setStates(collapsed){
      btn.setAttribute('aria-expanded', collapsed ? 'true' : 'false');
      if(sidebar) sidebar.setAttribute('aria-hidden', collapsed ? 'true' : 'false');
    }

    // Khôi phục trạng thái
    try{
      const stored = localStorage.getItem('ud_sidebar_collapsed');
      if(stored === '1'){
        document.body.classList.add('sidebar-collapsed');
        setStates(true);
      } else {
        setStates(false);
      }
    }catch(e){ setStates(false); }

    // Hàm toggle công khai
    window.toggleSidebar = function(){
      const collapsed = document.body.classList.toggle('sidebar-collapsed');
      setStates(collapsed);
      try{ localStorage.setItem('ud_sidebar_collapsed', collapsed ? '1' : '0'); }catch(e){}
      return collapsed;
    };

    // Sự kiện click và keyboard
    btn.addEventListener('click', function(){ window.toggleSidebar(); });
    btn.addEventListener('keydown', function(e){ if(e.key === 'Enter' || e.key === ' ') { e.preventDefault(); btn.click(); } });
  }

  function initAll(){ initSidebarToggle(); }
  if(document.readyState === 'loading') document.addEventListener('DOMContentLoaded', initAll);
  else initAll();
})();

// Tabs behavior for settings page
(function(){
  function initTabs(){
    const tabs = Array.from(document.querySelectorAll('.settings-tabs .tab-btn'));
    if(!tabs.length) return;
    tabs.forEach(btn => btn.addEventListener('click', function(){
      const tab = btn.getAttribute('data-tab');
      if(!tab) return;
      // set active button
      tabs.forEach(b => b.classList.toggle('active', b === btn));
      // show/hide panels
      const panels = Array.from(document.querySelectorAll('.tab-panel'));
      panels.forEach(p => {
        if(p.dataset.panel === tab){ p.classList.add('active'); p.style.display = ''; }
        else { p.classList.remove('active'); p.style.display = 'none'; }
      });
    }));
  }
  if(document.readyState === 'loading') document.addEventListener('DOMContentLoaded', initTabs);
  else initTabs();
})();
