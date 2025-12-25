package controller;

import exception.RegisterError;
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

        RegisterError error = authService.register(
                name, email, phone, password, confirmPassword
        );

        if (error != RegisterError.NONE) {
            req.setAttribute("activeTab", "register");
            switch (error) {
                case PASSWORD_MISMATCH ->
                        req.setAttribute("error", "Mật khẩu xác nhận không khớp");
                case INVALID_EMAIL_FORMAT ->
                        req.setAttribute("error", "Email không đúng định dạng");
                case WEAK_PASSWORD ->
                        req.setAttribute("error", "Mật khẩu phải từ 8 ký tự và chứa chữ, số, ký tự đặc biệt");
                case EMAIL_EXIST ->
                        req.setAttribute("error", "Email đã tồn tại");
                case PHONE_ISVALID ->
                        req.setAttribute("error", "Số điện thoại không hợp lệ");
            }
            try {
                req.getRequestDispatcher("index.jsp").forward(req, resp);
                return;
            } catch (IOException ex) {
                throw new RuntimeException(ex);
            }
        }
        try {
            resp.sendRedirect("index.jsp");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}
