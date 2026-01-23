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
        <% request.setAttribute("activePage", "order"); %>
        <%@ include file="../components/sidebar.jsp" %>
    </aside>
    <div class="container">
        <%@ include file="../components/header.jsp" %>

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