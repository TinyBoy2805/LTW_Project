<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MiChiShop</title>
    <link rel="stylesheet" href="../styles/pages/categories.css">
    <link rel="stylesheet" href="../styles/components/header.css">
    <link rel="stylesheet" href="../styles/components/sidebar.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css">
    <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/echarts@5.5.0/dist/echarts.min.js"></script>

</head>

<body>
    <div class="categories main">
        <aside class="sidebar">
            <% request.setAttribute("activePage", "categories"); %>
            <%@ include file="../components/sidebar.jsp" %>
        </aside>
        <div class="container">
            <%@ include file="../components/header.jsp" %>
 
            <!-- contert -->
            <div class="container__content">
                <div class="sticky__header">
                    <h2 class="content__title">Kho Hàng</h2>
                    <div class="content__header">
                        <div class="search__filter">
                            <input type="text" placeholder="Tìm kiếm sản phẩm">
                            <div class="search__box">
                                <ion-icon name="search-outline" class="search__icon"></ion-icon>
                                <div class="line">
                                </div>
                                <div class="filter__wrapper">
                                    <button class="filter__button" id="product__filter__btn">
                                        <ion-icon name="funnel-outline"></ion-icon>
                                        Lọc
                                    </button>
                                    <div class="filter__frame hidden" id="product__filter__frame">
                                        <h4 class="filter__frame__title">Bộ Lọc Sản Phẩm</h4>
                                        <div class="filter__group">
                                            <label for="filter__category">Danh mục:</label>
                                            <select id="filter__category">
                                                <option value="all">Tất cả</option>
                                                <option value="milk">Sữa bột/tươi</option>
                                                <option value="food">Thực phẩm ăn dặm</option>
                                            </select>
                                        </div>
                                        <div class="filter__group">
                                            <label for="filter__status">Trạng thái:</label>
                                            <select id="filter__status">
                                                <option value="active">Đang bán</option>
                                                <option value="oos">Hết hàng</option>
                                                <option value="low">Sắp hết hàng</option>
                                            </select>
                                        </div>
                                        <div class="filter__group">
                                            <label for="filter__stock">Tồn kho:</label>
                                            <input type="number" id="filter__stock" placeholder=">= Số lượng">
                                        </div>
                                        <div class="filter__actions">
                                            <button class="clear__button">Xóa lọc</button>
                                            <button class="apply__button">Áp dụng</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="action__btn">
                            <button class="stock-history-button" id="stock__history__btn">
                                <ion-icon name="time-outline"></ion-icon>
                                Lịch sử nhập kho
                            </button>
                            <a href="add__product.jsp">
                                <button class="add__button">
                                    <ion-icon name="add-outline"></ion-icon>
                                    Sản phẩm mới
                                </button>
                            </a>
                        </div>
                    </div>
                </div>

                <div class="content__grid__product">
                    <div class="product__card">
                        <div class="product__img">
                            <img src="../imgs/milk__powder.webp" alt="Sữa bột GrowPro (1-3 tuổi)" />
                            <span class="product__badge">Số lượng: 10</span>
                        </div>
                        <div class="product__info">
                            <p class="product__name">Sữa bột GrowPro (1-3 tuổi)</p>
                            <div class="product__button">
                                <p class="product__price">749.000đ</p>
                                <a href="product__details.jsp"><button class="detail-button">Chi tiết</button></a>
                            </div>
                        </div>
                    </div>
                    <div class="product__card">
                        <div class="product__img">
                            <img src="../imgs/cereal.webp" alt="Bột ăn dặm Rau Củ Sơ Sinh" />
                            <span class="product__badge">Số lượng: 20</span>
                        </div>
                        <div class="product__info">
                            <p class="product__name">Bột ăn dặm Rau Củ Sơ Sinh</p>
                            <div class="product__button">
                                <p class="product__price">125.000đ</p>
                                <a href="product__details.jsp"><button class="detail-button">Chi tiết</button></a>
                            </div>
                        </div>
                    </div>
                    <div class="product__card">
                        <div class="product__img">
                            <img src="../imgs/milk.webp" alt="Sữa tươi Organic không đường (Thùng)" />
                            <span class="product__badge">Số lượng: 15</span>
                        </div>
                        <div class="product__info">
                            <p class="product__name">Sữa tươi Organic không đường (Thùng)</p>
                            <div class="product__button">
                                <p class="product__price">320.000đ</p>
                                <a href="product__details.jsp"><button class="detail-button">Chi tiết</button></a>
                            </div>
                        </div>
                    </div>
                    <div class="product__card">
                        <div class="product__img">
                            <img src="../imgs/whey.webp" alt="Váng sữa tự nhiên vị Dâu" />
                            <span class="product__badge">Số lượng: 50</span>
                        </div>
                        <div class="product__info">
                            <p class="product__name">Váng sữa tự nhiên vị Dâu</p>
                            <div class="product__button">
                                <p class="product__price">45.000đ</p>
                                <a href="product__details.jsp"><button class="detail-button">Chi tiết</button></a>
                            </div>
                        </div>
                    </div>
                    <div class="product__card">
                        <div class="product__img">
                            <img src="../imgs/cracker.webp" alt="Bánh ăn dặm Chuối Dẹt (9M+)" />
                            <span class="product__badge">Số lượng: 75</span>
                        </div>
                        <div class="product__info">
                            <p class="product__name">Bánh ăn dặm Chuối Dẹt (9M+)</p>
                            <div class="product__button">
                                <p class="product__price">70.000đ</p>
                                <a href="product__details.jsp"><button class="detail-button">Chi tiết</button></a>
                            </div>
                        </div>
                    </div>
                    <div class="product__card">
                        <div class="product__img">
                            <img src="../imgs/nut__milk.webp" alt="Sữa hạt Óc Chó & Hạnh Nhân" />
                            <span class="product__badge">Số lượng: 40</span>
                        </div>
                        <div class="product__info">
                            <p class="product__name">Sữa hạt Óc Chó & Hạnh Nhân</p>
                            <div class="product__button">
                                <p class="product__price">46.000đ</p>
                                <a href="product__details.jsp"><button class="detail-button">Chi tiết</button></a>
                            </div>
                        </div>
                    </div>
                    <div class="product__card">
                        <div class="product__img">
                            <img src="../imgs/bird__nest.jpg" alt="Yến sào chưng sẵn cho bé" />
                            <span class="product__badge">Số lượng: 32</span>
                        </div>
                        <div class="product__info">
                            <p class="product__name">Yến sào chưng sẵn cho bé</p>
                            <div class="product__button">
                                <p class="product__price">180.000đ</p>
                                <a href="product__details.jsp"><button class="detail-button">Chi tiết</button></a>
                            </div>
                        </div>
                    </div>
                    <div class="product__card">
                        <div class="product__img">
                            <img src="../imgs/fresh__cheese.webp" alt="Phô mai tươi vị Vanila" />
                            <span class="product__badge">Số lượng: 44</span>
                        </div>
                        <div class="product__info">
                            <p class="product__name">Phô mai tươi vị Vanila</p>
                            <div class="product__button">
                                <p class="product__price">55.000đ</p>
                                <a href="product__details.jsp"><button class="detail-button">Chi tiết</button></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="stock-history-overlay hidden" id="stock__history__overlay">
                <div class="stock-history-modal">
                    <div class="stock-history-modal__header">
                        <h3 class="stock-history-modal__title">Lịch sử nhập kho</h3>
                        <div class="stock-history-modal__close" id="stock__history__close">
                            <ion-icon name="close-outline"></ion-icon>
                        </div>
                    </div>
                    <div class="stock-history-modal__content">
                        <table class="history-table">
                            <thead class="history-table__header">
                                <tr>
                                    <th>#</th>
                                    <th>Mã SP</th>
                                    <th>Sản phẩm</th>
                                    <th>Số lượng nhập</th>
                                    <th>Ngày nhập</th>
                                </tr>
                            </thead>
                            <tbody class="history-table__body">
                                <tr>
                                    <td>1</td>
                                    <td>SP001</td>
                                    <td>Sữa bột GrowPro (1-3 tuổi)</td>
                                    <td>+50</td>
                                    <td>20/11/2025</td>
                                </tr>
                                <tr>
                                    <td>2</td>
                                    <td>SP005</td>
                                    <td>Bánh ăn dặm Chuối Dẹt (9M+)</td>
                                    <td>+100</td>
                                    <td>15/11/2025</td>
                                </tr>
                                <tr>
                                    <td>3</td>
                                    <td>SP003</td>
                                    <td>Sữa tươi Organic không đường (Thùng)</td>
                                    <td>+40</td>
                                    <td>10/11/2025</td>
                                </tr>
                                <tr>
                                    <td>4</td>
                                    <td>SP007</td>
                                    <td>Yến sào chưng sẵn cho bé</td>
                                    <td>+60</td>
                                    <td>05/11/2025</td>
                                </tr>
                            </tbody>
                        </table>
                        <div class="history-table__pagination">
                            <button class="pagination__btn disabled">Trước</button>
                            <span class="pagination__info">Trang 1/5</span>
                            <button class="pagination__btn">Sau</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- link to javascript for burger button -->
    <script src="../scripts/components/ExtendSidebar.js"></script>
    <script src="../scripts/components/filter.js"></script>
    <script src="../scripts/components/stockHistory.js"></script>
</body>

</html>