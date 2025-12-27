<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="../styles/index.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css" 
        integrity="sha512-2SwdPD6INVrV/lHTZbO2nodKhrnDdJK9/kg2XD1r9uGqPo1cUbujc+IYdlYdEErWNu69gVcYgdxlmVmzTWnetw==" 
        crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
    <div class="scroll-to-top-btn"><i class="fa-solid fa-circle-up"></i></div>
    <jsp:include page="/customer/components/Header.jsp"/>
    <main class="main">
        <section class="notifications">

            <header class="notifications-header">
                <h2>Thông báo của bạn</h2>
                <button class="btn-mark-all">Đánh dấu tất cả đã đọc</button>
            </header>

            <div class="notifications-list">

                <!-- 1 item -->
                <article class="notification active">
                    <div class="icon --order">
                        <i class="fa-solid fa-box"></i>
                    </div>
                    <div class="content">
                        <h4>Đơn hàng #DH2031 đang được giao</h4>
                        <p>Đơn hàng của bạn đã rời kho và đang trên đường đến bạn!</p>
                        <span class="time">2 giờ trước</span>
                    </div>
                </article>

                <article class="notification">
                    <div class="icon --promo">
                        <i class="fa-solid fa-gift"></i>
                    </div>
                    <div class="content">
                        <h4>Ưu đãi thành viên VIP 🎁</h4>
                        <p>Giảm 15% cho tất cả sản phẩm dinh dưỡng trẻ nhỏ, hết hạn sau 3 ngày.</p>
                        <span class="time">1 ngày trước</span>
                    </div>
                </article>

                <article class="notification">
                    <div class="icon --security">
                        <i class="fa-solid fa-shield-halved"></i>
                    </div>
                    <div class="content">
                        <h4>Đổi mật khẩu thành công</h4>
                        <p>Bạn đã thay đổi mật khẩu tài khoản lúc 18:36.</p>
                        <span class="time">3 ngày trước</span>
                    </div>
                </article>

            </div>

            </section>

    </main>

    <jsp:include page="/customer/components/Footer.jsp"/>



    
</body>
<script type="module" src="../scripts/main.js"></script>
</html>