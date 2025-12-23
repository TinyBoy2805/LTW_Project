<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.time.LocalDate" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MichiShop</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/customer/styles/index.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css" integrity="sha512-2SwdPD6INVrV/lHTZbO2nodKhrnDdJK9/kg2XD1r9uGqPo1cUbujc+IYdlYdEErWNu69gVcYgdxlmVmzTWnetw==" crossorigin="anonymous" referrerpolicy="no-referrer" />


</head>
<body>

    
    <div class="scroll-to-top-btn"><i class="fa-solid fa-circle-up"></i></div>



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
    <main class="main">

        <section class="main__hero-banner"> 

            <div class="main__hero-banner-content">

                <div class="main__hero-banner-content-sub1">
                    <p class="--weight550"><i class="fa-solid fa-shield"></i> Cửa hàng trách nhiệm & uy tín</p>
                    <h2><span>Sữa & Thực phẩm</span> dinh dưỡng cho trẻ nhỏ</h2>
                    <p>Chúng tôi đồng hành cùng hành trình khôn lớn của bé yêu – mang đến những sản phẩm sữa và thực phẩm dinh dưỡng chính hãng, an toàn và giàu yêu thương, để mỗi bữa ăn, mỗi giọt sữa đều trở thành nguồn năng lượng trong lành nuôi dưỡng tương lai khỏe mạnh và hạnh phúc cho con.</p>
                    <ul>
                        <li><a href="${pageContext.request.contextPath}/product" class="--color6">Khám phá sản phẩm của chúng tôi</a></li>
                        <li><a href="About.jsp" class="--color6"><i class="fa-solid fa-circle-info"></i></a></li>
                    </ul>
                </div>

                <div class="main__hero-banner-content-line"></div>
                
                <div class="main__hero-banner-content-sub2">
                    <ul>
                        <li>
                            <h4>${user_count_formatted}</h4>
                            <p>Người dùng tin cậy</p>
                        </li>
                        <li>
                            <h4>100%</h4>
                            <p>Cam kết sản phẩm an toàn</p>
                        </li>
                        <li>
                            <h4><i class="fa-solid fa-star"></i> ${avg_rating}</h4>
                            <p>Từ 3 nghìn đánh giá</p>
                        </li>
                    </ul>
                </div>

            </div>

            <div class="main__hero-banner-image">
                <div class="main__hero-banner-image-container">
                    <img src="${pageContext.request.contextPath}/customer/imgs/herobanner2.jpg" alt="">
                </div>
            </div>

        </section>

        <section class="main__categories">
            <h3>Danh mục sản phẩm</h3>
            <div class="main__categories-list">
                <button class="left-btn"><</button>
                <button class="right-btn">></button>
                <ul data-total="${categories.size()}">
                    <c:forEach var="c" items="${categories}">
                        <li><i class="fa-solid fa-icons"></i><a href="${pageContext.request.contextPath}/customer/pages/Products.jsp" title="Sữa bột">${c}</a></li>
                    </c:forEach>
                </ul>
            </div>
        </section>
<!-- <i class="fa-solid fa-gift"></i> -->
 <!-- <i class="fa-solid fa-money-bill"></i> -->
