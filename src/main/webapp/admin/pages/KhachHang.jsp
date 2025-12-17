<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>MiChiShop</title>
  <link rel="stylesheet" href="../styles/components/header.css" />
  <link rel="stylesheet" href="../styles/components/sidebar.css" />
  <link rel="stylesheet" href="../styles/pages/KhachHang.css" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css">
  <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
  <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
</head>

<body>
  <div class="KhachHang main">
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
            <a href="./KhachHang.jsp" class="active">
              <div class="section">
                <div class="icon"><i class="fa-solid fa-users"></i></div>
                <p class="title">Khách hàng</p>
              </div>
            </a>
          </li>
          <li class="list__item">
            <a href="UuDai.jsp">
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
        <a href="../../../../../index.html">
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
      <main class="content" aria-labelledby="customer-title">
        <h3 class="content__title">Khách hàng</h3>
        <div class="content__panel">
          <div class="panel-header">
            <div class="tabs" role="tablist" aria-label="Lọc khách hàng">
              <button type="button" class="tab-btn" data-target="kh_tab_all" aria-selected="true">Tất cả khách
                hàng</button>
            </div>
            <div class="search__filter">
              <div class="search__box">
                <i class="fa-solid fa-magnifying-glass search__icon"></i>
                <input type="text" id="customer-search" placeholder="Tìm kiếm khách hàng" />
              </div>
            </div>
          </div>

          <!-- Radio inputs must be siblings of the customers containers for CSS ~ selector to work -->
          <input type="radio" name="kh_tab" id="kh_tab_all" checked hidden>

          <!-- All customers (default) -->
          <div class="customers customers-all" role="list">

            <!-- Cards-->
            <article class="card" role="listitem">
              <figure class="card__figure">
                <img src="https://cdn2.fptshop.com.vn/unsafe/Anh_meo_cute_36_19f3349915.jpg" alt="">
              </figure>
              <div class="info">
                <input type="hidden" class="card-address" value="123 Lê Lợi, Quận 1, TP. HCM">
                <h4>Khoa Bruh</h4>
                <p><i class="fa-solid fa-envelope"></i> khoabruh@gmail.com</p>
                <p><i class="fa-solid fa-phone"></i> 0363 666 636</p>
                <button class="detail-btn" type="button" data-toggle="detail" data-target=".customer-detail">Chi tiết</button>
              </div>
            </article>

            <article class="card" role="listitem">
              <figure class="card__figure">
                <img src="https://cdn2.fptshop.com.vn/unsafe/Anh_meo_cute_36_19f3349915.jpg" alt="">
              </figure>
              <div class="info">
                <input type="hidden" class="card-address" value="45 Nguyễn Huệ, Quận 1, TP. HCM">
                <h4>Trâm Anh</h4>
                <p><i class="fa-solid fa-envelope"></i> tramanh@gmail.com</p>
                <p><i class="fa-solid fa-phone"></i> 0966 555 444</p>
                <button class="detail-btn" type="button" data-toggle="detail" data-target=".customer-detail">Chi tiết</button>
              </div>
            </article>

            <article class="card" role="listitem">
              <figure class="card__figure">
                <img src="https://cdn2.fptshop.com.vn/unsafe/Anh_meo_cute_36_19f3349915.jpg" alt="">
              </figure>
              <div class="info">
                <input type="hidden" class="card-address" value="78 Trần Phú, Hà Nội">
                <h4>Phương Dung</h4>
                <p><i class="fa-solid fa-envelope"></i> phuongdung@gmail.com</p>
                <p><i class="fa-solid fa-phone"></i> 0944 777 666</p>
                <button class="detail-btn" type="button" data-toggle="detail" data-target=".customer-detail">Chi tiết</button>
              </div>
            </article>

            <article class="card" role="listitem">
              <figure class="card__figure">
                <img src="https://cdn2.fptshop.com.vn/unsafe/Anh_meo_cute_36_19f3349915.jpg" alt="">
              </figure>
              <div class="info">
                <input type="hidden" class="card-address" value="12 Võ Văn Kiệt, Quận 5, TP. HCM">
                <h4>Hoàng Nam</h4>
                <p><i class="fa-solid fa-envelope"></i> hoangnam@gmail.com</p>
                <p><i class="fa-solid fa-phone"></i> 0922 111 000</p>
                <button class="detail-btn" type="button" data-toggle="detail" data-target=".customer-detail">Chi tiết</button>
              </div>
            </article>

            <article class="card" role="listitem">
              <figure class="card__figure">
                <img src="https://cdn2.fptshop.com.vn/unsafe/Anh_meo_cute_36_19f3349915.jpg" alt="">
              </figure>
              <div class="info">
                <input type="hidden" class="card-address" value="89 Điện Biên Phủ, Quận 3, TP. HCM">
                <h4>Vy Oanh</h4>
                <p><i class="fa-solid fa-envelope"></i> vyoanh@gmail.com</p>
                <p><i class="fa-solid fa-phone"></i> 0911 222 333</p>
                <button class="detail-btn" type="button" data-toggle="detail" data-target=".customer-detail">Chi tiết</button>
              </div>
            </article>

            <article class="card" role="listitem">
              <figure class="card__figure">
                <img src="https://cdn2.fptshop.com.vn/unsafe/Anh_meo_cute_36_19f3349915.jpg" alt="">
              </figure>
              <div class="info">
                <input type="hidden" class="card-address" value="200 Phan Đình Phùng, TP. Đà Nẵng">
                <h4>Trọng Hùng</h4>
                <p><i class="fa-solid fa-envelope"></i> tronghung@gmail.com</p>
                <p><i class="fa-solid fa-phone"></i> 0900 111 222</p>
                <button class="detail-btn" type="button" data-toggle="detail" data-target=".customer-detail">Chi tiết</button>
              </div>
            </article>

            <article class="card" role="listitem">
              <figure class="card__figure">
                <img src="https://cdn2.fptshop.com.vn/unsafe/Anh_meo_cute_36_19f3349915.jpg" alt="">
              </figure>
              <div class="info">
                <input type="hidden" class="card-address" value="55 Trần Hưng Đạo, Quận 1, TP. HCM">
                <h4>Thành Phát</h4>
                <p><i class="fa-solid fa-envelope"></i> thanhphat@gmail.com</p>
                <p><i class="fa-solid fa-phone"></i> 0314 159 264</p>
                <button class="detail-btn" type="button" data-toggle="detail" data-target=".customer-detail">Chi tiết</button>
              </div>
            </article>

            <article class="card" role="listitem">
              <figure class="card__figure">
                <img src="https://cdn2.fptshop.com.vn/unsafe/Anh_meo_cute_36_19f3349915.jpg" alt="">
              </figure>
              <div class="info">
                <input type="hidden" class="card-address" value="9 Nguyễn Trãi, Quận 1, TP. HCM">
                <h4>Lê Minh</h4>
                <p><i class="fa-solid fa-envelope"></i> leminh@gmail.com</p>
                <p><i class="fa-solid fa-phone"></i> 0988 444 333</p>
                <button class="detail-btn" type="button" data-toggle="detail" data-target=".customer-detail">Chi tiết</button>
              </div>
            </article>

            <article class="card" role="listitem">
              <figure class="card__figure">
                <img src="https://cdn2.fptshop.com.vn/unsafe/Anh_meo_cute_36_19f3349915.jpg" alt="">
              </figure>
              <div class="info">
                <input type="hidden" class="card-address" value="34 Lý Thái Tổ, Hà Nội">
                <h4>Ngọc Ánh</h4>
                <p><i class="fa-solid fa-envelope"></i> ngocanh@gmail.com</p>
                <p><i class="fa-solid fa-phone"></i> 0977 222 111</p>
                <button class="detail-btn" type="button" data-toggle="detail" data-target=".customer-detail">Chi tiết</button>
              </div>
            </article>

            <article class="card" role="listitem">
              <figure class="card__figure">
                <img src="https://cdn2.fptshop.com.vn/unsafe/Anh_meo_cute_36_19f3349915.jpg" alt="">
              </figure>
              <div class="info">
                <input type="hidden" class="card-address" value="17 Lê Duẩn, TP. Huế">
                <h4>Minh Tú</h4>
                <p><i class="fa-solid fa-envelope"></i> minhtu@gmail.com</p>
                <p><i class="fa-solid fa-phone"></i> 0905 123 456</p>
                <button class="detail-btn" type="button" data-toggle="detail" data-target=".customer-detail">Chi tiết</button>
              </div>
            </article>

            <article class="card" role="listitem">
              <figure class="card__figure">
                <img src="https://cdn2.fptshop.com.vn/unsafe/Anh_meo_cute_36_19f3349915.jpg" alt="">
              </figure>
              <div class="info">
                <input type="hidden" class="card-address" value="101 Nguyễn Thị Minh Khai, Quận 3, TP. HCM">
                <h4>Thư Trần</h4>
                <p><i class="fa-solid fa-envelope"></i> thutran@gmail.com</p>
                <p><i class="fa-solid fa-phone"></i> 0912 987 654</p>
                <button class="detail-btn" type="button" data-toggle="detail" data-target=".customer-detail">Chi tiết</button>
              </div>
            </article>

            <article class="card" role="listitem">
              <figure class="card__figure">
                <img src="https://cdn2.fptshop.com.vn/unsafe/Anh_meo_cute_36_19f3349915.jpg" alt="">
              </figure>
              <div class="info">
                <input type="hidden" class="card-address" value="17 Lê Duẩn, TP. Huế">
                <h4>Quỳnh Liên</h4>
                <p><i class="fa-solid fa-envelope"></i> quynhlien@gmail.com</p>
                <p><i class="fa-solid fa-phone"></i> 0933 221 110</p>
                <button class="detail-btn" type="button">Chi tiết</button>
              </div>
            </article>

          </div> <!-- .customers -->
        </div> <!-- .content__panel -->
    </div> <!-- .content -->
    </main> <!-- .main -->

    <!-- Xem chi tiết khách hàng -->
    <aside class="customer-detail" role="dialog" aria-hidden="true" aria-labelledby="customer-detail-title">
      <div class="customer-detail__panel">
        <header class="customer-detail__header">
          <h4 id="customer-detail-title">Thông tin khách hàng</h4>
        </header>
        <form class="customer-detail__form" action="#" onsubmit="return false;">
          <label class="field"><span class="label">Họ và tên</span><input type="text" name="name" class="input name"
              readonly value="Khoa Bruh"></label>
          <label class="field"><span class="label">Email</span><input type="email" name="email" class="input email"
              readonly value="khoabruh@gmail.com"></label>
          <label class="field"><span class="label">Số điện thoại</span><input type="text" name="phone"
              class="input phone" readonly value="0363 666 636"></label>
          <label class="field"><span class="label">Địa chỉ</span><input type="text" name="address" class="input address"
              readonly value="123 Lê Lợi, Quận 1, TP. HCM"></label>
          <div class="customer-detail__actions">
            <button type="button" class="close-btn">Đóng</button>
          </div>
        </form>
      </div>
    </aside>
    <script src="../scripts/components/extendSidebar.js"></script>
    <script src="../scripts/components/modalDetail.js"></script>
    <script src="../scripts/page/KhachHang.js"></script>
</body>

</html>