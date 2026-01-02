<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
              <a href="ThemUuDai.jsp"><button class="new-btn" type="button">+ Ưu đãi mới</button></a>
            </div>
          </div>

          <div class="offers">
            <a class="card-link" href="QuanLyUuDai.jsp" aria-label="Xem chi tiết ưu đãi dành cho sữa bột">
              <article class="card" role="listitem" data-category="sua" data-customer="tat-ca" data-promo="discount">
                <figure class="card__figure">
                  <div class="promo-icon promo-discount" aria-hidden="true"><i class="fa-solid fa-credit-card"></i></div>
                </figure>
                <div class="info">
                  <h4>Ưu đãi dành cho sữa bột</h4>
                  <p>Giảm 15% cho các sản phẩm sữa bột chọn lọc, áp dụng kèm mã giảm giá.</p>
                  <p class="muted">Áp dụng cho đơn từ: 200.000đ</p>
                  <p class="muted">Hạn sử dụng: 30/11/2025</p>
                  <button class="time-pill" type="button">Thời hạn ưu đãi còn: 2 ngày</button>
                </div>
              </article>
            </a>

            <a class="card-link" href="QuanLyUuDai.jsp" aria-label="Xem chi tiết ưu đãi vận chuyển miễn phí">
              <article class="card" role="listitem" data-category="sua" data-customer="tat-ca" data-promo="shipping">
                <figure class="card__figure">
                  <div class="promo-icon promo-shipping" aria-hidden="true"><i class="fa-solid fa-truck"></i></div>
                </figure>
                <div class="info">
                  <h4>Ưu đãi vận chuyển miễn phí</h4>
                  <p>Miễn phí giao hàng cho đơn hàng sữa bột và hàng mẹ bé trong khu vực nội thành.</p>
                  <p class="muted">Áp dụng cho đơn từ: 300.000đ</p>
                  <p class="muted">Hạn sử dụng: 30/11/2025</p>
                  <button class="time-pill" type="button">Thời hạn ưu đãi còn: 3 ngày</button>
                </div>
              </article>
            </a>

            <a class="card-link" href="QuanLyUuDai.jsp" aria-label="Xem chi tiết ưu đãi vận chuyển nhanh">
              <article class="card" role="listitem" data-category="all" data-customer="tat-ca" data-promo="shipping">
                <figure class="card__figure">
                  <div class="promo-icon promo-shipping" aria-hidden="true"><i class="fa-solid fa-truck"></i></div>
                </figure>
                <div class="info">
                  <h4>Ưu đãi vận chuyển nhanh</h4>
                  <p>Giảm phí vận chuyển nhanh 50% cho đơn hàng nội thành khi dùng mã <strong>SHIP50</strong>.</p>
                  <p class="muted">Áp dụng cho đơn từ: 150.000đ</p>
                  <p class="muted">Hạn sử dụng: 30/12/2025</p>
                  <button class="time-pill" type="button">Thời hạn ưu đãi còn: 1 tháng</button>
                </div>
              </article>
            </a>

            <a class="card-link" href="QuanLyUuDai.jsp" aria-label="Xem chi tiết ưu đãi miễn phí vận chuyển cho đơn đầu">
              <article class="card" role="listitem" data-category="all" data-customer="tat-ca" data-promo="shipping">
                <figure class="card__figure">
                  <div class="promo-icon promo-shipping" aria-hidden="true"><i class="fa-solid fa-truck"></i></div>
                </figure>
                <div class="info">
                  <h4>Miễn phí vận chuyển cho đơn đầu</h4>
                  <p>Tặng miễn phí giao hàng cho khách hàng lần đầu mua khi sử dụng mã <strong>FREESHIP1</strong>.</p>
                  <p class="muted">Áp dụng cho đơn từ: 0đ</p>
                  <p class="muted">Hạn sử dụng: 31/01/2026</p>
                  <button class="time-pill" type="button">Thời hạn ưu đãi còn: 2 tháng</button>
                </div>
              </article>
            </a>

            <a class="card-link" href="QuanLyUuDai.jsp" aria-label="Xem chi tiết ưu đãi combo ăn dặm">
              <article class="card" role="listitem" data-category="an-dam" data-customer="tat-ca" data-promo="discount">
                <figure class="card__figure">
                  <div class="promo-icon promo-discount" aria-hidden="true"><i class="fa-solid fa-credit-card"></i></div>
                </figure>
                <div class="info">
                  <h4>Ưu đãi combo ăn dặm</h4>
                  <p>Combo đồ ăn dặm giảm 20% khi mua theo set, thích hợp cho bé 6–12 tháng.</p>
                  <p class="muted">Áp dụng cho đơn từ: 250.000đ</p>
                  <p class="muted">Hạn sử dụng: 31/12/2025</p>
                  <button class="time-pill" type="button">Thời hạn ưu đãi còn: 2 tháng</button>
                </div>
              </article>
            </a>

            <a class="card-link" href="QuanLyUuDai.jsp" aria-label="Xem chi tiết ưu đãi miễn phí vận chuyển toàn quốc">
              <article class="card" role="listitem" data-category="sua" data-customer="tat-ca" data-promo="shipping">
                <figure class="card__figure">
                  <div class="promo-icon promo-shipping" aria-hidden="true"><i class="fa-solid fa-truck"></i></div>
                </figure>
                <div class="info">
                  <h4>Miễn phí vận chuyển toàn quốc</h4>
                  <p>Miễn phí giao hàng cho đơn hàng sữa bột và sản phẩm dinh dưỡng cho bé.</p>
                  <p class="muted">Áp dụng cho đơn từ: 299.000đ</p>
                  <p class="muted">Hạn sử dụng: 30/11/2025</p>
                  <button class="time-pill" type="button">Thời hạn ưu đãi còn: 2 ngày</button>
                </div>
              </article>
            </a>

            <a class="card-link" href="QuanLyUuDai.jsp" aria-label="Xem chi tiết ưu đãi Flash Sale">
              <article class="card" role="listitem" data-category="sua" data-customer="tat-ca" data-promo="discount">
                <figure class="card__figure">
                  <div class="promo-icon promo-discount" aria-hidden="true"><i class="fa-solid fa-credit-card"></i></div>
                </figure>
                <div class="info">
                  <h4>Ưu đãi Flash Sale</h4>
                  <p>Giảm giá đặc biệt - chỉ trong hôm nay.</p>
                  <p class="muted">Áp dụng cho đơn từ: 500.000đ</p>
                  <p class="muted">Hạn sử dụng: 10/11/2025</p>
                  <button class="time-pill" type="button">Thời hạn: 1 ngày</button>
                </div>
              </article>
            </a>

            <a class="card-link" href="QuanLyUuDai.jsp" aria-label="Xem chi tiết voucher giảm giá 30%">
              <article class="card" role="listitem" data-category="sua" data-customer="tat-ca" data-promo="discount">
                <figure class="card__figure">
                  <div class="promo-icon promo-discount" aria-hidden="true"><i class="fa-solid fa-credit-card"></i></div>
                </figure>
                <div class="info">
                  <h4>Voucher giảm giá 30%</h4>
                  <p>Voucher giảm 30% dành cho khách hàng thân thiết.</p>
                  <p class="muted">Áp dụng cho đơn từ: 1 sản phẩm</p>
                  <p class="muted">Hạn sử dụng: 20/11/2025</p>
                  <button class="time-pill" type="button">Thời hạn: 5 ngày</button>
                </div>
              </article>
            </a>

            <a class="card-link" href="QuanLyUuDai.jsp" aria-label="Xem chi tiết ưu đãi giảm 50% phí ship">
              <article class="card" role="listitem" data-category="sua" data-customer="tat-ca" data-promo="shipping">
                <figure class="card__figure">
                  <div class="promo-icon promo-shipping" aria-hidden="true"><i class="fa-solid fa-truck"></i></div>
                </figure>
                <div class="info">
                  <h4>Giảm 50% phí ship</h4>
                  <p>Giảm 50% phí vận chuyển khi đặt mua online.</p>
                  <p class="muted">Áp dụng cho đơn từ: 300.000đ</p>
                  <p class="muted">Hạn sử dụng: 01/12/2025</p>
                  <button class="time-pill" type="button">Thời hạn: 21 ngày</button>
                </div>
              </article>
            </a>

            <a class="card-link" href="QuanLyUuDai.jsp" aria-label="Xem chi tiết ưu đãi giảm giá đơn hàng">
              <article class="card" role="listitem" data-category="sua" data-customer="tat-ca" data-promo="discount">
                <figure class="card__figure">
                  <div class="promo-icon promo-discount" aria-hidden="true"><i class="fa-solid fa-credit-card"></i></div>
                </figure>
                <div class="info">
                  <h4>Giảm giá đơn hàng</h4>
                  <p>Ưu đãi giảm giá dành cho mọi khách hàng.</p>
                  <p class="muted">Áp dụng cho đơn từ: 150.000đ</p>
                  <p class="muted">Hạn sử dụng: 31/12/2025</p>
                  <button class="time-pill" type="button">Thời hạn: 60 ngày</button>
                </div>
              </article>
            </a>

          </div> 
        </div> 
      </main>
    </div>
  </div> 
  <script src="../scripts/components/extendSidebar.js"></script>
</body>

</html>