<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>MiChiShop</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/styles/components/sidebar.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/styles/components/header.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/styles/pages/Email.css" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css">
  <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
  <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
</head>

<body>
  <%-- Hiển thị thông báo gửi email thành công/thất bại --%>
  <div id="notifyModal" class="modal notify-modal" style="display:none;">
    <div class="modal-content notify-modal-content">
      <div id="notifyMessage" class="notify-message"></div>
      <button id="notifyOkBtn" class="notify-ok-btn">OK</button>
    </div>
  </div>
  <script>
    window.contextPath = '${pageContext.request.contextPath}';
    window.notifyMsg = "${requestScope.message != null ? requestScope.message : ''}";
    window.notifyErr = "${requestScope.error != null ? requestScope.error : ''}";
  </script>
  <div class="Email main">
    <aside class="sidebar">
      <% request.setAttribute("activePage", "email"); %>
      <%@ include file="../components/sidebar.jsp" %>
    </aside>
    <div class="container">
      <%@ include file="../components/header.jsp" %>

      <!-- Main content -->
      <main class="content" aria-labelledby="email-title">
        <h3 class="content__title">Thông Báo</h3>
        <div class="content__panel">
          <div class="panel-header" style="justify-content: space-between;">
            <button type="button" class="all-notify-btn" id="allNotifyBtn">
              Tất cả thông báo
            </button>
          </div>

          <div class="mail-list" role="list" aria-label="Danh sách email">
            <c:forEach var="email" items="${emails}">
              <article class="mail-row${email.isRead ? ' read' : ' unread'}" data-toggle="detail" data-target=".mail-detail" data-email-id="${email.id}">
                <div class="mail-sender email-meta">${email.name}</div>
                <div class="mail-subject">
                  <span class="email-title">${email.topic}</span>
                  <span class="preview">${email.message}</span>
                </div>
                <div class="mail-date email-meta">${email.createdAt}</div>
              </article>
            </c:forEach>
          </div> 

      </div> 



      <!--Xem chi tiết email hoặc phản hồi-->
      <aside class="mail-detail" role="dialog" aria-hidden="true" aria-label="Chi tiết email">
        <header class="detail-header">
          <div class="detail-left">
            <h4 class="detail-subject"></h4>
            <div class="detail-meta"><span class="detail-sender sender-highlight"></span></div>
          </div>
          <div class="detail-right">
            <div class="detail-date"></div>
            <button class="detail-close" aria-label="Đóng chi tiết"><i class="fa-solid fa-xmark"></i></button>
          </div>
        </header>

        <div class="detail-body" tabindex="0">
          <p class="detail-message"></p>
        </div>

        <form class="detail-reply" method="post" action="${pageContext.request.contextPath}/admin/contact/reply">
          <input type="hidden" name="emailId" class="reply-email-id" value="" />
          <label class="label">Trả lời</label>
          <textarea class="input textarea reply-text" name="replyContent" rows="3" placeholder="Viết phản hồi..." required></textarea>
          <div class="detail-actions-row" style="display:flex; justify-content:flex-end; gap:10px; margin-top:8px;">
            <form method="post" action="${pageContext.request.contextPath}/admin/contact/reply" style="display:inline;">
              <input type="hidden" name="emailId" class="reply-email-id" value="" />
              <button type="submit" class="btn primary">Gửi</button>
            </form>
            <form class="delete-email-form" method="post" action="${pageContext.request.contextPath}/admin/contact/delete" style="display:inline;">
              <input type="hidden" name="id" class="delete-email-id" value="" />
              <button class="btn danger" type="submit" onclick="return confirm('Bạn có chắc muốn xóa email này?');">Xóa</button>
            </form>
          </div> 

      </aside>

      </main>
    </div>
  </div> 
  <script src="${pageContext.request.contextPath}/admin/scripts/components/extendSidebar.js"></script>
  <script src="${pageContext.request.contextPath}/admin/scripts/components/modalDetail.js"></script>
  <script src="${pageContext.request.contextPath}/admin/scripts/components/filter.js"></script>
  <script src="${pageContext.request.contextPath}/admin/scripts/page/Email.js"></script>
</body>

</html>