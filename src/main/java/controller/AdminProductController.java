package controller;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonSerializer;
import io.leangen.geantyref.TypeToken;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.orders.PageInformation;
import model.product.AdminProductCard;
import model.product.ProductCard;
import service.ProductService;

import java.io.IOException;
import java.lang.reflect.Type;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.*;
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
                try {
                    page = Integer.parseInt(pageParam);
                    if (page < 1) page = 1;
                } catch (NumberFormatException e) {
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

//        if (action.contains("new-products")) {
//            String jsonBody = req.getReader().lines().collect(Collectors.joining());
//            System.out.println(jsonBody);
//
//            Type type = new TypeToken<HashMap<String, Object>>() {}.getType();
//            Map<String, Object> map = gson.fromJson(jsonBody, type);
//
//            map.forEach((k, v) -> System.out.println(k + " -> " + v));
//
//            resp.getWriter().write("""
//                      { "status": "1234" }\s
//                   \s""");
//            this.addNewProduct(req, resp);
//        }
    }



    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String pathInfo = req.getPathInfo();

        if (pathInfo != null && pathInfo.equals("/details")) {
            this.addNewProduct(req, resp);
            return;
        }

        this.doGet(req, resp);
    }


    private void getProductCards(HttpServletRequest request, HttpServletResponse response, int pageIndex) throws IOException {
        PageInformation<AdminProductCard> page = this.productService.getProduct(pageIndex);

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(gson.toJson(page));
    }

    private void getSearchProduct(HttpServletRequest request, HttpServletResponse response, int pageIndex) throws IOException {
        PageInformation<AdminProductCard> searchProductCards = this.productService.searchProduct(request.getParameter("name"), pageIndex);
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

        PageInformation<AdminProductCard> filterProducts = this.productService.filterProducts(filterMap, pageIndex);

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(gson.toJson(filterProducts));
    }

    private void addNewProduct(HttpServletRequest req, HttpServletResponse resp) {


    }
}
