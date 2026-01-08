package controller;

import com.google.gson.Gson;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.product.Product;
import model.product.ProductCard;
import service.ProductService;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "ProductController", value = "/product/*")
public class ProductController extends HttpServlet
{

    private ProductService productService = new ProductService();
    private final int PAGE_SIZE = 16;
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        String pathInfo = request.getPathInfo(); // Lấy phần sau /product/

        if (pathInfo == null || pathInfo.equals("/"))
        {
            this.showProductByPage(request, response);
            return;
        }

//        String action = pathInfo.substring(1);
//        System.out.println("action: " + action);
//
//        switch (action)
//        {
//            case "search":
//                this.searchProductsByName(request, response);
//                return;
//            default:
//                response.sendError(HttpServletResponse.SC_NOT_FOUND);
//                return;
//        }

    }




    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        doGet(request, response);
    }

    private void searchProductsByName(HttpServletRequest request, HttpServletResponse response) throws IOException
    {
        Gson gson = new Gson();
        String productName = request.getParameter("name");
        System.out.println("product name: " + productName);
        List<ProductCard> products = this.productService.getProductsByName(productName);

        String json = gson.toJson(products);
        System.out.println(json);

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);
    }



    private void showProductByPage(HttpServletRequest request, HttpServletResponse response)
    {
        String pageParam = request.getParameter("page");
        String searchParam = request.getParameter("search");
        String categoryParam = request.getParameter("category");
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
            List<ProductCard> products;
            int totalProducts;

            if(searchParam != null && !searchParam.trim().isEmpty())
            {
                products = this.productService.getProductsByName(searchParam);
                totalProducts = products.size();

                int fromIndex = (page - 1) * PAGE_SIZE;
                int toIndex = Math.min(fromIndex + PAGE_SIZE, totalProducts);
                if(fromIndex < totalProducts)
                {
                    products = products.subList(fromIndex, toIndex);
                }
            }else if(categoryParam != null && !categoryParam.trim().isEmpty())
            {
                products = this.productService.getProductsByCategory(categoryParam);
                totalProducts = products.size();

                int fromIndex = (page - 1) * PAGE_SIZE;
                int toIndex = Math.min(fromIndex + PAGE_SIZE, totalProducts);
                if(fromIndex < totalProducts)
                {
                    products = products.subList(fromIndex, toIndex);
                }
            }else
            {
                products = this.productService.getProductByPage(page, PAGE_SIZE);
                totalProducts = this.productService.getTotalProducts();
            }

            for(ProductCard pc: products)
            {
                pc.setAvg_rating(Math.floor(pc.getAvg_rating()));
            }

            int totalPages = (int) Math.ceil((double) totalProducts / PAGE_SIZE);

            if (page > totalPages && totalPages > 0)
            {
                page = totalPages;
                if (searchParam != null && !searchParam.trim().isEmpty())
                {
                    products = this.productService.getProductsByName(searchParam);
                    int fromIndex = (page - 1) * PAGE_SIZE;
                    int toIndex = Math.min(fromIndex + PAGE_SIZE, products.size());
                    products = products.subList(fromIndex, toIndex);
                }else if(categoryParam != null && !categoryParam.trim().isEmpty())
                {
                    products = this.productService.getProductsByCategory(categoryParam);
                    int fromIndex = (page - 1) * PAGE_SIZE;
                    int toIndex = Math.min(fromIndex + PAGE_SIZE, products.size());
                    products = products.subList(fromIndex, toIndex);
                }else
                {
                    products = this.productService.getProductByPage(page, PAGE_SIZE);
                }
                for(ProductCard pc: products)
                {
                    pc.setAvg_rating(Math.floor(pc.getAvg_rating()));
                }
            }

            request.setAttribute("products", products);
            request.setAttribute("currentPage", page);
            request.setAttribute("totalPages", totalPages);
            request.setAttribute("searchKeyword", searchParam);

            request.getRequestDispatcher("/customer/pages/Products.jsp").forward(request, response);
        } catch (SQLException e)
        {
            throw new RuntimeException(e);
        } catch (ServletException e)
        {
            throw new RuntimeException(e);
        } catch (IOException e)
        {
            throw new RuntimeException(e);
        }
    }



}