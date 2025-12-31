<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MiChiShop</title>
    <link rel="stylesheet" href="../styles/pages/add__product.css">
    <link rel="stylesheet" href="../styles/components/header.css">
    <link rel="stylesheet" href="../styles/components/sidebar.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css">
    <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/echarts@5.5.0/dist/echarts.min.js"></script>

</head>

<body>
    <div class="categories__add__product main">
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
                        <a href="dashboard.jsp">
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
                        <a href="" class="active">
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
                <div class="content__header">
                    <a href="categories.jsp"><ion-icon name="chevron-back-outline"></ion-icon></a>
                    <h2 class="content__title">Thêm sản phẩm mới</h2>
                </div>
                <div class="content__body">
                    <form class="add__product__form">
                        <div class="form__input">
                            <p class="product__name">Tên sản phẩm</p>
                            <input type="text" id="product__name" name="product-name"
                                placeholder="Ví dụ: Sữa bột GrowPro" autocomplete="off">
                        </div>
                        <div class="form__input">
                            <p class="category">Danh mục</p>
                            <select id="category" name="category">
                                <option value="">-- Chọn Danh mục --</option>
                                <option value="milk">Sữa bột/tươi</option>
                                <option value="food">Thực phẩm ăn dặm</option>
                                <option value="supplement">Thực phẩm bổ sung</option>
                            </select>
                        </div>
                        <!-- <div class="two__column__input">
                            <div class="form__input">
                                <p class="product__price">Giá bán (VNĐ)</p>
                                <input type="text" id="product__price" name="product-price" placeholder="Ví dụ: 125.000"
                                    autocomplete="off">
                            </div>
                            <div class="form__input">
                                <p class="product__quantity">Số lượng</p>
                                <input type="text" id="product__quantity" name="product-quanttity"
                                    placeholder="Ví dụ: 20" autocomplete="off">
                            </div>
                        </div> -->
                        <div class="product-units">
                            <div class="product-units__list" id="unit-input-list">
                                <div class="unit-item" data-unit-id="1">
                                    <div class="form__input unit-item__unit">
                                        <p class="form__label">Đơn vị</p>
                                        <select name="unit-type[]" class="unit-item__select">
                                            <option value="le">Lẻ (Hộp/Gói)</option>
                                            <option value="loc">Lốc</option>
                                            <option value="thung">Thùng</option>
                                        </select>
                                    </div>
                                    <div class="form__input unit-item__qty">
                                        <p class="form__label">Số lượng</p>
                                        <input type="number" name="unit-qty[]" placeholder="Số lượng" value="1" min="1">
                                    </div>
                                    <div class="form__input unit-item__price">
                                        <p class="form__label">Giá nhập (VNĐ)</p>
                                        <input type="text" name="unit-price[]" placeholder="Giá nhập"
                                            autocomplete="off">
                                    </div>
                                    <button type="button" class="unit-item__remove-btn" style="display: none;">
                                        <ion-icon name="close-circle-outline"></ion-icon>
                                    </button>
                                </div>

                            </div>

                            <button type="button" id="add-unit-btn" class="product-units__add-btn">
                                <ion-icon name="add-circle-outline"></ion-icon>
                                Thêm đơn vị nhập khác
                            </button>
                        </div>
                        <template id="unit-item-template">
                            <div class="unit-item">
                                <div class="form__input unit-item__unit">
                                    <p class="form__label">Đơn vị</p>
                                    <select name="unit-type[]" class="unit-item__select">
                                        <option value="le">Lẻ (Hộp/Gói)</option>
                                        <option value="loc">Lốc</option>
                                        <option value="thung">Thùng</option>
                                    </select>
                                </div>
                                <div class="form__input unit-item__qty">
                                    <p class="form__label">Số lượng</p>
                                    <input type="number" name="unit-qty[]" value="1" min="1">
                                </div>
                                <div class="form__input unit-item__price">
                                    <p class="form__label">Giá nhập (VNĐ)</p>
                                    <input type="text" name="unit-price[]" placeholder="Giá nhập" autocomplete="off">
                                </div>
                                <button type="button" class="unit-item__remove-btn">
                                    <ion-icon name="close-circle-outline"></ion-icon>
                                </button>
                            </div>
                        </template>

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
                    </form>
                    <div class="choose__product__img">
                        <p class="choose__product__img__title">Thêm ảnh cho sản phẩm</p>
                        <div class="img-group__main">
                            <p class="img-group__title">1. Chọn ảnh chính cho sản phẩm (Tối đa 1)</p>
                            <div class="main-group__item">
                                <img src="../imgs/milk__powder.webp" alt="Sữa bột GrowPro (Ảnh chính)">
                            </div>
                        </div>

                        <div class="img-group__secondary">
                            <p class="img-group__title">2. Chọn ảnh phụ cho sản phẩm (Tối đa 4)</p>
                            <div class="img-group__container">
                                <div class="img-group__item secondary-item">
                                    <img src="../imgs/cereal.webp" alt="Bột ăn dặm Rau Củ">
                                </div>
                                <div class="img-group__item secondary-item">
                                    <img src="../imgs/cracker.webp" alt="Bánh ăn dặm Chuối Dẹt">
                                </div>
                                <div class="img-group__item secondary-item">
                                    <img src="../imgs/fresh__cheese.webp" alt="Phô mai tươi">
                                </div>
                                <div class="add__img">
                                    <ion-icon name="add-outline"></ion-icon>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="content__bottom">
                    <p class="bottom__title">Đảm bảo rằng sản phẩm của bạn là hợp pháp và không gây hậu quả nào</p>
                    <div class="bottom__button">
                        <a href="categories.jsp" class="cancel">Huỷ</a>
                        <a href="categories.jsp" class="add">Đưa vào danh sách</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- link to javascript for burger button -->
    <script src="../scripts/components/ExtendSidebar.js"></script>
    <script src="../scripts/components/addProductUnit.js"></script>
</body>

</html>