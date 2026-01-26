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
          <a href="${pageContext.request.contextPath}/admin/blog" class="back-icon">
            <i class="fa-solid fa-chevron-left"></i>
          </a>
          Quản lý bài viết
        </h3>
        <div class="content__body">
            <div class="form-wrap">
              <section class="left-panel" style="flex:1;">
                <div class="card-form">
                  <label class="label">Tiêu đề</label>
                  <div class="input-with-icon">
                    <input id="edit-title" name="title" class="input" type="text" placeholder="Nhập tiêu đề" value="${blog.title}" form="updateForm">
                    <i class="fa-solid fa-pen input-icon"></i>
                  </div>

                  <label class="label">Link bài viết</label>
                  <div class="input-with-icon">
                    <input id="edit-link" name="url" class="input" type="url" placeholder="https://..." value="${blog.url}" form="updateForm">
                    <i class="fa-solid fa-pen input-icon"></i>
                  </div>

                  <label class="label">Ngày đăng</label>
                  <div class="input-with-icon">
                    <input id="edit-date" name="created_at" class="input" type="date" value="${fn:substring(blog.createdAt, 0, 10)}" form="updateForm">
                    <i class="fa-solid fa-pen input-icon"></i>
                  </div>

                  <label class="label">Nội dung (mô tả ngắn)</label>
                  <div class="input-with-icon">
                    <textarea id="edit-content" name="content" class="input textarea" rows="3" placeholder="Tóm tắt, đoạn mô tả sẽ hiển thị trên card" form="updateForm">${blog.content}</textarea>
                    <i class="fa-solid fa-pen input-icon"></i>
                  </div>
                </div>
              </section>

              <aside class="right-panel">
                <div class="images-card">
                  <div class="images-card-header">
                    <h4>Hình ảnh</h4>
                  </div>
                  <div class="thumbs">
                    <img id="blog-image" class="blog-thumb-image visible" src="${empty blog.thumbnail ? 'https://via.placeholder.com/200x120?text=No+Image' : blog.thumbnail}" alt="Hình ảnh bài viết" style="max-width: 100%; max-height: 180px; display: block; margin-bottom: 10px;">
                    <input type="file" id="image-upload" name="image" form="updateForm" accept="image/*" style="margin-top: 8px;">
                  </div>
                </div>
              </aside>
              <div class="actions-row">
                <div class="actions-left">
                  <p class="note">Đảm bảo nội dung tuân thủ chính sách và không vi phạm quy định.</p>
                </div>
                <div class="actions-right">
                  <button class="btn ghost" type="button" onclick="window.location.href='${pageContext.request.contextPath}/admin/manage_blog?id=${blog.id}'">Hủy</button>
                  <form action="${pageContext.request.contextPath}/admin/manage_blog" method="post" style="display:inline-flex; gap:12px; align-items:center;">
                    <input type="hidden" name="action" value="delete" />
                    <input type="hidden" name="id" value="${blog.id}" />
                    <button class="btn danger" type="submit" onclick="return confirm('Bạn có chắc muốn xóa bài viết này?');">Xóa</button>
                  </form>
                  <form id="updateForm" action="${pageContext.request.contextPath}/admin/manage_blog" method="post" enctype="multipart/form-data" style="display:inline-flex; gap:12px; align-items:center;">
                    <input type="hidden" name="action" value="update" />
                    <input type="hidden" name="id" value="${blog.id}" />
                    <input type="hidden" name="thumbnail_old" value="${blog.thumbnail}" />
                    <button class="btn primary" type="submit">Cập Nhật</button>
                  </form>
                </div>
              </div>
        </div>
      </div>
    </div>

  <script src="../scripts/components/extendSidebar.js"></script>
  <script>
    // Preview ảnh trước khi upload
    document.getElementById('image-upload').addEventListener('change', function(event) {
      const [file] = event.target.files;
      if (file) {
        const img = document.getElementById('blog-image');
        img.src = URL.createObjectURL(file);
      }
    });
  </script>
</body>

</html>
