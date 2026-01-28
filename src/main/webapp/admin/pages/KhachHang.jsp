<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>MiChiShop</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/styles/components/header.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/styles/components/sidebar.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/styles/pages/KhachHang.css" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css">
  <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
  <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
</head>

<body>
  <div class="KhachHang main">
    <aside class="sidebar">
      <% request.setAttribute("activePage", "khachhang"); %>
      <%@ include file="../components/sidebar.jsp" %>
    </aside>
    <div class="container">
      <%@ include file="../components/header.jsp" %>
  
      <!-- Main content -->
      <main class="content" aria-labelledby="customer-title">
        <h3 class="content__title">Khách hàng</h3>
        <div class="content__panel">
        <div class="panel-header">
        <div class="tabs" role="tablist" aria-label="Lọc khách hàng">
      <button type="button" class="tab-btn" aria-selected="true" onclick="showRegisterModal()">+ Thêm tài khoản</button>
      </div>
      <div class="search__filter">
      <form method="get" action="${pageContext.request.contextPath}/admin/customer" class="search__box search__box--form">
       <input type="text" name="search" id="customer-search" placeholder="Tìm kiếm khách hàng" value="${search != null ? search : ''}" class="search__input" />
       <button type="submit" class="search__submit">
       <i class="fa-solid fa-search"></i>
      </button>
      </form>
      </div>
      </div>

      <input type="radio" name="kh_tab" id="kh_tab_all" checked hidden>
      
          <div class="customers customers-all" role="list">
            <!-- Modal đăng ký tài khoản -->
            <div id="registerModal" class="modal" style="display:none;position:fixed;z-index:9999;left:0;top:0;width:100vw;height:100vh;background:rgba(0,0,0,0.3);align-items:center;justify-content:center;">
              <div style="background:#fff;padding:32px 24px;border-radius:12px;min-width:350px;max-width:98vw;box-shadow:0 4px 32px #0003;position:relative;">
                <h3 style="color:#f564a9;font-weight:700;font-size:1.25rem;margin-bottom:18px;text-align:center;">Thêm tài khoản khách hàng</h3>
                <form id="registerForm" method="post" action="${pageContext.request.contextPath}/admin/register_customer">
                 <div style="margin-bottom:12px;">
                    <label>Họ và tên:</label><br>
                    <input type="text" name="name" id="reg_name" required style="width:100%;padding:8px;margin-top:4px;border-radius:6px;border:1.5px solid #e0e0e0;">
                  </div>
                  <div style="margin-bottom:12px;">
                    <label>Email:</label><br>
                    <input type="email" name="email" id="reg_email" required style="width:100%;padding:8px;margin-top:4px;border-radius:6px;border:1.5px solid #e0e0e0;">
                  </div>
                  <div style="margin-bottom:12px;">
                    <label>Số điện thoại:</label><br>
                    <input type="text" name="phone_number" id="reg_phone" required style="width:100%;padding:8px;margin-top:4px;border-radius:6px;border:1.5px solid #e0e0e0;">
                  </div>
                  <div style="margin-bottom:12px;">
                    <label>Mật khẩu:</label><br>
                    <input type="password" name="password" id="reg_password" required style="width:100%;padding:8px;margin-top:4px;border-radius:6px;border:1.5px solid #e0e0e0;">
                  </div>
                  <div style="margin-bottom:18px;">
                    <label>Xác nhận mật khẩu:</label><br>
                    <input type="password" name="confirm_password" id="reg_confirm_password" required style="width:100%;padding:8px;margin-top:4px;border-radius:6px;border:1.5px solid #e0e0e0;">
                  </div>
                  <div style="display:flex;gap:10px;justify-content:flex-end;">
                    <button type="button" onclick="hideRegisterModal()" style="padding:8px 24px;background:#fff;color:#f564a9;border:1.5px solid #f564a9;border-radius:6px;font-weight:500;">Hủy</button>
                    <button type="submit" style="padding:8px 24px;background:#f564a9;color:#fff;border:none;border-radius:6px;font-weight:500;">Đăng ký</button>
                  </div>
                </form>
                <button onclick="hideRegisterModal()" style="position:absolute;top:12px;right:18px;background:none;border:none;font-size:22px;color:#f564a9;">&times;</button>
              </div>
            </div>
            <script>
            function showRegisterModal() {
              document.getElementById('registerModal').style.display = 'flex';
            }
            function hideRegisterModal() {
              document.getElementById('registerModal').style.display = 'none';
            }
            // Sau khi đăng ký thành công, hiển thị popup nhập OTP
            document.getElementById('registerForm').onsubmit = function(e) {
              e.preventDefault();
              var form = e.target;
              var formData = new FormData(form);
              fetch(form.action, {
                method: 'POST',
                body: formData
              })
              .then(res => res.text())
              .then(msg => {
                if (msg.includes('Đăng ký thành công')) {
                  // Hiển thị popup nhập OTP
                  showOtpModal(formData.get('email'));
                } else {
                  alert(msg);
                }
              })
              .catch(() => alert('Lỗi hệ thống!'));
            };

            function showOtpModal(email) {
              var otpModal = document.createElement('div');
              otpModal.id = 'otpModal';
              otpModal.style = 'display:flex;position:fixed;z-index:99999;left:0;top:0;width:100vw;height:100vh;background:rgba(0,0,0,0.3);align-items:center;justify-content:center;';
              otpModal.innerHTML = `
                <div style="background:#fff;padding:32px 24px;border-radius:12px;min-width:350px;max-width:98vw;box-shadow:0 4px 32px #0003;position:relative;">
                  <h3 style="color:#f564a9;font-weight:700;font-size:1.25rem;margin-bottom:18px;text-align:center;">Xác thực OTP</h3>
                  <p>Nhập mã OTP đã gửi về email <b>${email}</b></p>
                  <input type="text" id="otp_input" placeholder="Nhập mã OTP" style="width:100%;padding:8px;margin-bottom:18px;border-radius:6px;border:1.5px solid #e0e0e0;">
                  <button id="verifyOtpBtn" style="padding:8px 24px;background:#f564a9;color:#fff;border:none;border-radius:6px;font-weight:500;">Xác thực</button>
                  <button onclick="document.body.removeChild(document.getElementById('otpModal'))" style="position:absolute;top:12px;right:18px;background:none;border:none;font-size:22px;color:#f564a9;">&times;</button>
                </div>
              `;
              document.body.appendChild(otpModal);
              document.getElementById('verifyOtpBtn').onclick = function() {
                var otp = document.getElementById('otp_input').value;
                fetch('${pageContext.request.contextPath}/admin/verify_customer_otp', {
                  method: 'POST',
                  headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
                  body: 'email=' + encodeURIComponent(email) + '&otp=' + encodeURIComponent(otp)
                })
                .then(res => res.text())
                .then(msg => {
                  alert(msg);
                  if (msg.includes('Xác thực thành công')) {
                    document.body.removeChild(document.getElementById('otpModal'));
                    hideRegisterModal();
                  }
                })
                .catch(() => alert('Lỗi xác thực OTP!'));
              };
            }
            </script>
            <c:choose>
              <c:when test="${not empty customers}">
                <c:forEach var="customer" items="${customers}">
                  <article class="card" role="listitem">
                    <figure class="card__figure">
                      <img src="${empty customer.avt_url ? '../imgs/logo.png' : customer.avt_url}" alt="Avatar">
                    </figure>
                    <div class="info">
                      <h4>${customer.name}</h4>
                      <p><i class="fa-solid fa-envelope"></i> ${customer.email}</p>
                      <p><i class="fa-solid fa-phone"></i> ${customer.phone_number}</p>
                      <button class="detail-btn" type="button"
                              onclick="window.location.href='${pageContext.request.contextPath}/admin/manage_customer?id=${customer.id}'">
                        Chi tiết
                      </button>
                    </div>
                  </article>
                </c:forEach>
              </c:when>
              <c:otherwise>
                <p>Chưa có khách hàng nào.</p>
              </c:otherwise>
            </c:choose>
          </div> 
        </div> 
    </div> 
    <script src="${pageContext.request.contextPath}/admin/scripts/components/extendSidebar.js"></script>
</body>

</html>