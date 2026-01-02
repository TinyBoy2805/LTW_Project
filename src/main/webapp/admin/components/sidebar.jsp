<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%-- Sidebar dùng chung cho các trang admin --%>
<div class="sidebar__header">
  <img src="${pageContext.request.contextPath}/admin/imgs/logo.png" alt="Logo">
  <h2>MiChiShop</h2>
</div>
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
      <a href="${pageContext.request.contextPath}/khachhang" class="active">
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
<div class="sidebar__bottom">
  <a href="${pageContext.request.contextPath}/index.jsp">
    <div class="icon"><ion-icon name="exit-outline"></ion-icon></div>
    <p class="title">Đăng xuất</p>
  </a>
</div>
