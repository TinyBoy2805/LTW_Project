package controller;

import exception.EmailStatus;
import exception.RegisterError;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import service.AuthService;
import service.MailService;
import util.EmailValidator;

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
            throws ServletException, IOException {

        try {
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
        RegisterError error = authService.validate(
                name, email, phone, password, confirmPassword
        );

        //if validation fails → send user back to register form with error message
        if (error != RegisterError.NONE) {
            req.setAttribute("activeTab", "register"); //keep register tab active after redirect
            switch (error) {
                case PASSWORD_MISMATCH -> req.setAttribute("error", "Mật khẩu xác nhận không khớp");
                case INVALID_EMAIL_FORMAT -> req.setAttribute("error", "Email không đúng định dạng");
                case WEAK_PASSWORD ->
                        req.setAttribute("error", "Mật khẩu phải từ 8 ký tự và chứa chữ, số, ký tự đặc biệt");
                case EMAIL_EXIST -> req.setAttribute("error", "Email đã tồn tại");
                case PHONE_ISVALID -> req.setAttribute("error", "Số điện thoại không hợp lệ");
            }
            try {
                req.getRequestDispatcher("index.jsp").forward(req, resp);
                return;
            } catch (IOException ex) {
                throw new RuntimeException(ex);
            }
        }

        //check email domain
        if (!EmailValidator.hasValidDomain(email)) {
            req.setAttribute("activeTab", "register");
            req.setAttribute("error", "Tên miền email không tồn tại hoặc không hỗ trợ nhận thư.");
            req.getRequestDispatcher("index.jsp").forward(req, resp);
            return;
        }

        //create otp send to user email, register controller take responsibility to create the otp code
        String otp = String.format("%06d", new java.util.Random().nextInt(999999));

        //call service to send otp to user
        EmailStatus status = mailService.sendOTP(email, otp);

        if (status == EmailStatus.SENT) {

            authService.register(name, email, phone, password, confirmPassword);

            HttpSession session = req.getSession();
            session.setAttribute("otp_code", otp);
            session.setAttribute("otp_email", email);
            session.setAttribute("otp_expire", System.currentTimeMillis() + 5 * 60 * 1000);

            req.setAttribute("email", email);
            req.getRequestDispatcher("verify.jsp").forward(req, resp);

        } else if (status == EmailStatus.NOT_EXIST) {
            req.setAttribute("activeTab", "register");
            req.setAttribute("error", "Email không tồn tại hoặc không nhận được thư.");
            req.getRequestDispatcher("index.jsp").forward(req, resp);

        } else if (status == EmailStatus.REJECTED) {
            req.setAttribute("activeTab", "register");
            req.setAttribute("error", "Email bị từ chối. Vui lòng thử email khác.");
            req.getRequestDispatcher("index.jsp").forward(req, resp);

        } else {
            req.setAttribute("activeTab", "register");
            req.setAttribute("error", "Lỗi hệ thống khi gửi email. Vui lòng thử lại sau.");
            req.getRequestDispatcher("index.jsp").forward(req, resp);
        }
    }
}
