(function () {
  var OPEN_ATTR = 'data-toggle';
  var TARGET_ATTR = 'data-target';
  var CLOSE_ATTR = 'data-dismiss';
  var TOGGLE_VALUE = 'detail';
  var SHOW_CLASS = 'show';
  var MODAL_SELECTOR = '.detail-modal, .mail-detail, .blog-detail, .offer-detail, .customer-detail';

  function openModal(modal) {
    if (!modal) return;
    console.log('[modalDetail] openModal called for:', modal);
    modal.classList.add(SHOW_CLASS);
    modal.setAttribute('aria-hidden', 'false');
    // Mở modal và khóa cuộn trang
    try { modal.style.display = modal.style.display || 'block'; } catch (e) {}
    try { document.body.style.overflow = 'hidden'; } catch (e) {}
    var body = modal.querySelector('.detail-body');
    if (body) body.focus();
  }

  function closeModal(modal) {
    if (!modal) return;
    console.log('[modalDetail] closeModal called for:', modal);
    modal.classList.remove(SHOW_CLASS);
    modal.setAttribute('aria-hidden', 'true');
    try { modal.style.display = ''; } catch (e) {}
    try { document.body.style.overflow = ''; } catch (e) {}
  }

  function findModal(target) {
    if (!target) return null;
    if (typeof target === 'string') return document.querySelector(target);
    return target;
  }

  function handleDocumentClick(e) {
    // Mở trigger: data-toggle="detail"
    var trigger = e.target.closest('[' + OPEN_ATTR + '="' + TOGGLE_VALUE + '"]');
    if (trigger) {
      console.log('[modalDetail] trigger clicked:', trigger);
      var selector = trigger.getAttribute(TARGET_ATTR) || trigger.dataset.target;
      var modal = findModal(selector) || document.querySelector('.mail-detail') || document.querySelector('.blog-detail') || document.querySelector('.offer-detail');
      console.log('[modalDetail] target selector:', selector, 'resolved modal:', modal);
      if (modal) openModal(modal);
      return;
    }

    // Đóng trigger: data-dismiss hoặc .detail-close
    var closeBtn = e.target.closest('[' + CLOSE_ATTR + ']') || e.target.closest('.detail-close') || e.target.closest('.close-btn');
    if (closeBtn) {
      var modalEl = closeBtn.closest('.detail-modal') || closeBtn.closest('.mail-detail') || closeBtn.closest('.blog-detail') || closeBtn.closest('.offer-detail') || closeBtn.closest('.customer-detail');
      if (modalEl) closeModal(modalEl);
      return;
    }

    // Đóng khi click ra ngoài nội dung modal
    var openModalElem = document.querySelector(MODAL_SELECTOR + '.' + SHOW_CLASS);
    if (openModalElem && e.target === openModalElem) {
      closeModal(openModalElem);
    }
  }

  function handleKeydown(e) {
    if (e.key === 'Escape' || e.key === 'Esc') {
      var openModalElem = document.querySelector(MODAL_SELECTOR + '.' + SHOW_CLASS);
      if (openModalElem) closeModal(openModalElem);
    }
  }

  function init() {
    document.addEventListener('click', handleDocumentClick);
    document.addEventListener('keydown', handleKeydown);
  }

  if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', init);
  else init();

  window.DetailModal = {
    open: function (selectorOrEl) { openModal(findModal(selectorOrEl)); },
    close: function (selectorOrEl) { closeModal(findModal(selectorOrEl)); }
  };
})();
