<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quên mật khẩu - MiChiShop</title>
    <link rel="stylesheet" href="admin/styles/pages/forgot__password.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"
          crossorigin="anonymous">
</head>

<body>
<div class="page-login">
    <header class="header">
        <nav class="nav">
            <div class="nav__top">
                <a class="nav__top-logo" href="#">
                    <div class="nav__logo-img">
                        <img src="admin/imgs/logo.png" alt="">
                    </div>
                    <h1>MichiShop</h1>
                </a>
                <div class="nav__top-input">
                    <form action="#">
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
                            <a href="#" class="--color4"><i class="fa-solid fa-cart-shopping --size20"></i></a>
                        </li>
                        <li>
                            <a href="#" class="--color4"><i class="fa-solid fa-bell --size20"></i></a>
                        </li>
                        <li class="hover-avt --is-login">
                            <a href="#" class="--color4"><i class="fa-solid fa-user-ninja --size20"></i></a>
                        </li>
                        <li class="login-btn --is-not-login"><a href="./index.jsp">Đăng nhập</a></li>
                    </ul>
                </div>
            </div>
            <div class="nav__line"></div>
            <div class="nav__bottom">
                <ul>
                    <li><a href="customer/pages/Home.jsp" class="">Trang chủ</a></li>
                    <li><a href="customer/pages/Products.jsp">Sản phẩm</a></li>
                    <li><a href="customer/pages/Voucher.jsp">Khuyến mãi</a></li>
                    <li><a href="customer/pages/Blog.jsp">Cẩm nang</a></li>
                    <li><a href="customer/pages/Contact.jsp">Liên hệ</a></li>
                    <li><a href="customer/pages/About.jsp">Về cửa hàng</a></li>
                </ul>
            </div>
        </nav>
    </header>
    <main class="main-content">
        <div class="welcome-section">
            <h1>Chào mừng đến với MichiShop</h1>
            <p>Nơi cung cấp sữa, thực phẩm dinh dưỡng tốt nhất cho bé yêu </p>
            <div class="product-showcase">
                <img src="admin/imgs/michishop.png" alt="MichiShop - Dinh dưỡng cho bé"
                     class="product-showcase__banner-image">
            </div>
            <p class="welcome-section__promotion-text">Khám phá ngay các sản phẩm, ưu đãi hấp dẫn cùng MichiShop!</p>
        </div>

        <div class="form-section">

            <form id="reset-step-1"
                  class="reset-form ${step == null || step == 1 ? 'reset-form--active' : 'reset-form--hidden'}"
                  action="enter-email" method="post">
                <p class="reset-form__instruction">Vui lòng nhập Email để nhận mã xác minh.</p>
                <div class="input-group">
                    <label for="reset-email" class="input-group__label">Email</label>
                    <input type="email" id="reset-email" name="email" placeholder="" class="input-group__input" autocomplete="off" required>
                </div>
                <c:if test="${not empty error}">
                    <p class="text-danger">${error}</p>
                </c:if>
                <button type="submit" class="submit-button">Gửi yêu cầu</button>
                <a href="index.jsp" class="reset-form__link">Quay lại Đăng nhập</a>
            </form>

            <form id="verify-step-2" class="reset-form ${step == 2 ? 'reset-form--active' : 'reset-form--hidden'}"
                  action="verify" method="post">
                <h2 class="reset-form__title">Nhập mã OTP</h2>
                <p class="reset-form__instruction">Nhập 6 số OTP được gửi tới email: <b
                        id="email-display-header">${email != null ? email : sessionScope.otp_email}</b></p>

                <div class="otp-input-group">
                    <div class="otp-input-group__inputs">
                        <input type="text" maxlength="1" class="otp-input-group__input" name="d1" autocomplete="off">
                        <input type="text" maxlength="1" class="otp-input-group__input" name="d2" autocomplete="off">
                        <input type="text" maxlength="1" class="otp-input-group__input" name="d3" autocomplete="off">
                        <input type="text" maxlength="1" class="otp-input-group__input" name="d4" autocomplete="off">
                        <input type="text" maxlength="1" class="otp-input-group__input" name="d5" autocomplete="off">
                        <input type="text" maxlength="1" class="otp-input-group__input" name="d6" autocomplete="off">
                    </div>
                </div>

                <c:if test="${not empty error}">
                    <p class="text-danger">${error}</p>
                </c:if>
                <button type="submit" class="submit-button" data-next-step="2">Xác minh</button>
                <a href="resend-otp?email=${email}" class="reset-form__link reset-form__link--resend">Gửi lại mã OTP</a>
            </form>

            <form id="reset-step-3" class="reset-form ${step == 3 ? 'reset-form--active' : 'reset-form--hidden'}"
                  action="change-password" method="post">
                <input type="hidden" name="email" value="${sessionScope.otp_email}">
                <p class="reset-form__instruction">Thiết lập mật khẩu mới cho tài khoản của bạn.</p>
                <div class="input-group password-wrapper">
                    <label for="reg-password" class="input-group__label">Mật khẩu mới</label>
                    <input type="password" id="reg-password" name="new_password" placeholder=""
                           class="input-group__input">
                    <i class="fa-solid fa-eye-slash toggle-password" data-target="reg-password"></i>
                </div>
                <div class="input-group password-wrapper">
                    <label for="reg-password" class="input-group__label">Xác nhận mật khẩu mới</label>
                    <input type="password" id="reg-confirm-password" name="confirm_new_password"
                           placeholder="" class="input-group__input">
                    <i class="fa-solid fa-eye-slash toggle-password" data-target="reg-confirm-password"></i>
                </div>
                <c:if test="${not empty error}">
                    <p class="text-danger">${error}</p>
                </c:if>
                <button type="submit" class="submit-button submit-button--final">Đặt lại Mật khẩu</button>
            </form>

            <form id="reset-step-4" class="reset-form ${step == 4 ? 'reset-form--active' : 'reset-form--hidden'}">
                <h2 class="reset-form__title">Cập nật mật khẩu thành công!</h2>
                <p class="reset-form__instruction reset-form__instruction--success">Mật khẩu mới đã được áp dụng.</p>
                <a href="index.jsp" class="submit-button">Đi đến đăng nhập</a>
            </form>

        </div>
    </main>
