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
      <%@ include file="../components/sidebar.jsp" %>
    </aside>
    <div class="container">
      <%@ include file="../components/header.jsp" %>

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
          <div class="avatar"><img src="${pageContext.request.contextPath}/admin/imgs/logo.png" alt="Avatar" /></div>
        </div>
      </div>

      <!-- Main content -->
      <main class="content" aria-labelledby="customer-title">
        <h3 class="content__title">
          <a href="${pageContext.request.contextPath}/khachhang" class="back-icon">
            <i class="fa-solid fa-chevron-left"></i>
          </a>
          Quản lý khách hàng
        </h3>
        
        <form id="customer-edit-form" method="post" action="${pageContext.request.contextPath}/quanlykhachhang?id=${customer.id}">
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
                <input type="text" class="field-input" name="name" id="name" value="${customer.name}" readonly>
                <i class="fa-solid fa-pen input-icon" title="Chỉnh sửa họ tên"></i>
              </div>
            </div>

            <div class="profile-field">
              <label>Email:</label>
              <div class="field-content">
                <input type="email" class="field-input" name="email" id="email" value="${customer.email}" readonly>
                <i class="fa-solid fa-pen input-icon" title="Chỉnh sửa email"></i>
              </div>
            </div>

            <div class="profile-field">
              <label>Số điện thoại:</label>
              <div class="field-content">
                <input type="text" class="field-input" name="phone_number" id="phone_number" value="${customer.phone_number}" readonly>
                <i class="fa-solid fa-pen input-icon" title="Chỉnh sửa số điện thoại"></i>
              </div>
            </div>

            <div class="profile-field">
              <label>Địa chỉ:</label>
              <div class="field-content">
                <c:choose>
                  <c:when test="${not empty address}">
                    <input type="text" class="field-input" name="address_full" id="address_full"
                      value="${address.houseNumber}, ${address.road}, ${address.district}, ${address.city}"
                      readonly placeholder="Số nhà, Đường, Quận/Huyện, Tỉnh/TP">
                  </c:when>
                  <c:otherwise>
                    <input type="text" class="field-input" name="address_full" id="address_full"
                      value="" readonly placeholder="Số nhà, Đường, Quận/Huyện, Tỉnh/TP">
                  </c:otherwise>
                </c:choose>
                <i class="fa-solid fa-pen input-icon" title="Chỉnh sửa địa chỉ"></i>
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
          <button class="update-info-btn" type="submit">
            <i class="fa-solid fa-check"></i> Cập nhật
          </button>
        </div>
        </form>
      </main>
    </div>
  </div>

  <script src="${pageContext.request.contextPath}/admin/scripts/components/extendSidebar.js"></script>
  <script src="${pageContext.request.contextPath}/admin/scripts/page/Quanlykhachhang.js"></script>
</body>

</html>
