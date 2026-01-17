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
            } else if ("update".equals(action) && idStr != null) {
                try {
                    int id = Integer.parseInt(idStr);
                    String title = request.getParameter("title");
                    String url = request.getParameter("url");
                    String createdAt = request.getParameter("created_at");
                    String content = request.getParameter("content");
                    String thumbnail = request.getParameter("thumbnail");
                    java.sql.Timestamp createdAtTs = null;
                    try {
                        createdAtTs = java.sql.Timestamp.valueOf(createdAt + " 00:00:00");
                    } catch (Exception e) {
                        createdAtTs = new java.sql.Timestamp(System.currentTimeMillis());
                    }
                    java.sql.Timestamp updatedAtTs = new java.sql.Timestamp(System.currentTimeMillis());
                    Blog blog = blogDao.getBlogById(id);
                    if (blog != null) {
                        blog.setTitle(title);
                        blog.setUrl(url);
                        blog.setCreatedAt(createdAtTs);
                        blog.setContent(content);
                        blog.setThumbnail(thumbnail);
                        blog.setUpdatedAt(updatedAtTs);
                        boolean updated = blogDao.updateBlog(blog);
                        if (updated) {
                            response.sendRedirect(request.getContextPath() + "/blog?msg=updated");
                        } else {
                            response.sendRedirect(request.getContextPath() + "/blog?msg=updatefail");
                        }
                        return;
                    }
                } catch (Exception ignored) {}
                response.sendRedirect(request.getContextPath() + "/blog?msg=updatefail");
                return;
            }
            response.sendRedirect(request.getContextPath() + "/blog?msg=invalid");
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