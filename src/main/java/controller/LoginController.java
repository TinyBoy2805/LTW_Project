package controller;

import exception.LoginError;
import exception.RegisterError;
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
    public void init() {
        authService = new AuthService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        String name = request.getParameter("name");
//        String password_hashed = request.getParameter("password_hashed");
//        AuthService as = new AuthService();
//        User u = as.checkLogin(name, password_hashed);
//        if (u != null) {
//            HttpSession session = request.getSession();
//            session.setAttribute("auth", u);
//            response.sendRedirect("home.jsp");
//        } else {
//            request.setAttribute("error", "Invalid name or password_hashed");
//            request.getRequestDispatcher("index.jsp").forward(request, response);
//        }

            String name = request.getParameter("name");
            String password = request.getParameter("password");

            LoginError error = authService.checkLogin(name, password);
                switch (error) {
                    case INVALID_USERNAME ->
                            request.setAttribute("error", "Tên đăng nhập không tồn tại");
                    case WRONG_PASSWORD ->
                            request.setAttribute("error", "Sai mật khẩu");
                    case NONE -> {
                            User u = authService.getUserData(name);
                            HttpSession session = request.getSession();
                            session.setAttribute("auth", u);
                            response.sendRedirect("home.jsp");
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