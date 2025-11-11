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
    // Cho phép dùng phím Enter hoặc Space
    btn.addEventListener('keydown', function(e){ 
      if(e.key === 'Enter' || e.key === ' ') { 
        e.preventDefault(); 
        btn.click(); 
      } 
    });
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

    //Xóa class hidden để hiển thị tất cả thẻ khách hàng
    function showAll(){
      cards.forEach(c => c.classList.remove('hidden'));
    }

    //Xử lý sự kiện click trên các tab
    tabs.forEach(btn => {
      btn.addEventListener('click', function(){
        tabs.forEach(b => { 
          b.classList.toggle('active', b === btn); 
          b.setAttribute('aria-selected', b === btn ? 'true' : 'false'); 
        });
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


// Xem chi tiết khách hàng
(function(){
  // Lấy text node sau icon trong thẻ p
  function getTextAfterIcon(p){
    if(!p) return '';
    for(const n of p.childNodes){
      if(n.nodeType === Node.TEXT_NODE && n.textContent.trim()) 
        return n.textContent.trim();
    }
    return p.textContent.trim();
  }

  // Hiển thị chi tiết khách hàng trong modal
  function openDetail(card){
    const modal = document.querySelector('.customer-detail');
    if(!modal) return;

    // Lấy thông tin từ thẻ card
    const name = card.querySelector('h4')?.textContent?.trim() || '';
    const ps = card.querySelectorAll('.info p');
  const email = getTextAfterIcon(ps[0]) || '';
  const phone = getTextAfterIcon(ps[1]) || '';
  // Read address from hidden input inside the card (keeps it in DOM but not visible)
  const addrInput = card.querySelector('input.card-address');
  const address = addrInput ? (addrInput.value || '') : '';

    // Gán dữ liệu vào form trong modal
    modal.querySelector('.input.name').value = name;
    modal.querySelector('.input.email').value = email;
    modal.querySelector('.input.phone').value = phone;
    modal.querySelector('.input.address').value = address;

    // Hiển thị modal
    modal.classList.add('show');
    modal.setAttribute('aria-hidden', 'false');
  }

  // Ẩn chi tiết khách hàng
  function closeDetail(){
    const modal = document.querySelector('.customer-detail');
    if(!modal) return;
    modal.classList.remove('show');
    modal.setAttribute('aria-hidden', 'true');
  }

  function init(){
    const customers = document.querySelector('.customers');
    const modal = document.querySelector('.customer-detail');
    const closeBtn = modal?.querySelector('.close-btn');
    if(!customers || !modal || !closeBtn) return;

    // Nhấn nút xem chi tiết
    customers.addEventListener('click', function(e){
      const btn = e.target.closest('.detail-btn');
      if(!btn) return;
      const card = btn.closest('.card');
      if(!card) return;
      openDetail(card);
    });

    // Nhấn nút "Đóng" trong modal
    closeBtn.addEventListener('click', function(){
      closeDetail();
    });
  }

  if(document.readyState === 'loading')
    document.addEventListener('DOMContentLoaded', init);
  else
    init();
})();