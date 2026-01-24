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
@MultipartConfig
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
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        String idParam = request.getParameter("id");
        int id = Integer.parseInt(idParam);

        // Xử lý đổi mật khẩu bởi admin
        if ("change_password".equals(action)) {
            String newPassword = request.getParameter("new_password");
            String confirmPassword = request.getParameter("confirm_password");
            service.AuthService authService = new service.AuthService();
            boolean success = authService.adminChangeUserPassword(id, newPassword, confirmPassword);
            if (success) {
                request.setAttribute("message", "Đổi mật khẩu thành công!");
            } else {
                request.setAttribute("error", "Mật khẩu không hợp lệ hoặc xác nhận không khớp!");
            }
            doGet(request, response);
            return;
        }

        // Xử lý xóa tài khoản
        if ("delete".equals(action)) {
            addressDao.deleteAddressByUserId(id);
            authDao.deleteUser(id);
            response.sendRedirect(request.getContextPath() + "/khachhang");
            return;
        }

        // Xử lý cập nhật thông tin
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone_number");

        String addressFull = request.getParameter("address_full");
        String houseNumber = "";
        String road = "";
        String district = "";
        String city = "";
        String hamlet = "";
        String ward = "";
        if (addressFull != null) {
            String[] parts = addressFull.split(",");
            if (parts.length > 0) houseNumber = parts[0].trim();
            if (parts.length > 1) road = parts[1].trim();
            if (parts.length > 2) district = parts[2].trim();
            if (parts.length > 3) city = parts[3].trim();
            if (parts.length > 4) hamlet = parts[4].trim();
            if (parts.length > 5) ward = parts[5].trim();
        }
        // Lấy avt_url hiện tại nếu không upload mới
        String avtUrl = null;
        User currentUser = authDao.getUserById(id);
        if (currentUser != null) {
            avtUrl = currentUser.getAvt_url();
        }
        Part filePart = null;
        try {
            filePart = request.getPart("avatar");
        } catch (Exception ignored) {}
        if (filePart != null && filePart.getSize() > 0) {
            String fileName = System.currentTimeMillis() + "_" + filePart.getSubmittedFileName();
            String uploadPath = request.getServletContext().getRealPath("/libraries/ckfinder/userfiles/");
            java.io.File uploadDir = new java.io.File(uploadPath);
            if (!uploadDir.exists()) uploadDir.mkdirs();
            String filePath = uploadPath + java.io.File.separator + fileName;
            filePart.write(filePath);
            avtUrl = request.getContextPath() + "/libraries/ckfinder/userfiles/" + fileName;
        }
        authDao.updateUserInfo(id, name, email, phone, avtUrl);
        addressDao.updateAddress(id, houseNumber, road, district, city, hamlet, ward);
        response.sendRedirect(request.getContextPath() + "/khachhang");
    }
}