package controller;

import com.google.gson.Gson;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Voucher;
import model.VoucherType;
import model.product.ProductCard;
import service.HomeService;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "HomeController", value = "/home")
public class HomeController extends HttpServlet
{
    private HomeService homeService = new HomeService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {


        //top tim kiem - top danh gia - top luot ban
        String trending_type = request.getParameter("trending_type");
        if(trending_type != null)
        {
            List<ProductCard> products = null;
            switch (trending_type)
            {
                case "search":
                    products = this.homeService.getSearchTrendings();
                    break;
                case "buy_count":
                    products = this.homeService.getSellTrendings();
                    break;
                case "rating":
                    products = this.homeService.getRatingTrendings();
                    break;
                default:
                    products = new ArrayList<>();
                    break;
            }


            Gson gson = new Gson();
            String json = gson.toJson(products);


            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(json);
            return;
        }






        this.setHomeData(request);
        request.getRequestDispatcher("/customer/pages/Home.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        doGet(request, response);
    }



    private void setHomeData(HttpServletRequest request)
    {
        request.setAttribute("user_count_formatted", formatNumber(this.homeService.getAmountUsers()));
        request.setAttribute("avg_rating", this.homeService.getAvgRating());
        request.setAttribute("categories", this.homeService.getCategories());
        request.setAttribute("vouchers", this.homeService.getVouchers());

    }




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
