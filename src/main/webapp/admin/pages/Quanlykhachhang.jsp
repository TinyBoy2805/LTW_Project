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
      <% request.setAttribute("activePage", "khachhang"); %>
      <%@ include file="../components/sidebar.jsp" %>
    </aside>
    <div class="container">
      <%@ include file="../components/header.jsp" %>

      <!-- Main content -->
      <main class="content" aria-labelledby="customer-title">
        <h3 class="content__title">
          <a href="${pageContext.request.contextPath}/khachhang" class="back-icon">
            <i class="fa-solid fa-chevron-left"></i>
          </a>
          Quản lý khách hàng
        </h3>
        
        <form id="customer-edit-form" method="post" action="${pageContext.request.contextPath}/quanlykhachhang?id=${customer.id}" enctype="multipart/form-data">
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
                <input type="text" class="field-input" name="name_display" id="name" value="${customer.name}">
                <input type="hidden" name="name" id="name_hidden" value="${customer.name}">
                <i class="fa-solid fa-pen input-icon" title="Chỉnh sửa họ tên"></i>
              </div>
            </div>

            <div class="profile-field">
              <label>Email:</label>
              <div class="field-content">
                <input type="email" class="field-input" name="email_display" id="email" value="${customer.email}">
                <input type="hidden" name="email" id="email_hidden" value="${customer.email}">
                <i class="fa-solid fa-pen input-icon" title="Chỉnh sửa email"></i>
              </div>
            </div>

            <div class="profile-field">
              <label>Số điện thoại:</label>
              <div class="field-content">
                <input type="text" class="field-input" name="phone_number_display" id="phone_number" value="${customer.phone_number}">
                <input type="hidden" name="phone_number" id="phone_number_hidden" value="${customer.phone_number}">
                  <script>
                    // Luôn đồng bộ giá trị input hidden với input hiển thị khi người dùng thay đổi
                    document.getElementById('name').addEventListener('input', function() {
                      document.getElementById('name_hidden').value = this.value;
                    });
                    document.getElementById('email').addEventListener('input', function() {
                      document.getElementById('email_hidden').value = this.value;
                    });
                    document.getElementById('phone_number').addEventListener('input', function() {
                      document.getElementById('phone_number_hidden').value = this.value;
                    });
                  </script>
                <i class="fa-solid fa-pen input-icon" title="Chỉnh sửa số điện thoại"></i>
              </div>
            </div>

            <div class="profile-field">
              <label>Địa chỉ:</label>
              <div class="field-content">
                <c:choose>
                  <c:when test="${not empty address}">
                    <input type="text" class="field-input" name="address_full" id="address_full"
                      value="${address.houseNumber}, ${address.road}, ${address.district}, ${address.city}, ${address.hamlet}, ${address.ward}"
                      readonly placeholder="Số nhà, Đường, Quận/Huyện, Tỉnh/TP, Khu phố, Phường/Xã">
                  </c:when>
                  <c:otherwise>
                    <input type="text" class="field-input" name="address_full" id="address_full"
                      value="" readonly placeholder="Số nhà, Đường, Quận/Huyện, Tỉnh/TP, Khu phố, Phường/Xã">
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
                <button class="delete-btn" type="button" onclick="handleDelete('${customer.id}', '${customer.name}')">
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
                  <img id="avatar-preview" src="${empty customer.avt_url ? '../imgs/logo.png' : customer.avt_url}" alt="User Avatar" style="max-width:120px;max-height:120px;border-radius:50%;object-fit:cover;">
                </div>
                <label class="edit-avatar-btn" style="cursor:pointer;">
                  <i class="fa-solid fa-pen"></i> Đổi ảnh đại diện
                  <input type="file" name="avatar" id="avatar" accept="image/*" style="display:none;" onchange="previewAvatar(event)">
                </label>
              </div>
              <script>
                function previewAvatar(event) {
                  const [file] = event.target.files;
                  if (file) {
                    document.getElementById('avatar-preview').src = URL.createObjectURL(file);
                  }
                }
              </script>
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
  <form id="hidden-delete-form" method="post" action="${pageContext.request.contextPath}/quanlykhachhang" style="display:none;">
    <input type="hidden" name="id" id="delete-id">
    <input type="hidden" name="action" value="delete">
  </form>
  <script src="${pageContext.request.contextPath}/admin/scripts/components/extendSidebar.js"></script>
  <script src="${pageContext.request.contextPath}/admin/scripts/page/Quanlykhachhang.js"></script>
</body>

</html>
