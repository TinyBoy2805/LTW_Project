<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%-- Header dùng chung cho các trang admin --%>
<div class="container__header">
  <!-- header left has sidebar expand button and hello message -->
  <div class="header__left">
    <div class="icon" id="menu__action"><ion-icon name="menu-outline"></ion-icon></div>
    <h3>Chào mừng trở lại, <span>MiChi Admin</span></h3>
  </div>
  <div class="header__right">
    <div class="avatar"><img src="${pageContext.request.contextPath}/admin/imgs/logo.png" alt="Avatar" /></div>
  </div>
</div>
