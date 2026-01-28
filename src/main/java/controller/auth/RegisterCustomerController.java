package controller.auth;

import service.AuthService;
import model.ValidateObject;
import exception.RegisterError;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.sql.Timestamp;
import java.util.Random;

@WebServlet(name = "RegisterCustomerController", value = "/admin/register_customer")
public class RegisterCustomerController extends HttpServlet {
    private final AuthService authService = new AuthService();
    private final String pepper = "TOI IU NLU-FIT";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone_number");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirm_password");

        // Validate
        ValidateObject errors = authService.validateRegistration(name, password, confirmPassword, email, phone);
        if (errors.hasError()) {
            response.getWriter().write("Lỗi: " + errors.getErrorMessage());
            return;
        }
        // Hash password
        String salt = generateSalt(16);
        String hashedPassword = "";
        try {
            hashedPassword = authService.hashPasswordUsingMD5(password, salt, pepper);
        } catch (NoSuchAlgorithmException e) {
            response.getWriter().write("Lỗi hệ thống khi mã hóa mật khẩu!");
            return;
        }
        // Tạo user mới (verified=0)
        int userId = authService.createNewUser(name, hashedPassword, email, phone, salt);
        if (userId > 0) {
            // Sinh token xác thực
            String token = java.util.UUID.randomUUID().toString();
            java.sql.Timestamp expiresAt = new java.sql.Timestamp(System.currentTimeMillis() + 15 * 60 * 1000);
            authService.createTokenAndExpiredTime(userId, token, expiresAt);
            response.getWriter().write("Đăng ký thành công! Vui lòng kiểm tra email để xác thực tài khoản.");
        } else {
            response.getWriter().write("Đăng ký thất bại!");
        }
    }

    private String generateSalt(int length) {
        String CHARACTERS = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
        Random ran = new Random();
        StringBuilder salt = new StringBuilder();
        for (int i = 0; i < length; i++) {
            salt.append(CHARACTERS.charAt(ran.nextInt(CHARACTERS.length())));
        }
        return salt.toString();
    }
}