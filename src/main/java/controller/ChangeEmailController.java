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
import util.EmailValidator;

import java.io.IOException;

@WebServlet("/change-email")
public class ChangeEmailController extends HttpServlet {
    private final AuthService authService = new AuthService();
    private final MailService mailService = new MailService();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws IOException, ServletException {

        req.setCharacterEncoding("UTF-8");

        HttpSession session = req.getSession();
        String oldEmail = req.getParameter("oldEmail");
        String newEmail = req.getParameter("newEmail");

        if (newEmail == null || newEmail.trim().isEmpty()) {
            req.setAttribute("emailError", "Vui lòng nhập email mới.");
            req.setAttribute("email", oldEmail);
            req.getRequestDispatcher("verify.jsp").forward(req, resp);
            return;
        }

        if (newEmail.equalsIgnoreCase(oldEmail)) {
            req.setAttribute("emailError", "Email mới phải khác email cũ.");
            req.setAttribute("email", oldEmail);
            req.getRequestDispatcher("verify.jsp").forward(req, resp);
            return;
        }

        //check format & duplicate
        if (!authService.isValidEmail(newEmail)) {
            req.setAttribute("emailError", "Email không hợp lệ. Vui lòng nhập lại.");
            req.getRequestDispatcher("verify.jsp").forward(req, resp);
            return;
        }
        if (authService.existsByEmail(newEmail)) {
            req.setAttribute("emailError", "Email đã được sử dụng. Hãy nhập email khác.");
            req.getRequestDispatcher("verify.jsp").forward(req, resp);
            return;
        }
        if (!EmailValidator.hasValidDomain(newEmail)) {
            req.setAttribute("emailError", "Tên miền email không tồn tại hoặc không hỗ trợ nhận thư.");
            req.getRequestDispatcher("verify.jsp").forward(req, resp);
            return;
        }

        //update DB when SMTP is OK
        authService.updateUserEmail(oldEmail, newEmail);

        //generate new OTP and resend
        String otp = String.format("%06d", new java.util.Random().nextInt(999999));

        EmailStatus status = mailService.sendOTP(newEmail, otp);

        if (status == EmailStatus.SENT) {
            // Email sent successfully - Update database
            authService.updateUserEmail(oldEmail, newEmail);

            // Update session with new OTP and email
            session.setAttribute("otp_code", otp);
            session.setAttribute("otp_email", newEmail);
            session.setAttribute("otp_expire", System.currentTimeMillis() + 5 * 60 * 1000);

            // Set attributes for JSP
            req.setAttribute("email", newEmail);
            req.setAttribute("emailChangeSuccess", true);
            req.setAttribute("message", "Email đã được cập nhật. Vui lòng kiểm tra hộp thư mới.");

            System.out.println("SUCCESS - Email changed from " + oldEmail + " → " + newEmail + " | OTP: " + otp);

            req.getRequestDispatcher("verify.jsp").forward(req, resp);

        } else {
            // Failed to send email
            req.setAttribute("emailError", "Không thể gửi email xác thực. Vui lòng thử lại hoặc dùng email khác.");
            req.setAttribute("email", oldEmail);
            System.err.println("ERROR - Failed to send OTP to: " + newEmail + " | Status: " + status);
            req.getRequestDispatcher("verify.jsp").forward(req, resp);
        }
    }
}