<%--        <i class="fa-regular fa-truck"></i>--%>




        <section class="main__vouchers">
            <h3>Ưu đãi -  Khuyến mãi</h3>
            <div class="main_vouchers-list">
                <ul>

                    <c:forEach var="v" items="${vouchers}">
                        <li>
                            <div class="voucher">
                                <c:set var="voucher_color" value="background: var(--c9)" scope="page"/>
                                <c:set var="voucher_text" value="phí ship"/>
                                <c:set var="voucher_icon" value="fa-regular fa-truck"/>
                                <c:if test="${v.voucher_type == 'DISCOUNT'}">
                                    <c:set var="voucher_color" value="background: var(--c7)" scope="page"/>
                                    <c:set var="voucher_text" value="giảm giá"/>
                                    <c:set var="voucher_icon" value="fa-solid fa-money-bill"/>
                                </c:if>

                                <div class="voucher__left" style="${voucher_color}">
                                    <p class="--size20">
                                        Ưu đãi ${voucher_text}
                                        <i class="${voucher_icon}"></i>
                                    </p>
                                    <p class="--size64 --weight700">-<fmt:formatNumber value="${v.discount_percentage}" type="number" maxFractionDigits="0" pattern="#,###"/>%</p>
                                    <p class="--size16">
                                        Áp dụng cho đơn từ
                                        <fmt:formatNumber value="${v.min_order_value}" type="number" maxFractionDigits="0" pattern="#,###"/> đ
                                    </p>
                                    <p class="left__info">còn lại: ${v.current_amount}</p>
                                </div>
                                <div class="voucher__right">
                                    <button type="button" onclick="">Nhận ưu đãi</button>
                                    <p>HSD: ${v.end_date}</p>
                                </div>
                            </div>
                        </li>
                    </c:forEach>


                </ul>
            </div>
        </section>


        <section class="main__trending">

            <div class="main__trending-tabs">
                <ul>
                    <li class="main__trending-tab active">Top tìm kiếm</li>
                    <li class="main__trending-tab">Top lượt bán</li>
                    <li class="main__trending-tab">Top đánh giá</li>
                    <div class="main__trending-tab-line"></div>
                </ul>
            </div>
            <!-- <div class="main__trending-line"></div> -->


            <div class="main__trending-content active">
                <ul class="main__trending-content-ul">
                    <li class="main__trending-content-ul-li">
                        <div class="product">
                            <div class="product__top">
                                <div class="product__image">
                                    <img src="https://i.pinimg.com/1200x/79/df/0d/79df0de0a96063735aca1c5d5c80ca26.jpg" alt="">
                                </div>
                            </div>

                            <div class="product__mid">
                                <h3>Sữa tươi thanh trùng</h3>
                                <div class="product__mid-sub1">
                                    <ul class="product__mid-sub1-stars">
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                    </ul>
                                    <p>98</p>
                                </div>

                                <div class="product__mid-sub2">
                                    <p>360.000đ</p>
                                    <p>Đã bán 3.6k+</p>
                                </div>
                            </div>

                            <div class="product__bottom">
                                <div class="product__bottom-actions">
                                    <button><i class="fa-solid fa-cart-plus"></i></button>
                                    <button>Mua ngay</button>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li class="main__trending-content-ul-li">
                        <div class="product">
                            <div class="product__top">
                                <div class="product__image">
                                    <img src="https://i.pinimg.com/1200x/79/df/0d/79df0de0a96063735aca1c5d5c80ca26.jpg" alt="">
                                </div>
                            </div>

                            <div class="product__mid">
                                <h3>Sữa tươi thanh trùng</h3>
                                <div class="product__mid-sub1">
                                    <ul class="product__mid-sub1-stars">
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                    </ul>
                                    <p>98</p>
                                </div>

                                <div class="product__mid-sub2">
                                    <p>360.000đ</p>
                                    <p>Đã bán 3.6k+</p>
                                </div>
                            </div>

                            <div class="product__bottom">
                                <div class="product__bottom-actions">
                                    <button><i class="fa-solid fa-cart-plus"></i></button>
                                    <button>Mua ngay</button>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li class="main__trending-content-ul-li">
                        <div class="product">
                            <div class="product__top">
                                <div class="product__image">
                                    <img src="https://i.pinimg.com/1200x/79/df/0d/79df0de0a96063735aca1c5d5c80ca26.jpg" alt="">
                                </div>
                            </div>

                            <div class="product__mid">
                                <h3>Sữa tươi thanh trùng</h3>
                                <div class="product__mid-sub1">
                                    <ul class="product__mid-sub1-stars">
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                    </ul>
                                    <p>98</p>
                                </div>

                                <div class="product__mid-sub2">
                                    <p>360.000đ</p>
                                    <p>Đã bán 3.6k+</p>
                                </div>
                            </div>

                            <div class="product__bottom">
                                <div class="product__bottom-actions">
                                    <button><i class="fa-solid fa-cart-plus"></i></button>
                                    <button>Mua ngay</button>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li class="main__trending-content-ul-li">
                        <div class="product">
                            <div class="product__top">
                                <div class="product__image">
                                    <img src="https://i.pinimg.com/1200x/79/df/0d/79df0de0a96063735aca1c5d5c80ca26.jpg" alt="">
                                </div>
                            </div>

                            <div class="product__mid">
                                <h3>Sữa tươi thanh trùng</h3>
                                <div class="product__mid-sub1">
                                    <ul class="product__mid-sub1-stars">
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                    </ul>
                                    <p>98</p>
                                </div>

                                <div class="product__mid-sub2">
                                    <p>360.000đ</p>
                                    <p>Đã bán 3.6k+</p>
                                </div>
                            </div>

                            <div class="product__bottom">
                                <div class="product__bottom-actions">
                                    <button><i class="fa-solid fa-cart-plus"></i></button>
                                    <button>Mua ngay</button>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li class="main__trending-content-ul-li">
                        <div class="product">
                            <div class="product__top">
                                <div class="product__image">
                                    <img src="https://i.pinimg.com/1200x/79/df/0d/79df0de0a96063735aca1c5d5c80ca26.jpg" alt="">
                                </div>
                            </div>

                            <div class="product__mid">
                                <h3>Sữa tươi thanh trùng</h3>
                                <div class="product__mid-sub1">
                                    <ul class="product__mid-sub1-stars">
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                    </ul>
                                    <p>98</p>
                                </div>

                                <div class="product__mid-sub2">
                                    <p>360.000đ</p>
                                    <p>Đã bán 3.6k+</p>
                                </div>
                            </div>

                            <div class="product__bottom">
                                <div class="product__bottom-actions">
                                    <button><i class="fa-solid fa-cart-plus"></i></button>
                                    <button>Mua ngay</button>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li class="main__trending-content-ul-li">
                        <div class="product">
                            <div class="product__top">
                                <div class="product__image">
                                    <img src="https://i.pinimg.com/1200x/79/df/0d/79df0de0a96063735aca1c5d5c80ca26.jpg" alt="">
                                </div>
                            </div>

                            <div class="product__mid">
                                <h3>Sữa tươi thanh trùng</h3>
                                <div class="product__mid-sub1">
                                    <ul class="product__mid-sub1-stars">
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                    </ul>
                                    <p>98</p>
                                </div>

                                <div class="product__mid-sub2">
                                    <p>360.000đ</p>
                                    <p>Đã bán 3.6k+</p>
                                </div>
                            </div>

                            <div class="product__bottom">
                                <div class="product__bottom-actions">
                                    <button><i class="fa-solid fa-cart-plus"></i></button>
                                    <button>Mua ngay</button>
                                </div>
                            </div>
                        </div>
                    </li>
                    
                </ul>
            </div>
            <div class="main__trending-content">
                <ul class="main__trending-content-ul">
                    <li class="main__trending-content-ul-li">
                        <div class="product">
                            <div class="product__top">
                                <div class="product__image">
                                    <img src="https://i.pinimg.com/1200x/79/df/0d/79df0de0a96063735aca1c5d5c80ca26.jpg" alt="">
                                </div>
                            </div>

                            <div class="product__mid">
                                <h3>Sữa tươi thanh trùng</h3>
                                <div class="product__mid-sub1">
                                    <ul class="product__mid-sub1-stars">
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                    </ul>
                                    <p>98</p>
                                </div>

                                <div class="product__mid-sub2">
                                    <p>360.000đ</p>
                                    <p>Đã bán 3.6k+</p>
                                </div>
                            </div>

                            <div class="product__bottom">
                                <div class="product__bottom-actions">
                                    <button><i class="fa-solid fa-cart-plus"></i></button>
                                    <button>Mua ngay</button>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li class="main__trending-content-ul-li">
                        <div class="product">
                            <div class="product__top">
                                <div class="product__image">
                                    <img src="https://i.pinimg.com/1200x/79/df/0d/79df0de0a96063735aca1c5d5c80ca26.jpg" alt="">
                                </div>
                            </div>

                            <div class="product__mid">
                                <h3>Sữa tươi thanh trùng</h3>
                                <div class="product__mid-sub1">
                                    <ul class="product__mid-sub1-stars">
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                    </ul>
                                    <p>98</p>
                                </div>

                                <div class="product__mid-sub2">
                                    <p>360.000đ</p>
                                    <p>Đã bán 3.6k+</p>
                                </div>
                            </div>

                            <div class="product__bottom">
                                <div class="product__bottom-actions">
                                    <button><i class="fa-solid fa-cart-plus"></i></button>
                                    <button>Mua ngay</button>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li class="main__trending-content-ul-li">
                        <div class="product">
                            <div class="product__top">
                                <div class="product__image">
                                    <img src="https://i.pinimg.com/1200x/79/df/0d/79df0de0a96063735aca1c5d5c80ca26.jpg" alt="">
                                </div>
                            </div>

                            <div class="product__mid">
                                <h3>Sữa tươi thanh trùng</h3>
                                <div class="product__mid-sub1">
                                    <ul class="product__mid-sub1-stars">
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                    </ul>
                                    <p>98</p>
                                </div>

                                <div class="product__mid-sub2">
                                    <p>360.000đ</p>
                                    <p>Đã bán 3.6k+</p>
                                </div>
                            </div>

                            <div class="product__bottom">
                                <div class="product__bottom-actions">
                                    <button><i class="fa-solid fa-cart-plus"></i></button>
                                    <button>Mua ngay</button>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li class="main__trending-content-ul-li">
                        <div class="product">
                            <div class="product__top">
                                <div class="product__image">
                                    <img src="https://i.pinimg.com/1200x/79/df/0d/79df0de0a96063735aca1c5d5c80ca26.jpg" alt="">
                                </div>
                            </div>

                            <div class="product__mid">
                                <h3>Sữa tươi thanh trùng</h3>
                                <div class="product__mid-sub1">
                                    <ul class="product__mid-sub1-stars">
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                    </ul>
                                    <p>98</p>
                                </div>

                                <div class="product__mid-sub2">
                                    <p>360.000đ</p>
                                    <p>Đã bán 3.6k+</p>
                                </div>
                            </div>

                            <div class="product__bottom">
                                <div class="product__bottom-actions">
                                    <button><i class="fa-solid fa-cart-plus"></i></button>
                                    <button>Mua ngay</button>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li class="main__trending-content-ul-li">
                        <div class="product">
                            <div class="product__top">
                                <div class="product__image">
                                    <img src="https://i.pinimg.com/1200x/79/df/0d/79df0de0a96063735aca1c5d5c80ca26.jpg" alt="">
                                </div>
                            </div>

                            <div class="product__mid">
                                <h3>Sữa tươi thanh trùng</h3>
                                <div class="product__mid-sub1">
                                    <ul class="product__mid-sub1-stars">
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                    </ul>
                                    <p>98</p>
                                </div>

                                <div class="product__mid-sub2">
                                    <p>360.000đ</p>
                                    <p>Đã bán 3.6k+</p>
                                </div>
                            </div>

                            <div class="product__bottom">
                                <div class="product__bottom-actions">
                                    <button><i class="fa-solid fa-cart-plus"></i></button>
                                    <button>Mua ngay</button>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li class="main__trending-content-ul-li">
                        <div class="product">
                            <div class="product__top">
                                <div class="product__image">
                                    <img src="https://i.pinimg.com/1200x/79/df/0d/79df0de0a96063735aca1c5d5c80ca26.jpg" alt="">
                                </div>
                            </div>

                            <div class="product__mid">
                                <h3>Sữa tươi thanh trùng</h3>
                                <div class="product__mid-sub1">
                                    <ul class="product__mid-sub1-stars">
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                    </ul>
                                    <p>98</p>
                                </div>

                                <div class="product__mid-sub2">
                                    <p>360.000đ</p>
                                    <p>Đã bán 3.6k+</p>
                                </div>
                            </div>

                            <div class="product__bottom">
                                <div class="product__bottom-actions">
                                    <button><i class="fa-solid fa-cart-plus"></i></button>
                                    <button>Mua ngay</button>
                                </div>
                            </div>
                        </div>
                    </li>
                    
                </ul>
            </div>
            <div class="main__trending-content">
                <ul class="main__trending-content-ul">
                    <li class="main__trending-content-ul-li">
                        <div class="product">
                            <div class="product__top">
                                <div class="product__image">
                                    <img src="https://i.pinimg.com/1200x/79/df/0d/79df0de0a96063735aca1c5d5c80ca26.jpg" alt="">
                                </div>
                            </div>

                            <div class="product__mid">
                                <h3>Sữa tươi thanh trùng</h3>
                                <div class="product__mid-sub1">
                                    <ul class="product__mid-sub1-stars">
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                    </ul>
                                    <p>98</p>
                                </div>

                                <div class="product__mid-sub2">
                                    <p>360.000đ</p>
                                    <p>Đã bán 3.6k+</p>
                                </div>
                            </div>

                            <div class="product__bottom">
                                <div class="product__bottom-actions">
                                    <button><i class="fa-solid fa-cart-plus"></i></button>
                                    <button>Mua ngay</button>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li class="main__trending-content-ul-li">
                        <div class="product">
                            <div class="product__top">
                                <div class="product__image">
                                    <img src="https://i.pinimg.com/1200x/79/df/0d/79df0de0a96063735aca1c5d5c80ca26.jpg" alt="">
                                </div>
                            </div>

                            <div class="product__mid">
                                <h3>Sữa tươi thanh trùng</h3>
                                <div class="product__mid-sub1">
                                    <ul class="product__mid-sub1-stars">
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                    </ul>
                                    <p>98</p>
                                </div>

                                <div class="product__mid-sub2">
                                    <p>360.000đ</p>
                                    <p>Đã bán 3.6k+</p>
                                </div>
                            </div>

                            <div class="product__bottom">
                                <div class="product__bottom-actions">
                                    <button><i class="fa-solid fa-cart-plus"></i></button>
                                    <button>Mua ngay</button>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li class="main__trending-content-ul-li">
                        <div class="product">
                            <div class="product__top">
                                <div class="product__image">
                                    <img src="https://i.pinimg.com/1200x/79/df/0d/79df0de0a96063735aca1c5d5c80ca26.jpg" alt="">
                                </div>
                            </div>

                            <div class="product__mid">
                                <h3>Sữa tươi thanh trùng</h3>
                                <div class="product__mid-sub1">
                                    <ul class="product__mid-sub1-stars">
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                    </ul>
                                    <p>98</p>
                                </div>

                                <div class="product__mid-sub2">
                                    <p>360.000đ</p>
                                    <p>Đã bán 3.6k+</p>
                                </div>
                            </div>

                            <div class="product__bottom">
                                <div class="product__bottom-actions">
                                    <button><i class="fa-solid fa-cart-plus"></i></button>
                                    <button>Mua ngay</button>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li class="main__trending-content-ul-li">
                        <div class="product">
                            <div class="product__top">
                                <div class="product__image">
                                    <img src="https://i.pinimg.com/1200x/79/df/0d/79df0de0a96063735aca1c5d5c80ca26.jpg" alt="">
                                </div>
                            </div>

                            <div class="product__mid">
                                <h3>Sữa tươi thanh trùng</h3>
                                <div class="product__mid-sub1">
                                    <ul class="product__mid-sub1-stars">
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                    </ul>
                                    <p>98</p>
                                </div>

                                <div class="product__mid-sub2">
                                    <p>360.000đ</p>
                                    <p>Đã bán 3.6k+</p>
                                </div>
                            </div>

                            <div class="product__bottom">
                                <div class="product__bottom-actions">
                                    <button><i class="fa-solid fa-cart-plus"></i></button>
                                    <button>Mua ngay</button>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li class="main__trending-content-ul-li">
                        <div class="product">
                            <div class="product__top">
                                <div class="product__image">
                                    <img src="https://i.pinimg.com/1200x/79/df/0d/79df0de0a96063735aca1c5d5c80ca26.jpg" alt="">
                                </div>
                            </div>

                            <div class="product__mid">
                                <h3>Sữa tươi thanh trùng</h3>
                                <div class="product__mid-sub1">
                                    <ul class="product__mid-sub1-stars">
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                    </ul>
                                    <p>98</p>
                                </div>

                                <div class="product__mid-sub2">
                                    <p>360.000đ</p>
                                    <p>Đã bán 3.6k+</p>
                                </div>
                            </div>

                            <div class="product__bottom">
                                <div class="product__bottom-actions">
                                    <button><i class="fa-solid fa-cart-plus"></i></button>
                                    <button>Mua ngay</button>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li class="main__trending-content-ul-li">
                        <div class="product">
                            <div class="product__top">
                                <div class="product__image">
                                    <img src="https://i.pinimg.com/1200x/79/df/0d/79df0de0a96063735aca1c5d5c80ca26.jpg" alt="">
                                </div>
                            </div>

                            <div class="product__mid">
                                <h3>Sữa tươi thanh trùng</h3>
                                <div class="product__mid-sub1">
                                    <ul class="product__mid-sub1-stars">
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                    </ul>
                                    <p>98</p>
                                </div>

                                <div class="product__mid-sub2">
                                    <p>360.000đ</p>
                                    <p>Đã bán 3.6k+</p>
                                </div>
                            </div>

                            <div class="product__bottom">
                                <div class="product__bottom-actions">
                                    <button><i class="fa-solid fa-cart-plus"></i></button>
                                    <button>Mua ngay</button>
                                </div>
                            </div>
                        </div>
                    </li>
                    
                </ul>
            </div>

            
        </section>
        
        <!-- ///////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
        <section class="main__today-suggestion">
            <h3 class="main__today-suggestion-heading">Gợi ý hôm nay</h3>
            <div class="main__today-suggestion-list">
                <ul class="main__today-suggestion-list-ul">
                    <li class="main__today-suggestion-list-ul-li">
                        <div class="product">
                            <div class="product__top">
                                <div class="product__image">
                                    <img src="https://i.pinimg.com/1200x/79/df/0d/79df0de0a96063735aca1c5d5c80ca26.jpg" alt="">
                                </div>
                            </div>

                            <div class="product__mid">
                                <h3>Sữa tươi thanh trùng</h3>
                                <div class="product__mid-sub1">
                                    <ul class="product__mid-sub1-stars">
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                    </ul>
                                    <p>98</p>
                                </div>

                                <div class="product__mid-sub2">
                                    <p>360.000đ</p>
                                    <p>Đã bán 3.6k+</p>
                                </div>
                            </div>

                            <div class="product__bottom">
                                <div class="product__bottom-actions">
                                    <button><i class="fa-solid fa-cart-plus"></i></button>
                                    <button>Mua ngay</button>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li class="main__today-suggestion-list-ul-li">
                        <div class="product">
                            <div class="product__top">
                                <div class="product__image">
                                    <img src="https://i.pinimg.com/1200x/79/df/0d/79df0de0a96063735aca1c5d5c80ca26.jpg" alt="">
                                </div>
                            </div>

                            <div class="product__mid">
                                <h3>Sữa tươi thanh trùng</h3>
                                <div class="product__mid-sub1">
                                    <ul class="product__mid-sub1-stars">
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                    </ul>
                                    <p>98</p>
                                </div>

                                <div class="product__mid-sub2">
                                    <p>360.000đ</p>
                                    <p>Đã bán 3.6k+</p>
                                </div>
                            </div>

                            <div class="product__bottom">
                                <div class="product__bottom-actions">
                                    <button><i class="fa-solid fa-cart-plus"></i></button>
                                    <button>Mua ngay</button>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li class="main__today-suggestion-list-ul-li">
                        <div class="product">
                            <div class="product__top">
                                <div class="product__image">
                                    <img src="https://i.pinimg.com/1200x/79/df/0d/79df0de0a96063735aca1c5d5c80ca26.jpg" alt="">
                                </div>
                            </div>

                            <div class="product__mid">
                                <h3>Sữa tươi thanh trùng</h3>
                                <div class="product__mid-sub1">
                                    <ul class="product__mid-sub1-stars">
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                    </ul>
                                    <p>98</p>
                                </div>

                                <div class="product__mid-sub2">
                                    <p>360.000đ</p>
                                    <p>Đã bán 3.6k+</p>
                                </div>
                            </div>

                            <div class="product__bottom">
                                <div class="product__bottom-actions">
                                    <button><i class="fa-solid fa-cart-plus"></i></button>
                                    <button>Mua ngay</button>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li class="main__today-suggestion-list-ul-li">
                        <div class="product">
                            <div class="product__top">
                                <div class="product__image">
                                    <img src="https://i.pinimg.com/1200x/79/df/0d/79df0de0a96063735aca1c5d5c80ca26.jpg" alt="">
                                </div>
                            </div>

                            <div class="product__mid">
                                <h3>Sữa tươi thanh trùng</h3>
                                <div class="product__mid-sub1">
                                    <ul class="product__mid-sub1-stars">
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                    </ul>
                                    <p>98</p>
                                </div>

                                <div class="product__mid-sub2">
                                    <p>360.000đ</p>
                                    <p>Đã bán 3.6k+</p>
                                </div>
                            </div>

                            <div class="product__bottom">
                                <div class="product__bottom-actions">
                                    <button><i class="fa-solid fa-cart-plus"></i></button>
                                    <button>Mua ngay</button>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li class="main__today-suggestion-list-ul-li">
                        <div class="product">
                            <div class="product__top">
                                <div class="product__image">
                                    <img src="https://i.pinimg.com/1200x/79/df/0d/79df0de0a96063735aca1c5d5c80ca26.jpg" alt="">
                                </div>
                            </div>

                            <div class="product__mid">
                                <h3>Sữa tươi thanh trùng</h3>
                                <div class="product__mid-sub1">
                                    <ul class="product__mid-sub1-stars">
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                    </ul>
                                    <p>98</p>
                                </div>

                                <div class="product__mid-sub2">
                                    <p>360.000đ</p>
                                    <p>Đã bán 3.6k+</p>
                                </div>
                            </div>

                            <div class="product__bottom">
                                <div class="product__bottom-actions">
                                    <button><i class="fa-solid fa-cart-plus"></i></button>
                                    <button>Mua ngay</button>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li class="main__today-suggestion-list-ul-li">
                        <div class="product">
                            <div class="product__top">
                                <div class="product__image">
                                    <img src="https://i.pinimg.com/1200x/79/df/0d/79df0de0a96063735aca1c5d5c80ca26.jpg" alt="">
                                </div>
                            </div>

                            <div class="product__mid">
                                <h3>Sữa tươi thanh trùng</h3>
                                <div class="product__mid-sub1">
                                    <ul class="product__mid-sub1-stars">
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                    </ul>
                                    <p>98</p>
                                </div>

                                <div class="product__mid-sub2">
                                    <p>360.000đ</p>
                                    <p>Đã bán 3.6k+</p>
                                </div>
                            </div>

                            <div class="product__bottom">
                                <div class="product__bottom-actions">
                                    <button><i class="fa-solid fa-cart-plus"></i></button>
                                    <button>Mua ngay</button>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li class="main__today-suggestion-list-ul-li">
                        <div class="product">
                            <div class="product__top">
                                <div class="product__image">
                                    <img src="https://i.pinimg.com/1200x/79/df/0d/79df0de0a96063735aca1c5d5c80ca26.jpg" alt="">
                                </div>
                            </div>

                            <div class="product__mid">
                                <h3>Sữa tươi thanh trùng</h3>
                                <div class="product__mid-sub1">
                                    <ul class="product__mid-sub1-stars">
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                    </ul>
                                    <p>98</p>
                                </div>

                                <div class="product__mid-sub2">
                                    <p>360.000đ</p>
                                    <p>Đã bán 3.6k+</p>
                                </div>
                            </div>

                            <div class="product__bottom">
                                <div class="product__bottom-actions">
                                    <button><i class="fa-solid fa-cart-plus"></i></button>
                                    <button>Mua ngay</button>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li class="main__today-suggestion-list-ul-li">
                        <div class="product">
                            <div class="product__top">
                                <div class="product__image">
                                    <img src="https://i.pinimg.com/1200x/79/df/0d/79df0de0a96063735aca1c5d5c80ca26.jpg" alt="">
                                </div>
                            </div>

                            <div class="product__mid">
                                <h3>Sữa tươi thanh trùng</h3>
                                <div class="product__mid-sub1">
                                    <ul class="product__mid-sub1-stars">
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                    </ul>
                                    <p>98</p>
                                </div>

                                <div class="product__mid-sub2">
                                    <p>360.000đ</p>
                                    <p>Đã bán 3.6k+</p>
                                </div>
                            </div>

                            <div class="product__bottom">
                                <div class="product__bottom-actions">
                                    <button><i class="fa-solid fa-cart-plus"></i></button>
                                    <button>Mua ngay</button>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li class="main__today-suggestion-list-ul-li">
                        <div class="product">
                            <div class="product__top">
                                <div class="product__image">
                                    <img src="https://i.pinimg.com/1200x/79/df/0d/79df0de0a96063735aca1c5d5c80ca26.jpg" alt="">
                                </div>
                            </div>

                            <div class="product__mid">
                                <h3>Sữa tươi thanh trùng</h3>
                                <div class="product__mid-sub1">
                                    <ul class="product__mid-sub1-stars">
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                    </ul>
                                    <p>98</p>
                                </div>

                                <div class="product__mid-sub2">
                                    <p>360.000đ</p>
                                    <p>Đã bán 3.6k+</p>
                                </div>
                            </div>

                            <div class="product__bottom">
                                <div class="product__bottom-actions">
                                    <button><i class="fa-solid fa-cart-plus"></i></button>
                                    <button>Mua ngay</button>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li class="main__today-suggestion-list-ul-li">
                        <div class="product">
                            <div class="product__top">
                                <div class="product__image">
                                    <img src="https://i.pinimg.com/1200x/79/df/0d/79df0de0a96063735aca1c5d5c80ca26.jpg" alt="">
                                </div>
                            </div>

                            <div class="product__mid">
                                <h3>Sữa tươi thanh trùng</h3>
                                <div class="product__mid-sub1">
                                    <ul class="product__mid-sub1-stars">
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                    </ul>
                                    <p>98</p>
                                </div>

                                <div class="product__mid-sub2">
                                    <p>360.000đ</p>
                                    <p>Đã bán 3.6k+</p>
                                </div>
                            </div>

                            <div class="product__bottom">
                                <div class="product__bottom-actions">
                                    <button><i class="fa-solid fa-cart-plus"></i></button>
                                    <button>Mua ngay</button>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li class="main__today-suggestion-list-ul-li">
                        <div class="product">
                            <div class="product__top">
                                <div class="product__image">
                                    <img src="https://i.pinimg.com/1200x/79/df/0d/79df0de0a96063735aca1c5d5c80ca26.jpg" alt="">
                                </div>
                            </div>

                            <div class="product__mid">
                                <h3>Sữa tươi thanh trùng</h3>
                                <div class="product__mid-sub1">
                                    <ul class="product__mid-sub1-stars">
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                    </ul>
                                    <p>98</p>
                                </div>

                                <div class="product__mid-sub2">
                                    <p>360.000đ</p>
                                    <p>Đã bán 3.6k+</p>
                                </div>
                            </div>

                            <div class="product__bottom">
                                <div class="product__bottom-actions">
                                    <button><i class="fa-solid fa-cart-plus"></i></button>
                                    <button>Mua ngay</button>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li class="main__today-suggestion-list-ul-li">
                        <div class="product">
                            <div class="product__top">
                                <div class="product__image">
                                    <img src="https://i.pinimg.com/1200x/79/df/0d/79df0de0a96063735aca1c5d5c80ca26.jpg" alt="">
                                </div>
                            </div>

                            <div class="product__mid">
                                <h3>Sữa tươi thanh trùng</h3>
                                <div class="product__mid-sub1">
                                    <ul class="product__mid-sub1-stars">
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                        <li class="product__mid-sub1-stars-item"><i class="fa-solid fa-star"></i></li>
                                    </ul>
                                    <p>98</p>
                                </div>

                                <div class="product__mid-sub2">
                                    <p>360.000đ</p>
                                    <p>Đã bán 3.6k+</p>
                                </div>
                            </div>

                            <div class="product__bottom">
                                <div class="product__bottom-actions">
                                    <button><i class="fa-solid fa-cart-plus"></i></button>
                                    <button>Mua ngay</button>
                                </div>
                            </div>
                        </div>
                    </li>
                </ul>
                <button class="main__today-suggestion-more">Xem thêm</button>
            </div>
        </section>

        <section class="main__rating">
            <form action="" class="main__rating-form">
                <h3 class="main__rating-form-heading">Đánh giá cửa hàng</h3>
                <fieldset>
                    <ul>
                        <li><i class="fa-solid fa-star"></i></li>
                        <li><i class="fa-solid fa-star"></i></li>
                        <li><i class="fa-solid fa-star"></i></li>
                        <li><i class="fa-solid fa-star"></i></li>
                        <li><i class="fa-solid fa-star"></i></li>
                    </ul>
                </fieldset>
                <fieldset>
                    <h4>Nhận xét</h4>
                    <textarea name="" id=""></textarea>
                </fieldset>
                <button>Gửi đánh giá</button>
            </form>    
        </section>


        
        <section class="main__contact">
            <h3>Các vấn đề thường gặp</h3>
            <div class="main__contact-list">
                <ul>
                    <li><a href="Contact.jsp">Hoàn trả sản phẩm</a></li>
                    <li><a href="Contact.jsp">Hoàn tiền</a></li>
                    <li><a href="Contact.jsp">Giảm giá sản phẩm</a></li>
                    <li><a href="Contact.jsp">Không thể liên hệ</a></li>
                    <li><a href="Contact.jsp">Lỗi mua hàng</a></li>
                </ul>
            </div>
        </section>



        



    </main>
    <footer class="footer">
        <div class="footer__top">

            <div class="footer__top-col1">
                <div class="footer__top-col1-top">

                    <div class="footer__top-col1-top-logo">
                        <i class="fa-solid fa-shop" ></i>
                        <h3 class="--size20">MichiShop</h3>
                    </div>
                    <p>MiChiShop – Bé khỏe, mẹ vui, cả nhà hạnh phúc</p>

                </div>

                <div class="footer__top-col1-bottom">
                    <h3>Về cửa hàng</h3>
                    <p>MichiShop luôn muốn mang đến khách hàng những sản phẩm chất lượng và uy tín</p>
                </div>
            </div>

            <div class="footer__top-col2">
                <h3>Liên hệ</h3>
                <ul>
                    <li>Hotline: 0901 234 567</li>
                    <li>Địa chỉ: 123 Nguyễn Văn Cừ, TP.HCM</li>
                    <li>Giờ mở cửa: 8h - 20h</li>
                </ul>
            </div>

            <div class="footer__top-col3">
                <h3>Liên kết nhanh</h3>
                <ul>
                    <li><a href="./Home.jsp">Trang chủ</a></li>
                    <li><a href="Products.jsp">Sản phẩm</a></li>
                    <li><a href="Voucher.jsp">Khuyến mãi</a></li>
                    <li><a href="Blog.jsp">Cẩm nang</a></li>
                    <li><a href="About.jsp">Về cửa hàng</a></li>
                    <li><a href="Contact.jsp">Liên hệ</a></li>
                </ul>
            </div>

            <div class="footer__top-col4">
                <div class="footer__top-col4-form">
                    <h3>Đăng kí để nhận thêm thông tin</h3>
                    <input type="text" placeholder="Để lại email của bạn...">
                    <button>Đăng kí!</button>
                </div>
            </div>

        </div>
        <div class="footer__line"></div>


        <div class="footer__bottom">
            <div class="footer__bottom-logos">
                <a href="https://facebook.com" target="_blank" rel="noopener noreferrer" aria-label="Facebook">
                    <i class="fa-brands fa-facebook-f"></i>
                </a>
                <a href="https://instagram.com" target="_blank" rel="noopener noreferrer" aria-label="Instagram">
                    <i class="fa-brands fa-instagram"></i>
                </a>
                <a href="https://tiktok.com" target="_blank" rel="noopener noreferrer" aria-label="TikTok">
                    <i class="fa-brands fa-tiktok"></i>
                </a>
                <a href="https://youtube.com" target="_blank" rel="noopener noreferrer" aria-label="YouTube">
                    <i class="fa-brands fa-youtube"></i>
                </a>
            </div>
            <h4>&copy; Copyright. All rights reserved.</h4>
        </div>

    </footer>

</body>
<script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
<script type="module" src="${pageContext.request.contextPath}/customer/scripts/main.js"></script>
<script type="module" src="${pageContext.request.contextPath}/customer/scripts/Home.js"></script>
</html>