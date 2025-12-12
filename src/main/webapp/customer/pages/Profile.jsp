<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MichiShop</title>
    <link rel="stylesheet" href="../styles/index.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css" 
        integrity="sha512-2SwdPD6INVrV/lHTZbO2nodKhrnDdJK9/kg2XD1r9uGqPo1cUbujc+IYdlYdEErWNu69gVcYgdxlmVmzTWnetw==" 
        crossorigin="anonymous" referrerpolicy="no-referrer" />
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
                                <a href="./Profile.jsp" class="--color4"><i class="fa-solid fa-user-ninja --size20"></i></a>
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
                    <li><a href="Home.jsp" class="">Trang chủ</a></li>
                    <li><a href="Products.jsp">Sản phẩm</a></li>
                    <li><a href="Voucher.jsp">Khuyến mãi</a></li>
                    <li><a href="Blog.jsp">Cẩm nang</a></li>
                    <li><a href="Contact.jsp">Liên hệ</a></li>
                    <li><a href="About.jsp">về cửa hàng</a></li>
                </ul>
            </div>
        </nav>
    </header>

    <main class="main">
        

        <div class="main__profile">

            <aside class="sidebar">
                <nav>
                    <ul>
                        <li class="profile-tab active"><i class="fa-regular fa-user"></i> Thông tin cá nhân</li>
                        <li class="profile-tab"><i class="fa-solid fa-boxes-stacked"></i> Thông tin mua hàng</li>
                        <li class="profile-tab"><i class="fa-solid fa-ticket-simple"></i> Ưu đãi của bạn</li>
                        <li class="profile-tab"><i class="fa-solid fa-shield"></i> Bảo mật tài khoản</li>
                    </ul>
                </nav>
            </aside>

            <section class="content">
                <article id="personal-info" class="profile-content active">
                    <div class="info-top">
                        <div class="avt-container">

                            <div class="background">
                                <div class="background-img">
                                    <img src="https://i.pinimg.com/1200x/a5/59/e3/a559e3e59fd9a38d909f5e016050e229.jpg" alt="">
                                </div>
                                <button><i class="fa-regular fa-camera"></i> Chỉnh sửa</button>
                            </div>

                            <div class="avatar">
                                <div class="avatar-img">
                                    <img src="https://i.pinimg.com/1200x/00/b5/b4/00b5b48568a9e2f49fed5cab79863303.jpg" alt="">
                                </div>
                                <button><i class="fa-regular fa-camera"></i></button>
                                <div class="icon">
                                    <i class="fa-solid fa-circle --active --size12"></i>
                                </div>
                            </div>

                            <div class="simple-info">
                                <div>
                                    <h3>Nguyễn Văn A</h3>
                                    <button><i class="fa-solid fa-pen"></i> chỉnh sửa hồ sơ</button>
                                </div>
                                <div>
                                    <p>Thành viên VIP <i class="fa-solid fa-crown --star"></i></p>
                                    <p>Ngày tạo tài khoản: 30/2/2024</p>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="info-bottom">
                            <div class="sub">
                                <h3 class="--color6"><i class="fa-solid fa-info"></i>Thông tin chi tiết</h3>
                                <!-- <i class="fa-solid fa-venus"></i> male icon -->
                                <ul>
                                    <li><p class="--color4">Email</p><p class="--color1 --weight600">taisaodattenlaikhovay@gmail.com</p></li>
                                    <li><p class="--color4">Số điện thoại</p><p class="--color1 --weight600">0931415926</p></li>
                                    <li><p class="--color4">Giới tính</p><p class="--color1 --weight600"><i class="fa-solid fa-mars --male"></i> Nam</p></li>
                                    <li><p class="--color4">Ngày sinh</p><p class="--color1 --weight600">2/12/2003</p></li>
                                </ul>
                            </div>
                            <div class="sub">
                                <h3 class="--color6"><i class="fa-solid fa-truck-fast"></i> Địa chỉ giao hàng</h3>
                                <!-- <i class="fa-solid fa-venus"></i> male icon -->
                                <ul>
                                    <li><p class="--color4">Số nhà</p><p class="--color1 --weight600">36/18</p></li>
                                    <li><p class="--color4">Khu phố</p><p class="--color1 --weight600">12</p></li>
                                    <li><p class="--color4">Phường</p><p class="--color1 --weight600">Tăng Nhơn Phú</p></li>
                                    <li><p class="--color4">Quận</p><p class="--color1 --weight600">Thủ Đức</p></li>
                                    <li><p class="--color4">Thành phố</p><p class="--color1 --weight600">Hồ Chí Minh</p></li>
                                </ul>
                            </div>
                        </div>
                    
                </article>

                <article id="purchase-info" class="profile-content">
                    <nav class="nav">
                        <ul>
                            <li class="purchase-tab active">Đơn hàng</li>
                            <li class="purchase-tab">Lịch sử đơn hàng</li>
                        </ul>
                    </nav>
                    <div class="content active">
                        <ul class="content-list">
                            <li>
                                <div class="order-card">
                                    <div class="order-header">
                                        <span class="order-id">#DH123456</span>
                                        <span class="order-status pending">Chờ xác nhận</span>
                                    </div>
                                    
                                    <div class="order-body">
                                        <div class="product-info">
                                        <img src="https://i.pinimg.com/1200x/79/df/0d/79df0de0a96063735aca1c5d5c80ca26.jpg" alt="Product Image">
                                        <div class="product-details">
                                            <p class="product-name">Sữa tươi thanh trùng</p>
                                            <p class="product-quantity">Số lượng: 2</p>
                                            <p style="font-size: 14px; color: var(--c4);">Tổng tiền: <strong class="--color6">1.200.000₫</strong></p>
                                        </div>
                                        </div>
                                        
                                        <div class="order-summary">
                                            <p style="font-size: 13px;">Ngày đặt: 24/11/2025</p>
                                        </div>
                                    </div>
                                    
                                </div>

                            </li>
                            <li>
                                <div class="order-card">
                                    <div class="order-header">
                                        <span class="order-id">#DH123456</span>
                                        <span class="order-status pending">Chờ xác nhận</span>
                                    </div>
                                    
                                    <div class="order-body">
                                        <div class="product-info">
                                        <img src="https://i.pinimg.com/1200x/79/df/0d/79df0de0a96063735aca1c5d5c80ca26.jpg" alt="Product Image">
                                        <div class="product-details">
                                            <p class="product-name">Sữa tươi thanh trùng</p>
                                            <p class="product-quantity">Số lượng: 2</p>
                                            <p style="font-size: 14px; color: var(--c4);">Tổng tiền: <strong class="--color6">1.200.000₫</strong></p>
                                        </div>
                                        </div>
                                        
                                        <div class="order-summary">
                                            <p style="font-size: 13px;">Ngày đặt: 24/11/2025</p>
                                        </div>
                                    </div>
                                    
                                </div>

                            </li>
                            <li>
                                <div class="order-card">
                                    <div class="order-header">
                                        <span class="order-id">#DH123456</span>
                                        <span class="order-status pending">Chờ xác nhận</span>
                                    </div>
                                    
                                    <div class="order-body">
                                        <div class="product-info">
                                        <img src="https://i.pinimg.com/1200x/79/df/0d/79df0de0a96063735aca1c5d5c80ca26.jpg" alt="Product Image">
                                        <div class="product-details">
                                            <p class="product-name">Sữa tươi thanh trùng</p>
                                            <p class="product-quantity">Số lượng: 2</p>
                                            <p style="font-size: 14px; color: var(--c4);">Tổng tiền: <strong class="--color6">1.200.000₫</strong></p>
                                        </div>
                                        </div>
                                        
                                        <div class="order-summary">
                                            <p style="font-size: 13px;">Ngày đặt: 24/11/2025</p>
                                        </div>
                                    </div>
                                    
                                </div>

                            </li>
                            <li>
                                <div class="order-card">
                                    <div class="order-header">
                                        <span class="order-id">#DH123456</span>
                                        <span class="order-status pending">Chờ xác nhận</span>
                                    </div>
                                    
                                    <div class="order-body">
                                        <div class="product-info">
                                        <img src="https://i.pinimg.com/1200x/79/df/0d/79df0de0a96063735aca1c5d5c80ca26.jpg" alt="Product Image">
                                        <div class="product-details">
                                            <p class="product-name">Sữa tươi thanh trùng</p>
                                            <p class="product-quantity">Số lượng: 2</p>
                                            <p style="font-size: 14px; color: var(--c4);">Tổng tiền: <strong class="--color6">1.200.000₫</strong></p>
                                        </div>
                                        </div>
                                        
                                        <div class="order-summary">
                                            <p style="font-size: 13px;">Ngày đặt: 24/11/2025</p>
                                        </div>
                                    </div>
                                    
                                </div>

                            </li>
                            <li>
                                <div class="order-card">
                                    <div class="order-header">
                                        <span class="order-id">#DH123456</span>
                                        <span class="order-status pending">Chờ xác nhận</span>
                                    </div>
                                    
                                    <div class="order-body">
                                        <div class="product-info">
                                        <img src="https://i.pinimg.com/1200x/79/df/0d/79df0de0a96063735aca1c5d5c80ca26.jpg" alt="Product Image">
                                        <div class="product-details">
                                            <p class="product-name">Sữa tươi thanh trùng</p>
                                            <p class="product-quantity">Số lượng: 2</p>
                                            <p style="font-size: 14px; color: var(--c4);">Tổng tiền: <strong class="--color6">1.200.000₫</strong></p>
                                        </div>
                                        </div>
                                        
                                        <div class="order-summary">
                                            <p style="font-size: 13px;">Ngày đặt: 24/11/2025</p>
                                        </div>
                                    </div>
                                    
                                </div>

                            </li>
                        </ul>
                    </div>
                    <div class="content">
                        <ul class="content-list">
                            <li>
                                <div class="order-card">
                                    <div class="order-header">
                                        <span class="order-id">#DH123456</span>
                                        <span class="order-status delivered">Đã giao</span>
                                    </div>
                                    
                                    <div class="order-body">
                                        <div class="product-info">
                                        <img src="https://i.pinimg.com/1200x/79/df/0d/79df0de0a96063735aca1c5d5c80ca26.jpg" alt="Product Image">
                                        <div class="product-details">
                                            <p class="product-name">Sữa tươi thanh trùng</p>
                                            <p class="product-quantity">Số lượng: 2</p>
                                            <p style="font-size: 14px; color: var(--c4);">Tổng tiền: <strong class="--color6">1.200.000₫</strong></p>
                                        </div>
                                        </div>
                                        
                                        <div class="order-summary">
                                            <p style="font-size: 13px;">Ngày đặt: 24/11/2025</p>
                                        </div>
                                    </div>
                                    
                                </div>
                            </li>
                            <li>
                                <div class="order-card">
                                    <div class="order-header">
                                        <span class="order-id">#DH123456</span>
                                        <span class="order-status delivered">Đã giao</span>
                                    </div>
                                    
                                    <div class="order-body">
                                        <div class="product-info">
                                        <img src="https://i.pinimg.com/1200x/79/df/0d/79df0de0a96063735aca1c5d5c80ca26.jpg" alt="Product Image">
                                        <div class="product-details">
                                            <p class="product-name">Sữa tươi thanh trùng</p>
                                            <p class="product-quantity">Số lượng: 2</p>
                                            <p style="font-size: 14px; color: var(--c4);">Tổng tiền: <strong class="--color6">1.200.000₫</strong></p>
                                        </div>
                                        </div>
                                        
                                        <div class="order-summary">
                                            <p style="font-size: 13px;">Ngày đặt: 24/11/2025</p>
                                        </div>
                                    </div>
                                    
                                </div>
                            </li>
                            <li>
                                <div class="order-card">
                                    <div class="order-header">
                                        <span class="order-id">#DH123456</span>
                                        <span class="order-status delivered">Đã giao</span>
                                    </div>
                                    
                                    <div class="order-body">
                                        <div class="product-info">
                                        <img src="https://i.pinimg.com/1200x/79/df/0d/79df0de0a96063735aca1c5d5c80ca26.jpg" alt="Product Image">
                                        <div class="product-details">
                                            <p class="product-name">Sữa tươi thanh trùng</p>
                                            <p class="product-quantity">Số lượng: 2</p>
                                            <p style="font-size: 14px; color: var(--c4);">Tổng tiền: <strong class="--color6">1.200.000₫</strong></p>
                                        </div>
                                        </div>
                                        
                                        <div class="order-summary">
                                            <p style="font-size: 13px;">Ngày đặt: 24/11/2025</p>
                                        </div>
                                    </div>
                                    
                                </div>
                            </li>
                            <li>
                                <div class="order-card">
                                    <div class="order-header">
                                        <span class="order-id">#DH123456</span>
                                        <span class="order-status delivered">Đã giao</span>
                                    </div>
                                    
                                    <div class="order-body">
                                        <div class="product-info">
                                        <img src="https://i.pinimg.com/1200x/79/df/0d/79df0de0a96063735aca1c5d5c80ca26.jpg" alt="Product Image">
                                        <div class="product-details">
                                            <p class="product-name">Sữa tươi thanh trùng</p>
                                            <p class="product-quantity">Số lượng: 2</p>
                                            <p style="font-size: 14px; color: var(--c4);">Tổng tiền: <strong class="--color6">1.200.000₫</strong></p>
                                        </div>
                                        </div>
                                        
                                        <div class="order-summary">
                                            <p style="font-size: 13px;">Ngày đặt: 24/11/2025</p>
                                        </div>
                                    </div>
                                    
                                </div>
                            </li>
                            <li>
                                <div class="order-card">
                                    <div class="order-header">
                                        <span class="order-id">#DH123456</span>
                                        <span class="order-status delivered">Đã giao</span>
                                    </div>
                                    
                                    <div class="order-body">
                                        <div class="product-info">
                                        <img src="https://i.pinimg.com/1200x/79/df/0d/79df0de0a96063735aca1c5d5c80ca26.jpg" alt="Product Image">
                                        <div class="product-details">
                                            <p class="product-name">Sữa tươi thanh trùng</p>
                                            <p class="product-quantity">Số lượng: 2</p>
                                            <p style="font-size: 14px; color: var(--c4);">Tổng tiền: <strong class="--color6">1.200.000₫</strong></p>
                                        </div>
                                        </div>
                                        
                                        <div class="order-summary">
                                            <p style="font-size: 13px;">Ngày đặt: 24/11/2025</p>
                                        </div>
                                    </div>
                                    
                                </div>
                            </li>
                            <li>
                                <div class="order-card">
                                    <div class="order-header">
                                        <span class="order-id">#DH123456</span>
                                        <span class="order-status delivered">Đã giao</span>
                                    </div>
                                    
                                    <div class="order-body">
                                        <div class="product-info">
                                        <img src="https://i.pinimg.com/1200x/79/df/0d/79df0de0a96063735aca1c5d5c80ca26.jpg" alt="Product Image">
                                        <div class="product-details">
                                            <p class="product-name">Sữa tươi thanh trùng</p>
                                            <p class="product-quantity">Số lượng: 2</p>
                                            <p style="font-size: 14px; color: var(--c4);">Tổng tiền: <strong class="--color6">1.200.000₫</strong></p>
                                        </div>
                                        </div>
                                        
                                        <div class="order-summary">
                                            <p style="font-size: 13px;">Ngày đặt: 24/11/2025</p>
                                        </div>
                                    </div>
                                    
                                </div>
                            </li>
                        </ul>
                    </div>
                    
                </article>

                <article id="voucher-info" class="profile-content">
                    <h2 class="section-title">Voucher của bạn</h2>

                    <div class="voucher-list">
                        
                        <div class="voucher-card">
                            <div class="voucher-left">
                                <div class="voucher-icon">🎟️</div>
                                <div>
                                    <p class="voucher-title">Giảm 10% đơn hàng</p>
                                    <p class="voucher-desc">Áp dụng cho đơn từ 200.000₫</p>
                                    <p class="voucher-exp">HSD: 31/12/2025</p>
                                </div>
                            </div>

                            <button class="voucher-btn">Dùng ngay</button>
                        </div>

                        <div class="voucher-card">
                            <div class="voucher-left">
                                <div class="voucher-icon">🔥</div>
                                <div>
                                    <p class="voucher-title">Giảm 50.000₫</p>
                                    <p class="voucher-desc">Cho mọi ngành hàng</p>
                                    <p class="voucher-exp">HSD: 25/12/2025</p>
                                </div>
                            </div>

                            <button class="voucher-btn">Dùng ngay</button>
                        </div>

                        <div class="voucher-card">
                            <div class="voucher-left">
                                <div class="voucher-icon">💎</div>
                                <div>
                                    <p class="voucher-title">Voucher VIP - Giảm 20%</p>
                                    <p class="voucher-desc">Không giới hạn giá trị</p>
                                    <p class="voucher-exp">HSD: 11/01/2026</p>
                                </div>
                            </div>

                            <button class="voucher-btn">Dùng ngay</button>
                        </div>

                    </div>
                </article>


                <article id="security-info" class="profile-content">
                    
                    <div class="container">
                        <h3>Bảo mật tài khoản</h3>
                        <div class="content">
                            <ul>
                                <li><p class="--color4">Mật khẩu:</p><p class="--color1 --weight600">********</p></li>
                                <li>
                                    <div>
                                        <button>Đổi mật khẩu</button>
                                        <button><i class="fa-solid fa-trash"></i> Xóa tài khoản</button>
                                        <button onclick="location.href='../../index.jsp'"><i class="fa-solid fa-right-from-bracket"></i> Đăng xuất</button>
                                    </div>
                                </li>
                                
                            </ul>
                        </div>
                    </div>
                    
                </article>

            </section>



        </div>















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
                    <li><a href="Voucher.jsp">Khuyến mãi</a></li>
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

    
</body>
<script type="module" src="../scripts/main.js"></script>
<script src="../scripts/Profile.js"></script>
<script src="../scripts/Order.js"></script>
</html>