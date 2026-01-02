package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import service.AuthService;

import java.io.IOException;

@WebServlet("/verify")
public class VerifyController extends HttpServlet {

    private AuthService authService;

    @Override
    public void init() {
        authService = new AuthService();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession();

        //combine all OTP input fields into 1 string (6 digits)
        String userOtp = req.getParameter("d1")+req.getParameter("d2")+req.getParameter("d3")+
                req.getParameter("d4")+req.getParameter("d5")+req.getParameter("d6");

        //get otp code, email user and expire time in session
        String email = req.getParameter("email");
        if(email == null) email = (String) session.getAttribute("otp_email");
        String otp = (String) session.getAttribute("otp_code");
        Long expire = (Long) session.getAttribute("otp_expire");

        //when the otp is expire
        if (expire == null || System.currentTimeMillis() > expire) {
            req.setAttribute("error", "Mã OTP đã hết hạn.");
            req.setAttribute("email", email);
            req.getRequestDispatcher("verify.jsp").forward(req, resp);
            return;
        }

        //wrong otp code
        if (!userOtp.equals(otp)) {
            req.setAttribute("error", "Mã OTP không đúng.");
            req.setAttribute("email", email);
            req.getRequestDispatcher("verify.jsp").forward(req, resp);
            return;
        }

        //correct otp -> update into database (verified = 1)
        System.out.println("Email đang thực hiện activate: " + email);
        authService.activateAccount(email);

        //remove otp out of session
        session.removeAttribute("otp_code");
        session.removeAttribute("otp_email");
        session.removeAttribute("otp_expire");

        //flag for JSP → switch UI to success confirmation mode
        req.setAttribute("verifiedSuccess", true);
        req.setAttribute("email", email);
        req.getRequestDispatcher("verify.jsp").forward(req, resp);
    }
}
