package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import service.AuthService;

import java.io.IOException;

@WebServlet("/change-password")
public class ChangePassController extends HttpServlet {
    private AuthService authService;

    @Override
    public void init(){
        authService = new AuthService();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession();
        String email = req.getParameter("email");
        if(email == null) email = (String) session.getAttribute("otp_email");

        String password = req.getParameter("new_password");
        String confirm_password = req.getParameter("confirm_new_password");

        if (password == null || confirm_password == null) {
            req.setAttribute("error", "Vui lòng nhập đầy đủ mật khẩu");
            req.setAttribute("step", 3);
            req.getRequestDispatcher("forgot__password.jsp").forward(req, resp);
            return;
        }

        if (!password.equals(confirm_password)) {
            req.setAttribute("error", "Mật khẩu xác nhận không khớp");
            req.setAttribute("step", 3);
            req.getRequestDispatcher("forgot__password.jsp").forward(req, resp);
            return;
        }

        if (!authService.isStrongPassword(password)){
            req.setAttribute("error", "Mật khẩu phải từ 8 ký tự và chứa chữ, số, ký tự đặc biệt");
            req.setAttribute("step", 3);
            req.getRequestDispatcher("forgot__password.jsp").forward(req, resp);
            return;
        }

        authService.updatePassword(email, password);
        authService.activateAccount(email);

        req.setAttribute("step", 4);
        req.getRequestDispatcher("forgot__password.jsp").forward(req, resp);
    }
}
