<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    request.setAttribute("activeTab", "");
%>

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

        <section class="main__payment active">
            <h2>Thanh toán đơn hàng</h2>

            <!-- 🧾 Bắt đầu form -->
            <form class="payment__form">

                <!-- 1️⃣ Thông tin khách hàng -->
                <div class="payment__user-info">
                    <h3 class="--color6">Thông tin giao hàng</h3>
                    <ul class="payment__customer-info">
                        <li><button type="button"><i class="fa-solid fa-pen-to-square"></i></button></li>
                        <li>
                            <p class="--color3">Số điện thoại</p>
                            <p class="--color1">0931415926</p>
                            <input type="hidden" name="phone" value="0931415926">
                        </li>
                        <li>
                            <p class="--color3">Địa chỉ</p>
                            <p class="--color1">36C, 18 Lái Thiêu, Khu Phố Hoà Long, TP. Thuận An, TPHCM</p>
                            <input type="hidden" name="address" value="36C, 18 Lái Thiêu, Khu Phố Hoà Long, TP. Thuận An, TPHCM">
                        </li>
                        <li>
                            <p class="--color3">Email</p>
                            <p class="--color1">tonguyenhoangphuc67@gmail.com</p>
                            <input type="hidden" name="email" value="tonguyenhoangphuc67@gmail.com">
                        </li>
                    </ul>
                </div>

                <div class="line"></div>

                <!-- 2️⃣ Giỏ hàng -->
                <div class="cart">
                    <table class="cart__table" aria-label="Giỏ hàng">
                        <thead class="cart__table-head">
                        <tr class="cart__row cart__row--head">
                            <th class="--text-left">Sản phẩm</th>
                            <th class="--text-center">Đơn giá</th>
                            <th class="--text-center">Số lượng</th>
                            <th class="--text-center">Thành tiền</th>
                        </tr>
                        </thead>

                        <tbody class="cart__table-body">
                        <tr class="cart__row">
                            <td class="cart__product --text-left">
                            <img src="https://i.pinimg.com/1200x/4b/bb/02/4bbb0223ba678e97772d02949e5f89ca.jpg" alt="Tên sản phẩm" class="cart__product-thumb" width="60" height="60">
                            <div class="cart__product-info">
                                <div class="cart__product-name">Sữa chua Hy Lạp</div>
                                <div class="cart__product-variant">Vị: Nho • Loại: chai</div>
                                <input type="hidden" name="product_name[]" value="Sữa chua Hy Lạp - Vị Nho - Chai">
                            </div>
                            </td>
                            <td class="cart__price --text-center">199.000₫</td>
                            <td class="cart__quantity --text-center">
                            <input type="number" class="cart__quantity-input" name="product_quantity[]" min="1" value="1" aria-label="Số lượng sản phẩm" readonly>
                            </td>
                            <td class="cart__subtotal --text-center">199.000₫</td>
                        </tr>

                        <tr class="cart__row">
                            <td class="cart__product --text-left">
                            <img src="https://i.pinimg.com/1200x/4b/bb/02/4bbb0223ba678e97772d02949e5f89ca.jpg" alt="Tên sản phẩm" class="cart__product-thumb" width="60" height="60">
                            <div class="cart__product-info">
                                <div class="cart__product-name">Sữa chua Hy Lạp</div>
                                <div class="cart__product-variant">Vị: Nho • Loại: chai</div>
                                <input type="hidden" name="product_name[]" value="Sữa chua Hy Lạp - Vị Nho - Chai">
                            </div>
                            </td>
                            <td class="cart__price --text-center">199.000₫</td>
                            <td class="cart__quantity --text-center">
                            <input type="number" class="cart__quantity-input" name="product_quantity[]" min="1" value="1" readonly>
                            </td>
                            <td class="cart__subtotal --text-center">199.000₫</td>
                        </tr>

                        <tr class="cart__row">
                            <td class="cart__product --text-left">
                            <img src="https://i.pinimg.com/1200x/4b/bb/02/4bbb0223ba678e97772d02949e5f89ca.jpg" alt="Tên sản phẩm" class="cart__product-thumb" width="60" height="60">
                            <div class="cart__product-info">
                                <div class="cart__product-name">Sữa chua Hy Lạp</div>
                                <div class="cart__product-variant">Vị: Nho • Loại: chai</div>
                                <input type="hidden" name="product_name[]" value="Sữa chua Hy Lạp - Vị Nho - Chai">
                            </div>
                            </td>
                            <td class="cart__price --text-center">199.000₫</td>
                            <td class="cart__quantity --text-center">
                            <input type="number" class="cart__quantity-input" name="product_quantity[]" min="1" value="1" readonly>
                            </td>
                            <td class="cart__subtotal --text-center">199.000₫</td>
                        </tr>
                        </tbody>
                    </table>
                </div>

                <!-- 3️⃣ Mã giảm giá -->
                <div class="payment__voucher-container">
                    <h3>Mã giảm giá</h3>
                    <div class="payment__choose-voucher">
                        <p><i class="fa-solid fa-ticket-simple"></i> Voucher</p>
                        <button type="button">Chọn voucher</button>
                    </div>

                    <div class="payment__voucher-info">
                        <div class="payment__chosen-info">
                        Đã chọn <span class="--color6">1</span> mã
                        </div>
                        <ul class="payment__chosen-voucher">
                        <li class="--color9">Phí giao hàng -15k</li>
                        <li class="--color6">Giảm 20%</li>
                        <li class="--color6">Giảm 22%</li>
                        <li class="--color6">Giảm 29%</li>
                        </ul>
                    </div>

                    <input type="hidden" name="voucher_code" value="VOUCHER2025">
                </div>

                <!-- 4️⃣ Phương thức thanh toán -->
                <div class="payment__method">
                    <h3 class="--color6">Phương thức thanh toán</h3>
                    <ul class="methods">
                        <li>
                            <label>
                                <input type="radio" name="payment_method" value="cod" required>
                                Thanh toán khi nhận hàng
                            </label>
                        </li>
                        <li>
                            <label>
                                <input type="radio" name="payment_method" value="bank" > 
                                Chuyển khoản ngân hàng
                            </label>
                        </li>
                    </ul>
                </div>

                <div class="payment__final-info">
                    <h3 class="final-title">Tổng kết đơn hàng</h3>
                    <ul class="final-list">
                        <li><p>Tổng tiền hàng</p><p>597.000₫</p></li>
                        <li><p>Phí vận chuyển</p><p>35.000₫</p></li>
                        <li><p>Tổng cộng voucher giảm giá</p><p>-35.000₫</p></li>
                        <li><p>Tổng thanh toán</p><p>597.000₫</p></li>
                    </ul>
                </div>

                <div class="action">
                    <button class="pay-btn">Thanh toán</button>
                </div>
                
            </form>
            <!-- 🧾 Kết thúc form -->

            </section>

            <section class="payment__result">
                <div class="payment-icon">✔</div>

                <h2 class="payment-title">Thanh toán thành công!</h2>
                <p class="payment-desc">Cảm ơn bạn đã mua hàng. Đơn hàng của bạn đang được xử lý.</p>

                <div class="payment-info">
                    <p><strong>Mã đơn hàng:</strong> #DH235678</p>
                    <p><strong>Tổng tiền:</strong> 1.200.000₫</p>
                    <p><strong>Phương thức thanh toán:</strong> Ví điện tử</p>
                </div>

                <div class="payment-actions">
                    <a href="OrderDetail.jsp" class="btn-primary">Xem đơn hàng</a>
                    <a href="Home.jsp" class="btn-secondary">Tiếp tục mua sắm</a>
                </div>
            </section>



    </main>


    <jsp:include page="/customer/components/Footer.jsp"/>


</body>
<script type="module" src="../scripts/main.js"></script>
<script src="../scripts/Payment.js"></script>
</html>