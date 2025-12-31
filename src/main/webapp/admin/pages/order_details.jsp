<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MiChiShop</title>
    <link rel="stylesheet" href="../styles/pages/order_details.css">
    <link rel="stylesheet" href="../styles/components/header.css">
    <link rel="stylesheet" href="../styles/components/sidebar.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css">
    <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
</head>

<body>
<div class="order_details main">
    <aside class="sidebar">
        <%@ include file="../components/sidebar.jsp" %>
    </aside>
    <div class="container">
        <%@ include file="../components/header.jsp" %>
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
                            <p class="title">Thông báo</p>
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
            <a href="../../../../../index.html">
                <div class="icon">
                    <ion-icon name="exit-outline"></ion-icon>
                </div>
                <p class="title">Đăng xuất</p>
            </a>
        </div>
    </aside>
    <div class="container">
        <!-- header -->
        <div class="container__header">
            <!-- header left has sidebar expand button and hello message -->
            <div class="header__left">
                <div class="icon" id="menu__action">
                    <ion-icon name="menu-outline"></ion-icon>
                </div>
                <h3>Chào mừng trở lại, <span>MiChi Admin</span></h3>
            </div>
            <!-- header right has anouncement icon and the avatar of admin account -->
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
                                <div class="item__icon">
                                    <ion-icon name="bag-check-outline"></ion-icon>
                                </div>
                                <div class="item__content">
                                    <p class="item__text">
                                        <strong>Đơn hàng mới:</strong> Mã O-250725 vừa được tạo.
                                    </p>
                                    <span class="item__time">Vài giây trước</span>
                                </div>
                            </div>

                            <div class="notification__item new">
                                <div class="item__icon alert">
                                    <ion-icon name="alert-circle-outline"></ion-icon>
                                </div>
                                <div class="item__content">
                                    <p class="item__text">
                                        <strong>Cảnh báo tồn kho:</strong> Sữa Bột GrowPro chỉ còn 10 sản phẩm.
                                    </p>
                                    <span class="item__time">5 phút trước</span>
                                </div>
                            </div>

                            <div class="notification__item">
                                <div class="item__icon review">
                                    <ion-icon name="star-outline"></ion-icon>
                                </div>
                                <div class="item__content">
                                    <p class="item__text">
                                        Có <strong>1 đánh giá 5 sao</strong> mới cho Váng sữa.
                                    </p>
                                    <span class="item__time">1 giờ trước</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="avatar"><img src="../imgs/logo.png" alt="Avatar"></div>
            </div>
        </div>
        <!-- contert -->
        <div class="container__content">
            <!-- header incules name of section and the back button -->
            <div class="content__header">
                <a href="order.jsp">
                    <ion-icon name="chevron-back-outline"></ion-icon>
                </a>
                <h2 class="content__title">Chi tiết đơn hàng</h2>
            </div>
            <!-- First card about image of order and some info about order -->
            <div class="content__info">
                <div class="orders">
                    <div class="orders__img">
                        <img src="../imgs/milk__powder.webp" alt="Trà sữa"/>
                        <span class="orders__status confirm">Đã xác nhận</span>
                    </div>
                    <div class="orders__info">
                        <p class="orders__name">Sữa bột GrowPro (1-3 tuổi)<span class="orders__id">
                                O-15022-290725</span></p>
                        <div class="order-sumary">
                            <div class="order-sumary__details">
                                <p class="orders__price">Giá: 749.000đ</p>
                                <p class="orders__ship-fee">Vận chuyển: 25.000đ</p>
                                <p class="orders__voucher">Ưu đãi: -0đ</p>
                            </div>
                            <div class="order-sumary__total">
                                <p class="total__price">Tổng tiền: 774.000đ</p>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Second card about customer who buy this order -->
                <div class="customer">
                    <p class="customer__name">Nguyễn Thị Hồng Nhung</p>
                    <div class="customer__info">
                        <div class="info">
                            <p>Email:</p>
                            <p class="info-detail">nthnhung@gmail.com</p>
                        </div>
                        <div class="info">
                            <p>Số điện thoại:</p>
                            <p class="info-detail">0369 123 456</p>
                        </div>
                        <div class="info">
                            <p>Địa chỉ:</p>
                            <p class="info-detail">36/18, khu phố Tây, Thủ Đức, Thành phố Hồ Chí Minh</p>
                        </div>
                        <div class="info">
                            <p>Hình thức thanh toán:</p>
                            <p class="info-detail">Tiền mặt</p>
                        </div>
                        <div class="info">
                            <p>Ngày tạo đơn:</p>
                            <p class="info-detail">01/10/2025</p>
                        </div>
                        <div class="info">
                            <p>Ưu đãi:</p>
                            <p class="info-detail">Không</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- link to javascript for burger button -->
<script src="../scripts/components/extendSidebar.js"></script>
</body>

</html>