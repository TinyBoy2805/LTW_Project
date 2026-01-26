<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>MiChiShop</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/styles/components/header.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/styles/components/sidebar.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/styles/pages/ThemUuDai.css" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css">
  <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
  <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
</head>

<body>
  <div class="ThemUuDai main">
    <aside class="sidebar">
      <% request.setAttribute("activePage", "uudai"); %>
      <%@ include file="../components/sidebar.jsp" %>
    </aside>
    <div class="container">
      <%@ include file="../components/header.jsp" %>
   
      <!-- Main content -->
      <main class="content" aria-labelledby="them-uu-dai-title">
        <a href="${pageContext.request.contextPath}/admin/voucher">
          <h3 class="content__title"><i class="fa-solid fa-chevron-left"></i>Thêm Ưu Đãi</h3>
        </a>
        <div class="content__panel creating">
          <div class="panel-header"></div>

          <form method="post" action="${pageContext.request.contextPath}/admin/voucher">
            <div class="content__body">
              <div class="form-wrap">
                <section class="left-panel">
                  <div class="card-form">
                    <label class="label">Tên ưu đãi</label>
                    <input type="text" class="input" name="code" placeholder="Nhập tên ưu đãi" required />

                    <label class="label">Áp dụng cho danh mục</label>
                    <select name="category_id" class="input" required>
                      <option value="" disabled selected>Chọn danh mục</option>
                      <c:forEach var="cat" items="${categories}">
                        <option value="${cat.id}">${cat.name}</option>
                      </c:forEach>
                    </select>

                    <label class="label">Phân loại ưu đãi</label>
                    <select id="offer-type" name="voucher_type" class="input" required>
                      <option value="discount">Giảm giá sản phẩm</option>
                      <option value="shipping">Giảm giá ship</option>
                    </select>

                    <div class="row two">
                      <div>
                        <label class="label">Giảm tiền (vnđ)</label>
                        <div class="inline currency-wrap">
                          <input type="number" class="input currency-input" name="discount_amount" min="0" step="1000" value="0"
                            aria-label="Giảm tiền" />
                        </div>
                      </div>
                      <div>
                        <label class="label">Giảm %</label>
                        <input type="number" class="input" name="discount_percentage" min="0" max="100" step="1" value="0" />
                      </div>
                    </div>

                    <div class="row two">
                      <div>
                        <label class="label">Áp dụng cho đơn từ (vnđ)</label>
                        <div class="inline currency-wrap">
                          <input type="number" class="input currency-input" name="min_order_value" min="0" step="1000" value="0"
                            aria-label="Áp dụng cho đơn giá từ" />
                        </div>
                      </div>
                      <div>
                        <label class="label">Số lượng</label>
                        <input type="number" class="input" name="usage_limit" min="0" step="1" value="0" />
                      </div>
                    </div>

                    <div class="row two">
                      <div>
                        <label class="label">Ngày bắt đầu</label>
                        <input type="date" class="input" name="start_date" />
                      </div>
                      <div>
                        <label class="label">Ngày kết thúc</label>
                        <input type="date" class="input" name="end_date" />
                      </div>
                    </div>

                    <label class="label">Mô tả chi tiết</label>
                    <textarea class="input textarea" name="description" rows="4" placeholder="Nhập mô tả ưu đãi"></textarea>
                  </div>
                </section>
              </div>
 
              <div class="actions-row">
                <div class="actions-left">
                  <p class="note">Đảm bảo rằng sản phẩm của bạn là hợp pháp và không gây hậu quả nào</p>
                </div>
                <div class="actions-right">
                  <div class="panel-actions">
                    <div class="actions">
                      <a href="${pageContext.request.contextPath}/admin/voucher" class="btn ghost" style="text-decoration:none; display:inline-block; text-align:center;">Hủy</a>
                      <button class="btn primary" type="submit">Đăng ưu đãi</button>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </form>

        </div>

      </main>
      <script src="../scripts/components/extendSidebar.js"></script>
      <script src="../scripts/page/ThemUuDai.js"></script>
</body>

</html>