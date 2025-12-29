<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>MiChiShop</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/styles/components/header.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/styles/components/sidebar.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/styles/pages/UuDai.css" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css">
  <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
  <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
</head>

<body>
  <div class="UuDai main">
    <aside class="sidebar">
      <!-- header inclue shop's logo and shop's name -->
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
            <a href="KhachHang.jsp">
              <div class="section">
                <div class="icon"><i class="fa-solid fa-users"></i></div>
                <p class="title">Khách hàng</p>
              </div>
            </a>
          </li>
          <li class="list__item">
            <a href="./UuDai.jsp" class="active">
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
      <main class="content" aria-labelledby="uu-dai-title">
        <h3 class="content__title">Ưu Đãi</h3>
        <div class="content__panel">
          <div class="panel-header">
            <div class="toolbar">
              <a href="ThemUuDai.jsp"><button class="new-btn" type="button">+ Ưu đãi mới</button></a>
            </div>
          </div>

          <div class="offers">
            <!-- offer item -->
            <a class="card-link" href="QuanLyUuDai.jsp" aria-label="Xem chi tiết ưu đãi dành cho sữa bột">
              <article class="card" role="listitem" data-category="sua" data-customer="tat-ca" data-promo="discount">
                <figure class="card__figure">
                  <div class="promo-icon promo-discount" aria-hidden="true"><i class="fa-solid fa-credit-card"></i></div>
                </figure>
                <div class="info">
                  <h4>Ưu đãi dành cho sữa bột</h4>
                  <p>Giảm 15% cho các sản phẩm sữa bột chọn lọc, áp dụng kèm mã giảm giá.</p>
                  <p class="muted">Áp dụng cho đơn từ: 200.000đ</p>
                  <p class="muted">Hạn sử dụng: 30/11/2025</p>
                  <button class="time-pill" type="button">Thời hạn ưu đãi còn: 2 ngày</button>
                </div>
              </article>
            </a>

            <a class="card-link" href="QuanLyUuDai.jsp" aria-label="Xem chi tiết ưu đãi vận chuyển miễn phí">
              <article class="card" role="listitem" data-category="sua" data-customer="tat-ca" data-promo="shipping">
                <figure class="card__figure">
                  <div class="promo-icon promo-shipping" aria-hidden="true"><i class="fa-solid fa-truck"></i></div>
                </figure>
                <div class="info">
                  <h4>Ưu đãi vận chuyển miễn phí</h4>
                  <p>Miễn phí giao hàng cho đơn hàng sữa bột và hàng mẹ bé trong khu vực nội thành.</p>
                  <p class="muted">Áp dụng cho đơn từ: 300.000đ</p>
                  <p class="muted">Hạn sử dụng: 30/11/2025</p>
                  <button class="time-pill" type="button">Thời hạn ưu đãi còn: 3 ngày</button>
                </div>
              </article>
            </a>

            <!-- New shipping promo card -->
            <a class="card-link" href="QuanLyUuDai.jsp" aria-label="Xem chi tiết ưu đãi vận chuyển nhanh">
              <article class="card" role="listitem" data-category="all" data-customer="tat-ca" data-promo="shipping">
                <figure class="card__figure">
                  <div class="promo-icon promo-shipping" aria-hidden="true"><i class="fa-solid fa-truck"></i></div>
                </figure>
                <div class="info">
                  <h4>Ưu đãi vận chuyển nhanh</h4>
                  <p>Giảm phí vận chuyển nhanh 50% cho đơn hàng nội thành khi dùng mã <strong>SHIP50</strong>.</p>
                  <p class="muted">Áp dụng cho đơn từ: 150.000đ</p>
                  <p class="muted">Hạn sử dụng: 30/12/2025</p>
                  <button class="time-pill" type="button">Thời hạn ưu đãi còn: 1 tháng</button>
                </div>
              </article>
            </a>

            <!-- Another new shipping promo card -->
            <a class="card-link" href="QuanLyUuDai.jsp" aria-label="Xem chi tiết ưu đãi miễn phí vận chuyển cho đơn đầu">
              <article class="card" role="listitem" data-category="all" data-customer="tat-ca" data-promo="shipping">
                <figure class="card__figure">
                  <div class="promo-icon promo-shipping" aria-hidden="true"><i class="fa-solid fa-truck"></i></div>
                </figure>
                <div class="info">
                  <h4>Miễn phí vận chuyển cho đơn đầu</h4>
                  <p>Tặng miễn phí giao hàng cho khách hàng lần đầu mua khi sử dụng mã <strong>FREESHIP1</strong>.</p>
                  <p class="muted">Áp dụng cho đơn từ: 0đ</p>
                  <p class="muted">Hạn sử dụng: 31/01/2026</p>
                  <button class="time-pill" type="button">Thời hạn ưu đãi còn: 2 tháng</button>
                </div>
              </article>
            </a>

            <a class="card-link" href="QuanLyUuDai.jsp" aria-label="Xem chi tiết ưu đãi combo ăn dặm">
              <article class="card" role="listitem" data-category="an-dam" data-customer="tat-ca" data-promo="discount">
                <figure class="card__figure">
                  <div class="promo-icon promo-discount" aria-hidden="true"><i class="fa-solid fa-credit-card"></i></div>
                </figure>
                <div class="info">
                  <h4>Ưu đãi combo ăn dặm</h4>
                  <p>Combo đồ ăn dặm giảm 20% khi mua theo set, thích hợp cho bé 6–12 tháng.</p>
                  <p class="muted">Áp dụng cho đơn từ: 250.000đ</p>
                  <p class="muted">Hạn sử dụng: 31/12/2025</p>
                  <button class="time-pill" type="button">Thời hạn ưu đãi còn: 2 tháng</button>
                </div>
              </article>
            </a>

            <a class="card-link" href="QuanLyUuDai.jsp" aria-label="Xem chi tiết ưu đãi miễn phí vận chuyển toàn quốc">
              <article class="card" role="listitem" data-category="sua" data-customer="tat-ca" data-promo="shipping">
                <figure class="card__figure">
                  <div class="promo-icon promo-shipping" aria-hidden="true"><i class="fa-solid fa-truck"></i></div>
                </figure>
                <div class="info">
                  <h4>Miễn phí vận chuyển toàn quốc</h4>
                  <p>Miễn phí giao hàng cho đơn hàng sữa bột và sản phẩm dinh dưỡng cho bé.</p>
                  <p class="muted">Áp dụng cho đơn từ: 299.000đ</p>
                  <p class="muted">Hạn sử dụng: 30/11/2025</p>
                  <button class="time-pill" type="button">Thời hạn ưu đãi còn: 2 ngày</button>
                </div>
              </article>
            </a>

            <a class="card-link" href="QuanLyUuDai.jsp" aria-label="Xem chi tiết ưu đãi Flash Sale">
              <article class="card" role="listitem" data-category="sua" data-customer="tat-ca" data-promo="discount">
                <figure class="card__figure">
                  <div class="promo-icon promo-discount" aria-hidden="true"><i class="fa-solid fa-credit-card"></i></div>
                </figure>
                <div class="info">
                  <h4>Ưu đãi Flash Sale</h4>
                  <p>Giảm giá đặc biệt - chỉ trong hôm nay.</p>
                  <p class="muted">Áp dụng cho đơn từ: 500.000đ</p>
                  <p class="muted">Hạn sử dụng: 10/11/2025</p>
                  <button class="time-pill" type="button">Thời hạn: 1 ngày</button>
                </div>
              </article>
            </a>

            <a class="card-link" href="QuanLyUuDai.jsp" aria-label="Xem chi tiết voucher giảm giá 30%">
              <article class="card" role="listitem" data-category="sua" data-customer="tat-ca" data-promo="discount">
                <figure class="card__figure">
                  <div class="promo-icon promo-discount" aria-hidden="true"><i class="fa-solid fa-credit-card"></i></div>
                </figure>
                <div class="info">
                  <h4>Voucher giảm giá 30%</h4>
                  <p>Voucher giảm 30% dành cho khách hàng thân thiết.</p>
                  <p class="muted">Áp dụng cho đơn từ: 1 sản phẩm</p>
                  <p class="muted">Hạn sử dụng: 20/11/2025</p>
                  <button class="time-pill" type="button">Thời hạn: 5 ngày</button>
                </div>
              </article>
            </a>

            <a class="card-link" href="QuanLyUuDai.jsp" aria-label="Xem chi tiết ưu đãi giảm 50% phí ship">
              <article class="card" role="listitem" data-category="sua" data-customer="tat-ca" data-promo="shipping">
                <figure class="card__figure">
                  <div class="promo-icon promo-shipping" aria-hidden="true"><i class="fa-solid fa-truck"></i></div>
                </figure>
                <div class="info">
                  <h4>Giảm 50% phí ship</h4>
                  <p>Giảm 50% phí vận chuyển khi đặt mua online.</p>
                  <p class="muted">Áp dụng cho đơn từ: 300.000đ</p>
                  <p class="muted">Hạn sử dụng: 01/12/2025</p>
                  <button class="time-pill" type="button">Thời hạn: 21 ngày</button>
                </div>
              </article>
            </a>

            <a class="card-link" href="QuanLyUuDai.jsp" aria-label="Xem chi tiết ưu đãi giảm giá đơn hàng">
              <article class="card" role="listitem" data-category="sua" data-customer="tat-ca" data-promo="discount">
                <figure class="card__figure">
                  <div class="promo-icon promo-discount" aria-hidden="true"><i class="fa-solid fa-credit-card"></i></div>
                </figure>
                <div class="info">
                  <h4>Giảm giá đơn hàng</h4>
                  <p>Ưu đãi giảm giá dành cho mọi khách hàng.</p>
                  <p class="muted">Áp dụng cho đơn từ: 150.000đ</p>
                  <p class="muted">Hạn sử dụng: 31/12/2025</p>
                  <button class="time-pill" type="button">Thời hạn: 60 ngày</button>
                </div>
              </article>
            </a>

          </div> <!-- .offers -->
        </div> <!-- .content__panel -->
      </main>
    </div> <!-- .container -->
  </div> <!-- .UuDai.main -->
  <script src="../scripts/components/extendSidebar.js"></script>
</body>

</html>