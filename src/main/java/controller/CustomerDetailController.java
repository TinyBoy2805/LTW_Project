package controller;

import dao.AuthDao;
import dao.AddressDao;
import model.User;
import model.Address;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "CustomerDetailController", value = "/quanlykhachhang")
public class CustomerDetailController extends HttpServlet {
    private final AuthDao authDao = new AuthDao();
    private final AddressDao addressDao = new AddressDao();

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

        Address address = addressDao.getAddressByUserId(id);
        request.setAttribute("customer", customer);
        request.setAttribute("address", address);
        request.getRequestDispatcher("admin/pages/Quanlykhachhang.jsp").forward(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idParam = request.getParameter("id");
        int id = Integer.parseInt(idParam);

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone_number");

        String addressFull = request.getParameter("address_full");
        String houseNumber = "";
        String road = "";
        String district = "";
        String city = "";
        if (addressFull != null) {
            String[] parts = addressFull.split(",");
            if (parts.length > 0) houseNumber = parts[0].trim();
            if (parts.length > 1) road = parts[1].trim();
            if (parts.length > 2) district = parts[2].trim();
            if (parts.length > 3) city = parts[3].trim();
        }

        authDao.updateUserInfo(id, name, email, phone);

        response.sendRedirect(request.getContextPath() + "/quanlykhachhang?id=" + id);
    }
}