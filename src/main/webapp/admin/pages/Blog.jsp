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
                </div>
              </div>
            </div>
          </div>
          <div class="tab-panel active" data-panel="blogs">
            <div class="blog-list" role="list" aria-label="Danh sách bài viết">
              <%-- Hiển thị danh sách blog từ database --%>
              <c:forEach var="blog" items="${blogs}">
                <a class="blog-card blog-clickable" href="${pageContext.request.contextPath}/quanlyblog?id=${blog.id}" style="display:block;text-decoration:none;color:inherit;">
                  <figure class="card__figure">
                    <img src="${empty blog.thumbnail ? 'https://via.placeholder.com/200x120?text=No+Image' : blog.thumbnail}" alt="${blog.title}" style="object-fit:cover;width:200px;height:120px;">
                  </figure>
                  <div class="card-content">
                    <h4 class="card-title">${blog.title}</h4>
                    <p class="card-link" style="display:none">${blog.url}</p>
                    <p class="card-excerpt">${blog.content}</p>
                  </div>
                </a>
              </c:forEach>
        
            </div>
          </div>

          <!-- Tạo bài viết -->
          <div class="tab-panel" data-panel="create">
            <div class="content__body">
              <form class="form-wrap" action="${pageContext.request.contextPath}/blog" method="post" enctype="multipart/form-data">
                <section class="left-panel">
                  <div class="card-form">
                    <label class="label">Tiêu đề</label> 
                    <input name="title" class="input" type="text" placeholder="Nhập tiêu đề" required>

                    <label class="label">Link bài viết</label>
                    <input name="url" class="input" type="url" placeholder="https://...">

                    <div class="row two">
                      <div>
                        <label class="label">Ngày đăng</label>
                        <input name="created_at" class="input" type="date">
                      </div>
                    </div>

                    <label class="label">Nội dung (mô tả ngắn)</label>
                    <textarea name="content" class="input textarea" rows="3" placeholder="Tóm tắt, đoạn mô tả sẽ hiển thị trên card"></textarea>
                  </div>
                  
                </section>
                <aside class="right-panel">
                  <div class="images-card">
                    <h4>Hình ảnh</h4>
                    <div class="thumbs">
                      <!-- Thay nút + bằng input file -->
                      <input type="file" name="thumbnail" accept="image/*" class="input" style="margin-bottom:10px;">
                      <div style="font-size:13px;color:#888">Chọn ảnh đại diện cho bài viết</div>
                    </div>
                  </div>
                </aside>
                <div class="actions-row">
                  <div class="actions-left">
                    <p class="note">Đảm bảo nội dung tuân thủ chính sách và không vi phạm quy định.</p>
                  </div>
                  <div class="actions-right">
                    <div class="panel-actions">
                      <div class="actions">
                        <button class="btn ghost" type="reset">Hủy</button>
                        <button class="btn primary" type="submit">Đăng bài</button>
                      </div>
                    </div>
                  </div>
                </div>
              </form>
            </div>
          </div>


        </div> <!-- .content__panel -->
      </main>
    </div>
  </div> <!-- .main -->
  <script src="../scripts/components/extendSidebar.js"></script>
  <script src="${pageContext.request.contextPath}/admin/scripts/page/Blog.js"></script>
    </script>
</body>
</html>