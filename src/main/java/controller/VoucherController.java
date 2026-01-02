package controller;

import dao.VoucherDao;
import dao.CategoryDao;
import model.Voucher;
import model.Category;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Date;
import java.util.List;

@WebServlet(name = "VoucherController", urlPatterns = {"/uudai", "/themuudai"})
public class VoucherController extends HttpServlet {
    private final VoucherDao voucherDao = new VoucherDao();
    private final CategoryDao categoryDao = new CategoryDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String servletPath = request.getServletPath();
        if ("/themuudai".equals(servletPath)) {
            List<Category> categories = categoryDao.findAll();
            request.setAttribute("categories", categories);
            request.getRequestDispatcher("admin/pages/ThemUuDai.jsp").forward(request, response);
            return;
        }

        List<Voucher> vouchers = voucherDao.findAll();
        request.setAttribute("vouchers", vouchers);
        request.getRequestDispatcher("admin/pages/UuDai.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String servletPath = request.getServletPath();
        if ("/uudai".equals(servletPath)) {
            Voucher voucher = parseVoucher(request);
            voucherDao.insert(voucher);
            response.sendRedirect(request.getContextPath() + "/uudai");
            return;
        }

        response.sendRedirect(request.getContextPath() + "/uudai");
    }

    private Voucher parseVoucher(HttpServletRequest request) {
        Voucher voucher = new Voucher();
        voucher.setCategoryId(parseLong(request.getParameter("category_id")));
        voucher.setCode(trimToNull(request.getParameter("code")));
        voucher.setDescription(trimToNull(request.getParameter("description")));
        voucher.setDiscountAmount(parseBigDecimal(request.getParameter("discount_amount")));
        voucher.setDiscountPercentage(parseDouble(request.getParameter("discount_percentage")));
        voucher.setStartDate(parseDate(request.getParameter("start_date")));
        voucher.setEndDate(parseDate(request.getParameter("end_date")));
        voucher.setUsageLimit(parseInt(request.getParameter("usage_limit")));
        Integer usageLimit = voucher.getUsageLimit();
        voucher.setCurrentAmount(usageLimit != null ? usageLimit : null);
        voucher.setMinOrderValue(parseBigDecimal(request.getParameter("min_order_value")));
        voucher.setVoucherType(trimToNull(request.getParameter("voucher_type")));
        return voucher;
    }

    private String trimToNull(String val) {
        if (val == null) return null;
        String trimmed = val.trim();
        return trimmed.isEmpty() ? null : trimmed;
    }

    private Long parseLong(String val) {
        try {
            return val != null ? Long.parseLong(val.trim()) : null;
        } catch (NumberFormatException e) {
            return null;
        }
    }

    private Integer parseInt(String val) {
        try {
            return val != null ? Integer.parseInt(val.trim()) : null;
        } catch (NumberFormatException e) {
            return null;
        }
    }

    private Double parseDouble(String val) {
        try {
            return val != null ? Double.parseDouble(val.trim()) : null;
        } catch (NumberFormatException e) {
            return null;
        }
    }

    private BigDecimal parseBigDecimal(String val) {
        try {
            return val != null && !val.trim().isEmpty() ? new BigDecimal(val.trim()) : null;
        } catch (NumberFormatException e) {
            return null;
        }
    }

    private Date parseDate(String val) {
        try {
            return val != null && !val.trim().isEmpty() ? Date.valueOf(val.trim()) : null;
        } catch (IllegalArgumentException e) {
            return null;
        }
    }
}
