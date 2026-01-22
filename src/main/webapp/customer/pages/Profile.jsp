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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/customer/styles/index.css">
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
                        <li class="profile-tab active" data-tab="personal-info">
                            <i class="fa-regular fa-user"></i> 
                            <span>Thông tin cá nhân</span>
                        </li>
                        <li class="profile-tab" data-tab="purchase-info">
                            <i class="fa-solid fa-receipt"></i> 
                            <span>Đơn hàng của tôi</span>
                        </li>
                        <li class="profile-tab" data-tab="address-info">
                            <i class="fa-solid fa-location-dot"></i> 
                            <span>Địa chỉ của tôi</span>
                        </li>
                        <li class="profile-tab" data-tab="voucher-info">
                            <i class="fa-solid fa-ticket"></i> 
                            <span>Ưu đãi của tôi</span>
                        </li>
                        <li class="profile-tab" data-tab="security-info">
                            <i class="fa-solid fa-shield-halved"></i> 
                            <span>Bảo mật</span>
                        </li>
                    </ul>
                </nav>
            </aside>

            <section class="content">
                <!-- Personal Info Tab -->
                <article id="personal-info" class="profile-content active">
                    <div class="content-header">
                        <h2>Thông tin cá nhân</h2>
                        <p class="subtitle">Quản lý thông tin của bạn để bảo mật tài khoản</p>
                    </div>

                    <div class="profile-main-card">
                        <div class="avatar-wrapper">
                            <div class="avatar-container">
                                <img src="https://i.pinimg.com/1200x/00/b5/b4/00b5b48568a9e2f49fed5cab79863303.jpg" alt="Avatar" class="avatar-image">
                                <div class="status-badge">
                                    <i class="fa-solid fa-circle"></i>
                                </div>
                            </div>
                            <button class="change-avatar-btn">
                                <i class="fa-solid fa-camera"></i>
                                <span>Đổi ảnh</span>
                            </button>
                        </div>

                        <div class="profile-details">
                            <div class="detail-row">
                                <label>Họ và tên</label>
                                <div class="detail-value">
                                    <span>Nguyễn Văn A</span>
                                    <button class="edit-btn"><i class="fa-solid fa-pen"></i></button>
                                </div>
                            </div>

                            <div class="detail-row">
                                <label>Email</label>
                                <div class="detail-value">
                                    <span>taisaodattenlaikhovay@gmail.com</span>
                                    <span class="verified-badge"><i class="fa-solid fa-circle-check"></i> Đã xác minh</span>
                                </div>
                            </div>

                            <div class="detail-row">
                                <label>Số điện thoại</label>
                                <div class="detail-value">
                                    <span>0931415926</span>
                                    <button class="edit-btn"><i class="fa-solid fa-pen"></i></button>
                                </div>
                            </div>

                            <div class="detail-row">
                                <label>Giới tính</label>
                                <div class="detail-value">
                                    <span><i class="fa-solid fa-mars" style="color: var(--c9);"></i> Nam</span>
                                    <button class="edit-btn"><i class="fa-solid fa-pen"></i></button>
                                </div>
                            </div>

                            <div class="detail-row">
                                <label>Ngày sinh</label>
                                <div class="detail-value">
                                    <span>2/12/2003</span>
                                    <button class="edit-btn"><i class="fa-solid fa-pen"></i></button>
                                </div>
                            </div>

                            <div class="detail-row">
                                <label>Thành viên từ</label>
                                <div class="detail-value">
                                    <span>30/2/2024</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                </article>

                <!-- Purchase Info Tab -->
                <article id="purchase-info" class="profile-content">
                    <div class="content-header">
                        <h2>Đơn hàng của tôi</h2>
                        <p class="subtitle">Theo dõi và quản lý đơn hàng của bạn</p>
                    </div>

                    <div class="order-tabs">
                        <button class="order-tab-btn active" data-status="all">
                            Tất cả
                        </button>
                        <button class="order-tab-btn" data-status="pending">
                            <i class="fa-solid fa-clock"></i>
                            Chờ xác nhận
                        </button>
                        <button class="order-tab-btn" data-status="shipping">
                            <i class="fa-solid fa-truck"></i>
                            Đang giao
                        </button>
                        <button class="order-tab-btn" data-status="delivered">
                            <i class="fa-solid fa-circle-check"></i>
                            Đã giao
                        </button>
                        <button class="order-tab-btn" data-status="cancelled">
                            <i class="fa-solid fa-circle-xmark"></i>
                            Đã hủy
                        </button>
                    </div>

                    <div class="orders-container">
                        <div class="order-card-modern">
                            <div class="order-card-header">
                                <div class="order-id-section">
                                    <span class="order-label">Mã đơn hàng:</span>
                                    <span class="order-number">#DH123456</span>
                                </div>
                                <span class="order-status-badge pending">Chờ xác nhận</span>
                            </div>

                            <div class="order-card-body">
                                <div class="order-product">
                                    <img src="https://i.pinimg.com/1200x/79/df/0d/79df0de0a96063735aca1c5d5c80ca26.jpg" alt="Product">
                                    <div class="order-product-info">
                                        <h4>Sữa tươi thanh trùng</h4>
                                        <p class="order-product-qty">Số lượng: x2</p>
                                    </div>
                                    <div class="order-product-price">
                                        <span class="price-label">Thành tiền</span>
                                        <span class="price-value">1.200.000₫</span>
                                    </div>
                                </div>
                            </div>

                            <div class="order-card-footer">
                                <div class="order-date">
                                    <i class="fa-regular fa-calendar"></i>
                                    <span>24/11/2025</span>
                                </div>
                                <div class="order-actions">
                                    <button class="btn-secondary">Xem chi tiết</button>
                                    <button class="btn-primary">Mua lại</button>
                                </div>
                            </div>
                        </div>

                        <div class="order-card-modern">
                            <div class="order-card-header">
                                <div class="order-id-section">
                                    <span class="order-label">Mã đơn hàng:</span>
                                    <span class="order-number">#DH123457</span>
                                </div>
                                <span class="order-status-badge delivered">Đã giao</span>
                            </div>

                            <div class="order-card-body">
                                <div class="order-product">
                                    <img src="https://i.pinimg.com/1200x/79/df/0d/79df0de0a96063735aca1c5d5c80ca26.jpg" alt="Product">
                                    <div class="order-product-info">
                                        <h4>Sữa tươi thanh trùng</h4>
                                        <p class="order-product-qty">Số lượng: x2</p>
                                    </div>
                                    <div class="order-product-price">
                                        <span class="price-label">Thành tiền</span>
                                        <span class="price-value">1.200.000₫</span>
                                    </div>
                                </div>
                            </div>

                            <div class="order-card-footer">
                                <div class="order-date">
                                    <i class="fa-regular fa-calendar"></i>
                                    <span>20/11/2025</span>
                                </div>
                                <div class="order-actions">
                                    <button class="btn-secondary">Xem chi tiết</button>
                                    <button class="btn-primary">Mua lại</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </article>

                <!-- Address Info Tab (NEW) -->
                <article id="address-info" class="profile-content">
                    <div class="content-header">
                        <h2>Địa chỉ của tôi</h2>
                        <p class="subtitle">Quản lý địa chỉ giao hàng của bạn</p>
                    </div>

                    <button class="add-address-btn">
                        <i class="fa-solid fa-plus"></i>
                        Thêm địa chỉ mới
                    </button>

                    <div class="address-list">
                        <div class="address-card">
                            <div class="address-card-header">
                                <div class="address-name">
                                    <h4>Nguyễn Văn A</h4>
                                    <span class="default-badge">Mặc định</span>
                                </div>
                                <button class="address-edit-btn"><i class="fa-solid fa-pen"></i></button>
                            </div>
                            <div class="address-card-body">
                                <div class="address-detail">
                                    <i class="fa-solid fa-phone"></i>
                                    <span>0931415926</span>
                                </div>
                                <div class="address-detail">
                                    <i class="fa-solid fa-location-dot"></i>
                                    <span>36/18, Khu phố 12, Phường Tăng Nhơn Phú, Quận Thủ Đức, TP. Hồ Chí Minh</span>
                                </div>
                            </div>
                            <div class="address-card-footer">
                                <button class="btn-text">Xóa</button>
                            </div>
                        </div>

                        <div class="address-card">
                            <div class="address-card-header">
                                <div class="address-name">
                                    <h4>Nguyễn Văn A</h4>
                                </div>
                                <button class="address-edit-btn"><i class="fa-solid fa-pen"></i></button>
                            </div>
                            <div class="address-card-body">
                                <div class="address-detail">
                                    <i class="fa-solid fa-phone"></i>
                                    <span>0931415926</span>
                                </div>
                                <div class="address-detail">
                                    <i class="fa-solid fa-location-dot"></i>
                                    <span>123 Nguyễn Văn Linh, Phường 10, Quận 1, TP. Hồ Chí Minh</span>
                                </div>
                            </div>
                            <div class="address-card-footer">
                                <button class="btn-text-secondary">Đặt làm mặc định</button>
                                <button class="btn-text">Xóa</button>
                            </div>
                        </div>
                    </div>
                </article>

                <!-- Voucher Info Tab -->
                <article id="voucher-info" class="profile-content">
                    <div class="content-header">
                        <h2>Ưu đãi của tôi</h2>
                        <p class="subtitle">Các voucher và mã giảm giá của bạn</p>
                    </div>

                    <div class="voucher-grid">
                        <div class="voucher-card-modern">
                            <div class="voucher-icon-badge">
                                <i class="fa-solid fa-percent"></i>
                            </div>
                            <div class="voucher-content">
                                <h3>Giảm 10%</h3>
                                <p class="voucher-condition">Đơn hàng từ 200.000₫</p>
                                <div class="voucher-meta">
                                    <span class="voucher-code">SAVE10</span>
                                    <span class="voucher-expire">HSD: 31/12/2025</span>
                                </div>
                            </div>
                            <button class="use-voucher-btn">Dùng ngay</button>
                        </div>

                        <div class="voucher-card-modern">
                            <div class="voucher-icon-badge fire">
                                <i class="fa-solid fa-fire"></i>
                            </div>
                            <div class="voucher-content">
                                <h3>Giảm 50.000₫</h3>
                                <p class="voucher-condition">Cho mọi ngành hàng</p>
                                <div class="voucher-meta">
                                    <span class="voucher-code">FLASH50</span>
                                    <span class="voucher-expire">HSD: 25/12/2025</span>
                                </div>
                            </div>
                            <button class="use-voucher-btn">Dùng ngay</button>
                        </div>

                        <div class="voucher-card-modern">
                            <div class="voucher-icon-badge premium">
                                <i class="fa-solid fa-crown"></i>
                            </div>
                            <div class="voucher-content">
                                <h3>Giảm 20%</h3>
                                <p class="voucher-condition">Không giới hạn giá trị</p>
                                <div class="voucher-meta">
                                    <span class="voucher-code">VIP20</span>
                                    <span class="voucher-expire">HSD: 11/01/2026</span>
                                </div>
                            </div>
                            <button class="use-voucher-btn">Dùng ngay</button>
                        </div>
                    </div>
                </article>

                <!-- Security Tab -->
                <article id="security-info" class="profile-content">
                    <div class="content-header">
                        <h2>Bảo mật</h2>
                        <p class="subtitle">Quản lý mật khẩu và bảo mật tài khoản</p>
                    </div>

                    <div class="security-section">
                        <div class="security-item">
                            <div class="security-info">
                                <i class="fa-solid fa-lock"></i>
                                <div>
                                    <h4>Mật khẩu</h4>
                                    <p>Thay đổi mật khẩu thường xuyên để bảo mật tài khoản</p>
                                </div>
                            </div>
                            <button class="btn-secondary">Đổi mật khẩu</button>
                        </div>

                        <div class="security-item">
                            <div class="security-info">
                                <i class="fa-solid fa-envelope"></i>
                                <div>
                                    <h4>Email xác minh</h4>
                                    <p>taisaodattenlaikhovay@gmail.com</p>
                                </div>
                            </div>
                            <span class="verified-badge"><i class="fa-solid fa-circle-check"></i> Đã xác minh</span>
                        </div>

                        <div class="security-item">
                            <div class="security-info">
                                <i class="fa-solid fa-shield-halved"></i>
                                <div>
                                    <h4>Xác thực hai bước</h4>
                                    <p>Bảo vệ tài khoản với lớp bảo mật thứ hai</p>
                                </div>
                            </div>
                            <button class="btn-secondary">Bật</button>
                        </div>

                        <div class="security-item danger-zone">
                            <div class="security-info">
                                <i class="fa-solid fa-triangle-exclamation"></i>
                                <div>
                                    <h4>Vùng nguy hiểm</h4>
                                    <p>Đăng xuất hoặc xóa tài khoản vĩnh viễn</p>
                                </div>
                            </div>
                            <div class="danger-actions">
                                <button class="btn-outline" onclick="location.href='../../index.jsp'">
                                    <i class="fa-solid fa-right-from-bracket"></i>
                                    Đăng xuất
                                </button>
                                <button class="btn-danger">
                                    <i class="fa-solid fa-trash"></i>
                                    Xóa tài khoản
                                </button>
                            </div>
                        </div>
                    </div>
                </article>

            </section>



        </div>



    </main>

    <jsp:include page="/customer/components/Footer.jsp"/>

    
<script type="module" src="${pageContext.request.contextPath}/customer/scripts/main.js"></script>
<script src="${pageContext.request.contextPath}/customer/scripts/Profile.js"></script>
<script src="${pageContext.request.contextPath}/customer/scripts/Order.js"></script>
</body>
</html>