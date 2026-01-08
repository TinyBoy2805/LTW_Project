<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
    request.setAttribute("activeTab", "");
%>

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
    <jsp:include page="/customer/components/Header.jsp"/>

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

    <jsp:include page="/customer/components/Footer.jsp"/>

    
</body>
<script type="module" src="../scripts/main.js"></script>
<script src="../scripts/Profile.js"></script>
<script src="../scripts/Order.js"></script>
</html>