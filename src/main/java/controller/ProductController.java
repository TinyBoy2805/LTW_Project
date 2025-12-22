package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Product;
import service.ProductService;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ProductController", value = "/product")
public class ProductController extends HttpServlet
{

    private ProductService productService = new ProductService();
    private final int PAGE_SIZE = 16;
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        String pageParam = request.getParameter("page");
        int page = 1;
        
        if (pageParam != null && !pageParam.isEmpty())
        {
            try
            {
                page = Integer.parseInt(pageParam);
                if (page < 1) page = 1;
            } catch (NumberFormatException e)
            {
                page = 1;
            }
        }

        try
        {
            List<Product> products = productService.getProductByPage(page, PAGE_SIZE);

            int totalProducts = productService.getTotalProducts();
            int totalPages = (int) Math.ceil((double) totalProducts / PAGE_SIZE);

            if (page > totalPages && totalPages > 0)
            {
                page = totalPages;
                products = productService.getProductByPage(page, PAGE_SIZE);
            }
            
            request.setAttribute("products", products);
            request.setAttribute("currentPage", page);
            request.setAttribute("totalPages", totalPages);
            
            request.getRequestDispatcher("/customer/pages/Products.jsp").forward(request, response);
        } catch (SQLException e)
        {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        doGet(request, response);
    }
}