package controller;

import com.google.gson.Gson;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.ProductReview;
import model.product.Product;
import model.product.ProductCard;
import model.product.ProductImage;
import service.ProductService;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductDetailController", value = "/product-detail/*")
public class ProductDetailController extends HttpServlet
{
    private ProductService productService = new ProductService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        String pathInfo = request.getPathInfo(); // Lấy phần sau /home/
        Gson gson = new Gson();
        int id = Integer.parseInt(request.getParameter("product_id"));

        List<ProductImage> images = this.productService.getImagesByProductId(id);
        Product product = this.productService.getOneProduct(id);
        product.setImages(images);
        double avgRating = this.productService.getAvgRating(this.productService.getProductReviewsByProductId(id));

        if (pathInfo == null || pathInfo.equals("/"))
        {
            request.setAttribute("avgRating", avgRating);
            request.setAttribute("product", product);
            request.getRequestDispatcher("/customer/pages/ProductDetail.jsp").forward(request, response);
            return;
        }

        String action = pathInfo.substring(1);

        switch (action)
        {
            case "review" ->
            {
                String pageReviewParam = request.getParameter("pageReview");
                int pageReview = (pageReviewParam == null || pageReviewParam.isEmpty()) ? 1 : Integer.parseInt(pageReviewParam);
                int pageReviewSize = 4;
                List<ProductReview> reviews = this.productService.getProductReviewsByProductIdHasPagination(id, pageReview, pageReviewSize);

                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                String json = gson.toJson(reviews);
                response.getWriter().write(json);
            }
            case "product" ->
            {
                String pageProductParam = request.getParameter("pageProduct");
                int pageProduct = (pageProductParam == null || pageProductParam.isEmpty()) ? 1 : Integer.parseInt(pageProductParam);
                int pageProductSize = 8;
                List<ProductCard> productCards = this.productService.getProductsByCategoryHasPagination(product.getCategory(), pageProduct, pageProductSize);

                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                String json = gson.toJson(productCards);
                response.getWriter().write(json);
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        doGet(request, response);
    }
}