</div>
<footer class="site-footer">
    <div class="site-footer__top">

        <div class="site-footer__col site-footer__col--1">
            <div class="site-footer__col1-top">

                <div class="site-footer__col1-top-logo">
                    <i class="fa-solid fa-shop"></i>
                    <h3 class="--size20">MichiShop</h3>
                </div>
                <p class="site-footer__text">MiChiShop – Bé khỏe, mẹ vui, cả nhà hạnh phúc</p>

            </div>

            <div class="site-footer__col1-bottom">
                <h3 class="site-footer__heading">Về cửa hàng</h3>
                <p class="site-footer__text">MichiShop luôn muốn mang đến khách hàng những sản phẩm chất lượng và uy
                    tín</p>
            </div>
        </div>

        <div class="site-footer__col site-footer__col--2">
            <h3 class="site-footer__heading">Liên hệ</h3>
            <ul class="site-footer__list">
                <li class="site-footer__list-item">Hotline: 0901 234 567</li>
                <li class="site-footer__list-item">Địa chỉ: 123 Nguyễn Văn Cừ, TP.HCM</li>
                <li class="site-footer__list-item">Giờ mở cửa: 8h - 20h</li>
            </ul>
        </div>

        <div class="site-footer__col site-footer__col--3">
            <h3 class="site-footer__heading">Liên kết nhanh</h3>
            <ul class="site-footer__list">
                <li class="site-footer__list-item"><a href="customer/pages/Home.jsp" class="site-footer__link">Trang
                    chủ</a>
                </li>
                <li class="site-footer__list-item"><a href="customer/pages/Products.jsp" class="site-footer__link">Sản
                    phẩm</a>
                </li>
                <li class="site-footer__list-item"><a href="customer/pages/Voucher.jsp" class="site-footer__link">Khuyến
                    mãi</a>
                </li>
                <li class="site-footer__list-item"><a href="customer/pages/Blog.jsp" class="site-footer__link">Cẩm
                    nang</a></li>
                <li class="site-footer__list-item"><a href="customer/pages/About.jsp" class="site-footer__link">Về
                    cửa
                    hàng</a>
                </li>
                <li class="site-footer__list-item"><a href="customer/pages/Contact.jsp" class="site-footer__link">Liên
                    hệ</a>
                </li>
            </ul>
        </div>

        <div class="site-footer__col site-footer__col--4">
            <div class="site-footer__form-newsletter">
                <h3 class="site-footer__heading">Đăng kí để nhận thêm thông tin</h3>
                <input type="text" placeholder="Để lại email của bạn..." class="site-footer__input">
                <button class="site-footer__button">Đăng kí!</button>
            </div>
        </div>

    </div>
    <div class="site-footer__line"></div>

    <div class="site-footer__bottom">
        <div class="site-footer__social-logos">
            <a href="https://facebook.com" target="_blank" rel="noopener noreferrer" aria-label="Facebook"
               class="site-footer__social-link">
                <i class="fa-brands fa-facebook-f"></i>
            </a>
            <a href="https://instagram.com" target="_blank" rel="noopener noreferrer" aria-label="Instagram"
               class="site-footer__social-link">
                <i class="fa-brands fa-instagram"></i>
            </a>
            <a href="https://tiktok.com" target="_blank" rel="noopener noreferrer" aria-label="TikTok"
               class="site-footer__social-link">
                <i class="fa-brands fa-tiktok"></i>
            </a>
            <a href="https://youtube.com" target="_blank" rel="noopener noreferrer" aria-label="YouTube"
               class="site-footer__social-link">
                <i class="fa-brands fa-youtube"></i>
            </a>
        </div>
        <h4 class="site-footer__copyright">&copy; Copyright. All rights reserved.</h4>
    </div>
</footer>
<script src="./admin/scripts/components/forgot__password.js"></script>
<script src="./admin/scripts/components/showPassword.js"></script>
</body>

</html>