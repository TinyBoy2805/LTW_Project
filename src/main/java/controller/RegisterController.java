package controller;

import exception.RegisterError;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import service.AuthService;
import service.MailService;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

@WebServlet("/register")
public class RegisterController extends HttpServlet {

    private AuthService authService;
    private MailService mailService;

    @Override
    public void init() {
        this.authService = new AuthService();
        this.mailService = new MailService();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException {

        try {
            //ensure request body supports Vietnamese input (UTF-8)
            req.setCharacterEncoding("UTF-8");
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException(e);
        }

        //receive form input from UI
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");
        String password = req.getParameter("password");
        String confirmPassword = req.getParameter("confirm_password");

        //service layer handles validation + insert account (not verified yet)
        RegisterError error = authService.register(
                name, email, phone, password, confirmPassword
        );

        //if validation fails → send user back to register form with error message
        if (error != RegisterError.NONE) {
            req.setAttribute("activeTab", "register"); //keep register tab active after redirect
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

        //create otp send to user email
        //in this situation, register controller take responsibility to create the otp code for user
        String otp = String.format("%06d", new java.util.Random().nextInt(999999));

        //create session to save info of otp code, email receive otp and the use-time of the otp code
        HttpSession session = req.getSession();

        session.setAttribute("otp_code", otp);
        session.setAttribute("otp_email", email);
        session.setAttribute("otp_expire", System.currentTimeMillis() + 5 * 60 * 1000);

        //call service to send otp to user
        mailService.sendOTP(email, otp);
        req.setAttribute("email", email);

        try {
            req.getRequestDispatcher("verify.jsp").forward(req, resp);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}
