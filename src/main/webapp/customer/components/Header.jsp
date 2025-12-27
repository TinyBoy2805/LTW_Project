<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 12/27/2025
  Time: 5:31 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<header class="header">
    <nav class="nav">
        <div class="nav__top">
            <a class="nav__top-logo" href="./Home.jsp">
                <div class="nav__logo-img">
                    <img src="${pageContext.request.contextPath}/customer/imgs/Gemini_Generated_Image_c648fqc648fqc648.png" alt="">
                </div>
                <h1>MichiShop</h1>
            </a>
            <div class="nav__top-input">
                <form action="Products.jsp">
                    <input type="text" placeholder="Sản phẩm bạn cần tìm..." class="--no-border --no-outline">
                    <button class="--no-border --no-outline">
                        <i class="fa-solid fa-magnifying-glass"></i>
                        Tìm kiếm
                    </button>
                </form>
            </div>
            <div class="nav__top-actions">
                <ul>
                    <li class="hovercart">
                        <a href="Cart.jsp" class="--color4"><i class="fa-solid fa-cart-shopping --size20"></i></a>
                        <div class="header-cart">
                            <ul>
                                <li>
                                    <div class="item">
                                        <div class="img-container">
                                            <img src="https://i.pinimg.com/1200x/4b/bb/02/4bbb0223ba678e97772d02949e5f89ca.jpg" alt="">
                                        </div>
                                        <p>Sữa chua hy lạp</p>
                                        <p class="--weight600 --color6">199.000₫</p>
                                    </div>
                                </li>
                                <li>
                                    <div class="item">
                                        <div class="img-container">
                                            <img src="https://i.pinimg.com/1200x/4b/bb/02/4bbb0223ba678e97772d02949e5f89ca.jpg" alt="">
                                        </div>
                                        <p>Sữa chua hy lạp</p>
                                        <p class="--weight600 --color6">199.000₫</p>
                                    </div>
                                </li>
                                <li>
                                    <div class="item">
                                        <div class="img-container">
                                            <img src="https://i.pinimg.com/1200x/4b/bb/02/4bbb0223ba678e97772d02949e5f89ca.jpg" alt="">
                                        </div>
                                        <p>Sữa chua hy lạp</p>
                                        <p class="--weight600 --color6">199.000₫</p>
                                    </div>
                                </li>
                                <li>
                                    <div class="item">
                                        <div class="img-container">
                                            <img src="https://i.pinimg.com/1200x/4b/bb/02/4bbb0223ba678e97772d02949e5f89ca.jpg" alt="">
                                        </div>
                                        <p>Sữa chua hy lạp</p>
                                        <p class="--weight600 --color6">199.000₫</p>
                                    </div>
                                </li>
                            </ul>
                            <div class="sub-info">
                                <p>36 sản phẩm</p>
                                <a href="Cart.jsp">Xem giỏ hàng</a>
                            </div>
                        </div>
                    </li>
                    <li><a href="Inform.jsp" class="--color4"><i class="fa-solid fa-bell --size20"></i></a><div class="notif-count">2</div></li>
                    <li class="hover-avt">
                        <div class="container">
                            <a href="Profile.jsp" class="--color4"><i class="fa-solid fa-user-ninja --size20"></i></a>
                            <ul class="avt-options">
                                <li onclick="window.location.href='Profile.jsp'">
                                    <div class="avt-container">
                                        <img src="https://i.pinimg.com/736x/5f/83/3d/5f833de6a6b1d8032037b6a24a5321b6.jpg" alt="">
                                    </div>
                                    <h4>Nguyễn Văn A</h4>
                                </li>
                                <li>
                                    <button onclick="window.location.href='../../index.jsp'">Đăng xuất</button>
                                </li>
                            </ul>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
        <div class="nav__line"></div>
        <div class="nav__bottom">
            <ul>
                <li><a href="${pageContext.request.contextPath}/home" class="active">Trang chủ</a></li>
                <li><a href="${pageContext.request.contextPath}/product">Sản phẩm</a></li>
                <li><a href="${pageContext.request.contextPath}/customer/pages/Voucher.jsp">Khuyến mãi</a></li>
                <li><a href="${pageContext.request.contextPath}/customer/pages/Blog.jsp">Cẩm nang</a></li>
                <li><a href="${pageContext.request.contextPath}/customer/pages/Contact.jsp">Liên hệ</a></li>
                <li><a href="${pageContext.request.contextPath}/customer/pages/About.jsp">về cửa hàng</a></li>
            </ul>
        </div>
    </nav>
</header>