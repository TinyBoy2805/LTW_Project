<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
          <div class="panel-header">
            <div class="compose-left">
              <button type="button" class="compose-btn" id="compose__btn">
                <i class="fa-solid fa-pen-to-square"></i>
                Soạn thư
              </button>
            </div>

            <div class="controls controls--right">
              <div class="search__filter">
                <input type="text" placeholder="Tìm kiếm email (Tiêu đề, Người gửi,...)">
                <div class="search__box">
                  <ion-icon name="search-outline" class="search__icon"></ion-icon>
                  <div class="line"></div>
                  <div class="filter__wrapper">
                    <button class="filter__button" id="email__filter__btn">
                      <ion-icon name="funnel-outline"></ion-icon>
                      Lọc
                    </button>
                    <div class="filter__frame hidden" id="email__filter__frame">
                      <h4 class="filter__frame__title">Bộ Lọc Thông Báo</h4>

                      <div class="filter__group">
                        <label for="filter__email__status">Trạng thái:</label>
                        <select id="filter__email__status">
                          <option value="all">Tất cả</option>
                          <option value="unread">Chưa đọc</option>
                          <option value="read">Đã đọc</option>
                          <option value="important">Quan trọng</option>
                        </select>
                      </div>

                      <div class="filter__actions">
                        <button class="clear__button">Xóa lọc</button>
                        <button class="apply__button">Áp dụng</button>
                      </div>
                    </div>
                  </div>
                </div>
              </div>

            </div>

          </div> <!-- .panel-header -->


          <div class="mail-list" role="list" aria-label="Danh sách email">
            <c:forEach var="email" items="${emails}">
              <article class="mail-row${email.isImportant ? ' selected' : ''}" data-toggle="detail" data-target=".mail-detail">
                <div class="row-left">
                  <label class="check-wrap"><input type="checkbox" /><span class="check-custom"></span></label>
                  <button class="star" aria-pressed="${email.isImportant}" title="${email.isImportant ? 'Đã đánh dấu quan trọng' : 'Đánh dấu quan trọng'}">
                    <i class="${email.isImportant ? 'fa-solid fa-star' : 'fa-regular fa-star'}"></i>
                  </button>
                </div>
                <div class="mail-sender">${email.userName}</div>
                <div class="mail-subject"><strong>${email.title}</strong> <span class="preview">${email.message}</span></div>
                <div class="mail-date">${email.createdAt}</div>
              </article>
            </c:forEach>
          </div> <!-- .mail-list -->

      </div> <!-- .content__panel -->

      <!--Xem chi tiết email hoặc phản hồi-->
      <aside class="mail-detail" role="dialog" aria-hidden="true" aria-label="Chi tiết email">
        <header class="detail-header">
          <div class="detail-left">
            <h4 class="detail-subject"></h4>
            <div class="detail-meta"><span class="detail-sender"></span></div>
          </div>
          <div class="detail-right">
            <div class="detail-date"></div>
            <button class="detail-star star" aria-pressed="false"><i class="fa-regular fa-star"></i></button>
            <button class="detail-close" aria-label="Đóng chi tiết"><i class="fa-solid fa-xmark"></i></button>
          </div>
        </header>

        <div class="detail-body" tabindex="0">
          <p class="detail-message"></p>
        </div>

        <form class="detail-reply" action="#" onsubmit="return false;">
          <label class="label">Trả lời</label>
          <textarea class="input textarea reply-text" rows="3" placeholder="Viết phản hồi..."></textarea>
          <div class="detail-actions">
            <button type="button" class="btn primary reply-send">Gửi</button>
            <button type="button" class="btn ghost reply-cancel">Hủy</button>
            <button type="button" class="btn danger reply-delete">Xóa</button>
          </div>
        </form>
      </aside>

      </main>
    </div>
  </div> <!-- .Email.main -->
  <script src="../scripts/components/extendSidebar.js"></script>
  <script src="../scripts/components/modalDetail.js"></script>
  <script src="../scripts/components/filter.js"></script>
  <script>
    // Ngăn checkbox trigger modal
    document.querySelectorAll('.check-wrap, .check-wrap input, .star').forEach(el => {
      el.addEventListener('click', function(e) {
        e.stopPropagation();
      });
    });
  </script>
</body>

</html>