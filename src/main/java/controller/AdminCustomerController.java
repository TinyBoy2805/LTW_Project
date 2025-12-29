package controller;

import dao.AuthDao;
import model.User;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "AdminCustomerController", value = "/admin-customers")
public class AdminCustomerController extends HttpServlet {
    private AuthDao authDao = new AuthDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 1. Lấy danh sách khách hàng từ database
        List<User> customers = authDao.getAllCustomers();
        // 2. Đưa vào request attribute để JSP có thể đọc được
        request.setAttribute("customers", customers);
        // 3. Chuyển hướng sang trang hiển thị
        request.getRequestDispatcher("admin/pages/KhachHang.jsp").forward(request, response);
    }
}