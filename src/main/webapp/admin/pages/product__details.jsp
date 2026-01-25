<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MiChiShop</title>
    <link rel="stylesheet" href="../styles/pages/product__details.css">
    <link rel="stylesheet" href="../styles/components/header.css">
    <link rel="stylesheet" href="../styles/components/sidebar.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css">
    <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
</head>

<body>
    <div class="product_details main">
        <aside class="sidebar">
            <% request.setAttribute("activePage", "categories"); %>
            <%@ include file="../components/sidebar.jsp" %>
        </aside>
        <div class="container">
            <%@ include file="../components/header.jsp" %>
             
            <!-- contert -->
<%--            <div class="container__content">--%>
<%--                <div class="content__header">--%>
<%--                    <div class="header__title">--%>
<%--                        <a href="product.jsp" class="back__button"><ion-icon--%>
<%--                                name="chevron-back-outline"></ion-icon></a>--%>
<%--                        <h2 class="content__title">Chi tiết sản phẩm</h2>--%>
<%--                    </div>--%>
<%--                    <div class="header__actions">--%>
<%--                        <button class="action__button delete__button" id="delete__product__btn">Xóa sản phẩm</button>--%>
<%--                        <button class="action__button edit__button" id="edit__mode__btn">Chỉnh sửa</button>--%>
<%--                    </div>--%>
<%--                </div>--%>

<%--                <div class="detail__content__grid">--%>
<%--                    <div class="main__details__card card">--%>
<%--                        <h3 class="card__title">Thông Tin Cơ Bản</h3>--%>
<%--                        <form id="product__form" class="product__form">--%>
<%--                            <div class="product__gallery" data-disabled="true">--%>
<%--                                <div class="thumbnail__list">--%>
<%--                                    <img src="../imgs/milk__powder.webp" class="thumbnail active"--%>
<%--                                         data-img-src="../imgs/milk__powder.webp" alt="Thumbnail 1">--%>
<%--                                    <img src="../imgs/cereal.webp" class="thumbnail" data-img-src="../imgs/cereal.webp"--%>
<%--                                         alt="Thumbnail 2">--%>
<%--                                    <div class="thumbnail add__thumbnail disabled" id="add__image__btn">--%>
<%--                                        <ion-icon name="add-outline"></ion-icon>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>

<%--                            <div class="form__input">--%>
<%--                                <p class="label">Tên sản phẩm</p>--%>
<%--                                <input type="text" id="product__name" value="Sữa bột GrowPro (1-3 tuổi)"--%>
<%--                                    autocomplete="off" disabled>--%>
<%--                            </div>--%>
<%--                            <div class="form__input">--%>
<%--                                <p class="label">Mã SKU / Bar code</p>--%>
<%--                                <input type="text" id="product__sku" value="SP-MP-023" autocomplete="off" disabled>--%>
<%--                            </div>--%>
<%--                            <div class="two__column__input">--%>
<%--                                <div class="form__input">--%>
<%--                                    <p class="label">Danh mục</p>--%>
<%--                                    <select id="product__category" disabled>--%>
<%--                                        <option value="milk">Sữa bột/tươi</option>--%>
<%--                                        <option value="food">Thực phẩm ăn dặm</option>--%>
<%--                                    </select>--%>
<%--                                </div>--%>
<%--                                <div class="form__input">--%>
<%--                                    <p class="label">Giá bán (VNĐ)</p>--%>
<%--                                    <input type="text" id="product__price" value="749.000" autocomplete="off" disabled>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                            <div class="form__input description">--%>
<%--                                <p class="label">Mô tả sản phẩm</p>--%>
<%--                                <textarea id="product__description" rows="5"--%>
<%--                                    disabled>Sữa GrowPro giúp phát triển chiều cao và trí não cho trẻ từ 1 đến 3 tuổi. Cung cấp đầy đủ vitamin và khoáng chất thiết yếu.</textarea>--%>
<%--                            </div>--%>
<%--                        </form>--%>
<%--                    </div>--%>

<%--                    <div class="extra__details__column">--%>

