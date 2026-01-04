<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%-- Header dùng chung cho các trang admin --%>
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
    <div class="avatar"><img src="${pageContext.request.contextPath}/admin/imgs/logo.png" alt="Avatar" /></div>
  </div>
</div>
