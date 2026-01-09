package controller;


import dao.BlogDao;
import model.Blog;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Timestamp;

@WebServlet("/blog")
public class BlogController extends HttpServlet {
    private final BlogDao blogDao = new BlogDao();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        String thumbnail = request.getParameter("thumbnail");
        String url = request.getParameter("url");
        String userIdStr = request.getParameter("user_id");
        long userId = 0;
        if (userIdStr != null && !userIdStr.isEmpty()) {
            userId = Long.parseLong(userIdStr);
        } else {
            // Lấy user admin từ session, nếu chưa có thì mặc định là 1
            jakarta.servlet.http.HttpSession session = request.getSession(false);
            if (session != null && session.getAttribute("user") != null) {
                model.User user = (model.User) session.getAttribute("user");
                if (user.getRole() == model.Role.admin) {
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

        Blog blog = new Blog();
        blog.setUserId(userId);
        blog.setTitle(title);
        blog.setContent(content);
        blog.setThumbnail(thumbnail != null ? thumbnail : ""); // Nếu ảnh trống thì gán chuỗi rỗng
        blog.setUrl(url);
        blog.setCreatedAt(now);
        blog.setUpdatedAt(now);

        try {
            boolean success = blogDao.insertBlog(blog);
            if (success) {
                response.sendRedirect("/admin/pages/Blog.jsp?msg=success");
            } else {
                response.sendRedirect("/admin/pages/Blog.jsp?msg=fail");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("/admin/pages/Blog.jsp?msg=error");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.sendRedirect(request.getContextPath() + "/admin/pages/Blog.jsp");
    }
}
