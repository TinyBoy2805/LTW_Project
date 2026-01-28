package controller;

import dao.BlogDAO;
import model.Blog;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Timestamp;
import jakarta.servlet.http.Part;

@WebServlet("/admin/blog")
@jakarta.servlet.annotation.MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1,
        maxFileSize = 1024 * 1024 * 10,
        maxRequestSize = 1024 * 1024 * 15
)
public class AdminBlogController extends HttpServlet {
    private final BlogDAO blogDao = new BlogDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        // Xử lý upload file ảnh
        Part filePart = request.getPart("thumbnail");
        String fileName = "";
        String thumbnailPath = "";
        if (filePart != null && filePart.getSize() > 0) {
            fileName = java.nio.file.Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
            String uploadDir = getServletContext().getRealPath("/uploads");
            java.io.File uploadFolder = new java.io.File(uploadDir);
            if (!uploadFolder.exists()) uploadFolder.mkdir();
            String filePath = uploadDir + java.io.File.separator + fileName;
            filePart.write(filePath);
            thumbnailPath = "uploads/" + fileName;
        }
        String url = request.getParameter("url");
        String userIdStr = request.getParameter("user_id");
        int userId = 0;
        if (userIdStr != null && !userIdStr.isEmpty()) {
            userId = Integer.parseInt(userIdStr);
        } else {
            // Lấy user admin từ session, nếu chưa có thì mặc định là 1
            jakarta.servlet.http.HttpSession session = request.getSession(false);
            if (session != null && session.getAttribute("user") != null) {
                model.User user = (model.User) session.getAttribute("user");
                if (user.getRole() == model.Role.ADMIN) {
                    userId = user.getId();
                } else {
                    // Nếu không phải admin, có thể trả về lỗi hoặc gán mặc định
                    response.sendRedirect("/admin/pages/Blog.jsp?msg=not_admin");
                    return;
                }
            } else {
                // Nếu chưa đăng nhập, gán mặc định user admin id = 1
                userId = 1;
            }
        }
        Timestamp now = new Timestamp(System.currentTimeMillis());

        // Lấy ngày đăng từ form, nếu có
        String createdAtStr = request.getParameter("created_at");
        Timestamp createdAt = now;
        if (createdAtStr != null && !createdAtStr.isEmpty()) {
            try {
                java.sql.Date date = java.sql.Date.valueOf(createdAtStr);
                createdAt = new Timestamp(date.getTime());
            } catch (Exception ex) {
                // Nếu lỗi format, giữ nguyên now
            }
        }

        Blog blog = new Blog();
        blog.setUserId(userId);
        blog.setTitle(title);
        blog.setContent(content);
        blog.setThumbnail(thumbnailPath);
        blog.setUrl(url);
        blog.setCreatedAt(createdAt);
        blog.setUpdatedAt(now);

        try {
            boolean success = blogDao.insertBlog(blog);
            if (success) {
                response.sendRedirect(request.getContextPath() + "/admin/blog");
            } else {
                response.sendRedirect(request.getContextPath() + "/admin/blog");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/admin/blog");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        java.util.List<Blog> blogs = blogDao.getAllBlogs();
        request.setAttribute("blogs", blogs);
        request.getRequestDispatcher("/admin/pages/Blog.jsp").forward(request, response);
    }
}
