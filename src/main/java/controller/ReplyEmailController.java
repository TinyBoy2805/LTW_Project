package controller;

import dao.EmailDao;
import model.Email;
import model.User;
import service.MailService;
import dao.UserDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ReplyEmailController", value = "/admin/email/reply")
public class ReplyEmailController extends HttpServlet {
    private final EmailDao emailDao = new EmailDao();
    private final UserDao userDao = new UserDao();
    private final MailService mailService = new MailService();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String emailIdStr = request.getParameter("emailId");
        String replyContent = request.getParameter("replyContent");
        if (emailIdStr == null || replyContent == null || replyContent.trim().isEmpty()) {
            request.setAttribute("error", "Thiếu thông tin phản hồi.");
            request.getRequestDispatcher("/admin/email").forward(request, response);
            return;
        }
        int emailId;
        try {
            emailId = Integer.parseInt(emailIdStr);
        } catch (NumberFormatException e) {
            request.setAttribute("error", "ID email không hợp lệ.");
            request.getRequestDispatcher("/admin/email").forward(request, response);
            return;
        }
        Email email = emailDao.getEmailById(emailId);
        if (email == null) {
            request.setAttribute("error", "Không tìm thấy email gốc.");
            request.getRequestDispatcher("/admin/email").forward(request, response);
            return;
        }
        // Lấy email người nhận từ userId
        User user = userDao.getUserById(email.getUserId());
        if (user == null || user.getEmail() == null) {
            request.setAttribute("error", "Không tìm thấy email người nhận.");
            request.getRequestDispatcher("/admin/email").forward(request, response);
            return;
        }
        // Gửi email phản hồi
        boolean sent = MailService.sendEmail(user.getEmail(), email.getTitle(), replyContent);
        if (sent) {
            request.getSession().setAttribute("message", "Đã gửi phản hồi thành công!");
        } else {
            request.getSession().setAttribute("error", "Gửi email thất bại. Vui lòng thử lại.");
        }
        // Chuyển hướng về trang email
        response.sendRedirect(request.getContextPath() + "/admin/email");
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Chuyển hướng về trang danh sách email hoặc báo lỗi hợp lý
        response.sendRedirect(request.getContextPath() + "/admin/email");
    }
}
