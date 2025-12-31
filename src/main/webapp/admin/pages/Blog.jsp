<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>MiChiShop</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/styles/components/sidebar.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/styles/components/header.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/styles/pages/Blog.css" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css">
  <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
  <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
</head>

<body>
  <div class="Blog main">
    <aside class="sidebar">
      <% request.setAttribute("activePage", "blog"); %>
      <%@ include file="../components/sidebar.jsp" %>
    </aside>
    <div class="container">
      <%@ include file="../components/header.jsp" %>

      <!-- Main content -->
      <main class="content" aria-labelledby="blog-title">
        <h3 class="content__title">Bài Viết</h3>
        <div class="content__panel">
          <div class="panel-header">

            <div class="tabs" role="tablist" aria-label="Tabs blog">
              <button class="tab-btn active" data-tab="blogs" type="button">Bài Viết</button>
              <button class="tab-btn" data-tab="create" type="button">Tạo Bài Viết</button>
            </div>

            <div class="controls">
              <div class="search__filter">
                <input type="text" placeholder="Tìm kiếm bài viết (Tiêu đề, Nội dung)" id="blog__search__input"
                  aria-label="Tìm kiếm bài viết theo tiêu đề hoặc nội dung">
                <div class="search__box">
                  <ion-icon name="search-outline" class="search__icon"></ion-icon>
                  <div class="line"></div>
                  <div class="filter__wrapper">
                    <button class="filter__button" id="blog__filter__btn">
                      <ion-icon name="funnel-outline"></ion-icon>
                      Lọc
                    </button>
                    <div class="filter__frame hidden" id="blog__filter__frame">
                      <h4 class="filter__frame__title">Bộ Lọc Bài Viết</h4>
                      <div class="filter__group">
                        <label for="filter__blog__status">Trạng thái:</label>
                        <select id="filter__blog__status">
                          <option value="all">Tất cả</option>
                          <option value="published">Đã đăng</option>
                          <option value="draft">Bản nháp</option>
                        </select>
                      </div>
                      <!-- 'Chủ đề' filter removed as requested -->
                      <div class="filter__actions">
                        <button class="clear__button">Xóa lọc</button>
                        <button class="apply__button">Áp dụng</button>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="tab-panel active" data-panel="blogs">
            <div class="blog-list" role="list" aria-label="Danh sách bài viết">
              <article class="blog-card blog-clickable" role="button" tabindex="0">
                <figure class="card__figure"><img
                    src="https://media.vietnamplus.vn/images/ed1918d4cf848798286fdbd286ae25b434bfe5fe1202c90591deb8e201814798f805af93601147e13a81d0f60f99424f/thuc-pham-bo-sung4.jpg"
                    alt="Sữa công thức">
                </figure>
                <div class="card-content">
                  <span class="card-badge">Đã đăng</span>
                  <h4 class="card-title">Sữa công thức: Hướng dẫn chọn cho bé 0–12 tháng</h4>
                  <p class="card-meta">Ngày: 12/11/2025</p>
                  <p class="card-link" style="display:none">http://michishop.local/blog/sua-cong-thuc-abc</p>
                  <p class="card-excerpt">Bài viết hướng dẫn lựa chọn sữa công thức phù hợp theo độ tuổi, thành phần
                    dinh dưỡng cần chú ý và mẹo chuyển đổi khi thay sữa.</p>
                </div>
              </article>

              <article class="blog-card blog-clickable" role="button" tabindex="0">
                <figure class="card__figure"><img src="https://vsh.org.vn/pic/News/images/che-do-dinh-duong-covid19.jpg"
                    alt="Thực phẩm dinh dưỡng">
                </figure>
                <div class="card-content">
                  <span class="card-badge">Đã đăng</span>
                  <h4 class="card-title">Thực phẩm bổ sung cho trẻ: Khi nào cần và loại nào an toàn?</h4>
                  <p class="card-meta">Ngày: 01/11/2025</p>
                  <p class="card-link" style="display:none">http://michishop.local/blog/thuc-pham-bo-sung</p>
                  <p class="card-excerpt">Tổng hợp các loại thực phẩm bổ sung (vitamins, probiotics) cho trẻ, nguồn gốc
                    an toàn và liều dùng gợi ý theo từng nhóm tuổi.</p>
                </div>
              </article>

              <article class="blog-card blog-clickable" role="button" tabindex="0">
                <figure class="card__figure"><img
                    src="https://www.vinmec.com/static/uploads/small_20200819_035119_590444_vi_sao_tre_bi_hep_m_max_1800x1800_jpg_c0ced03362.jpg"
                    alt="Sữa cho trẻ em">
                </figure>
                <div class="card-content">
                  <span class="card-badge">Đã đăng</span>
                  <h4 class="card-title">So sánh các loại sữa cho trẻ 1–3 tuổi</h4>
                  <p class="card-meta">Ngày: 28/10/2025</p>
                  <p class="card-link" style="display:none">http://michishop.local/blog/so-sanh-sua-1-3</p>
                  <p class="card-excerpt">Bài viết so sánh phổ biến giữa sữa tăng cân, sữa phát triển và sữa bổ sung vi
                    chất giúp bố mẹ dễ lựa chọn.</p>
                </div>
              </article>

              <article class="blog-card blog-clickable" role="button" tabindex="0">
                <figure class="card__figure"><img
                    src="https://file.hstatic.net/200000460185/file/440293054_1486400732293385_283475967119864188_n_bc649692da824bb9ac0a7108d2f0e813_grande.jpg"
                    alt="Dinh dưỡng trẻ">
                </figure>
                <div class="card-content">
                  <span class="card-badge">Đã đăng</span>
                  <h4 class="card-title">Bữa ăn cho bé 6–12 tháng: Mẹo kết hợp dinh dưỡng</h4>
                  <p class="card-meta">Ngày: 18/10/2025</p>
                  <p class="card-link" style="display:none">http://michishop.local/blog/bua-an-6-12-thang</p>
                  <p class="card-excerpt">Gợi ý thực đơn hàng tuần, tỉ lệ chất đạm, bột và rau củ để hỗ trợ tăng trưởng
                    khỏe mạnh.</p>
                </div>
              </article>

              <article class="blog-card blog-clickable" role="button" tabindex="0">
                <figure class="card__figure"><img
                    src="https://nreci.org/wp-content/uploads/2023/01/hinh-anh-thap-dinh-duong-cho-tre-mam-non-1.webp"
                    alt="Ăn dặm"></figure>
                <div class="card-content">
                  <span class="card-badge">Đã đăng</span>
                  <h4 class="card-title">Ăn dặm an toàn: Các loại thực phẩm cần tránh</h4>
                  <p class="card-meta">Ngày: 05/10/2025</p>
                  <p class="card-link" style="display:none">http://michishop.local/blog/an-dam-an-toan</p>
                  <p class="card-excerpt">Danh sách thực phẩm có nguy cơ dị ứng hoặc nghẹn, kèm lời khuyên chế biến an
                    toàn cho bé.</p>
                </div>
              </article>

              <article class="blog-card blog-clickable" role="button" tabindex="0">
                <figure class="card__figure"><img
                    src="https://suckhoedoisong.qltns.mediacdn.vn/Images/nguyenkhanh/2020/03/26/mon-an-cho-tre-.jpg"
                    alt="Sức khỏe trẻ em">
                </figure>
                <div class="card-content">
                  <span class="card-badge">Đã đăng</span>
                  <h4 class="card-title">Giữ hệ tiêu hóa khỏe mạnh cho trẻ: Probiotics và prebiotics</h4>
                  <p class="card-meta">Ngày: 22/09/2025</p>
                  <p class="card-link" style="display:none">http://michishop.local/blog/he-tieu-hoa</p>
                  <p class="card-excerpt">Hiểu về lợi ích của probiotics, cách bổ sung an toàn và thực phẩm giàu
                    prebiotics tự nhiên.</p>
                </div>
              </article>

              <article class="blog-card blog-clickable" role="button" tabindex="0">
                <figure class="card__figure"><img
                    src="https://suckhoedoisong.qltns.mediacdn.vn/324455921873985536/2022/8/17/sua-16606738764131624047533.jpg"
                    alt="Sữa hữu cơ"></figure>
                <div class="card-content">
                  <span class="card-badge">Đã đăng</span>
                  <h4 class="card-title">Sữa hữu cơ với sữa thường: Có đáng đầu tư?</h4>
                  <p class="card-meta">Ngày: 10/09/2025</p>
                  <p class="card-link" style="display:none">http://michishop.local/blog/sua-huu-co-vs-thuong</p>
                  <p class="card-excerpt">Phân tích chi phí-lợi ích, thành phần dinh dưỡng và tiêu chuẩn an toàn giữa
                    hai loại sữa.</p>
                </div>
              </article>

              <article class="blog-card blog-clickable" role="button" tabindex="0">
                <figure class="card__figure"><img
                    src="https://www.vinmec.com/static/uploads/small_20210518_170321_275704_cham_soc_tre_max_1800x1800_jpg_b9b9632ddc.jpg"
                    alt="Dinh dưỡng bé">
                </figure>
                <div class="card-content">
                  <span class="card-badge">Đã đăng</span>
                  <h4 class="card-title">Vitamin cần thiết cho trẻ sơ sinh: Liều lượng và nguồn thực phẩm</h4>
                  <p class="card-meta">Ngày: 01/09/2025</p>
                  <p class="card-link" style="display:none">http://michishop.local/blog/vitamin-so-sinh</p>
                  <p class="card-excerpt">Những vitamin thường thiếu ở trẻ sơ sinh và cách bù đắp qua thực phẩm tự nhiên
                    và bổ sung đúng cách.</p>
                </div>
              </article>
              <!-- Bản nháp -->
              <article class="blog-card blog-clickable" role="button" tabindex="0">
                <figure class="card__figure"><img
                    src="https://bau.vn/wp-content/uploads/2022/04/luoc-trung-cai-sua-meo-vat-dan-gian-mot-phat-an-ngay-3.jpg"
                    alt="Bản nháp 1">
                </figure>
                <div class="card-content">
                  <span class="card-badge draft">Bản nháp</span>
                  <h4 class="card-title">Cách chọn sữa cho bé sinh non</h4>
                  <p class="card-meta">Ngày: 21/11/2025</p>
                  <p class="card-link" style="display:none">http://michishop.local/blog/sua-sinh-non</p>
                  <p class="card-excerpt">Thảo luận các lưu ý khi lựa chọn sữa cho trẻ sinh non, cần kiểm
                    tra bác sĩ trước khi thay đổi.</p>
                </div>
              </article>

              <article class="blog-card blog-clickable" role="button" tabindex="0">
                <figure class="card__figure"><img
                    src="https://www.cleanipedia.com/images/5iwkm8ckyw6v/3LVycqdEjr9gmm5HYHuzcf/ed822419b50cf144131b0aa3c649c029/NDA0ZmE3MTE1YjYzMGU0MWU1YTQ0MWQ1ZDJhZDUzYmUtMTgwMHctMTIwMGguanBn/1200w/ng%C6%B0%E1%BB%9Di-ph%E1%BB%A5-n%E1%BB%AF-%C4%91ang-cho-em-b%C3%A9-%C4%83n..jpg"
                    alt="Bản nháp 2">
                </figure>
                <div class="card-content">
                  <span class="card-badge draft">Bản nháp</span>
                  <h4 class="card-title">Thực đơn ăn dặm tuần đầu cho bé 6 tháng</h4>
                  <p class="card-meta">Ngày: 19/11/2025</p>
                  <p class="card-link" style="display:none">http://michishop.local/blog/thuc-don-an-dam-tuan-dau</p>
                  <p class="card-excerpt">Gợi ý thực đơn ban đầu khi bắt đầu cho bé ăn dặm, các loại thực phẩm
                    thử nghiệm từng bước để giảm nguy cơ dị ứng.</p>
                </div>
              </article>

              <article class="blog-card">
                <figure class="card__figure"><img
                    src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_Lz7_z2VOYEHy4kvmQnshzc6kKWsOvgQKVA&s"
                    alt="Bản nháp 3">
                </figure>
                <div class="card-content">
                  <span class="card-badge draft">Bản nháp</span>
                  <h4 class="card-title">Chế độ dinh dưỡng cho trẻ em theo từng độ tuổi</h4>
                  <p class="card-meta">Ngày: 17/11/2025</p>
                  <p class="card-link" style="display:none">http://michishop.local/blog/che-do-dinh-duong-tre-em</p>
                  <p class="card-excerpt">Hướng dẫn chi tiết về chế độ dinh dưỡng phù hợp cho trẻ em ở các giai đoạn
                    phát triển khác nhau.</p>
                </div>
              </article>

              <article class="blog-card">
                <figure class="card__figure"><img
                    src="https://cdn.thuvienphapluat.vn/uploads/tintuc/2023/05/09/san-pham-dinh-duong-dung-cho-tre-nho.png"
                    alt="Bản nháp 4">
                </figure>
                <div class="card-content">
                  <span class="card-badge draft">Bản nháp</span>
                  <h4 class="card-title">Mẹo cho con biếng ăn: thực đơn đơn giản</h4>
                  <p class="card-meta">Ngày: 22/11/2025</p>
                  <p class="card-link" style="display:none">http://michishop.local/blog/meo-beo-an</p>
                  <p class="card-excerpt">Tổng hợp các món ngon, dễ làm và cách trình bày hấp dẫn giúp bé hứng thú ăn
                    uống hơn.</p>
                </div>
              </article>
            </div>
          </div>

          <!-- Tạo bài viết -->
          <div class="tab-panel" data-panel="create">
            <div class="content__body">
              <div class="form-wrap">
                <section class="left-panel">
                  <div class="card-form">
                    <label class="label">Tiêu đề</label>
                    <input id="blog-title" class="input" type="text" placeholder="Nhập tiêu đề" required>

                    <label class="label">Link bài viết</label>
                    <input id="blog-link" class="input" type="url" placeholder="https://...">

                    <div class="row two">
                      <div>
                        <label class="label">Ngày đăng</label>
                        <input id="blog-date" class="input" type="date">
                      </div>
                    </div>

                    <label class="label">Nội dung (mô tả ngắn)</label>
                    <textarea id="blog-content" class="input textarea" rows="3"
                      placeholder="Tóm tắt, đoạn mô tả sẽ hiển thị trên card"></textarea>
                  </div>
                </section>

                <aside class="right-panel">
                  <div class="images-card">
                    <h4>Hình ảnh</h4>
                    <div class="thumbs">
                      <div class="add-thumb">+</div>
                    </div>
                  </div>
                </aside>
              </div>
              <!-- Actions row -->
              <div class="actions-row">
                <div class="actions-left">
                  <p class="note">Đảm bảo nội dung tuân thủ chính sách và không vi phạm quy định.</p>
                </div>
                <div class="actions-right">
                  <div class="panel-actions">
                    <div class="actions">
                      <button id="cancel-blog" class="btn ghost" type="button">Hủy</button>
                      <button id="save-draft-blog" class="btn secondary" type="button">Lưu bản nháp</button>
                      <button id="publish-blog" class="btn primary" type="button">Đăng bài</button>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>


        </div> <!-- .content__panel -->


      </main>
    </div>
  </div> <!-- .main -->
  <script src="../scripts/components/extendSidebar.js"></script>
  <script src="../scripts/page/Blog.js"></script>
  <script src="../scripts/components/filter.js"></script>
</body>

</html>