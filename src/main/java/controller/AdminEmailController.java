package controller;

import dao.EmailDao;
import model.Email;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "AdminEmailController", value = "/admin/email")

public class AdminEmailController extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EmailDao emailDao = new EmailDao();
        List<Email> emails = emailDao.getAllEmails();
        request.setAttribute("emails", emails);
        request.getRequestDispatcher("/admin/pages/Email.jsp").forward(request, response);
    }
}
