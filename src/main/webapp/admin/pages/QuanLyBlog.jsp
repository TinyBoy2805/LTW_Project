<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Quản Lý Bài Viết - MiChiShop</title>
  <link rel="stylesheet" href="../styles/pages/QuanLyBlog.css" />
  <link rel="stylesheet" href="../styles/components/header.css" />
  <link rel="stylesheet" href="../styles/components/sidebar.css" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css">
  <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
  <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
</head>
<body>
  <div class="Blog main">
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
            <a href="UuDai.jsp">
              <div class="section">
                <div class="icon"><i class="fa-solid fa-gift"></i></div>
                <p class="title">Ưu đãi</p>
              </div>
            </a>
          </li>
          <li class="list__item">
            <a href="./Blog.jsp" class="active">
              <div class="section">
                <div class="icon"><i class=" fa-solid fa-blog"></i></div>
                <p class="title">Bài viết</p>
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
      <!-- header -->
      <div class="container__header">
        <!-- header left has sidebar expand button and hello message -->
        <div class="header__left">
          <div class="icon" id="menu__action"><ion-icon name="menu-outline"></ion-icon></div>
          <h3>Chào mừng trở lại, <span>MiChi Admin</span></h3>
        </div>
        <!-- header right has anouncement icon and the avatar of admin account -->
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
                    <p class="item__text">
                      <strong>Đơn hàng mới:</strong> Mã O-250725 vừa được tạo.
                    </p>
                    <span class="item__time">Vài giây trước</span>
                  </div>
                </div>

                <div class="notification__item new">
                  <div class="item__icon alert"><ion-icon name="alert-circle-outline"></ion-icon>
                  </div>
                  <div class="item__content">
                    <p class="item__text">
                      <strong>Cảnh báo tồn kho:</strong> Sữa Bột GrowPro chỉ còn 10 sản phẩm.
                    </p>
                    <span class="item__time">5 phút trước</span>
                  </div>
                </div>

                <div class="notification__item">
                  <div class="item__icon review"><ion-icon name="star-outline"></ion-icon></div>
                  <div class="item__content">
                    <p class="item__text">
                      Có <strong>1 đánh giá 5 sao</strong> mới cho Váng sữa.
                    </p>
                    <span class="item__time">1 giờ trước</span>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="avatar"><img src="../imgs/logo.png" alt="Avatar"></div>
        </div>
      </div>
      <!-- content -->
      <div class="container__content">
        <h3 class="content__title">
          <a href="./Blog.jsp" class="back-icon">
            <i class="fa-solid fa-chevron-left"></i>
          </a>
          Quản lý bài viết
        </h3>
        <div class="content__body">
            <div class="form-wrap">
              <section class="left-panel">
                <div class="card-form">
                  <label class="label">Tiêu đề</label>
                  <div class="input-with-icon">
                    <input id="edit-title" class="input" type="text" placeholder="Nhập tiêu đề" value="Sữa công thức: Hướng dẫn chọn cho bé 0–12 tháng">
                    <i class="fa-solid fa-pen input-icon"></i>
                  </div>

                  <label class="label">Link bài viết</label>
                  <div class="input-with-icon">
                    <input id="edit-link" class="input" type="url" placeholder="https://..." value="http://michishop.local/blog/sua-cong-thuc-abc">
                    <i class="fa-solid fa-pen input-icon"></i>
                  </div>

                  <label class="label">Ngày đăng</label>
                  <div class="input-with-icon">
                    <input id="edit-date" class="input" type="date" value="2025-11-12">
                    <i class="fa-solid fa-pen input-icon"></i>
                  </div>

                  <label class="label">Nội dung (mô tả ngắn)</label>
                  <div class="input-with-icon">
                    <textarea id="edit-content" class="input textarea" rows="3" placeholder="Tóm tắt, đoạn mô tả sẽ hiển thị trên card">Bài viết hướng dẫn lựa chọn sữa công thức phù hợp theo độ tuổi, thành phần dinh dưỡng cần chú ý và mẹo chuyển đổi khi thay sữa.</textarea>
                    <i class="fa-solid fa-pen input-icon"></i>
                  </div>
                </div>
              </section>

              <aside class="right-panel">
                <div class="images-card">
                  <div class="images-card-header">
                    <h4>Hình ảnh</h4>
                    <i class="fa-solid fa-pen input-icon"></i>
                  </div>
                  <div class="thumbs">
                    <img id="blog-image" class="blog-thumb-image visible" src="https://media.vietnamplus.vn/images/ed1918d4cf848798286fdbd286ae25b434bfe5fe1202c90591deb8e201814798f805af93601147e13a81d0f60f99424f/thuc-pham-bo-sung4.jpg" alt="Hình ảnh bài viết">
                  </div>
                </div>
              </aside>
            </div>

            <div class="actions-row">
              <div class="actions-left">
                <p class="note">Đảm bảo nội dung tuân thủ chính sách và không vi phạm quy định.</p>
              </div>
              <div class="actions-right">
                <div class="panel-actions">
                  <div class="actions">
                    <button id="cancel-blog" class="btn ghost" type="button">Hủy</button>
                    <button id="btn-delete" class="btn danger" type="button">Xóa</button>
                    <button id="btn-update" class="btn primary" type="button">Cập Nhật</button>
                  </div>
                </div>
              </div>
            </div>
        </div>
      </div>
    </div>

  <script src="../scripts/components/extendSidebar.js"></script>
</body>

</html>
