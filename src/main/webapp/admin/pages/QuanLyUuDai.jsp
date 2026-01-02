<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Quản lý ưu đãi</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/styles/components/header.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/styles/components/sidebar.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/styles/pages/QuanLyUuDai.css" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css">
  <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
  <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
</head>

<body>
  <div class="QuanLyUuDai main">
    <aside class="sidebar">
      <% request.setAttribute("activePage", "uudai"); %>
      <%@ include file="../components/sidebar.jsp" %>
    </aside>
    <div class="container">
      <%@ include file="../components/header.jsp" %>
     
      <!-- Main content -->
      <main class="content" aria-labelledby="quan-ly-uu-dai-title">
        <h3 class="content__title" id="quan-ly-uu-dai-title">
          <a href="UuDai.jsp" class="back-icon"><i class="fa-solid fa-chevron-left"></i></a>
          Quản lý ưu đãi
        </h3>
        <div class="content__panel managing">
          <div class="panel-header"></div>

          <div class="content__body">
            <div class="form-wrap">
              <section class="left-panel">
                <div class="card-form">
                  <label class="label">Tên ưu đãi</label>
                  <div class="input-with-icon">
                    <input type="text" class="input" value="Ưu đãi dành cho sữa bột" />
                    <i class="fa-solid fa-pen input-icon"></i>
                  </div>

                  <label class="label">Mặt hàng</label>
                  <div class="chips">
                    <button type="button" class="chip">Tất cả</button>
                    <button type="button" class="chip active">Sữa</button>
                    <button type="button" class="chip">Đồ ăn dặm</button>
                    <button type="button" class="chip">Cháo dinh dưỡng</button>
                    <button type="button" class="chip">Thức uống dinh dưỡng</button>
                  </div>

                  <label class="label">Phân loại ưu đãi</label>
                  <select id="offer-type" name="offer_type" class="input">
                    <option value="product" selected>Giảm giá sản phẩm</option>
                    <option value="shipping">Giảm giá ship</option>
                  </select>

                  <div class="row two">
                    <div>
                      <label class="label">Giảm tiền (vnđ)</label>
                      <div class="input-with-icon">
                        <div class="inline currency-wrap">
                          <input type="number" class="input currency-input" min="0" step="1000" value="0" aria-label="Giảm tiền" />
                        </div>
                        <i class="fa-solid fa-pen input-icon"></i>
                      </div>
                    </div>
                    <div>
                      <label class="label">Giảm %</label>
                      <div class="input-with-icon">
                        <input type="number" class="input" min="0" max="100" step="1.0" value="0" />
                        <i class="fa-solid fa-pen input-icon"></i>
                      </div>
                    </div>
                  </div>

                  <div class="row two">
                    <div>
                      <label class="label">Áp dụng cho đơn giá từ</label>
                      <div class="input-with-icon">
                        <div class="inline currency-wrap">
                          <input type="number" class="input currency-input" min="0" step="1000" value="200000"
                            aria-label="Áp dụng cho đơn giá từ" />
                        </div>
                        <i class="fa-solid fa-pen input-icon"></i>
                      </div>
                    </div>
                    <div>
                      <label class="label">Số lượng</label>
                      <div class="input-with-icon">
                        <input type="number" class="input" min="0" step="1" value="1" />
                        <i class="fa-solid fa-pen input-icon"></i>
                      </div>
                    </div>
                  </div>
                  <label class="label">Hạn ưu đãi đến hết ngày</label>
                  <div class="input-with-icon">
                    <input type="date" class="input" value="2025-11-30" />
                    <i class="fa-solid fa-pen input-icon"></i>
                  </div>

                  <label class="label">Mô tả</label>
                  <div class="input-with-icon">
                    <textarea class="input textarea" rows="4">Giảm 15% cho các sản phẩm sữa bột chọn lọc, áp dụng kèm mã giảm giá.</textarea>
                    <i class="fa-solid fa-pen input-icon"></i>
                  </div>
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
                    <button class="btn ghost" type="button">Hủy</button>
                    <button class="btn danger" type="button">Xóa</button>
                    <button class="btn primary" type="button">Cập nhật</button>
                  </div>
                </div>
              </div>
            </div>

          </div>

        </div> <!-- .content__panel -->

      </main>
      <script src="../scripts/components/extendSidebar.js"></script>
</body>

</html>
