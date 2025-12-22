package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import service.AuthService;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

@WebServlet("/register")
public class RegisterController extends HttpServlet {

    private AuthService authService;

    @Override
    public void init() {
        authService = new AuthService();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException {

        try {
            req.setCharacterEncoding("UTF-8");
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException(e);
        }

        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");
        String password = req.getParameter("password");
        String confirmPassword = req.getParameter("confirm_password");

        String error = authService.register(name, email, phone, password, confirmPassword);

        if (error != null) {
            req.setAttribute("error", error);
            try {
                req.setAttribute("activeTab", "register");
                req.getRequestDispatcher("index.jsp").forward(req, resp);
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
            return;
        }

        try {
            resp.sendRedirect("index.jsp");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}
