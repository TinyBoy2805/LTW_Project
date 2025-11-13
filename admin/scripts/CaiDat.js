// Nút tabs cho trang cài đặt
(function(){
  function initTabs(){
    const tabs = Array.from(document.querySelectorAll('.settings-tabs .tab-btn'));
    if(!tabs.length) return;
    tabs.forEach(btn => btn.addEventListener('click', function(){
      const tab = btn.getAttribute('data-tab');
      if(!tab) return;
      // Cập nhật trạng thái nút
      tabs.forEach(b => b.classList.toggle('active', b === btn));
      // Hiển thị/ẩn panel tương ứng
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
