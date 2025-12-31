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
      <!-- header includes shop's logo and shop's name -->
      <div class="sidebar__header">
        <img src="../imgs/logo.png" alt="Logo">
        <h2>MiChiShop</h2>
      </div>
      <!-- list item of sidebar -->
      <div class="sidebar__list">
        <ul class="list">
          <li class="list__item">
            <a href="dashboard.jsp">
              <div class="section">
                <div class="icon"><i class="fa-solid fa-chart-line"></i></div>
                <p class="title">Thống kê</p>
              </div>
            </a>
          </li>
          <li class="list__item">
            <a href="order.jsp">
              <div class="section">
                <div class="icon"><i class="fa-solid fa-shopping-cart"></i></div>
                <p class="title">Đơn hàng</p>
              </div>
            </a>
          </li>
          <li class="list__item">
            <a href="categories.jsp">
              <div class="section">
                <div class="icon"><i class="fa-solid fa-box"></i></div>
                <p class="title">Kho hàng</p>
              </div>
            </a>
          </li>
          <li class="list__item">
            <a href="${pageContext.request.contextPath}/khachhang">
              <div class="section">
                <div class="icon"><i class="fa-solid fa-users"></i></div>
                <p class="title">Khách hàng</p>
              </div>
            </a>
          </li>
          <li class="list__item">
            <a href="UuDai.jsp" class="active">
              <div class="section">
                <div class="icon"><i class="fa-solid fa-gift"></i></div>
                <p class="title">Ưu đãi</p>
              </div>
            </a>
          </li>
          <li class="list__item">
            <a href="Blog.jsp">
              <div class="section">
                <div class="icon"><i class=" fa-solid fa-blog"></i></div>
                <p class="title">Bài Viết</p>
              </div>
            </a>
          </li>
          <li class="list__item">
            <a href="Email.jsp">
              <div class="section">
                <div class="icon"><i class="fa-solid fa-envelope"></i></div>
                <p class="title">Thông Báo</p>
              </div>
              <div class="badge">+99</div>
            </a>
          </li>
          <li class="list__item">
            <a href="CaiDat.jsp">
              <div class="section">
                <div class="icon"><i class="fa-solid fa-cog"></i></div>
                <p class="title">Cài đặt</p>
              </div>
            </a>
          </li>
        </ul>
      </div>
      <!-- bottom has exit button -->
      <div class="sidebar__bottom">
        <a href="${pageContext.request.contextPath}/index.jsp">
          <div class="icon"><ion-icon name="exit-outline"></ion-icon></div>
          <p class="title">Đăng xuất</p>
        </a>
      </div>
    </aside>

    <div class="container">
      <div class="container__header">
        <!-- header left has sidebar expand button and hello message -->
        <div class="header__left">
          <div class="icon" id="menu__action"><ion-icon name="menu-outline"></ion-icon></div>
          <h3>Chào mừng trở lại, <span>MiChi Admin</span></h3>
        </div>

        <div class="header__right">

          <div class="notification__wrapper">
            <div class="icon" id="notification__icon">
              <ion-icon name="notifications-outline"></ion-icon>
              <span class="notification__badge">3</span>
            </div>

            <div class="notification__frame">
              <h4 class="notification__title">🔔 Thông báo mới</h4>
              <div class="notification__list">

                <div class="notification__item new">
                  <div class="item__icon"><ion-icon name="bag-check-outline"></ion-icon></div>
                  <div class="item__content">
                    <p class="item__text"><strong>Đơn hàng mới:</strong> Mã O-250725 vừa được tạo.</p>
                    <span class="item__time">Vài giây trước</span>
                  </div>
                </div>

                <div class="notification__item new">
                  <div class="item__icon alert"><ion-icon name="alert-circle-outline"></ion-icon></div>
                  <div class="item__content">
                    <p class="item__text"><strong>Cảnh báo tồn kho:</strong> Sữa Bột GrowPro chỉ còn 10 sản phẩm.</p>
                    <span class="item__time">5 phút trước</span>
                  </div>
                </div>

                <div class="notification__item">
                  <div class="item__icon review"><ion-icon name="star-outline"></ion-icon></div>
                  <div class="item__content">
                    <p class="item__text">Có <strong>1 đánh giá 5 sao</strong> mới cho Váng sữa.</p>
                    <span class="item__time">1 giờ trước</span>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="avatar"><img src="../imgs/logo.png" alt="Avatar" /></div>
        </div>
      </div>


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
