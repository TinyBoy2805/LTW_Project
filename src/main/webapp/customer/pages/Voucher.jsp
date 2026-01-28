<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


<%
    request.setAttribute("activeTab", "voucher");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MichiShop</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/customer/styles/index.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css" integrity="sha512-2SwdPD6INVrV/lHTZbO2nodKhrnDdJK9/kg2XD1r9uGqPo1cUbujc+IYdlYdEErWNu69gVcYgdxlmVmzTWnetw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script>
        window.APP_CONTEXT_PATH = `${pageContext.request.contextPath}`;
    </script>
</head>
<body>
    <jsp:include page="/customer/components/Header.jsp"/>
    <div class="scroll-to-top-btn"><i class="fa-solid fa-circle-up"></i></div>

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
                        <span>Freeshipping</span>
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

        <template id="voucher_template">
            <div class="voucher__card freeship">
<%--                <div class="voucher__badge hot">HOT</div>--%>
                <div class="voucher__header">
                    <div class="voucher__icon">
                        <i class="fa-solid fa-truck-fast"></i>
                    </div>
                    <span class="voucher__type">${v.voucher_type}</span>
                </div>
                <div class="voucher__body">
                    <h3 class="voucher__title">Miễn phí vận chuyển</h3>
                    <p class="voucher__desc">Áp dụng cho đơn hàng từ ${v.min_order_value}đ</p>
                    <div class="voucher__progress">
                        <div class="progress__bar">
                            <div class="progress__fill" style="width: ${100*((v.usage_limit-v.current_amount)/v.usage_limit)}%"></div>
                        </div>
                        <span class="progress__text">Đã dùng ${100*((v.usage_limit-v.current_amount)/v.usage_limit)}%</span>
                    </div>
                </div>
                <div class="voucher__footer">
                    <div class="voucher__code">
                        <span class="code__text">${v.code}</span>
                        <button class="code__copy" onclick="copyCode(this, '${v.code}')">
                            <i class="fa-solid fa-copy"></i>
                        </button>
                    </div>
                    <div class="voucher__actions">
                        <span class="voucher__expiry">HSD: ${v.end_date}</span>
                        <button class="voucher__btn">Dùng ngay</button>
                    </div>
                </div>
            </div>
        </template>
        <!-- Voucher Grid -->
        <section class="promo-list">
            <div class="vouchers__grid">




            </div>
            <button id="more-voucher" style="min-width: 200px; padding: 8px 12px; font-size: 16px; cursor: pointer; color: var(--c10); background: var(--c6); margin: 16px auto; display: grid; align-items: center; border-radius: 8px; border: none;">Xem thêm</button>
        </section>
    </main>


    <jsp:include page="/customer/components/Footer.jsp"/>



<script type="module" src="${pageContext.request.contextPath}/customer/scripts/main.js"></script>
    <script src="${pageContext.request.contextPath}/customer/scripts/voucherPage/getVoucher.js"></script>
</body>
</html>