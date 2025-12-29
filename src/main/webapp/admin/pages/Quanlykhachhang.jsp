<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>MiChiShop - Quản lý khách hàng</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/styles/components/header.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/styles/components/sidebar.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/styles/pages/Quanlykhachhang.css" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css">
  <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
  <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
</head>

<body>
  <div class="Quanlykhachhang main">
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
            <a href="./Quanlykhachhang.jsp" class="active">
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
      <main class="content" aria-labelledby="customer-title">
        <h3 class="content__title">
          <a href="./KhachHang.jsp" class="back-icon">
            <i class="fa-solid fa-chevron-left"></i>
          </a>
          Quản lý khách hàng
          <c:if test="${not empty customer.name}">
            <span class="customer-name-header">${customer.name}</span>
          </c:if>
        </h3>
        
        <div class="content__body">
          <div class="form-wrap">
            <!-- Left Panel: Form -->
            <section class="left-panel">

          <!-- Personal Information Section -->
          <div class="profile-section">
            <h3 class="section-title">Thông tin cá nhân</h3>
            
            <div class="profile-field">
              <label>Họ và tên:</label>
              <div class="field-content">
                <input type="text" class="field-input" value="${customer.name}" readonly>
              </div>
            </div>

            <div class="profile-field">
              <label>Email:</label>
              <div class="field-content">
                <input type="email" class="field-input" value="${customer.email}" readonly>
              </div>
            </div>

            <div class="profile-field">
              <label>Số điện thoại:</label>
              <div class="field-content">
                <input type="text" class="field-input" value="${customer.phone_number}" readonly>
              </div>
            </div>

            <div class="profile-field">
              <label>Địa chỉ:</label>
              <div class="field-content">
                <input type="text" class="field-input" value="${empty customer.address ? 'Chưa cập nhật' : customer.address}" readonly>
              </div>
            </div>
          </div>

          <!-- Account Status Section -->
          <div class="profile-section">
            <h3 class="section-title">Trạng thái tài khoản</h3>
            
            <div class="status-row">
              <div class="status-field">
                <label>Khóa Tài Khoản</label>
                <div class="toggle-switch">
                  <input type="checkbox" class="toggle-input">
                  <span class="toggle-slider"></span>
                </div>
              </div>

              <div class="action-group">
                <button class="reset-btn" type="button">
                  <i class="fa-solid fa-question-circle"></i> Đổi mật khẩu
                </button>
                <button class="delete-btn" type="button">
                  <i class="fa-solid fa-trash"></i> Xóa tài khoản
                </button>
                <button class="email-btn" type="button">
                  <i class="fa-solid fa-envelope"></i> Gửi Email
                </button>
              </div>
            </div>
          </div>
            </section>

            <!-- Right Panel: Avatar -->
            <aside class="right-panel">
              <div class="profile-avatar-card">
                <div class="avatar-container">
                  <img src="${empty customer.avt_url ? '../imgs/logo.png' : customer.avt_url}" alt="User Avatar">
                </div>
                <button class="edit-avatar-btn" type="button">
                  <i class="fa-solid fa-pen"></i> Đổi ảnh đại diện
                </button>
              </div>
            </aside>
            </aside>
          </div>
        </div>

        <!-- Update Info Section -->
        <div class="update-info-section">
          <button class="cancel-btn" type="button">
            <i class="fa-solid fa-times"></i> Hủy
          </button>
          <button class="update-info-btn" type="button">
            <i class="fa-solid fa-check"></i> Cập nhật
          </button>
        </div>
      </main>
    </div>
  </div>

  <script src="../scripts/components/extendSidebar.js"></script>
  <script src="../scripts/page/Quanlykhachhang.js"></script>
</body>

</html>
