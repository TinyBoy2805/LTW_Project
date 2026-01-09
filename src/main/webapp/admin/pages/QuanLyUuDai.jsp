<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Quản lý ưu đãi</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/styles/components/header.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/styles/components/sidebar.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/styles/pages/QuanLyUuDai.css" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css">
  <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
  <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
</head>

<body>
  <div class="QuanLyUuDai main">
    <aside class="sidebar">
      <% request.setAttribute("activePage", "uudai"); %>
      <%@ include file="../components/sidebar.jsp" %>
    </aside>
    <div class="container">
      <%@ include file="../components/header.jsp" %>
     
      <!-- Main content -->
      <main class="content" aria-labelledby="quan-ly-uu-dai-title">
        <h3 class="content__title" id="quan-ly-uu-dai-title">
          <a href="${pageContext.request.contextPath}/uudai" class="back-icon" aria-label="Quay lại ưu đãi"><i class="fa-solid fa-chevron-left"></i></a>
          Quản lý ưu đãi
        </h3>
        <div class="content__panel managing">
          <div class="panel-header"></div>

          <div class="content__body">
            <div class="form-wrap">
              <div class="left-panel">
                <div class="card-form">
                  <label class="label">Tên ưu đãi</label>
                  <div class="input-with-icon">
                    <input type="text" class="input" name="code" form="updateForm" value="${voucher.code}" />
                    <i class="fa-solid fa-pen input-icon"></i>
                  </div>

                  <label class="label">Áp dụng cho danh mục</label>
                  <select name="category_id" class="input" form="updateForm">
                    <option value="">Chọn danh mục</option>
                    <c:forEach var="cat" items="${categories}">
                      <option value="${cat.id}" ${voucher.category_name == cat.id ? 'selected' : ''}>${cat.name}</option>
                    </c:forEach>
                  </select>

                  <label class="label">Phân loại ưu đãi</label>
                  <select id="offer-type" name="voucher_type" class="input" form="updateForm">
                    <option value="discount" ${voucher.voucher_type != null and voucher.voucher_type.name() == 'DISCOUNT' ? 'selected' : ''}>Giảm giá sản phẩm</option>
                    <option value="shipping" ${voucher.voucher_type != null and voucher.voucher_type.name() == 'SHIPPING' ? 'selected' : ''}>Giảm giá ship</option>
                  </select>

                  <div class="row two">
                    <div>
                      <label class="label">Giảm tiền (vnđ)</label>
                      <div class="input-with-icon">
                        <input type="number" class="input" name="discount_amount" form="updateForm" min="0" step="1000" value="${voucher.discount_amount}" aria-label="Giảm tiền" />
                        <i class="fa-solid fa-pen input-icon"></i>
                      </div>
                    </div>
                    <div>
                      <label class="label">Giảm %</label>
                      <div class="input-with-icon">
                        <input type="number" class="input" name="discount_percentage" form="updateForm" min="0" max="100" step="1.0" value="${voucher.discount_percentage}" />
                        <i class="fa-solid fa-pen input-icon"></i>
                      </div>
                    </div>
                  </div>

                  <div class="row two">
                    <div>
                      <label class="label">Áp dụng cho đơn giá từ</label>
                      <div class="input-with-icon">
                        <input type="number" class="input" name="min_order_value" form="updateForm" min="0" step="1000" value="${voucher.min_order_value}"
                          aria-label="Áp dụng cho đơn giá từ" />
                        <i class="fa-solid fa-pen input-icon"></i>
                      </div>
                    </div>
                    <div>
                      <label class="label">Số lượng</label>
                      <div class="input-with-icon">
                        <input type="number" class="input" name="usage_limit" form="updateForm" min="0" step="1" value="${voucher.usage_limt}" />
                        <i class="fa-solid fa-pen input-icon"></i>
                      </div>
                    </div>
                  </div>
                  <label class="label">Áp dụng từ ngày</label>
                  <div class="input-with-icon">
                    <input type="date" class="input" name="start_date" form="updateForm" value="${voucher.start_date}" />
                    <i class="fa-solid fa-pen input-icon"></i>
                  </div>

                  <label class="label">Hạn ưu đãi đến hết ngày</label>
                  <div class="input-with-icon">
                    <input type="date" class="input" name="end_date" form="updateForm" value="${voucher.end_date}" />
                    <i class="fa-solid fa-pen input-icon"></i>
                  </div>

                  <label class="label">Mô tả chi tiết</label>
                  <div class="input-with-icon">
                    <textarea class="input textarea" name="description" form="updateForm" rows="4">${voucher.description}</textarea>
                    <i class="fa-solid fa-pen input-icon"></i>
                  </div>

              <div class="right-panel">
                <%-- Right panel content can go here if needed in the future --%>
              </div>
            </div>

            <div class="actions-row">
              <div class="actions-left">
                <p class="note">Đảm bảo rằng sản phẩm của bạn là hợp pháp và không gây hậu quả nào</p>
              </div>
              <div class="actions-right">
                <button class="btn ghost" type="button" onclick="window.location.href='${pageContext.request.contextPath}/quanlyuudai?id=${voucher.id}'">Hủy</button>
                <form action="${pageContext.request.contextPath}/quanlyuudai" method="post" style="display:inline-flex; gap:12px; align-items:center;">
                  <input type="hidden" name="action" value="delete" />
                  <input type="hidden" name="id" value="${voucher.id}" />
                  <button class="btn danger" type="submit">Xóa</button>
                </form>
                <form id="updateForm" action="${pageContext.request.contextPath}/quanlyuudai" method="post" style="display:inline-flex; gap:12px; align-items:center;">
                  <input type="hidden" name="action" value="update" />
                  <input type="hidden" name="id" value="${voucher.id}" />
                  <button class="btn primary" type="submit">Cập nhật</button>
                </form>
              </div>
            </div>
          </div>

        </div> <!-- .content__panel -->

      </main>
      <script src="../scripts/components/extendSidebar.js"></script>
      <script src="${pageContext.request.contextPath}/admin/scripts/page/Quanlyuudai.js"></script>
</body>

</html>
