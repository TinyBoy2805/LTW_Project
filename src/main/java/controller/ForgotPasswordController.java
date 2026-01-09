package controller;

import exception.EmailStatus;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import service.AuthService;
import service.MailService;

import java.io.IOException;

@WebServlet("/enter-email")
public class ForgotPasswordController extends HttpServlet {

    private AuthService authService;
    private MailService mailService;

    @Override
    public void init(){
        authService = new AuthService();
        mailService = new MailService();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String email = req.getParameter("email");

        if (email == null || email.isBlank()) {
            req.setAttribute("error", "Email Không được để trống");
            req.getRequestDispatcher("forgot__password.jsp").forward(req, resp);
            return;
        }

        if (!authService.existsByEmail(email)) {
            req.setAttribute("error", "Email không tồn tại trên hệ thống");
            req.getRequestDispatcher("forgot__password.jsp").forward(req, resp);
            return;
        }

        String otp = String.format("%06d", new java.util.Random().nextInt(999999));
        EmailStatus status = mailService.sendOTP(email, otp);

        if (status == EmailStatus.SENT) {

            HttpSession session = req.getSession();
            session.setAttribute("otp_code", otp);
            session.setAttribute("otp_email", email);
            session.setAttribute("otp_expire", System.currentTimeMillis() + 5 * 60 * 1000);
            session.setAttribute("flow", "forgot");

            req.setAttribute("step", 2);
            req.getRequestDispatcher("forgot__password.jsp").forward(req, resp);

        } else if (status == EmailStatus.NOT_EXIST) {
            req.setAttribute("activeTab", "register");
            req.setAttribute("error", "Email không tồn tại hoặc không nhận được thư.");
            req.getRequestDispatcher("forgot__password.jsp").forward(req, resp);

        } else if (status == EmailStatus.REJECTED) {
            req.setAttribute("activeTab", "register");
            req.setAttribute("error", "Email bị từ chối. Vui lòng thử email khác.");
            req.getRequestDispatcher("forgot__password.jsp").forward(req, resp);

        } else {
            req.setAttribute("activeTab", "register");
            req.setAttribute("error", "Lỗi hệ thống khi gửi email. Vui lòng thử lại sau.");
            req.getRequestDispatcher("forgot__password.jsp").forward(req, resp);
        }
    }
}
