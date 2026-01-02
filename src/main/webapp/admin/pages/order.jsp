<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MiChiShop</title>
    <link rel="stylesheet" href="../styles/pages/order.css">
    <link rel="stylesheet" href="../styles/components/header.css">
    <link rel="stylesheet" href="../styles/components/sidebar.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css">
    <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
</head>

<body>
    <div class="order main">
        <aside class="sidebar">
            <% request.setAttribute("activePage", "order"); %>
            <%@ include file="../components/sidebar.jsp" %>
        </aside>
        <div class="container">
            <%@ include file="../components/header.jsp" %>
  
            <!-- contert -->
            <div class="container__content">
                <div class="sticky__header">
                    <h2 class="content__title">Đơn hàng</h2>
                    <!-- Search bar for seach orders -->
                    <div class="search__filter">
                        <input type="text" placeholder="Tìm kiếm đơn hàng">
                        <div class="search__box">
                            <ion-icon name="search-outline" class="search__icon"></ion-icon>
                            <div class="line">
                                    </div>
                            <div class="filter__wrapper">
                                <button class="filter__button" id="order__filter__btn">
                                    <ion-icon name="funnel-outline"></ion-icon>
                                    Lọc
                                </button>
                                <div class="filter__frame hidden" id="order__filter__frame">
                                    <h4 class="filter__frame__title">Bộ Lọc Đơn Hàng</h4>
                                    <div class="filter__group">
                                        <label for="filter__order__status">Trạng thái:</label>
                                        <select id="filter__order__status">
                                            <option value="all">Tất cả</option>
                                            <option value="pending">Chờ xác nhận</option>
                                            <option value="shipping">Đang giao hàng</option>
                                            <option value="completed">Hoàn thành</option>
                                            <option value="cancelled">Đã hủy</option>
                                        </select>
                                    </div>
                                    <div class="filter__group">
                                        <label for="filter__order__date">Ngày đặt hàng:</label>
                                        <input type="date" id="filter__order__date__from" title="Từ ngày">
                                    </div>
                                    <div class="filter__group">
                                        <label for="filter__price__min">Tổng tiền (VNĐ):</label>
                                        <input type="number" id="filter__price__min" placeholder="Từ">
                                        <input type="number" id="filter__price__max" placeholder="Đến"
                                            style="margin-top: 5px;">
                                    </div>
                                    <div class="filter__actions">
                                        <button class="clear__button">Xóa lọc</button>
                                        <button class="apply__button">Áp dụng</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                <!-- List of some orders available -->
                <div class="order__list">
                    <div class="order__card">
                        <div class="order__img">
                            <img src="../imgs/milk__powder.webp" alt="Trà sữa" />
                            <span class="order__status confirm">Đã xác nhận</span>
                        </div>
                        <div class="order__detail">
                            <div class="detail__top">
                                <p class="order__name">Sữa bột GrowPro (1-3 tuổi)</p>
                                <p class="order__id">Mã đơn hàng: O-15022-290725</p>
                            </div>
                            <div class="detail__bottom">
                                <p class="order__delivery">Ngày giao hàng dự kiến: 12/10/2025</p>
                                <div class="order__actions">
                                    <p class="price">749.000đ</p>
                                    <a href="order_details.jsp"><button class="detail__button">Chi tiết</button></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="order__card">
                        <div class="order__img">
                            <img src="../imgs/cereal.webp" alt="Trà sữa" />
                            <span class="order__status shipping">Đang giao</span>
                        </div>
                        <div class="order__detail">
                            <div class="detail__top">
                                <p class="order__name">Bột ăn dặm Yến Mạch Cá Hồi</p>
                                <p class="order__id">Mã đơn hàng: O-15022-300725</p>
                            </div>
                            <div class="detail__bottom">
                                <p class="order__delivery">Ngày giao hàng dự kiến: 10/10/2025</p>
                                <div class="order__actions">
                                    <p class="price">125.000đ</p>
                                    <a href="order_details.jsp"><button class="detail__button">Chi tiết</button></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="order__card">
                        <div class="order__img">
                            <img src="../imgs/whey.webp" alt="Trà sữa" />
                            <span class="order__status deliveried">Đã giao</span>
                        </div>
                        <div class="order__detail">
                            <div class="detail__top">
                                <p class="order__name">Váng sữa tự nhiên vị Trái Cây</p>
                                <p class="order__id">Mã đơn hàng: O-15022-280725</p>
                            </div>
                            <div class="detail__bottom">
                                <p class="order__delivery">Ngày giao hàng: 05/10/2025</p>
                                <div class="order__actions">
                                    <p class="price">45.000đ</p>
                                    <a href="order_details.jsp"><button class="detail__button">Chi tiết</button></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="order__card">
                        <div class="order__img">
                            <img src="../imgs/milk.webp" alt="Trà sữa" />
                            <span class="order__status cancel">Đã hủy</span>
                        </div>
                        <div class="order__detail">
                            <div class="detail__top">
                                <p class="order__name">Sữa tươi Organic không đường</p>
                                <p class="order__id">Mã đơn hàng: O-15022-270725</p>
                            </div>
                            <div class="detail__bottom">
                                <p class="order__delivery">Ngày giao hàng dự kiến: 03/10/2025</p>
                                <div class="order__actions">
                                    <p class="price">160.000đ</p>
                                    <a href="order_details.jsp"><button class="detail__button">Chi tiết</button></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- link to javascript for burger button -->
    <script src="../scripts/components/ExtendSidebar.js"></script>
    <script src="../scripts/components/filter.js"></script>
</body>

</html>