<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
        <a href="UuDai.jsp">
          <h3 class="content__title"><i class="fa-solid fa-chevron-left"></i>Thêm Ưu Đãi</h3>
        </a>
        <div class="content__panel creating">
          <div class="panel-header"></div>

          <div class="content__body">
            <div class="form-wrap">
              <section class="left-panel">
                <div class="card-form">
                  <label class="label">Tên ưu đãi</label>
                  <input type="text" class="input" placeholder="Nhập tên ưu đãi" />

                  <label class="label">Mặt hàng</label>
                  <div class="chips">
                    <button type="button" class="chip">Tất cả</button>
                    <button type="button" class="chip">Sữa</button>
                    <button type="button" class="chip">Đồ ăn dặm</button>
                    <button type="button" class="chip">Cháo dinh dưỡng</button>
                    <button type="button" class="chip">Thức uống dinh dưỡng</button>
                  </div>

                  <label class="label">Phân loại ưu đãi</label>
                  <select id="offer-type" name="offer_type" class="input">
                    <option value="product">Giảm giá sản phẩm</option>
                    <option value="shipping">Giảm giá ship</option>
                  </select>

                  <div class="row two">
                    <div>
                      <label class="label">Áp dụng cho đơn giá từ</label>
                      <div class="inline currency-wrap">
                        <input type="number" class="input currency-input" min="0" step="1000" value="0"
                          aria-label="Áp dụng cho đơn giá từ" />
                      </div>
                    </div>
                    <div>
                      <label class="label">Số lượng</label>
                      <input type="number" class="input" min="0" step="1" value="0" />
                    </div>
                  </div>
                  <label class="label">Hạn ưu đãi đến hết ngày</label>
                  <input type="date" class="input" value="Thời gian ưu đãi" />

                  <label class="label">Mô tả</label>
                  <textarea class="input textarea" rows="4" placeholder="Nhập mô tả ưu đãi"></textarea>
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
                    <button class="btn ghost">Hủy</button>
                    <button class="btn primary">Lưu ưu đãi</button>
                  </div>
                </div>
              </div>
            </div>

          </div>

        </div>

      </main>
      <script src="../scripts/components/extendSidebar.js"></script>
      <script src="../scripts/page/ThemUuDai.js"></script>
</body>

</html>