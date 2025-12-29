package controller;

import dao.AuthDao;
import model.User;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "CustomerDetailController", value = "/customer-detail")
public class CustomerDetailController extends HttpServlet {
    private final AuthDao authDao = new AuthDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idParam = request.getParameter("id");
        if (idParam == null) {
            response.sendRedirect("admin-customers");
            return;
        }

        int id;
        try {
            id = Integer.parseInt(idParam);
        } catch (NumberFormatException ex) {
            response.sendRedirect("admin-customers");
            return;
        }

        User customer = authDao.getUserById(id);
        if (customer == null) {
            response.sendRedirect("admin-customers");
            return;
        }

        request.setAttribute("customer", customer);
        request.getRequestDispatcher("admin/pages/Quanlykhachhang.jsp").forward(request, response);
    }
}