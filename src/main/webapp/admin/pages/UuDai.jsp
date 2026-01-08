<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>MiChiShop</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/styles/components/header.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/styles/components/sidebar.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/styles/pages/UuDai.css" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css">
  <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
  <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
</head>

<body>
  <div class="UuDai main">
    <aside class="sidebar">
      <% request.setAttribute("activePage", "uudai"); %>
      <%@ include file="../components/sidebar.jsp" %>
    </aside>
    <div class="container">
      <%@ include file="../components/header.jsp" %>
 
      <!-- Main content -->
      <main class="content" aria-labelledby="uu-dai-title">
        <h3 class="content__title">Ưu Đãi</h3>
        <div class="content__panel">
          <div class="panel-header">
            <div class="toolbar">
              <a href="${pageContext.request.contextPath}/themuudai"><button class="new-btn" type="button">+ Ưu đãi mới</button></a>
            </div>
          </div>

          <div class="offers">
            <c:if test="${empty vouchers}">
              <p class="muted" style="padding: 16px;">Chưa có ưu đãi nào. Hãy tạo ưu đãi mới.</p>
            </c:if>

            <c:forEach items="${vouchers}" var="voucher">
              <a class="card-link" href="${pageContext.request.contextPath}/quanlyuudai?id=${voucher.id}" title="Quản lý ưu đãi">
              <article class="card" role="listitem" data-promo="${voucher.voucher_type}">
                <figure class="card__figure">
                  <c:choose>
                    <c:when test="${voucher.voucher_type.name() == 'SHIPPING'}">
                      <div class="promo-icon promo-shipping" aria-hidden="true"><i class="fa-solid fa-truck"></i></div>
                    </c:when>
                    <c:otherwise>
                      <div class="promo-icon promo-discount" aria-hidden="true"><i class="fa-solid fa-credit-card"></i></div>
                    </c:otherwise>
                  </c:choose>
                </figure>
                <div class="info">
                  <h4>${voucher.code != null ? voucher.code : 'Ưu đãi'}</h4>
                  <p>${voucher.description}</p>
                  <p class="muted">Loại: ${voucher.voucher_type.name() == 'SHIPPING' ? 'Giảm giá ship' : 'Giảm giá sản phẩm'}</p>
                  <c:if test="${voucher.min_order_value != null}">
                    <p class="muted">Áp dụng cho đơn từ: ${voucher.min_order_value}</p>
                  </c:if>
                  <c:if test="${voucher.discount_amount != null}">
                    <p class="muted">Giảm tiền: ${voucher.discount_amount}</p>
                  </c:if>
                  <c:if test="${voucher.discount_percentage != null}">
                    <p class="muted">Giảm %: ${voucher.discount_percentage}%</p>
                  </c:if>
                  <c:if test="${voucher.end_date != null}">
                    <p class="muted">Hạn sử dụng: ${voucher.end_date}</p>
                  </c:if>
                  <c:if test="${voucher.usage_limt != null}">
                    <p class="muted">Số lượng: ${voucher.usage_limt}</p>
                  </c:if>
                </div>
              </article>
              </a>
            </c:forEach>
          </div>
        </div>
      </main>
    </div>
  </div> 
  <script src="../scripts/components/extendSidebar.js"></script>
</body>

</html>