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
    <jsp:include page="/customer/components/Header.jsp"/>

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


    <jsp:include page="/customer/components/Header.jsp"/>



    
</body>
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
<script type="module" src="../scripts/main.js"></script>
</html>