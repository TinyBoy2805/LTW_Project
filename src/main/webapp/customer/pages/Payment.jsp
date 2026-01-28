<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    request.setAttribute("activeTab", "");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thanh toán | MichiShop</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/customer/styles/index.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css">
</head>
<body>

    <div class="scroll-to-top-btn"><i class="fa-solid fa-circle-up"></i></div>
    <jsp:include page="/customer/components/Header.jsp"/>

    <main class="main" style="background: #f8f9fa; padding: 40px 0;">
        <div class="container" style="max-width: 1200px; margin: 0 auto; padding: 0 20px;">
            <h2 style="margin-bottom: 30px; font-weight: 700;">Thanh toán đơn hàng</h2>

            <form class="payment__form" action="${pageContext.request.contextPath}/payment" method="POST" id="checkout-form">
                <div style="display: grid; grid-template-columns: 1.8fr 1.2fr; gap: 30px; align-items: start;">

                    <!-- Cột trái: Thông tin chính -->
                    <div style="display: flex; flex-direction: column; gap: 20px;">

                        <!-- 1️⃣ Thông tin khách hàng -->
                        <div class="card-modern" style="padding: 25px; background: white; border-radius: 12px; box-shadow: 0 2px 10px rgba(0,0,0,0.05);">
                            <h3 style="margin-bottom: 20px; color: var(--c6); display: flex; align-items: center; gap: 10px;">
                                <i class="fa-solid fa-location-dot"></i> Thông tin giao hàng
                            </h3>
                            <div class="payment__customer-info" style="display: grid; gap: 15px;">
                                <div>
                                    <p style="color: #666; font-size: 0.9rem; margin-bottom: 4px;">Số điện thoại</p>
                                    <p style="font-weight: 600;">${userProfile.phone_number}</p>
                                </div>
                                <div style="border-top: 1px solid #eee; padding-top: 15px;">
                                    <p style="color: #666; font-size: 0.9rem; margin-bottom: 4px;">Địa chỉ giao hàng</p>
                                    <c:set var="defaultAddr" value="" />
                                    <c:forEach var="addr" items="${userProfile.myAddresses}">
                                        <c:if test="${addr.isDefault}">
                                            <c:set var="defaultAddr" value="${addr}" />
                                        </c:if>
                                    </c:forEach>

                                    <c:choose>
                                        <c:when test="${not empty defaultAddr}">
                                            <p style="font-weight: 600;">
                                                ${defaultAddr.houseNumber}, ${defaultAddr.road}, ${defaultAddr.ward}, ${defaultAddr.district}, ${defaultAddr.city}
                                            </p>
                                            <input type="hidden" name="addressId" value="${defaultAddr.id}">
                                        </c:when>
                                        <c:otherwise>
                                            <p style="color: #d32f2f; font-weight: 600;">⚠️ Vui lòng thêm địa chỉ mặc định trong profile!</p>
                                            <a href="${pageContext.request.contextPath}/profile?tab=address-list" style="color: var(--c6); font-size: 0.9rem;">Đi đến trang địa chỉ &rarr;</a>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                                <div style="border-top: 1px solid #eee; padding-top: 15px;">
                                    <p style="color: #666; font-size: 0.9rem; margin-bottom: 4px;">Email</p>
                                    <p style="font-weight: 600;">${userProfile.email}</p>
                                </div>
                            </div>
                        </div>

                        <!-- 2️⃣ Giỏ hàng tóm tắt -->
                        <div class="card-modern" style="padding: 25px; background: white; border-radius: 12px; box-shadow: 0 2px 10px rgba(0,0,0,0.05);">
                            <h3 style="margin-bottom: 20px; display: flex; align-items: center; gap: 10px;">
                                <i class="fa-solid fa-shopping-cart"></i> Sản phẩm
                            </h3>
                            <div class="payment__items">
                                <c:forEach var="item" items="${cart.cart.values()}">
                                    <div style="display: flex; gap: 15px; padding: 15px 0; border-bottom: 1px solid #f0f0f0;">
                                        <img src="${item.product.img_url}" alt="${item.product.name}" style="width: 70px; height: 70px; object-fit: cover; border-radius: 8px;">
                                        <div style="flex: 1;">
                                            <h4 style="margin: 0; font-size: 1rem;">${item.product.name}</h4>
                                            <p style="color: #666; font-size: 0.9rem; margin: 5px 0;">Số lượng: ${item.quantity}</p>
                                            <p style="font-weight: 600; color: var(--c6);"><fmt:formatNumber value="${item.price}" pattern="#,###"/>₫</p>
                                        </div>
                                        <div style="font-weight: 700;">
                                            <fmt:formatNumber value="${item.price * item.quantity}" pattern="#,###"/>₫
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>

                        <!-- 4️⃣ Phương thức thanh toán -->
                        <div class="card-modern" style="padding: 25px; background: white; border-radius: 12px; box-shadow: 0 2px 10px rgba(0,0,0,0.05);">
                            <h3 style="margin-bottom: 20px; color: var(--c6); display: flex; align-items: center; gap: 10px;">
                                <i class="fa-solid fa-credit-card"></i> Phương thức thanh toán
                            </h3>
                            <ul class="methods" style="list-style: none; padding: 0;">
                                <li style="margin-bottom: 12px; border: 1px solid #eee; border-radius: 8px; padding: 15px;">
                                    <label style="display: flex; align-items: center; gap: 10px; cursor: pointer;">
                                        <input type="radio" name="payment_method" value="cod" checked required style="width: 18px; height: 18px;">
                                        <div>
                                            <p style="font-weight: 600; margin: 0;">Thanh toán khi nhận hàng (COD)</p>
                                            <p style="font-size: 0.85rem; color: #666; margin: 0;">Trả tiền sau khi đã nhận và kiểm tra hàng.</p>
                                        </div>
                                    </label>
                                </li>
                                <li style="border: 1px solid #eee; border-radius: 8px; padding: 15px;">
                                    <label style="display: flex; align-items: center; gap: 10px; cursor: pointer;">
                                        <input type="radio" name="payment_method" value="bank" style="width: 18px; height: 18px;">
                                        <div>
                                            <p style="font-weight: 600; margin: 0;">Chuyển khoản ngân hàng</p>
                                            <p style="font-size: 0.85rem; color: #666; margin: 0;">Chuyển khoản qua ứng dụng ngân hàng.</p>
                                        </div>
                                    </label>
                                </li>
                            </ul>
                        </div>
                    </div>

                    <!-- Cột phải: Summary & Checkout -->
                    <div style="display: flex; flex-direction: column; gap: 20px; position: sticky; top: 100px;">

                        <!-- 3️⃣ Mã giảm giá -->
                        <div class="card-modern" style="padding: 25px; background: white; border-radius: 12px; box-shadow: 0 2px 10px rgba(0,0,0,0.05);">
                            <h3 style="margin-bottom: 20px; display: flex; align-items: center; gap: 10px;">
                                <i class="fa-solid fa-ticket-simple"></i> Mã giảm giá
                            </h3>

                            <div style="display: flex; gap: 10px; margin-bottom: 15px;">
                                <input type="text" id="voucher-input" placeholder="Nhập mã voucher"
                                    style="flex: 1; padding: 12px; border: 1px solid #ddd; border-radius: 8px;">
                                <button type="button" id="apply-voucher-btn"
                                    style="padding: 0 20px; background: var(--c6); color: white; border: none; border-radius: 8px; font-weight: 600; cursor: pointer;">
                                    Áp dụng
                                </button>
                            </div>

                            <div style="margin-top: 15px;">
                                <p style="font-size: 0.9rem; font-weight: 600; margin-bottom: 10px;">Voucher của bạn:</p>
                                <div style="display: flex; flex-direction: column; gap: 8px; max-height: 200px; overflow-y: auto;">
                                    <c:forEach var="v" items="${userVouchers}">
                                        <div class="voucher-mini-card" data-code="${v.code}"
                                            style="padding: 10px; border: 1px dashed var(--c6); border-radius: 8px; background: #fff9f9; cursor: pointer; display: flex; justify-content: space-between; align-items: center;">
                                            <div>
                                                <p style="margin: 0; font-weight: 700; color: var(--c6); font-size: 0.9rem;">${v.code}</p>
                                                <p style="margin: 0; font-size: 0.75rem; color: #666;">Giảm ${v.discount_percentage}% - Đơn từ <fmt:formatNumber value="${v.min_order_value}" pattern="#,###"/>đ</p>
                                            </div>
                                            <i class="fa-solid fa-plus" style="color: var(--c6);"></i>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>

                            <input type="hidden" name="voucherCode" id="applied-voucher-code">
                        </div>

                        <!-- 5️⃣ Bảng tổng tiền -->
                        <div class="card-modern" style="padding: 25px; background: white; border-radius: 12px; box-shadow: 0 4px 20px rgba(0,0,0,0.1); border: 2px solid var(--c6);">
                            <h3 style="margin-bottom: 25px; border-bottom: 1px solid #eee; padding-bottom: 15px;">Tổng kết chi phí</h3>
                            <ul style="list-style: none; padding: 0; display: flex; flex-direction: column; gap: 15px;">
                                <li style="display: flex; justify-content: space-between;">
                                    <span style="color: #666;">Tạm tính</span>
                                    <span style="font-weight: 600;"><fmt:formatNumber value="${cart.totalAmount}" pattern="#,###"/>₫</span>
                                </li>
                                <li style="display: flex; justify-content: space-between;">
                                    <span style="color: #666;">Phí vận chuyển</span>
                                    <span style="font-weight: 600;">35.000₫</span>
                                </li>
                                <li style="display: none; justify-content: space-between; color: var(--c6);" id="discount-row">
                                    <span style="font-weight: 600;">Giảm giá (<span id="discount-code-label"></span>)</span>
                                    <span style="font-weight: 700;">-<span id="discount-value-label">0</span>₫</span>
                                </li>
                                <li style="margin-top: 10px; padding-top: 20px; border-top: 2px solid #eee; display: flex; justify-content: space-between; align-items: baseline;">
                                    <span style="font-size: 1.1rem; font-weight: 700;">Tổng cộng</span>
                                    <span style="font-size: 1.8rem; font-weight: 800; color: var(--c6);" id="final-amount-label">
                                        <fmt:formatNumber value="${cart.totalAmount + 35000}" pattern="#,###"/>₫
                                    </span>
                                </li>
                            </ul>

                            <div style="margin-top: 30px;">
                                <button type="submit" class="pay-btn" ${empty defaultAddr ? 'disabled' : ''}
                                    style="width: 100%; padding: 18px; background: var(--c6); color: white; border: none; border-radius: 12px; font-size: 1.2rem; font-weight: 700; cursor: pointer; transition: 0.3s;">
                                    ĐẶT HÀNG NGAY
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </main>

    <script>
        document.addEventListener("DOMContentLoaded", () => {
        window.APP_CONTEXT_PATH = "${pageContext.request.contextPath}";
        const subtotal = ${cart.totalAmount};
            const shipping = 35000;
            let discount = 0;

            const voucherInput = document.getElementById("voucher-input");
            const applyBtn = document.getElementById("apply-voucher-btn");
            const discountRow = document.getElementById("discount-row");
            const discountCodeLabel = document.getElementById("discount-code-label");
            const discountValueLabel = document.getElementById("discount-value-label");
            const finalAmountLabel = document.getElementById("final-amount-label");
            const appliedVoucherHidden = document.getElementById("applied-voucher-code");

            const updateSummary = () => {
                const final = subtotal + shipping - discount;
                discountValueLabel.innerText = Math.round(discount).toLocaleString('vi-VN');
                finalAmountLabel.innerText = Math.round(final).toLocaleString('vi-VN') + "₫";

                if (discount > 0) {
                    discountRow.style.display = "flex";
                } else {
                    discountRow.style.display = "none";
                }
            };

            const applyVoucher = async (code) => {
                alert("Applying voucher: " + code);
                try {
                    const formData = new FormData();
                    formData.append("action", "check-voucher");
                    formData.append("code", code);

                    const res = await fetch(`${window.APP_CONTEXT_PATH}/payment`, {
                        method: 'POST',
                        body: new URLSearchParams(formData)
                    });
                    const data = await res.json();

                    if (data.success) {
                        discount = data.discount;
                        discountCodeLabel.innerText = data.code;
                        appliedVoucherHidden.value = data.code;
                        updateSummary();
                        alert("Áp dụng mã giảm giá thành công!");
                    } else {
                        alert(data.message);
                        discount = 0;
                        appliedVoucherHidden.value = "";
                        updateSummary();
                    }
                } catch (error) {
                    console.error("Error applying voucher:", error);
                    alert("Đã có lỗi xảy ra khi áp dụng voucher. Vui lòng thử lại.");
                }
            };

            applyBtn.addEventListener("click", () => {
                const code = voucherInput.value.trim();
                if (code) applyVoucher(code);
            });

            document.querySelectorAll(".voucher-mini-card").forEach(card => {
                card.addEventListener("click", () => {
                    const code = card.getAttribute("data-code");
                    voucherInput.value = code;
                    applyVoucher(code);
                });
            });
        });
    </script>

    <jsp:include page="/customer/components/Footer.jsp"/>

</body>
<script type="module" src="${pageContext.request.contextPath}/customer/scripts/main.js"></script>
</html>
