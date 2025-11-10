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
// Lọc và đánh dấu email quan trọng 
(function(){
  const ready = fn => document.readyState === 'loading' ? document.addEventListener('DOMContentLoaded', fn) : fn();
  ready(() => {
    const mailList = document.querySelector('.mail-list');
    const tabs = document.querySelector('.tabs');
    if(!mailList || !tabs) return;

    const applyFilter = showImportant => {
      mailList.querySelectorAll('.mail-row').forEach(row => {
        const important = !!row.querySelector('.star[aria-pressed="true"]');
        row.style.display = (!showImportant || important) ? '' : 'none';
      });
    };

    // Nhúng tab click + keyboard được ủy quyền
    tabs.addEventListener('click', e => {
      const btn = e.target.closest('button[data-filter]'); if(!btn) return;
      tabs.querySelectorAll('button').forEach(b => b.classList.toggle('active', b===btn));
      applyFilter(btn.dataset.filter === 'important');
    });
    tabs.addEventListener('keydown', e => { if((e.key==='Enter'||e.key===' ') && e.target.closest('button')) { e.preventDefault(); e.target.click(); } });

    // Toggle dấu sao (delegation). Nếu đang lọc 'Quan trọng', cập nhật ngay bằng cách tái kích hoạt tab đang mở.
    mailList.addEventListener('click', e => {
      const star = e.target.closest('.star'); if(!star) return;
      const pressed = star.getAttribute('aria-pressed') === 'true';
      star.setAttribute('aria-pressed', String(!pressed));
      const i = star.querySelector('i'); if(i) { i.classList.toggle('fa-solid'); i.classList.toggle('fa-regular'); }
      const active = tabs.querySelector('button.active'); if(active && active.dataset.filter === 'important') active.click();
    });

    // Khởi tạo: áp filter theo tab đang active (nếu có)
    const active = tabs.querySelector('button.active'); if(active) applyFilter(active.dataset.filter === 'important');
  });
})();

