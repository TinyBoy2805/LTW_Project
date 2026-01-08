<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>MiChiShop</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/styles/components/sidebar.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/styles/components/header.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/styles/pages/CaiDat.css" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css">
  <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
  <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
</head>

<body>
  <div class="CaiDat main">
    <aside class="sidebar">
      <% request.setAttribute("activePage", "caidat"); %>
      <%@ include file="../components/sidebar.jsp" %>
    </aside>
    <div class="container">
      <%@ include file="../components/header.jsp" %>
      
      <!-- Main content -->
      <main class="content" aria-labelledby="settings-title">
        <h3 class="content__title">Cài đặt</h3>
        <div class="content__panel">
          <div class="panel-header">
          </div>

          <div class="tab-panel-wrapper">
            <div class="settings-grid tab-panel active" data-panel="account">
              <!-- Left column: stack avatar panel + password panel -->
              <div class="left-column">
                <div class="panel avatar-panel">
                  <h4>Thay đổi hồ sơ</h4>
                  <div class="panel-sub">Thay đổi ảnh đại diện của bạn tại đây</div>
                  <div class="avatar-wrap">
                    <img class="avatar" src="../imgs/logo.png" alt="avatar">
                    <div class="avatar-actions">
                      <button class="btn primary" type="button">Tải lên</button>
                      <button class="btn ghost" type="button">Đặt lại</button>
                    </div>
                  </div>
                  <div class="panel-sub small-sub">Cho phép JPG, GIF hoặc PNG. Kích thước tối đa 800K</div>
                </div>

                <div class="panel password-panel">
                  <h4>Đổi mật khẩu</h4>
                  <div class="panel-sub">Đổi mật khẩu để bảo vệ tài khoản của bạn</div>
                  <form class="mt-6">
                    <div class="form-grid">
                      <div class="form-row">
                        <div class="label">Mật khẩu hiện tại</div>
                        <input type="password" name="current_password" placeholder="Mật khẩu hiện tại"
                          autocomplete="current-password">
                      </div>
                      <div class="form-row">
                        <div class="label">Mật khẩu mới</div>
                        <input type="password" name="new_password" placeholder="Mật khẩu mới"
                          autocomplete="new-password">
                      </div>
                      <div class="form-row">
                        <div class="label">Xác nhận mật khẩu</div>
                        <input type="password" name="confirm_password" placeholder="Xác nhận mật khẩu"
                          autocomplete="new-password">
                      </div>
                    </div>
                    <div class="form-message mt-8 hidden"></div>
                    <div class="form-actions mt-8">
                      <button class="btn primary save-password" type="button">Lưu mật khẩu</button>
                    </div>
                  </form>
                </div>
              </div>

              <!-- Right column: personal details -->
              <div class="panel account-panel">
                <h4>Thông tin cá nhân</h4>
                <div class="panel-sub">Để thay đổi thông tin cá nhân, chỉnh sửa và lưu tại đây</div>
                <form class="mt-12">
                  <div class="form-grid">

                    <div class="form-row">
                      <div class="label">Tên cửa hàng</div>
                      <input type="text" value="MichiShop">
                    </div>

                    <div class="form-row">
                      <div class="label">Email</div>
                      <input type="email" value="michishop@beyeu123.com">
                    </div>
                    <div class="form-row">
                      <div class="label">Số điện thoại</div>
                      <input type="text" value="+84912345678">
                    </div>

                    <div class="panel-grid-full">
                      <div class="form-row">
                        <div class="label">Địa chỉ</div>
                        <input type="text" value="123 Nguyễn Văn Cừ, TP.HCM">
                      </div>
                    </div>
                  </div>

                  <div class="form-actions">
                    <button type="button" class="btn primary">Lưu</button>
                    <button type="button" class="btn ghost">Hủy</button>
                  </div>
                </form>
              </div>
            </div> <!-- /.settings-grid (account) -->
          </div> <!-- /.tab-panel-wrapper -->
        </div> <!-- /.content__panel -->
      </main>
    </div> <!-- .container -->
  </div> <!-- .CaiDat.main -->
  <script src="../scripts/components/extendSidebar.js"></script>
</body>

</html>