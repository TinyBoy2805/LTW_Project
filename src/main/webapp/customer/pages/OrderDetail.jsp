<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chi tiết đơn hàng | MichiShop</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/customer/styles/index.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css">
</head>
<body>

    <jsp:include page="/customer/components/Header.jsp"/>

    <main class="main" style="background: #f8f9fa; padding: 40px 0;">
        <div class="container" style="max-width: 900px; margin: 0 auto; padding: 0 20px;">
            <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 20px;">
                <h2 style="font-weight: 700;">Chi tiết đơn hàng #${order.orderCode}</h2>
                <a href="${pageContext.request.contextPath}/profile?tab=purchase-info" style="color: var(--c6); text-decoration: none;">&larr; Quay lại danh sách đơn hàng</a>
            </div>

            <div class="card-modern" style="padding: 30px; background: white; border-radius: 12px; box-shadow: 0 2px 10px rgba(0,0,0,0.05);">

                <!-- Order Header -->
                <div style="display: flex; justify-content: space-between; align-items: center; border-bottom: 1px solid #eee; padding-bottom: 20px; margin-bottom: 20px;">
                    <div>
                        <p style="color: #666; margin-bottom: 5px;">Ngày đặt hàng:</p>
                        <p style="font-weight: 600;"><fmt:formatDate value="${order.createdAt}" pattern="dd/MM/yyyy HH:mm"/></p>
                    </div>
                    <div>
                        <p style="color: #666; text-align: right; margin-bottom: 5px;">Trạng thái:</p>
                        <span class="order-status-badge ${order.orderStatus.toLowerCase()}">
                            <c:choose>
                                <c:when test="${order.orderStatus eq 'PENDING'}">Chờ xác nhận</c:when>
                                <c:when test="${order.orderStatus eq 'DELIVERED'}">Đã giao</c:when>
                                <c:otherwise>${order.orderStatus}</c:otherwise>
                            </c:choose>
                        </span>
                    </div>
                </div>

                <!-- Product List -->
                <div style="margin-bottom: 20px;">
                    <h3 style="margin-bottom: 15px;">Sản phẩm</h3>
                    <c:forEach var="item" items="${order.items}">
                        <div style="display: flex; gap: 20px; padding: 15px 0; border-bottom: 1px solid #f0f0f0;">
                            <img src="${item.productUrl}" alt="${item.productName}" style="width: 80px; height: 80px; object-fit: cover; border-radius: 8px;">
                            <div style="flex: 1;">
                                <h4 style="margin: 0; font-size: 1.1rem;">${item.productName}</h4>
                                <p style="color: #666; margin: 5px 0;">Số lượng: ${item.quantity}</p>
                            </div>
                            <div style="text-align: right;">
                                <p style="font-weight: 600; color: var(--c6);"><fmt:formatNumber value="${item.priceAtPurchase}" pattern="#,###"/>₫</p>
                                <p style="font-weight: 700; margin-top: 5px;">Thành tiền: <fmt:formatNumber value="${item.priceAtPurchase * item.quantity}" pattern="#,###"/>₫</p>
                            </div>
                        </div>
                    </c:forEach>
                </div>

                <!-- Totals Section -->
                <div style="border-top: 2px solid #ddd; padding-top: 20px; display: grid; grid-template-columns: 2fr 1fr; gap: 10px;">
                    <div> <!-- empty div for spacing --> </div>
                    <div style="display: flex; flex-direction: column; gap: 15px;">
                        <div style="display: flex; justify-content: space-between;">
                            <span style="color: #666;">Tạm tính</span>
                            <span style="font-weight: 600;"><fmt:formatNumber value="${order.totalPrice}" pattern="#,###"/>₫</span>
                        </div>
                        <div style="display: flex; justify-content: space-between;">
                            <span style="color: #666;">Phí vận chuyển</span>
                            <span style="font-weight: 600;"><fmt:formatNumber value="${order.shippingFee}" pattern="#,###"/>₫</span>
                        </div>
                        <c:if test="${order.discountAmount > 0}">
                            <div style="display: flex; justify-content: space-between; color: var(--c6);">
                                <span style="font-weight: 600;">Giảm giá</span>
                                <span style="font-weight: 700;">-<fmt:formatNumber value="${order.discountAmount}" pattern="#,###"/>₫</span>
                            </div>
                        </c:if>
                        <div style="margin-top: 10px; padding-top: 15px; border-top: 2px solid #000; display: flex; justify-content: space-between; align-items: baseline;">
                            <span style="font-size: 1.2rem; font-weight: 700;">Tổng cộng</span>
                            <span style="font-size: 1.8rem; font-weight: 800; color: var(--c6);">
                                <fmt:formatNumber value="${order.finalAmount}" pattern="#,###"/>₫
                            </span>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </main>

    <jsp:include page="/customer/components/Footer.jsp"/>

</body>
</html>