<%--                        <div class="inventory__card card">--%>
<%--                            <h3 class="card__title">Quản Lý Kho Hàng</h3>--%>
<%--                            <div class="form__input">--%>
<%--                                <p class="label">Số lượng Tồn kho</p>--%>
<%--                                <input type="number" id="product__quantity" value="10" autocomplete="off" disabled>--%>
<%--                            </div>--%>
<%--                            <div class="form__input">--%>
<%--                                <p class="label">Vị trí Lưu trữ</p>--%>
<%--                                <input type="text" id="product__location" value="Kệ A, Khu 3" autocomplete="off"--%>
<%--                                    disabled>--%>
<%--                            </div>--%>
<%--                            <div class="two__column__input">--%>
<%--                                <div class="form__input">--%>
<%--                                    <p class="label">Ngày Nhập Kho</p>--%>
<%--                                    <input type="date" id="product__receipt__day" value="2025-01-01" autocomplete="off"--%>
<%--                                        disabled>--%>
<%--                                </div>--%>
<%--                                <div class="form__input">--%>
<%--                                    <p class="label">Ngày Hết Hạn (EXP)</p>--%>
<%--                                    <input type="date" id="product__expire__day" value="2026-01-01" autocomplete="off"--%>
<%--                                        disabled>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                            <div class="form__input">--%>
<%--                                <p class="label">Trạng thái Sản phẩm</p>--%>
<%--                                <select id="product__status" disabled>--%>
<%--                                    <option value="active">Đang bán</option>--%>
<%--                                    <option value="outofstock">Hết hàng</option>--%>
<%--                                    <option value="inactive">Ngừng kinh doanh</option>--%>
<%--                                </select>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
            <div class="container__content">
                <div class="content__header">
                    <div class="header__title">
                        <a href="product.jsp"><ion-icon name="chevron-back-outline"></ion-icon></a>
                        <h2 class="content__title">Chi tiết sản phẩm</h2>
                    </div>
                    <div class="header__actions">
                        <a class="action__button delete__button">Xoá</a>
                        <a class="action__button edit__button">Chỉnh sửa</a>
                    </div>
                </div>

                <div class="detail__content__grid">
                    <div class="card basic__info">
                        <h3 class="card__title">Thông tin cơ bản</h3>

                        <div class="product__gallery">
                            <img id="main__product__img" src="../imgs/milk__powder.webp">
                            <div class="thumbnail__list">
                                <img class="thumbnail active" src="../imgs/milk__powder.webp">
                                <img class="thumbnail" src="../imgs/cereal.webp">
                                <img class="thumbnail" src="../imgs/cracker.webp">
                                <img class="thumbnail" src="../imgs/fresh__cheese.webp">
                            </div>
                        </div>

                        <div class="form__input">
                            <span class="label">Tên sản phẩm</span>
                            <input disabled value="Sữa tươi Organic không đường">
                        </div>

                        <div class="two__column__input">
                            <div class="form__input">
                                <span class="label">Danh mục</span>
                                <input disabled value="Sữa tươi">
                            </div>
                            <div class="form__input">
                                <span class="label">Trạng thái</span>
                                <input disabled value="Đang kinh doanh">
                            </div>
                        </div>

                        <div class="form__input">
                            <span class="label">Mô tả</span>
                            <textarea disabled>Sữa tươi organic không đường, phù hợp cho trẻ em.</textarea>
                        </div>
                    </div>

                    <div class="card stock__management">
                        <h3 class="card__title">Quản lý kho hàng</h3>

                        <table class="stock__table">
                            <thead>
                            <tr>
                                <th>Số lô</th>
                                <th>Ngày nhập</th>
                                <th>Ngày hết hạn</th>
                                <th>Số lượng</th>
                                <th>Giá nhập</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>LO-001</td>
                                <td>01/01/2025</td>
                                <td>01/06/2025</td>
                                <td>20</td>
                                <td>280.000đ</td>
                            </tr>
                            <tr>
                                <td>LO-002</td>
                                <td>01/02/2025</td>
                                <td>01/08/2025</td>
                                <td>15</td>
                                <td>290.000đ</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- link to javascript for burger button -->
    <script src="../scripts/components/ExtendSidebar.js"></script>
</body>

</html>