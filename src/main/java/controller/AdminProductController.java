package controller;


import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonSerializer;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.orders.OrderCard;
import model.orders.PageInformation;
import model.product.ProductCard;
import service.ProductService;

import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.stream.Collectors;

@WebServlet(name = "AdminProductController", value = "/admin/products/*")
public class AdminProductController extends HttpServlet {
    private final ProductService productService = new ProductService();

    Gson gson = new GsonBuilder()
            .registerTypeAdapter(LocalDateTime.class, (JsonSerializer<LocalDateTime>) (src, typeOfSrc, context) -> {
                return context.serialize(src.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")));
            })
            .registerTypeAdapter(LocalDate.class, (com.google.gson.JsonDeserializer<LocalDate>) (json, typeOfT, context) ->
                    LocalDate.parse(json.getAsString(), DateTimeFormatter.ISO_LOCAL_DATE))
            .create();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // lấy phần sau /admin/products/
        String pathInfo = req.getPathInfo();

        if (pathInfo == null || pathInfo.equals("/")) {
            List<String> categoryNames = productService.getAllCategoryNames();
            req.setAttribute("categoryNames", categoryNames);

            req.getRequestDispatcher("/admin/pages/product.jsp")
                    .forward(req, resp);
            return;
        }

        String action = pathInfo.substring(1); //lấy action để fetch api
        if (action.contains("page-index-")) {
            String pageNumber = action.substring(action.lastIndexOf("-") + 1);
            this.getProductCards(req, resp, Integer.parseInt(pageNumber));
        }

        if (action.contains("search")) {
            String pageParam = req.getParameter("page");
            int page = 1;
            if(pageParam != null && !pageParam.isEmpty())
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
            this.getSearchProduct(req, resp, page);
        }

        if (action.contains("filter")) {
            String pageParam = req.getParameter("page");
            int page = 1;
            if(pageParam != null && !pageParam.isEmpty())
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
            this.getFilterProduct(req, resp, page);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req, resp);
    }


    private void getProductCards(HttpServletRequest request, HttpServletResponse response, int pageIndex) throws IOException {
        PageInformation<ProductCard> page = this.productService.getProduct(pageIndex);

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(gson.toJson(page));
    }

    private void getSearchProduct(HttpServletRequest request, HttpServletResponse response, int pageIndex) throws IOException {
        PageInformation<ProductCard> searchProductCards = this.productService.searchProduct(request.getParameter("name"), pageIndex);
        System.out.println("Search name is");
        System.out.println(request.getParameter("name"));


        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(gson.toJson(searchProductCards));
    }

    private void getFilterProduct(HttpServletRequest request, HttpServletResponse response, int pageIndex) throws IOException {
        String jsonString = request.getReader().lines().collect(Collectors.joining());

        java.lang.reflect.Type type = new com.google.gson.reflect.TypeToken<java.util.HashMap<String, Object>>(){}.getType();

        java.util.HashMap<String, Object> filterMap = gson.fromJson(jsonString, type);

        PageInformation<ProductCard> filterProducts = this.productService.filterProducts(filterMap, pageIndex);

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(gson.toJson(filterProducts));
    }
}
