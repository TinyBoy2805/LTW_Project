document.addEventListener('DOMContentLoaded', function() {
  // Thông báo gửi email thành công/thất bại
  var msg = window.notifyMsg || '';
  var err = window.notifyErr || '';
  if (msg || err) {
    document.getElementById('notifyMessage').textContent = msg || err;
    document.getElementById('notifyModal').style.display = 'flex';
  }
  var okBtn = document.getElementById('notifyOkBtn');
  if (okBtn) okBtn.onclick = function() {
    document.getElementById('notifyModal').style.display = 'none';
  };

  // Đánh dấu đã đọc khi click
  var mailList = document.querySelector('.mail-list');
  if (mailList) {
    mailList.addEventListener('click', function(e) {
      var card = e.target.closest('.mail-row');
      if (card && card.classList.contains('unread')) {
        var emailId = card.getAttribute('data-email-id');
          fetch(window.location.origin + window.contextPath + '/admin/contact/read', {
          method: 'POST',
          headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
          body: 'id=' + emailId
        }).then(function(res) {
          if (res.ok) {
            card.classList.remove('unread');
            card.classList.add('read');
          }
        });
      }
    });
  }

  // Điền id vào form trả lời/xóa khi mở chi tiết
  document.querySelectorAll('.mail-row').forEach(function(row) {
    row.addEventListener('click', function() {
      var emailId = row.getAttribute('data-email-id') || '';
      document.querySelectorAll('.reply-email-id').forEach(function(input) {
        input.value = emailId;
      });
      document.querySelectorAll('.delete-email-id').forEach(function(input) {
        input.value = emailId;
      });
    });
  });

  // Ngăn checkbox trigger modal
  document.querySelectorAll('.check-wrap, .check-wrap input').forEach(el => {
    el.addEventListener('click', function(e) {
      e.stopPropagation();
    });
  });
});
