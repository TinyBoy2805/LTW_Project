package controller;

import dao.BlogDao;
import model.Blog;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/admin/pages/quanlyblog")
public class BlogDetailController extends HttpServlet {
        @Override
        protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            String action = request.getParameter("action");
            String idStr = request.getParameter("id");
            if ("delete".equals(action) && idStr != null) {
                try {
                    int id = Integer.parseInt(idStr);
                    boolean deleted = blogDao.deleteBlogById(id);
                    if (deleted) {
                        response.sendRedirect(request.getContextPath() + "/blog?msg=deleted");
                    } else {
                        response.sendRedirect(request.getContextPath() + "/blog?msg=deletefail");
                    }
                    return;
                } catch (NumberFormatException ignored) {}
            }
            response.sendRedirect(request.getContextPath() + "/admin/pages/Blog.jsp?msg=invalid");
        }
    private final BlogDao blogDao = new BlogDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idStr = request.getParameter("id");
        Blog blog = null;
        if (idStr != null) {
            try {
                int id = Integer.parseInt(idStr);
                blog = blogDao.getBlogById(id);
            } catch (NumberFormatException ignored) {}
        }
        if (blog == null) {
            response.sendRedirect("/admin/pages/Blog.jsp?msg=notfound");
            return;
        }
        request.setAttribute("blog", blog);
        request.getRequestDispatcher("/admin/pages/QuanLyBlog.jsp").forward(request, response);
    }
}