package controller;

import exception.LoginError;
import service.AuthService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import model.User;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "LoginController", value = "/login")
public class LoginController extends HttpServlet {

    private AuthService authService;

    @Override
    public void init()
    {
        this.authService = new AuthService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String account = request.getParameter("input");
        String password = request.getParameter("password_hashed");
        boolean isAdmin = request.getParameter("is_admin") != null;

        LoginError error = authService.checkLogin(account, password);
        switch (error) {
            case INVALID_USERNAME -> {
                request.setAttribute("loginError", "Tài khoản không tồn tại");
                request.getRequestDispatcher("index.jsp").forward(request, response);
                return;
            }
            case WRONG_PASSWORD -> {
                request.setAttribute("loginError", "Sai mật khẩu");
                request.getRequestDispatcher("index.jsp").forward(request, response);
                return;
            }
            case NOT_VERIFIED -> {
                request.setAttribute("loginError", "Tài khoản chưa kích hoạt, vui lòng kiểm tra email");
                request.getRequestDispatcher("index.jsp").forward(request, response);
                return;
            }
            case NONE -> {
                User u = authService.getUserData(account);
                HttpSession session = request.getSession();
                session.setAttribute("auth", u);
                boolean isAdminAccount = u.getRole().name().equalsIgnoreCase("admin");

                if (isAdminAccount && !isAdmin) {
                    request.setAttribute("loginError", "Tài khoản này là Admin, vui lòng chọn 'Đăng nhập với vai trò Admin'.");
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                    return;
                }
                if (isAdminAccount && isAdmin) {
                    response.sendRedirect("admin/pages/dashboard.jsp");
                    return;
                }
                response.sendRedirect("customer/pages/Home.jsp");
                return;
            }
        }
        try {
            request.getRequestDispatcher("index.jsp").forward(request, response);
            return;
        } catch (IOException ex) {
            throw new RuntimeException(ex);
        }
    }
}