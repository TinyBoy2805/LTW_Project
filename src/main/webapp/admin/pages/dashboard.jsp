<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MiChiShop</title>
    <link rel="stylesheet" href="../styles/pages/dashboard.css">
    <link rel="stylesheet" href="../styles/components/header.css">
    <link rel="stylesheet" href="../styles/components/sidebar.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css">
    <script src="https://cdn.jsdelivr.net/npm/echarts@5.5.0/dist/echarts.min.js"></script>
    <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>

</head>

<body>
    <div class="dashboard main">
        <!-- sidebar -->
        <aside class="sidebar">
            <!-- header inclue shop's logo and shop's name -->
            <div class="sidebar__header">
                <img src="../imgs/logo.png" alt="Logo">
                <h2>MiChiShop</h2>
            </div>
            <!-- list item of sidebar -->
            <div class="sidebar__list">
                <ul class="list">
                    <li class="list__item">
                        <a href="./dashboard.jsp" class="active">
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
                        <a href="${pageContext.request.contextPath}/khachhang">
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
                    <div class="icon"><ion-icon name="exit-outline"></ion-icon></div>
                    <p class="title">Đăng xuất</p>
                </a>
            </div>
        </aside>
        <div class="container">
            <!-- header -->
            <div class="container__header">
                <!-- header left has sidebar expand button and hello message -->
                <div class="header__left">
                    <div class="icon" id="menu__action"><ion-icon name="menu-outline"></ion-icon></div>
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
                                    <div class="item__icon"><ion-icon name="bag-check-outline"></ion-icon></div>
                                    <div class="item__content">
                                        <p class="item__text">
                                            <strong>Đơn hàng mới:</strong> Mã O-250725 vừa được tạo.
                                        </p>
                                        <span class="item__time">Vài giây trước</span>
                                    </div>
                                </div>

                                <div class="notification__item new">
                                    <div class="item__icon alert"><ion-icon name="alert-circle-outline"></ion-icon>
                                    </div>
                                    <div class="item__content">
                                        <p class="item__text">
                                            <strong>Cảnh báo tồn kho:</strong> Sữa Bột GrowPro chỉ còn 10 sản phẩm.
                                        </p>
                                        <span class="item__time">5 phút trước</span>
                                    </div>
                                </div>

                                <div class="notification__item">
                                    <div class="item__icon review"><ion-icon name="star-outline"></ion-icon></div>
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
                <!-- first, content has 3 card to revenue overview by day, month, quarter -->
                <h2 class="content__title">Tổng quan</h2>
                <div class="overview">
                    <div class="overview__header">
                        <p class="revenue">Doanh thu</p>
                        <p class="unit">Đơn vị: VNĐ</p>
                    </div>
                    <div class="overview__card">
                        <div class="card highlight">
                            <!-- Today revenue -->
                            <div class="card__header__highlight">
                                <p class="title__highlight">Hôm nay</p>
                                <ion-icon name="cash-outline" class="icon__highlight"></ion-icon>
                            </div>
                            <div class="card__data">
                                <p class="value__highlight">12,5 Triệu</p>
                                <div class="text__highlight">
                                    <p class="increase__highlight">↑ 15%</p>
                                    <span>So với ngày hôm qua</span>
                                </div>
                            </div>
                        </div>
                        <div class="card">
                            <!-- this month revenue -->
                            <div class="card__header">
                                <p class="title">Tháng 10</p>
                                <ion-icon name="cash-outline" class="icon"></ion-icon>
                            </div>
                            <div class="card__data">
                                <p class="value">360,36 Triệu</p>
                                <div class="text">
                                    <p class="decrease">↓ 36%</p>
                                    <span>So với tháng trước</span>
                                </div>
                            </div>
                        </div>
                        <div class="card">
                            <!-- this quarter revenue -->
                            <div class="card__header">
                                <p class="title">Quý 4</p>
                                <ion-icon name="cash-outline" class="icon"></ion-icon>
                            </div>
                            <div class="card__data">
                                <p class="value">12,4 Tỷ</p>
                                <div class="text">
                                    <p class="increase">↑ 7.4%</p>
                                    <span>So với quý trước</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- then, content has 2 card about chart -->
                <div class="chart">
                    <div class="chart__pie">
                        <!-- this card is pie chart for the number of sold products -->
                        <div class="header">
                            <p>Sản phẩm</p>
                        </div>
                        <div id="pie" style="width: 100%"></div>
                    </div>

                    <div class="chart__bar">
                        <!-- this card is bar chart for the revenue of the year -->
                        <div class="header">
                            <p>Biểu đồ doanh thu trong năm (triệu)</p>
                        </div>
                        <div id="bar" style=" width: 100%"></div>
                    </div>
                </div>

                <!-- last, content has a table about top product -->
                <div class="table">
                    <table>
                        <thead>
                            <tr>
                                <th>Thứ tự</th>
                                <th>Mã sản phẩm</th>
                                <th>Tên sản phẩm</th>
                                <th>Xuất xứ</th>
                                <th>Trạng thái</th>
                                <th>Đơn giá</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td class="numerical">1</td>
                                <td class="id">#614232</td>
                                <td class="name">Sữa tươi Vinamilk tiệt trùng</td>
                                <td class="origin"><img src="https://flagcdn.com/w40/vn.png" alt="Việt Nam"></td>
                                <td><span class="status status__instock --instock">Còn hàng</span></td>
                                <td class="price">245.000đ</td>
                            </tr>
                            <tr>
                                <td class="numerical">2</td>
                                <td class="id">#614246</td>
                                <td class="name">Sữa bột Gold IQ+</td>
                                <td class="origin"><img src="https://flagcdn.com/w40/us.png" alt="Mỹ"></td>
                                <td><span class="status status__instock --instock">Còn hàng</span></td>
                                <td>360.000đ</td>
                            </tr>
                            <tr>
                                <td class="numerical">3</td>
                                <td class="id">#614510</td>
                                <td class="name">Váng sữa hương Vani</td>
                                <td class="origin"><img src="https://flagcdn.com/w40/ru.png" alt="Nga"></td>
                                <td><span class="status status__waiting --pending">Chờ nhập hàng</span></td>
                                <td>120.000đ</td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="table__bottom">
                        <a href="categories.jsp"><button class="viewmore">Xem đầy đủ</button></a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- link to javascript for burger button -->
    <script src="../scripts/components/ExtendSidebar.js"></script>
    <script src="../scripts/components/chart.js"></script>
</body>

</html>
