package controller;

import dao.AuthDao;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/verify")
public class VerifyController extends HttpServlet {
    AuthDao authDao = new AuthDao();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String email = req.getParameter("email");
        String otp = req.getParameter("otp");

        String stored = authDao.getOTP(email);
        if (stored != null && stored.equals(otp)) {
            authDao.updateVerified(email);
            resp.sendRedirect("verify.jsp?success=1");
        } else {
            resp.sendRedirect("verify.jsp?error=1");
        }
    }
}
