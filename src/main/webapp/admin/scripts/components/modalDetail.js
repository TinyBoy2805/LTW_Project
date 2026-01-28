(function () {
  function toggle(modal, show) {
    if (!modal) return;
    modal.classList.toggle('show', show);
    modal.style.display = show ? 'block' : '';
    document.body.style.overflow = show ? 'hidden' : '';
  }

  document.addEventListener('click', function (e) {
    const trigger = e.target.closest('[data-toggle="detail"]');
    if (trigger) {
      const modal = document.querySelector(trigger.dataset.target || '.mail-detail');
      // Lấy thông tin từ card
      const subject = trigger.querySelector('.mail-subject strong')?.textContent || '';
      const sender = trigger.querySelector('.mail-sender')?.textContent || '';
      const date = trigger.querySelector('.mail-date')?.textContent || '';
      const message = trigger.querySelector('.preview')?.textContent || '';
      // Gán vào modal
      if (modal) {
        const modalSubject = modal.querySelector('.detail-subject');
        const modalSender = modal.querySelector('.detail-sender');
        const modalDate = modal.querySelector('.detail-date');
        const modalMessage = modal.querySelector('.detail-message');
        if (modalSubject) modalSubject.textContent = subject;
        if (modalSender) modalSender.textContent = sender;
        if (modalDate) modalDate.textContent = date;
        if (modalMessage) modalMessage.textContent = message;
      }
      toggle(modal, true);
      return;
    }

    const closeBtn = e.target.closest('[data-dismiss], .detail-close');
    if (closeBtn) {
      toggle(closeBtn.closest('.mail-detail'), false);
      return;
    }

    const openModal = document.querySelector('.mail-detail.show');
    if (openModal && e.target === openModal) toggle(openModal, false);
  });

  document.addEventListener('keydown', function (e) {
    if (e.key === 'Escape') toggle(document.querySelector('.mail-detail.show'), false);
  });
})();

