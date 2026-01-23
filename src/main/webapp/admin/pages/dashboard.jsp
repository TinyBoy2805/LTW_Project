<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MiChiShop</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/styles/pages/dashboard.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/styles/components/header.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/styles/components/sidebar.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css">
    <script src="https://cdn.jsdelivr.net/npm/echarts@5.5.0/dist/echarts.min.js"></script>
    <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>

</head>

<body>
    <div class="dashboard main">
        <aside class="sidebar">
            <% request.setAttribute("activePage", "dashboard"); %>
            <%@ include file="../components/sidebar.jsp" %>
        </aside>
        <div class="container">
            <%@ include file="../components/header.jsp" %>

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
                                <p id="today-revenue" class="value__highlight">

<%--                                12,5 Triệu--%>
                                </p>
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
                                <p id="month-revenue" class="value">
<%--                                360,36 Triệu--%>
                                </p>
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
                                <p id="year-revenue" class="value">
                                    ${yearRevenue}
<%--                                    12,4 Tỷ--%>
                                </p>
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
                        <tbody class="tbody-table">
<%--                            <tr>--%>
<%--                                <td class="numerical">1</td>--%>
<%--                                <td class="id">#614232</td>--%>
<%--                                <td class="name">Sữa tươi Vinamilk tiệt trùng</td>--%>
<%--                                <td class="origin"><img src="https://flagcdn.com/w40/vn.png" alt="Việt Nam"></td>--%>
<%--                                <td><span class="status status__instock --instock">Còn hàng</span></td>--%>
<%--                                <td class="price">245.000đ</td>--%>
<%--                            </tr>--%>
<%--                            <tr>--%>
<%--                                <td class="numerical">2</td>--%>
<%--                                <td class="id">#614246</td>--%>
<%--                                <td class="name">Sữa bột Gold IQ+</td>--%>
<%--                                <td class="origin"><img src="https://flagcdn.com/w40/us.png" alt="Mỹ"></td>--%>
<%--                                <td><span class="status status__instock --instock">Còn hàng</span></td>--%>
<%--                                <td>360.000đ</td>--%>
<%--                            </tr>--%>
<%--                            <tr>--%>
<%--                                <td class="numerical">3</td>--%>
<%--                                <td class="id">#614510</td>--%>
<%--                                <td class="name">Váng sữa hương Vani</td>--%>
<%--                                <td class="origin"><img src="https://flagcdn.com/w40/ru.png" alt="Nga"></td>--%>
<%--                                <td><span class="status status__waiting --pending">Chờ nhập hàng</span></td>--%>
<%--                                <td>120.000đ</td>--%>
<%--                            </tr>--%>
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
    <script src="${pageContext.request.contextPath}/admin/scripts/components/extendSidebar.js" defer></script>
    <script src="${pageContext.request.contextPath}/admin/scripts/dashboard/dashboard.js" defer></script>
<%--    <script src="${pageContext.request.contextPath}/admin/scripts/components/chart.js"></script>--%>
</body>

</html>
