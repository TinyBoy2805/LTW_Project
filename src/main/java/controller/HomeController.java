package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Voucher;
import model.VoucherType;
import service.HomeService;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "HomeController", value = "/home")
public class HomeController extends HttpServlet
{
    private HomeService homeService = new HomeService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        int amountUsers = this.homeService.getAmountUsers();
        int avg_rating = this.homeService.getAvgRating();
        List<String> categories = this.homeService.getCategories();
        List<Voucher> vouchers = this.homeService.getVouchers();

        // Format user count
        String formattedUserCount = formatNumber(amountUsers);

        request.setAttribute("user_count_formatted", formattedUserCount);
        request.setAttribute("avg_rating", avg_rating);
        request.setAttribute("categories", categories);
        request.setAttribute("vouchers", vouchers);
        request.setAttribute("voucherTypes", VoucherType.values());

        request.getRequestDispatcher("/customer/pages/Home.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        doGet(request, response);
    }

    /**
     * Format number to Vietnamese format with units (nghìn, triệu, tỷ)
     * Examples:
     * 500 -> "500"
     * 1200 -> "1.2 nghìn"
     * 15000 -> "15 nghìn"
     * 1200000 -> "1.2 triệu"
     * 1500000000 -> "1.5 tỷ"
     */
    private String formatNumber(int number)
    {
        if (number < 1000)
        {
            return String.valueOf(number);
        } else if (number < 1000000)
        {
            // Nghìn
            double thousands = number / 1000.0;
            if (thousands == (int) thousands)
            {
                return String.format("%d nghìn", (int) thousands);
            } else {
                return String.format("%.1f nghìn", thousands);
            }
        } else if (number < 1000000000)
        {
            // Triệu
            double millions = number / 1000000.0;
            if (millions == (int) millions)
            {
                return String.format("%d triệu", (int) millions);
            } else
            {
                return String.format("%.1f triệu", millions);
            }
        } else
        {
            // Tỷ
            double billions = number / 1000000000.0;
            if (billions == (int) billions)
            {
                return String.format("%d tỷ", (int) billions);
            } else
            {
                return String.format("%.1f tỷ", billions);
            }
        }
    }
}
