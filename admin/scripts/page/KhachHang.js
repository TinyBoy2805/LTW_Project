(function(){
  // Chuyển đổi trạng thái nút tab khi chọn tab khác
  function initTabButtons(){
    const tabBtns = Array.from(document.querySelectorAll('.tab-btn'));
    if(!tabBtns.length) return;

    function updateActive(){
      tabBtns.forEach(b => {
        const targetId = b.getAttribute('data-target');
        const radio = document.getElementById(targetId);
        if(radio && radio.checked) b.classList.add('active');
        else b.classList.remove('active');
      });
    }

    tabBtns.forEach(btn => {
      btn.addEventListener('click', function(){
        const target = btn.getAttribute('data-target');
        const r = document.getElementById(target);
        if(r) r.checked = true;
        updateActive();
      });
    });

    // Cập nhật trạng thái ban đầu
    updateActive();
    // Giữ đồng bộ nếu các radio thay đổi
    const radios = Array.from(document.querySelectorAll('input[name="kh_tab"]'));
    radios.forEach(r => r.addEventListener('change', updateActive));
  }

  // Hiển thị chi tiết khách hàng trong modal 
  if(document.readyState === 'loading')
    document.addEventListener('DOMContentLoaded', function(){ initTabButtons(); });
  else{ initTabButtons(); }
})();