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
          <% request.setAttribute("activePage", "khachhang" ); %>
            <%@ include file="../components/sidebar.jsp" %>
        </aside>
        <div class="container">
          <%@ include file="../components/header.jsp" %>

            <!-- Main content -->
            <main class="content" aria-labelledby="customer-title">
              <h3 class="content__title">
                <a href="${pageContext.request.contextPath}/admin/customer" class="back-icon">
                  <i class="fa-solid fa-chevron-left"></i>
                </a>
                Quản lý khách hàng
              </h3>

              <div class="customer-edit-wrap">

                <div class="content__body">
                  <div class="form-wrap">
                    <section class="left-panel">
                      <div class="profile-section">
                        <h3 class="section-title">Thông tin cá nhân</h3>
                        <div class="profile-field">
                          <label>Họ và tên:</label>
                          <div class="field-content">
                            <input type="text" class="field-input" name="name" value="${customer.name}" form="updateForm">
                            <i class="fa-solid fa-pen input-icon"></i>
                          </div>
                        </div>
                        <div class="profile-field">
                          <label>Email:</label>
                          <div class="field-content">
                            <input type="email" class="field-input" name="email" value="${customer.email}" form="updateForm">
                            <i class="fa-solid fa-pen input-icon"></i>
                          </div>
                        </div>
                        <div class="profile-field">
                          <label>Số điện thoại:</label>
                          <div class="field-content">
                            <input type="text" class="field-input" name="phone_number" value="${customer.phone_number}" form="updateForm">
                            <i class="fa-solid fa-pen input-icon"></i>
                          </div>
                        </div>
                        <div class="profile-field">
                          <label>Địa chỉ:</label>
                          <div class="field-content" style="display: flex; flex-wrap: wrap; gap: 8px;">
                            <input type="text" class="field-input" name="house_number" value="${address.houseNumber}"
                              placeholder="Số nhà" form="updateForm">
                            <input type="text" class="field-input" name="road" value="${address.road}"
                              placeholder="Đường" form="updateForm">
                            <input type="text" class="field-input" name="district" value="${address.district}"
                              placeholder="Quận/Huyện" form="updateForm">
                            <input type="text" class="field-input" name="city" value="${address.city}"
                              placeholder="Tỉnh/TP" form="updateForm">
                            <input type="text" class="field-input" name="hamlet" value="${address.hamlet}"
                              placeholder="Khu phố" form="updateForm">
                            <input type="text" class="field-input" name="ward" value="${address.ward}"
                              placeholder="Phường/Xã" form="updateForm">
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
                            <button class="reset-btn" type="button" onclick="showChangePasswordModal()">
                              <i class="fa-solid fa-question-circle"></i> Đổi mật khẩu
                            </button>
                            <!-- Modal đổi mật khẩu -->
                            <div id="changePasswordModal" class="modal"
                              style="display:none;position:fixed;z-index:9999;left:0;top:0;width:100vw;height:100vh;background:rgba(0,0,0,0.3);align-items:center;justify-content:center;">
                              <div
                                style="background:#fff;padding:32px 24px;border-radius:8px;min-width:320px;max-width:90vw;box-shadow:0 2px 16px #0002;position:relative;">
                                <h3>Đổi mật khẩu cho khách hàng</h3>
                                <div id="change-password-fields">
                                  <div style="margin-bottom:12px;">
                                    <label>Mật khẩu mới:</label><br>
                                    <input type="password" id="new_password_modal" required
                                      style="width:100%;padding:8px;margin-top:4px;">
                                  </div>
                                  <div style="margin-bottom:12px;">
                                    <label>Xác nhận mật khẩu mới:</label><br>
                                    <input type="password" id="confirm_password_modal" required
                                      style="width:100%;padding:8px;margin-top:4px;">
                                  </div>
                                  <div style="display:flex;gap:8px;justify-content:flex-end;">
                                    <button type="button" onclick="hideChangePasswordModal()"
                                      style="padding:6px 16px;">Hủy</button>
                                    <button type="button" onclick="submitChangePassword()"
                                      style="padding:6px 16px;background:#007bff;color:#fff;border:none;border-radius:4px;">Đổi
                                      mật khẩu</button>
                                  </div>
                                </div>
                                <button onclick="hideChangePasswordModal()"
                                  style="position:absolute;top:8px;right:12px;background:none;border:none;font-size:20px;">&times;</button>
                              </div>
                            </div>
                            <script>
                              function showChangePasswordModal() {
                                document.getElementById('changePasswordModal').style.display = 'flex';
                              }
                              function hideChangePasswordModal() {
                                document.getElementById('changePasswordModal').style.display = 'none';
                              }
                              function submitChangePassword() {
                                // copy modal inputs into hidden form and submit (avoid nested forms)
                                try {
                                  const newPwd = document.getElementById('new_password_modal').value;
                                  const confirmPwd = document.getElementById('confirm_password_modal').value;
                                  const hiddenNew = document.getElementById('new_password_hidden');
                                  const hiddenConfirm = document.getElementById('confirm_password_hidden');
                                  const hiddenId = document.getElementById('change_password_id_hidden');
                                  if (hiddenNew && hiddenConfirm) {
                                    hiddenNew.value = newPwd;
                                    hiddenConfirm.value = confirmPwd;
                                  }
                                  if (hiddenId) hiddenId.value = '${customer.id}';
                                  const hiddenForm = document.getElementById('change-password-form');
                                  if (hiddenForm) {
                                    hiddenForm.submit();
                                  }
                                } catch (e) {
                                  console.error('submitChangePassword error', e);
                                }
                              }
                            </script>
                            <form action="${pageContext.request.contextPath}/admin/manage_customer" method="post" style="display:inline-flex; align-items:center; gap:8px;">
                              <input type="hidden" name="action" value="delete" />
                              <input type="hidden" name="id" value="${customer.id}" />
                              <button class="delete-btn" type="submit" onclick="return confirm('Bạn có chắc chắn muốn xóa tài khoản &quot;${customer.name}&quot;?');">
                                <i class="fa-solid fa-trash"></i> Xóa tài khoản
                              </button>
                            </form>
                            <button class="email-btn" type="button">
                              <i class="fa-solid fa-envelope"></i> Gửi Email
                            </button>
                          </div>
                        </div>
                      </div>
                    </section>
                    

                    <aside class="right-panel">
                      <div class="profile-avatar-card">
                        <div class="avatar-container">
                          <img id="avatar-preview"
                            src="${empty customer.avt_url ? pageContext.request.contextPath.concat('/imgs/logo.png') : customer.avt_url}"
                            style="max-width:120px;max-height:120px;border-radius:50%;object-fit:cover;">
                        </div>
                        <label class="edit-avatar-btn" style="cursor:pointer;">
                          <i class="fa-solid fa-pen"></i> Đổi ảnh đại diện
                          <input type="file" name="avatar" id="avatar" accept="image/*" style="display:none;" form="updateForm">
                        </label>
                      </div>
                    </aside>
                  </div>
                </div>

                <div class="update-info-section">
                  <c:if test="${not empty message}">
                    <div style="color:green;">${message}</div>
                  </c:if>
                  <c:if test="${not empty error}">
                    <div style="color:red;">${error}</div>
                  </c:if>
                  <div style="display:inline-flex;gap:12px;align-items:center;">
                    <button class="btn ghost" type="button" onclick="window.location.href='${pageContext.request.contextPath}/admin/manage_customer?id=${customer.id}'">Hủy</button>

                    <!-- delete moved to the action-group above -->

                    <form id="updateForm" action="${pageContext.request.contextPath}/admin/manage_customer" method="post" enctype="multipart/form-data" style="display:inline-flex; gap:12px; align-items:center;">
                      <input type="hidden" name="action" value="update" />
                      <input type="hidden" name="id" value="${customer.id}" />
                      <button class="btn primary" type="submit">Cập Nhật</button>
                    </form>
                  </div>
                </div>
              </div>
            </main>
        </div>
      </div>

        <!-- Hidden form for change-password (moved outside main form to avoid nesting) -->
        <form id="change-password-form" method="post" action="${pageContext.request.contextPath}/admin/manage_customer" style="display:none;">
          <input type="hidden" name="action" value="change_password" />
          <input type="hidden" name="id" id="change_password_id_hidden" />
          <input type="hidden" name="new_password" id="new_password_hidden" />
          <input type="hidden" name="confirm_password" id="confirm_password_hidden" />
        </form>


      <script src="${pageContext.request.contextPath}/admin/scripts/components/extendSidebar.js"></script>
      <script src="${pageContext.request.contextPath}/admin/scripts/page/Quanlykhachhang.js"></script>
    </body>

    </html>