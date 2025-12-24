<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MichiShop</title>
    <link rel="stylesheet" href="../styles/index.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css" integrity="sha512-2SwdPD6INVrV/lHTZbO2nodKhrnDdJK9/kg2XD1r9uGqPo1cUbujc+IYdlYdEErWNu69gVcYgdxlmVmzTWnetw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
    <div class="scroll-to-top-btn"><i class="fa-solid fa-circle-up"></i></div>
    <header class="header">
        <nav class="nav">
            <div class="nav__top">
                <a class="nav__top-logo" href="Home.jsp">
                    <div class="nav__logo-img">
                        <img src="../imgs/Gemini_Generated_Image_c648fqc648fqc648.png" alt="">
                    </div>
                    <h1>MichiShop</h1>
                </a>
                <div class="nav__top-input">
                    <form action="">
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
                            <a href="Cart.jsp" class="--color4"><i class="fa-solid fa-cart-shopping --size20"></i></a>
                            <div class="header-cart">
                                <ul>
                                    <li>
                                        <div class="item">
                                            <div class="img-container">
                                                <img src="https://i.pinimg.com/1200x/4b/bb/02/4bbb0223ba678e97772d02949e5f89ca.jpg" alt="">
                                            </div>
                                            <p>Sữa chua hy lạp</p>
                                            <p class="--weight600 --color6">199.000₫</p>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="item">
                                            <div class="img-container">
                                                <img src="https://i.pinimg.com/1200x/4b/bb/02/4bbb0223ba678e97772d02949e5f89ca.jpg" alt="">
                                            </div>
                                            <p>Sữa chua hy lạp</p>
                                            <p class="--weight600 --color6">199.000₫</p>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="item">
                                            <div class="img-container">
                                                <img src="https://i.pinimg.com/1200x/4b/bb/02/4bbb0223ba678e97772d02949e5f89ca.jpg" alt="">
                                            </div>
                                            <p>Sữa chua hy lạp</p>
                                            <p class="--weight600 --color6">199.000₫</p>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="item">
                                            <div class="img-container">
                                                <img src="https://i.pinimg.com/1200x/4b/bb/02/4bbb0223ba678e97772d02949e5f89ca.jpg" alt="">
                                            </div>
                                            <p>Sữa chua hy lạp</p>
                                            <p class="--weight600 --color6">199.000₫</p>
                                        </div>
                                    </li>
                                </ul>
                                <div class="sub-info">
                                    <p>36 sản phẩm</p>
                                    <a href="Cart.jsp">Xem giỏ hàng</a>
                                </div>
                            </div>
                        </li>
                        <li><a href="Inform.jsp" class="--color4"><i class="fa-solid fa-bell --size20"></i></a><div class="notif-count">2</div></li>
                       <li class="hover-avt">
                            <div class="container">
                                <a href="Profile.jsp" class="--color4"><i class="fa-solid fa-user-ninja --size20"></i></a>
                                <ul class="avt-options">
                                    <li onclick="window.location.href='./Profile.jsp'">
                                        <div class="avt-container">
                                            <img src="https://i.pinimg.com/736x/5f/83/3d/5f833de6a6b1d8032037b6a24a5321b6.jpg" alt="">
                                        </div>
                                        <h4>Nguyễn Văn A</h4>
                                    </li>
                                    <li>
                                        <button onclick="window.location.href='../../index.jsp'">Đăng xuất</button>
                                    </li>
                                </ul>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="nav__line"></div>
            <div class="nav__bottom">
                <ul>
                    <li><a href="Home.jsp" >Trang chủ</a></li>
                    <li><a href="Products.jsp">Sản phẩm</a></li>
                    <li><a href="./Voucher.jsp" class="active">Khuyến mãi</a></li>
                    <li><a href="Blog.jsp">Cẩm nang</a></li>
                    <li><a href="Contact.jsp">Liên hệ</a></li>
                    <li><a href="About.jsp">về cửa hàng</a></li>
                </ul>
            </div>
        </nav>
    </header>

    <main class="main">
        <!-- Hero Banner -->
        <section class="promo-banner">
            <div class="banner__content">
                <h1 class="banner__title">Khuyến mãi hấp dẫn</h1>
                <p class="banner__subtitle">Nhận ngay các ưu đãi đặc biệt khi mua sắm hôm nay!</p>
                <a href="#vouchers" class="banner__btn">
                    <i class="fa-solid fa-gift"></i>
                    Khám phá ngay
                </a>
            </div>
        </section>

        <!-- Filter / Tabs -->
        <section class="promo-filter" id="vouchers">
            <div class="filter__container">
                <ul class="filter__tabs">
                    <li class="filter__tab active" data-filter="all">
                        <i class="fa-solid fa-tags"></i>
                        <span>Tất cả</span>
                    </li>
                    <li class="filter__tab" data-filter="freeship">
                        <i class="fa-solid fa-truck-fast"></i>
                        <span>Freeship</span>
                    </li>
                    <li class="filter__tab" data-filter="percent">
                        <i class="fa-solid fa-percent"></i>
                        <span>Giảm %</span>
                    </li>
                    <li class="filter__tab" data-filter="money">
                        <i class="fa-solid fa-coins"></i>
                        <span>Giảm tiền</span>
                    </li>
                    <li class="filter__tab" data-filter="flash">
                        <i class="fa-solid fa-bolt"></i>
                        <span>Flash Sale</span>
                    </li>
                </ul>
            </div>
        </section>

        <!-- Voucher Grid -->
        <section class="promo-list">
            <div class="vouchers__grid">
                
                <!-- Freeship Voucher 1 -->
                <div class="voucher__card freeship">
                    <div class="voucher__badge hot">HOT</div>
                    <div class="voucher__header">
                        <div class="voucher__icon">
                            <i class="fa-solid fa-truck-fast"></i>
                        </div>
                        <span class="voucher__type">Freeship 0Đ</span>
                    </div>
                    <div class="voucher__body">
                        <h3 class="voucher__title">Miễn phí vận chuyển</h3>
                        <p class="voucher__desc">Áp dụng cho đơn hàng từ 100.000đ</p>
                        <div class="voucher__progress">
                            <div class="progress__bar">
                                <div class="progress__fill" style="width: 65%"></div>
                            </div>
                            <span class="progress__text">Đã dùng 65%</span>
                        </div>
                    </div>
                    <div class="voucher__footer">
                        <div class="voucher__code">
                            <span class="code__text">FREESHIP100</span>
                            <button class="code__copy" onclick="copyCode('FREESHIP100')">
                                <i class="fa-solid fa-copy"></i>
                            </button>
                        </div>
                        <div class="voucher__actions">
                            <span class="voucher__expiry">HSD: 31/12/2024</span>
                            <button class="voucher__btn">Dùng ngay</button>
                        </div>
                    </div>
                </div>

                <!-- Percent Voucher 1 -->
                <div class="voucher__card percent">
                    <div class="voucher__badge"></div>
                    <div class="voucher__header">
                        <div class="voucher__icon">
                            <i class="fa-solid fa-percent"></i>
                        </div>
                        <span class="voucher__type">Giảm giá</span>
                    </div>
                    <div class="voucher__body">
                        <h3 class="voucher__title">Giảm 50%</h3>
                        <p class="voucher__desc">Cho đơn hàng từ 200.000đ, giảm tối đa 100.000đ</p>
                        <div class="voucher__progress">
                            <div class="progress__bar">
                                <div class="progress__fill" style="width: 35%"></div>
                            </div>
                            <span class="progress__text">Đã dùng 35%</span>
                        </div>
                    </div>
                    <div class="voucher__footer">
                        <div class="voucher__code">
                            <span class="code__text">SALE50</span>
                            <button class="code__copy" onclick="copyCode('SALE50')">
                                <i class="fa-solid fa-copy"></i>
                            </button>
                        </div>
                        <div class="voucher__actions">
                            <span class="voucher__expiry">HSD: 25/12/2024</span>
                            <button class="voucher__btn">Dùng ngay</button>
                        </div>
                    </div>
                </div>

                <!-- Money Voucher 1 -->
                <div class="voucher__card money">
                    <div class="voucher__badge"></div>
                    <div class="voucher__header">
                        <div class="voucher__icon">
                            <i class="fa-solid fa-coins"></i>
                        </div>
                        <span class="voucher__type">Giảm tiền</span>
                    </div>
                    <div class="voucher__body">
                        <h3 class="voucher__title">Giảm 50.000đ</h3>
                        <p class="voucher__desc">Cho đơn hàng từ 300.000đ trở lên</p>
                        <div class="voucher__progress">
                            <div class="progress__bar">
                                <div class="progress__fill" style="width: 80%"></div>
                            </div>
                            <span class="progress__text">Đã dùng 80%</span>
                        </div>
                    </div>
                    <div class="voucher__footer">
                        <div class="voucher__code">
                            <span class="code__text">GIAM50K</span>
                            <button class="code__copy" onclick="copyCode('GIAM50K')">
                                <i class="fa-solid fa-copy"></i>
                            </button>
                        </div>
                        <div class="voucher__actions">
                            <span class="voucher__expiry">HSD: 28/12/2024</span>
                            <button class="voucher__btn">Dùng ngay</button>
                        </div>
                    </div>
                </div>

                <!-- Flash Sale Voucher 1 -->
                <div class="voucher__card flash">
                    <div class="voucher__badge hot">FLASH SALE</div>
                    <div class="voucher__header">
                        <div class="voucher__icon">
                            <i class="fa-solid fa-bolt"></i>
                        </div>
                        <span class="voucher__type">Flash Sale</span>
                    </div>
                    <div class="voucher__body">
                        <h3 class="voucher__title">Giảm 30%</h3>
                        <p class="voucher__desc">Flash sale 12h - 14h hôm nay, giảm tối đa 80.000đ</p>
                        <div class="voucher__progress">
                            <div class="progress__bar">
                                <div class="progress__fill" style="width: 90%"></div>
                            </div>
                            <span class="progress__text">Đã dùng 90%</span>
                        </div>
                    </div>
                    <div class="voucher__footer">
                        <div class="voucher__code">
                            <span class="code__text">FLASH30</span>
                            <button class="code__copy" onclick="copyCode('FLASH30')">
                                <i class="fa-solid fa-copy"></i>
                            </button>
                        </div>
                        <div class="voucher__actions">
                            <span class="voucher__expiry">HSD: 24/12/2024</span>
                            <button class="voucher__btn">Dùng ngay</button>
                        </div>
                    </div>
                </div>

                <!-- Freeship Voucher 2 -->
                <div class="voucher__card freeship">
                    <div class="voucher__badge"></div>
                    <div class="voucher__header">
                        <div class="voucher__icon">
                            <i class="fa-solid fa-truck-fast"></i>
                        </div>
                        <span class="voucher__type">Freeship 0Đ</span>
                    </div>
                    <div class="voucher__body">
                        <h3 class="voucher__title">Freeship toàn quốc</h3>
                        <p class="voucher__desc">Không giới hạn đơn hàng, áp dụng mọi sản phẩm</p>
                        <div class="voucher__progress">
                            <div class="progress__bar">
                                <div class="progress__fill" style="width: 45%"></div>
                            </div>
                            <span class="progress__text">Đã dùng 45%</span>
                        </div>
                    </div>
                    <div class="voucher__footer">
                        <div class="voucher__code">
                            <span class="code__text">SHIPTODAY</span>
                            <button class="code__copy" onclick="copyCode('SHIPTODAY')">
                                <i class="fa-solid fa-copy"></i>
                            </button>
                        </div>
                        <div class="voucher__actions">
                            <span class="voucher__expiry">HSD: 30/12/2024</span>
                            <button class="voucher__btn">Dùng ngay</button>
                        </div>
                    </div>
                </div>

                <!-- Percent Voucher 2 -->
                <div class="voucher__card percent">
                    <div class="voucher__badge expiring">SẮP HẾT</div>
                    <div class="voucher__header">
                        <div class="voucher__icon">
                            <i class="fa-solid fa-percent"></i>
                        </div>
                        <span class="voucher__type">Giảm giá</span>
                    </div>
                    <div class="voucher__body">
                        <h3 class="voucher__title">Giảm 20%</h3>
                        <p class="voucher__desc">Cho đơn hàng từ 150.000đ, giảm tối đa 50.000đ</p>
                        <div class="voucher__progress">
                            <div class="progress__bar">
                                <div class="progress__fill" style="width: 55%"></div>
                            </div>
                            <span class="progress__text">Đã dùng 55%</span>
                        </div>
                    </div>
                    <div class="voucher__footer">
                        <div class="voucher__code">
                            <span class="code__text">SALE20</span>
                            <button class="code__copy" onclick="copyCode('SALE20')">
                                <i class="fa-solid fa-copy"></i>
                            </button>
                        </div>
                        <div class="voucher__actions">
                            <span class="voucher__expiry">HSD: 26/12/2024</span>
                            <button class="voucher__btn">Dùng ngay</button>
                        </div>
                    </div>
                </div>

                <!-- Money Voucher 2 -->
                <div class="voucher__card money">
                    <div class="voucher__badge"></div>
                    <div class="voucher__header">
                        <div class="voucher__icon">
                            <i class="fa-solid fa-coins"></i>
                        </div>
                        <span class="voucher__type">Giảm tiền</span>
                    </div>
                    <div class="voucher__body">
                        <h3 class="voucher__title">Giảm 100.000đ</h3>
                        <p class="voucher__desc">Cho đơn hàng từ 500.000đ trở lên</p>
                        <div class="voucher__progress">
                            <div class="progress__bar">
                                <div class="progress__fill" style="width: 25%"></div>
                            </div>
                            <span class="progress__text">Đã dùng 25%</span>
                        </div>
                    </div>
                    <div class="voucher__footer">
                        <div class="voucher__code">
                            <span class="code__text">GIAM100K</span>
                            <button class="code__copy" onclick="copyCode('GIAM100K')">
                                <i class="fa-solid fa-copy"></i>
                            </button>
                        </div>
                        <div class="voucher__actions">
                            <span class="voucher__expiry">HSD: 31/12/2024</span>
                            <button class="voucher__btn">Dùng ngay</button>
                        </div>
                    </div>
                </div>

                <!-- Percent Voucher 3 -->
                <div class="voucher__card percent">
                    <div class="voucher__badge hot">HOT</div>
                    <div class="voucher__header">
                        <div class="voucher__icon">
                            <i class="fa-solid fa-percent"></i>
                        </div>
                        <span class="voucher__type">Giảm giá</span>
                    </div>
                    <div class="voucher__body">
                        <h3 class="voucher__title">Giảm 35%</h3>
                        <p class="voucher__desc">Cho đơn hàng từ 250.000đ, giảm tối đa 70.000đ</p>
                        <div class="voucher__progress">
                            <div class="progress__bar">
                                <div class="progress__fill" style="width: 70%"></div>
                            </div>
                            <span class="progress__text">Đã dùng 70%</span>
                        </div>
                    </div>
                    <div class="voucher__footer">
                        <div class="voucher__code">
                            <span class="code__text">SALE35</span>
                            <button class="code__copy" onclick="copyCode('SALE35')">
                                <i class="fa-solid fa-copy"></i>
                            </button>
                        </div>
                        <div class="voucher__actions">
                            <span class="voucher__expiry">HSD: 29/12/2024</span>
                            <button class="voucher__btn">Dùng ngay</button>
                        </div>
                    </div>
                </div>

            </div>
        </section>
    </main>


    <footer class="footer">
        <div class="footer__top">

            <div class="footer__top-col1">
                <div class="footer__top-col1-top">

                    <div class="footer__top-col1-top-logo">
                        <i class="fa-solid fa-shop" ></i>
                        <h3 class="--size20">MichiShop</h3>
                    </div>
                    <p>MiChiShop – Bé khỏe, mẹ vui, cả nhà hạnh phúc</p>

                </div>

                <div class="footer__top-col1-bottom">
                    <h3>Về cửa hàng</h3>
                    <p>MichiShop luôn muốn mang đến khách hàng những sản phẩm chất lượng và uy tín</p>
                </div>
            </div>

            <div class="footer__top-col2">
                <h3>Liên hệ</h3>
                <ul>
                    <li>Hotline: 0901 234 567</li>
                    <li>Địa chỉ: 123 Nguyễn Văn Cừ, TP.HCM</li>
                    <li>Giờ mở cửa: 8h - 20h</li>
                </ul>
            </div>

            <div class="footer__top-col3">
                <h3>Liên kết nhanh</h3>
                <ul>
                    <li><a href="Home.jsp">Trang chủ</a></li>
                    <li><a href="Products.jsp">Sản phẩm</a></li>
                    <li><a href="./Voucher.jsp">Khuyến mãi</a></li>
                    <li><a href="Blog.jsp">Cẩm nang</a></li>
                    <li><a href="About.jsp">Về cửa hàng</a></li>
                    <li><a href="Contact.jsp">Liên hệ</a></li>
                </ul>
            </div>

            <div class="footer__top-col4">
                <div class="footer__top-col4-form">
                    <h3>Đăng kí để nhận thêm thông tin</h3>
                    <input type="text" placeholder="Để lại email của bạn...">
                    <button>Đăng kí!</button>
                </div>
            </div>

        </div>
        <div class="footer__line"></div>


        <div class="footer__bottom">
            <div class="footer__bottom-logos">
                <a href="https://facebook.com" target="_blank" rel="noopener noreferrer" aria-label="Facebook">
                    <i class="fa-brands fa-facebook-f"></i>
                </a>
                <a href="https://instagram.com" target="_blank" rel="noopener noreferrer" aria-label="Instagram">
                    <i class="fa-brands fa-instagram"></i>
                </a>
                <a href="https://tiktok.com" target="_blank" rel="noopener noreferrer" aria-label="TikTok">
                    <i class="fa-brands fa-tiktok"></i>
                </a>
                <a href="https://youtube.com" target="_blank" rel="noopener noreferrer" aria-label="YouTube">
                    <i class="fa-brands fa-youtube"></i>
                </a>
            </div>
            <h4>&copy; Copyright. All rights reserved.</h4>
        </div>

    </footer>

    <script>
        // Copy voucher code
        function copyCode(code) {
            navigator.clipboard.writeText(code).then(() => {
                // Visual feedback
                const btn = event.target.closest('.code__copy');
                const originalHTML = btn.innerHTML;
                btn.innerHTML = '<i class="fa-solid fa-check"></i>';
                btn.style.color = '#10b981';
                
                setTimeout(() => {
                    btn.innerHTML = originalHTML;
                    btn.style.color = '';
                }, 2000);
            }).catch(err => {
                console.error('Failed to copy:', err);
            });
        }
    </script>

    
</body>
<script type="module" src="../scripts/main.js"></script>
</html>