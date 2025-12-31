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
      <!-- header inclue shop's logo and shop's name -->
      <div class="sidebar__header">
        <img src="${pageContext.request.contextPath}/admin/imgs/logo.png" alt="Logo">
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
      <!-- bottom has exit button -->
      <div class="sidebar__bottom">
        <a href="../../index.jsp">
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
          <div class="avatar"><img src="${pageContext.request.contextPath}/admin/imgs/logo.png" alt="Avatar" /></div>
        </div>
      </div>

      <!-- Main content -->
      <main class="content" aria-labelledby="customer-title">
        <h3 class="content__title">Khách hàng</h3>
        <div class="content__panel">
          <div class="panel-header">
            <div class="tabs" role="tablist" aria-label="Lọc khách hàng">
              <form method="get" action="${pageContext.request.contextPath}/khachhang" style="display:inline;">
                <button type="submit" class="tab-btn" aria-selected="true">Tất cả khách hàng</button>
              </form>
            </div>
            <div class="search__filter">
              <form method="get" action="${pageContext.request.contextPath}/khachhang" class="search__box search__box--form">
                <input type="text" name="search" id="customer-search" placeholder="Tìm kiếm khách hàng" value="${search != null ? search : ''}" class="search__input" />
                <button type="submit" class="search__submit">
                  <i class="fa-solid fa-search"></i>
                </button>
              </form>
            </div>
          </div>

          <!-- Radio inputs must be siblings of the customers containers for CSS ~ selector to work -->
          <input type="radio" name="kh_tab" id="kh_tab_all" checked hidden>

          <!-- All customers (default) -->
          <div class="customers customers-all" role="list">
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
                              onclick="window.location.href='${pageContext.request.contextPath}/quanlykhachhang?id=${customer.id}'">
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
          </div> <!-- .customers -->
        </div> <!-- .content__panel -->
    </div> <!-- .content -->
    <script src="../scripts/components/extendSidebar.js"></script>
</body>

</html>