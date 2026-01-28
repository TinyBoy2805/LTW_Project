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
              <!-- Left column: avatar + password -->
              <div class="left-column">
                <div class="panel avatar-panel">
                  <h4>Ảnh đại diện</h4>
                  <div class="panel-sub">Thay đổi ảnh đại diện của bạn tại đây</div>
                  <form method="post" action="${pageContext.request.contextPath}/admin/upload-avatar" enctype="multipart/form-data" style="display: flex; flex-direction: column; align-items: center; gap: 12px; width: 100%;">
                    <div class="avatar-wrap">
                      <img class="avatar" id="avatarPreview" src="${adminProfile.avt_url != null ? adminProfile.avt_url : '../imgs/logo.png'}" alt="avatar" style="width: 90px; height: 90px; border-radius: 50%; object-fit: cover; border: 2px solid #eee;">
                    </div>
                    <input type="file" name="avatar" accept="image/*" style="display:none;" id="avatarInput" onchange="previewAvatar(this)">
                    <div style="display: flex; width: 100%; justify-content: flex-end; gap: 8px;">
                      <button class="btn ghost" type="button" style="background: #fff; color: #e91e63; border: 1px solid #e91e63; min-width: 90px;" onclick="document.getElementById('avatarInput').click();return false;">Chọn ảnh</button>
                      <button class="btn primary" type="submit" style="min-width: 90px;">Lưu ảnh</button>
                    </div>
                  </form>
                  <script>
                  function previewAvatar(input) {
                    if (input.files && input.files[0]) {
                      var reader = new FileReader();
                      reader.onload = function(e) {
                        document.getElementById('avatarPreview').src = e.target.result;
                      };
                      reader.readAsDataURL(input.files[0]);
                    }
                  }
                  </script>
                </div>
              </div>

              <!-- Right column: admin profile info -->
              <div class="panel account-panel">
                <h4>Hồ sơ Admin</h4>
                <div class="panel-sub">Chỉnh sửa thông tin hồ sơ admin</div>
                <form class="mt-12" method="post" action="${pageContext.request.contextPath}/admin/update-profile" enctype="multipart/form-data">
                  <div class="form-grid">
                    <div class="form-row">
                      <div class="label">Họ và tên</div>
                      <input type="text" name="name" value="${adminProfile.name}" required>
                    </div>
                    <div class="form-row">
                      <div class="label">Email</div>
                      <input type="email" name="email" value="${adminProfile.email}" required>
                    </div>
                    <div class="form-row">
                      <div class="label">Số điện thoại</div>
                      <input type="text" name="phone" value="${adminProfile.phone_number}" required>
                    </div>
                    <div class="form-row">
                      <div class="label">Số nhà</div>
                      <input type="text" name="houseNumber" value="${not empty adminProfile.myAddresses ? adminProfile.myAddresses[0].houseNumber : ''}" required>
                    </div>
                    <div class="form-row">
                      <div class="label">Đường</div>
                      <input type="text" name="road" value="${not empty adminProfile.myAddresses ? adminProfile.myAddresses[0].road : ''}" required>
                    </div>
                    <div class="form-row">
                      <div class="label">Phường/Xã</div>
                      <input type="text" name="ward" value="${not empty adminProfile.myAddresses ? adminProfile.myAddresses[0].ward : ''}" required>
                    </div>
                    <div class="form-row">
                    <div class="label">Thôn/Xóm</div>
                    <input type="text" name="hamlet" value="${not empty adminProfile.myAddresses ? adminProfile.myAddresses[0].hamlet : ''}" required>
                  </div>
                    <div class="form-row">
                      <div class="label">Quận/Huyện</div>
                      <input type="text" name="district" value="${not empty adminProfile.myAddresses ? adminProfile.myAddresses[0].district : ''}" required>
                    </div>
                    <div class="form-row">
                      <div class="label">Thành phố/Tỉnh</div>
                      <input type="text" name="city" value="${not empty adminProfile.myAddresses ? adminProfile.myAddresses[0].city : ''}" required>
                    </div>
                  </div>
                  <div class="form-actions">
                    <button type="submit" class="btn primary">Lưu</button>
                    <button type="reset" class="btn ghost" onclick="window.location.reload();return false;">Hủy</button>
                  </div>
                </form>
              </div>
            </div> 
          </div> 
        </div> 
      </main>
    </div> 
  </div> 
  <script src="${pageContext.request.contextPath}/admin/scripts/components/extendSidebar.js"></script>
</body>

</html>