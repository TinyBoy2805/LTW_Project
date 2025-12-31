<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>MiChiShop</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/styles/components/sidebar.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/styles/components/header.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/styles/pages/Email.css" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css">
  <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
  <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
</head>

<body>
  <div class="Email main">
    <aside class="sidebar">
      <!-- header inclue shop's logo and shop's name -->
      <div class="sidebar__header">
        <img src="../imgs/logo.png" alt="Logo">
        <h2>MiChiShop</h2>
      </div>
      <!-- list item of sidebar -->
      <div class="sidebar__list">
        <ul class="list">
          <li class="list__item">
            <a href="dashboard.jsp">
              <div class="section">
                <div class="icon"><i class="fa-solid fa-chart-line"></i></div>
                <p class="title">Thống kê</p>
              </div>
            </a>
          </li>
          <li class="list__item">
            <a href="order.jsp">
              <div class="section">
                <div class="icon"><i class="fa-solid fa-shopping-cart"></i></div>
                <p class="title">Đơn hàng</p>
              </div>
            </a>
          </li>
          <li class="list__item">
            <a href="categories.jsp">
              <div class="section">
                <div class="icon"><i class="fa-solid fa-box"></i></div>
                <p class="title">Kho hàng</p>
              </div>
            </a>
          </li>
          <li class="list__item">
            <a href="${pageContext.request.contextPath}/khachhang">
              <div class="section">
                <div class="icon"><i class="fa-solid fa-users"></i></div>
                <p class="title">Khách hàng</p>
              </div>
            </a>
          </li>
          <li class="list__item">
            <a href="UuDai.jsp">
              <div class="section">
                <div class="icon"><i class="fa-solid fa-gift"></i></div>
                <p class="title">Ưu đãi</p>
              </div>
            </a>
          </li>
          <li class="list__item">
            <a href="Blog.jsp">
              <div class="section">
                <div class="icon"><i class=" fa-solid fa-blog"></i></div>
                <p class="title">Bài Viết</p>
              </div>
            </a>
          </li>
          <li class="list__item">
            <a href="./Email.jsp" class="active">
              <div class="section">
                <div class="icon"><i class="fa-solid fa-envelope"></i></div>
                <p class="title">Thông Báo</p>
              </div>
              <div class="badge">+99</div>
            </a>
          </li>
          <li class="list__item">
            <a href="CaiDat.jsp">
              <div class="section">
                <div class="icon"><i class="fa-solid fa-cog"></i></div>
                <p class="title">Cài đặt</p>
              </div>
            </a>
          </li>
        </ul>
      </div>
      <!-- bottom has exit button -->
      <div class="sidebar__bottom">
        <a href="${pageContext.request.contextPath}/index.jsp">
          <div class="icon"><ion-icon name="exit-outline"></ion-icon></div>
          <p class="title">Đăng xuất</p>
        </a>
      </div>
    </aside>

    <div class="container">
      <div class="container__header">
        <!-- header left has sidebar expand button and hello message -->
        <div class="header__left">
          <div class="icon" id="menu__action"><ion-icon name="menu-outline"></ion-icon></div>
          <h3>Chào mừng trở lại, <span>MiChi Admin</span></h3>
        </div>

        <div class="header__right">

          <div class="notification__wrapper">
            <div class="icon" id="notification__icon">
              <ion-icon name="notifications-outline"></ion-icon>
              <span class="notification__badge">3</span>
            </div>

            <div class="notification__frame">
              <h4 class="notification__title">🔔 Thông báo mới</h4>
              <div class="notification__list">

                <div class="notification__item new">
                  <div class="item__icon"><ion-icon name="bag-check-outline"></ion-icon></div>
                  <div class="item__content">
                    <p class="item__text"><strong>Đơn hàng mới:</strong> Mã O-250725 vừa được tạo.</p>
                    <span class="item__time">Vài giây trước</span>
                  </div>
                </div>

                <div class="notification__item new">
                  <div class="item__icon alert"><ion-icon name="alert-circle-outline"></ion-icon></div>
                  <div class="item__content">
                    <p class="item__text"><strong>Cảnh báo tồn kho:</strong> Sữa Bột GrowPro chỉ còn 10 sản phẩm.</p>
                    <span class="item__time">5 phút trước</span>
                  </div>
                </div>

                <div class="notification__item">
                  <div class="item__icon review"><ion-icon name="star-outline"></ion-icon></div>
                  <div class="item__content">
                    <p class="item__text">Có <strong>1 đánh giá 5 sao</strong> mới cho Váng sữa.</p>
                    <span class="item__time">1 giờ trước</span>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="avatar"><img src="../imgs/logo.png" alt="Avatar" /></div>
        </div>
      </div>


      <!-- Main content -->
      <main class="content" aria-labelledby="email-title">
        <h3 class="content__title">Thông Báo</h3>
        <div class="content__panel">
          <div class="panel-header">
            <div class="compose-left">
              <button type="button" class="compose-btn" id="compose__btn">
                <i class="fa-solid fa-pen-to-square"></i>
                Soạn thư
              </button>
            </div>

            <div class="controls controls--right">
              <div class="search__filter">
                <input type="text" placeholder="Tìm kiếm email (Tiêu đề, Người gửi,...)">
                <div class="search__box">
                  <ion-icon name="search-outline" class="search__icon"></ion-icon>
                  <div class="line"></div>
                  <div class="filter__wrapper">
                    <button class="filter__button" id="email__filter__btn">
                      <ion-icon name="funnel-outline"></ion-icon>
                      Lọc
                    </button>
                    <div class="filter__frame hidden" id="email__filter__frame">
                      <h4 class="filter__frame__title">Bộ Lọc Thông Báo</h4>

                      <div class="filter__group">
                        <label for="filter__email__status">Trạng thái:</label>
                        <select id="filter__email__status">
                          <option value="all">Tất cả</option>
                          <option value="unread">Chưa đọc</option>
                          <option value="read">Đã đọc</option>
                          <option value="important">Quan trọng</option>
                        </select>
                      </div>

                      <div class="filter__actions">
                        <button class="clear__button">Xóa lọc</button>
                        <button class="apply__button">Áp dụng</button>
                      </div>
                    </div>
                  </div>
                </div>
              </div>

            </div>

          </div> <!-- .panel-header -->

          <div class="mail-list" role="list" aria-label="Danh sách email">

            <!-- expanded sample rows -->
            <article class="mail-row" data-toggle="detail" data-target=".mail-detail">
              <div class="row-left">
                <label class="check-wrap"><input type="checkbox" /><span class="check-custom"></span></label>
                <button class="star" aria-pressed="false" title="Đánh dấu quan trọng"><i
                    class="fa-regular fa-star"></i></button>
              </div>
              <div class="mail-sender">Khoa Bruh</div>
              <div class="mail-subject"><strong>Yêu cầu hoàn tiền</strong> <span class="preview">Tôi muốn được hoàn lại
                  tiền cho sản phẩm bị hỏng khi giao, mong shop xử lý và hướng dẫn thủ tục hoàn tiền.</span></div>
              <div class="mail-date">11/10/2025</div>
            </article>

            <article class="mail-row selected" data-toggle="detail" data-target=".mail-detail">
              <div class="row-left">
                <label class="check-wrap"><input type="checkbox" /><span class="check-custom"></span></label>
                <button class="star" aria-pressed="true" title="Đã đánh dấu quan trọng"><i
                    class="fa-solid fa-star"></i></button>
              </div>
              <div class="mail-sender">Vinamilk</div>
              <div class="mail-subject"><strong>Thông báo nhập hàng</strong> <span class="preview">Bạn vừa có đơn hàng
                  từ Vinamilk đã được nhập vào kho và đang chờ kiểm đếm, vui lòng kiểm tra số lượng.</span></div>
              <div class="mail-date">11/10/2025</div>
            </article>

            <article class="mail-row" data-toggle="detail" data-target=".mail-detail">
              <div class="row-left">
                <label class="check-wrap"><input type="checkbox" /><span class="check-custom"></span></label>
                <button class="star" aria-pressed="false"><i class="fa-regular fa-star"></i></button>
              </div>
              <div class="mail-sender">Khoa Bruh</div>
              <div class="mail-subject"><strong>Yêu cầu hỗ trợ</strong> <span class="preview">Tôi cần giúp đỡ về việc
                  đăng ký tài khoản vip, mong được hỗ trợ hướng dẫn chi tiết.</span></div>
              <div class="mail-date">10/10/2025</div>
            </article>

            <article class="mail-row" data-toggle="detail" data-target=".mail-detail">
              <div class="row-left">
                <label class="check-wrap"><input type="checkbox" /><span class="check-custom"></span></label>
                <button class="star" aria-pressed="false"><i class="fa-regular fa-star"></i></button>
              </div>
              <div class="mail-sender">MichiShop</div>
              <div class="mail-subject"><strong>Khuyến mãi cuối tuần</strong> <span class="preview">Giảm 20% cho đơn
                  hàng trên 500k áp dụng từ thứ 6 đến chủ nhật, xem chi tiết điều kiện áp dụng trong thông báo.</span>
              </div>
              <div class="mail-date">9/10/2025</div>
            </article>

            <article class="mail-row" data-toggle="detail" data-target=".mail-detail">
              <div class="row-left">
                <label class="check-wrap"><input type="checkbox" /><span class="check-custom"></span></label>
                <button class="star" aria-pressed="false"><i class="fa-regular fa-star"></i></button>
              </div>
              <div class="mail-sender">Nguyễn Lan</div>
              <div class="mail-subject"><strong>Phản hồi đơn hàng</strong> <span class="preview">Sản phẩm nhận được bị
                  lỗi (vết bể trên bao bì), mong shop hỗ trợ đổi trả và hướng dẫn cách gửi lại hàng.</span></div>
              <div class="mail-date">7/10/2025</div>
            </article>

            <article class="mail-row selected" data-toggle="detail" data-target=".mail-detail">
              <div class="row-left">
                <label class="check-wrap"><input type="checkbox" /><span class="check-custom"></span></label>
                <button class="star" aria-pressed="true"><i class="fa-solid fa-star"></i></button>
              </div>
              <div class="mail-sender">Vinamilk</div>
              <div class="mail-subject"><strong>Hoàn tất giao dịch</strong> <span class="preview">Đơn hàng #12345 đã
                  được giao thành công tới khách hàng vào ngày 07/10/2025, cảm ơn bạn đã sử dụng dịch vụ.</span></div>
              <div class="mail-date">7/10/2025</div>
            </article>

            <article class="mail-row" data-toggle="detail" data-target=".mail-detail">
              <div class="row-left">
                <label class="check-wrap"><input type="checkbox" /><span class="check-custom"></span></label>
                <button class="star" aria-pressed="false"><i class="fa-regular fa-star"></i></button>
              </div>
              <div class="mail-sender">Hỗ trợ khách hàng</div>
              <div class="mail-subject"><strong>Yêu cầu hỗ trợ</strong> <span class="preview">Tôi cần thay đổi địa chỉ
                  giao hàng cho đơn #54321 do địa chỉ ban đầu không có người nhận, mong shop cập nhật kịp thời.</span>
              </div>
              <div class="mail-date">5/10/2025</div>
            </article>

            <article class="mail-row selected" data-toggle="detail" data-target=".mail-detail">
              <div class="row-left">
                <label class="check-wrap"><input type="checkbox" /><span class="check-custom"></span></label>
                <button class="star" aria-pressed="true"><i class="fa-solid fa-star"></i></button>
              </div>
              <div class="mail-sender">Phòng Kinh Doanh</div>
              <div class="mail-subject"><strong>Báo cáo doanh thu</strong> <span class="preview">Báo cáo tuần 8 đã được
                  gửi, vui lòng kiểm tra số liệu doanh thu, lợi nhuận và các chi tiết liên quan.</span></div>
              <div class="mail-date">5/10/2025</div>
            </article>

            <article class="mail-row selected" data-toggle="detail" data-target=".mail-detail">
              <div class="row-left">
                <label class="check-wrap"><input type="checkbox" /><span class="check-custom"></span></label>
                <button class="star" aria-pressed="true"><i class="fa-solid fa-star"></i></button>
              </div>
              <div class="mail-sender">Hỗ trợ kỹ thuật</div>
              <div class="mail-subject"><strong>Vấn đề thanh toán</strong> <span class="preview">Có giao dịch thất bại
                  với mã #TX9988, vui lòng kiểm tra log hệ thống và liên hệ bộ phận kỹ thuật để xử lý.</span></div>
              <div class="mail-date">28/9/2025</div>
            </article>

            <article class="mail-row" data-toggle="detail" data-target=".mail-detail">
              <div class="row-left">
                <label class="check-wrap"><input type="checkbox" /><span class="check-custom"></span></label>
                <button class="star" aria-pressed="false"><i class="fa-regular fa-star"></i></button>
              </div>
              <div class="mail-sender">Vinamilk</div>
              <div class="mail-subject"><strong>Khuyến mãi đặc biệt</strong> <span class="preview">Bộ quà tặng miễn phí
                  cho 100 khách hàng đầu tiên khi mua sản phẩm chương trình, áp dụng theo điều kiện chương trình.</span>
              </div>
              <div class="mail-date">28/9/2025</div>
            </article>

            <article class="mail-row" data-toggle="detail" data-target=".mail-detail">
              <div class="row-left">
                <label class="check-wrap"><input type="checkbox" /><span class="check-custom"></span></label>
                <button class="star" aria-pressed="false"><i class="fa-regular fa-star"></i></button>
              </div>
              <div class="mail-sender">Khoa Bruh</div>
              <div class="mail-subject"><strong>Thông báo hệ thống</strong> <span class="preview">Hệ thống sẽ bảo trì
                  vào chủ nhật tuần này từ 02:00 đến 06:00, một số dịch vụ có thể tạm ngưng trong thời gian này.</span>
              </div>
              <div class="mail-date">27/9/2025</div>
            </article>

            <article class="mail-row selected" data-toggle="detail" data-target=".mail-detail">
              <div class="row-left">
                <label class="check-wrap"><input type="checkbox" /><span class="check-custom"></span></label>
                <button class="star" aria-pressed="true"><i class="fa-solid fa-star"></i></button>
              </div>
              <div class="mail-sender">Lê Thị Hoa</div>
              <div class="mail-subject"><strong>Yêu cầu đổi trả</strong> <span class="preview">Sản phẩm nhận được bị
                  lỗi, mong shop hỗ trợ đổi trả nhanh và cung cấp hướng dẫn gửi trả hàng miễn phí nếu đủ điều
                  kiện.</span></div>
              <div class="mail-date">26/9/2025</div>
            </article>
          </div> <!-- .mail-list -->

          <!--Xem chi tiết email hoặc phản hồi-->
          <aside class="mail-detail" role="dialog" aria-hidden="true" aria-label="Chi tiết email">
            <header class="detail-header">
              <div class="detail-left">
                <h4 class="detail-subject">Yêu cầu hoàn tiền</h4>
                <div class="detail-meta"><span class="detail-sender">Khoa Bruh</span></div>
              </div>
              <div class="detail-right">
                <div class="detail-date">11/10/2025</div>
                <button class="detail-star star" aria-pressed="false"><i class="fa-regular fa-star"></i></button>
                <button class="detail-close" aria-label="Đóng chi tiết"><i class="fa-solid fa-xmark"></i></button>
              </div>
            </header>

            <div class="detail-body" tabindex="0">
              <p class="detail-message">Tôi muốn được hoàn lại tiền cho sản phẩm bị hỏng khi giao, mong shop xử lý và
                hướng dẫn thủ tục hoàn tiền.</p>
            </div>

            <form class="detail-reply" action="#" onsubmit="return false;">
              <label class="label">Trả lời</label>
              <textarea class="input textarea reply-text" rows="3" placeholder="Viết phản hồi..."></textarea>
              <div class="detail-actions">
                <button type="button" class="btn primary reply-send">Gửi</button>
                <button type="button" class="btn ghost reply-cancel">Hủy</button>
                <button type="button" class="btn danger reply-delete">Xóa</button>
              </div>
            </form>
          </aside>
      </main>
    </div>
  </div> <!-- .Email.main -->
  <script src="../scripts/components/extendSidebar.js"></script>
  <script src="../scripts/components/modalDetail.js"></script>
  <script src="../scripts/components/filter.js"></script>
  <script>
    // Ngăn checkbox trigger modal
    document.querySelectorAll('.check-wrap, .check-wrap input, .star').forEach(el => {
      el.addEventListener('click', function(e) {
        e.stopPropagation();
      });
    });
  </script>
</body>

</html>