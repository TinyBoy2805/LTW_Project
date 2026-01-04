package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.product.Product;
import service.ProductService;

import java.io.IOException;

@WebServlet(name = "ProductDetailController", value = "/product-detail")
public class ProductDetailController extends HttpServlet
{
    private ProductService productService = new ProductService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        int id = Integer.parseInt(request.getParameter("product_id"));

        Product product = this.productService.getOneProduct(id);

        System.out.println(product);

        request.setAttribute("product", product);


        request.getRequestDispatcher("/customer/pages/ProductDetail.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        doGet(request, response);
    }
}