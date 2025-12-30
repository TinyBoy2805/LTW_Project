package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import service.MailService;
import java.io.IOException;

@WebServlet("/resend-otp")
public class ResendOtpController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws IOException, ServletException {

        //when the old otp is expired, user can resend the otp with this controller

        String email = req.getParameter("email");

        String otp = String.format("%06d", new java.util.Random().nextInt(999999));

        HttpSession session = req.getSession();
        session.setAttribute("otp_code", otp);
        session.setAttribute("otp_email", email);
        session.setAttribute("otp_expire", System.currentTimeMillis() + 5 * 60 * 1000);

        MailService.sendOTP(email, otp);

        req.setAttribute("email", email);
        req.setAttribute("message", "Mã OTP mới đã được gửi!");
        req.getRequestDispatcher("verify.jsp").forward(req, resp);
    }
}
