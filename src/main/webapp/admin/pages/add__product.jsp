<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MiChiShop</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/styles/pages/add__product.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/styles/components/header.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/styles/components/sidebar.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css">
    <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/echarts@5.5.0/dist/echarts.min.js"></script>
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/libraries/ckeditor/ckeditor.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/libraries/ckfinder/ckfinder.js"></script>
</head>

<body>
<div class="categories__add__product main">
    <aside class="sidebar">
        <% request.setAttribute("activePage", "product"); %>
        <%@ include file="../components/sidebar.jsp" %>
    </aside>
    <div class="container">
        <%@ include file="../components/header.jsp" %>

        <!-- contert -->
        <div class="container__content">
            <div class="content__header">
                <a href="${pageContext.request.contextPath}/admin/products">
                    <ion-icon name="chevron-back-outline"></ion-icon>
                </a>
                <h2 class="content__title">Thêm sản phẩm mới</h2>
            </div>
            <div class="content__body">
                <form class="add__product__form" action="${pageContext.request.contextPath}/admin/products/add-product"
                      method="post">
                    <div class="form__input">
                        <p class="product__name">Tên sản phẩm</p>
                        <input type="text" id="product__name" name="product-name"
                               placeholder="Ví dụ: Sữa bột GrowPro" autocomplete="off">
                    </div>
                    <div class="brand-category">
                        <div class="form__input">
                            <p class="category">Danh mục</p>
                            <select id="category" name="category">
                                <option value="Sữa bột công thức">Sữa bột công thức</option>
                                <option value="Sữa tươi tiệt trùng">Sữa tươi tiệt trùng</option>
                                <option value="Sữa đặc">Sữa đặc</option>
                                <option value="Sữa chua uống">Sữa chua uống</option>
                                <option value="Thực phẩm ăn dặm">Thực phẩm ăn dặm</option>
                            </select>
                        </div>
                        <div class="form__input">
                            <p class="brand">Thương hiệu</p>
                            <select id="brand" name="brand">
                                <option value="Meiji">Meiji</option>
                                <option value="Aptamil">Aptamil</option>
                                <option value="Nutifood">Nutifood</option>
                                <option value="Friso">Friso</option>
                                <option value="Enfamil">Enfamil</option>
                                <option value="Similac">Similac</option>
                                <option value="Vinamilk">Vinamilk</option>
                                <option value="Abbott">Abbott</option>
                                <option value="Morinaga">Morinaga</option>
                                <option value="Nestlé">Nestlé</option>
                            </select>
                        </div>
                    </div>

                    <div class="product-units">
                        <div class="product-units__list" id="unit-input-list">
                            <div class="form__input unit-item__qty">
                                <p class="form__label">Số lượng</p>
                                <input type="number" name="unit-qty[]" id="unit-quantity" placeholder="Số lượng" value="1" min="1">
                            </div>
                            <div class="form__input unit-item__price">
                                <p class="form__label">Giá nhập (VNĐ)</p>
                                <input type="text" name="unit-price[]" id="unit-import-price" placeholder="Giá nhập"
                                       autocomplete="off">
                            </div>
                        </div>
                    </div>

                    <div class="two__column__input">
                        <div class="form__input">
                            <p class="product__receipt__day">Ngày nhập kho</p>
                            <input type="date" id="product__receipt__day" name="product-receipt-day"
                                   autocomplete="off">
                        </div>
                        <div class="form__input">
                            <p class="product__expire__day">Ngày hết hạn</p>
                            <input type="date" id="product__expire__day" name="product-expire-day"
                                   autocomplete="off">
                        </div>
                    </div>

                    <div class="form__input description">
                        <p class="product__description">Mô tả sản phẩm</p>
                        <textarea type="" id="product__description" name="product-description"
                                  autocomplete="off"></textarea>
                    </div>

                    <input type="hidden" id="main-image-input" name="mainImage">

                    <div id="secondary-images-inputs-container"></div>
                </form>
                <div class="choose__product__img">
                    <p class="choose__product__img__title">Thêm ảnh cho sản phẩm</p>
                    <div class="img-group__main">
                        <p class="img-group__title">1. Chọn ảnh chính cho sản phẩm (Tối đa 1)</p>
                        <div class="main-group__item img-group__item">
                            <img src="" alt="" >
                        </div>
                        <button id="add-main-image" class="add-img" type="button">Thêm ảnh chính</button>
                    </div>

                    <div class="img-group__secondary">
                        <p class="img-group__title">2. Chọn ảnh phụ cho sản phẩm (Tối đa 4)</p>
                        <div class="img-group__container">
                            <div class="img-group__item secondary-item">
                                <img src="" alt="" >
                            </div>
                            <div class="img-group__item secondary-item">
                                <img src="" alt="" >
                            </div>
                            <div class="img-group__item secondary-item">
                                <img src="" alt="" >
                            </div>
                            <div class="add__img img-group__item secondary-item">
                                <img src="" alt="" >
                            </div>
                        </div>
                        <button id="add-secondary-image" class="add-img">Thêm ảnh phụ</button>
                    </div>
                </div>
            </div>
            <div class="content__bottom">
                <p class="bottom__title">Đảm bảo rằng sản phẩm của bạn là hợp pháp và không gây hậu quả nào</p>
                <div class="bottom__button">
                    <button id="move-to-list" class="add" type="submit">Đưa vào danh sách</button>
                </div>
            </div>
        </div>
    </div>
</div>


<script>
    const contextPath = '${pageContext.request.contextPath}';
</script>
<!-- link to javascript for burger button -->
<script src="${pageContext.request.contextPath}/admin/scripts/components/extendSidebar.js"></script>
<script src="${pageContext.request.contextPath}/admin/scripts/product/addProduct.js"></script>
</body>

</html>