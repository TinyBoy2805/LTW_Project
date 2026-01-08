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
        String flow = (String) session.getAttribute("flow");

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
            fail(flow, req, resp, "Mã OTP đã hết hạn");
            req.setAttribute("email", email);
            return;
        }

        //wrong otp code
        if (!userOtp.equals(otp)) {
            fail(flow, req, resp, "Mã OTP không đúng");
            req.setAttribute("email", email);
            return;
        }

        //correct otp -> update into database (verified = 1)
        System.out.println("Email đang thực hiện activate: " + email);
        authService.activateAccount(email);

        if ("register".equals(flow)) {
            authService.activateAccount((String) session.getAttribute("otp_email"));
            req.setAttribute("verifiedSuccess", true);
            req.getRequestDispatcher("verify.jsp").forward(req, resp);
            return;
        }

        if ("forgot".equals(flow)) {
            req.setAttribute("step", 3);
            req.getRequestDispatcher("forgot__password.jsp").forward(req, resp);
        }

        //remove otp out of session
        session.removeAttribute("otp_code");
        session.removeAttribute("otp_email");
        session.removeAttribute("otp_expire");

    }

    private void fail(String flow, HttpServletRequest req, HttpServletResponse resp, String message) throws ServletException, IOException {
        req.setAttribute("error", message);

        if ("forgot".equals(flow)) {
            req.setAttribute("step", 2);
            req.getRequestDispatcher("forgo__password.jsp").forward(req, resp);
        } else {
            req.getRequestDispatcher("verify.jsp").forward(req, resp);
        }
    }
}
