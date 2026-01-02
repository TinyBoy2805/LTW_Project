<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Quản Lý Bài Viết - MiChiShop</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/styles/pages/QuanLyBlog.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/styles/components/header.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/styles/components/sidebar.css" />
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
 
      <!-- content -->
      <div class="container__content">
        <h3 class="content__title">
          <a href="./Blog.jsp" class="back-icon">
            <i class="fa-solid fa-chevron-left"></i>
          </a>
          Quản lý bài viết
        </h3>
        <div class="content__body">
            <div class="form-wrap">
              <section class="left-panel">
                <div class="card-form">
                  <label class="label">Tiêu đề</label>
                  <div class="input-with-icon">
                    <input id="edit-title" class="input" type="text" placeholder="Nhập tiêu đề" value="Sữa công thức: Hướng dẫn chọn cho bé 0–12 tháng">
                    <i class="fa-solid fa-pen input-icon"></i>
                  </div>

                  <label class="label">Link bài viết</label>
                  <div class="input-with-icon">
                    <input id="edit-link" class="input" type="url" placeholder="https://..." value="http://michishop.local/blog/sua-cong-thuc-abc">
                    <i class="fa-solid fa-pen input-icon"></i>
                  </div>

                  <label class="label">Ngày đăng</label>
                  <div class="input-with-icon">
                    <input id="edit-date" class="input" type="date" value="2025-11-12">
                    <i class="fa-solid fa-pen input-icon"></i>
                  </div>

                  <label class="label">Nội dung (mô tả ngắn)</label>
                  <div class="input-with-icon">
                    <textarea id="edit-content" class="input textarea" rows="3" placeholder="Tóm tắt, đoạn mô tả sẽ hiển thị trên card">Bài viết hướng dẫn lựa chọn sữa công thức phù hợp theo độ tuổi, thành phần dinh dưỡng cần chú ý và mẹo chuyển đổi khi thay sữa.</textarea>
                    <i class="fa-solid fa-pen input-icon"></i>
                  </div>
                </div>
              </section>

              <aside class="right-panel">
                <div class="images-card">
                  <div class="images-card-header">
                    <h4>Hình ảnh</h4>
                    <i class="fa-solid fa-pen input-icon"></i>
                  </div>
                  <div class="thumbs">
                    <img id="blog-image" class="blog-thumb-image visible" src="https://media.vietnamplus.vn/images/ed1918d4cf848798286fdbd286ae25b434bfe5fe1202c90591deb8e201814798f805af93601147e13a81d0f60f99424f/thuc-pham-bo-sung4.jpg" alt="Hình ảnh bài viết">
                  </div>
                </div>
              </aside>
            </div>

            <div class="actions-row">
              <div class="actions-left">
                <p class="note">Đảm bảo nội dung tuân thủ chính sách và không vi phạm quy định.</p>
              </div>
              <div class="actions-right">
                <div class="panel-actions">
                  <div class="actions">
                    <button id="cancel-blog" class="btn ghost" type="button">Hủy</button>
                    <button id="btn-delete" class="btn danger" type="button">Xóa</button>
                    <button id="btn-update" class="btn primary" type="button">Cập Nhật</button>
                  </div>
                </div>
              </div>
            </div>
        </div>
      </div>
    </div>

  <script src="../scripts/components/extendSidebar.js"></script>
</body>

</html>
