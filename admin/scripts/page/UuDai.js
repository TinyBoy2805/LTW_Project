// Mã JavaScript cho trang Quản lý Ưu Đãi
document.addEventListener('DOMContentLoaded', function () {
  const offers = document.querySelectorAll('.card');
  let offerDetail = document.querySelector('.offer-detail');
  if (!offerDetail) {
    console.warn('No .offer-detail element found in DOM');
    return;
  }
// Định dạng ngày cho input type="date"
  function formatDateForInput(dateStr) {
    if (!dateStr) return '';
    if (dateStr.indexOf('/') > -1) {
      const parts = dateStr.split('/').map(s => s.trim());
      if (parts.length === 3) {
        const [d, m, y] = parts;
        return `${y.padStart(4, '0')}-${m.padStart(2, '0')}-${d.padStart(2, '0')}`;
      }
    }
    const d = new Date(dateStr);
    if (!isNaN(d)) return d.toISOString().slice(0, 10);
    return '';
  }
// Mở modal chỉnh sửa ưu đãi
  function openOfferEditor(card) {
    const title = card.querySelector('.info h4')?.textContent?.trim() || '';
    const desc = Array.from(card.querySelectorAll('.info > p')).find(p => !p.classList.contains('muted'))?.textContent?.trim() || '';
    const muted = card.querySelectorAll('.info > p.muted');
    const minOrder = muted[0]?.textContent?.replace(/[^0-9.,đ\s]/g, '').trim() || '';
    const expiryText = muted[1]?.textContent?.replace(/[^0-9\/\-]/g, '').trim() || '';
// Điền dữ liệu vào modal
    const subjectEl = offerDetail.querySelector('.detail-subject');
    if (subjectEl) subjectEl.textContent = title || 'Tiêu đề ưu đãi';
    const dateEl = offerDetail.querySelector('.detail-date');
    if (dateEl) dateEl.textContent = expiryText || '';
    offerDetail.querySelector('.edit-title').value = title;
    offerDetail.querySelector('.edit-desc').value = desc;
    offerDetail.querySelector('.edit-min').value = minOrder;
    offerDetail.querySelector('.edit-expiry').value = formatDateForInput(expiryText);
    // populate category/customer selects from hidden card data attributes (if present)
    const category = card.dataset?.category || '';
    const customer = card.dataset?.customer || '';
    const catEl = offerDetail.querySelector('.edit-category');
    if (catEl) catEl.value = category || (catEl.querySelector('option')?.value || '');
    const custEl = offerDetail.querySelector('.edit-customer');
    if (custEl) custEl.value = customer || (custEl.querySelector('option')?.value || '');
// Hiển thị modal
    offerDetail.classList.add('show');
    offerDetail.setAttribute('aria-hidden', 'false');
  }

  // Đóng modal chỉnh sửa ưu đãi
  function closeOfferEditor() {
    offerDetail.classList.remove('show');
    offerDetail.setAttribute('aria-hidden', 'true');
  }

  // Khi ấn vào thẻ ưu đãi -> mở modal chỉnh sửa
  offers.forEach(card => {
    card.addEventListener('click', function (e) {
      if (e.target && e.target.closest && e.target.closest('button')) return;
      openOfferEditor(card);
    });
  });

  // Đóng modal khi ấn nút đóng
  const closeBtn = offerDetail.querySelector('.detail-close');
  if (closeBtn) closeBtn.addEventListener('click', closeOfferEditor);
});
