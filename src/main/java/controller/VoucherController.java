package controller;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonPrimitive;
import com.google.gson.JsonSerializer;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Voucher;
import service.VoucherService;

import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

@WebServlet(name = "VoucherController", value = "/voucher")
public class VoucherController extends HttpServlet
{

    private VoucherService voucherService;

    @Override
    public void init() throws ServletException
    {
        this.voucherService = new VoucherService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        String pageParam = request.getParameter("page");
        int page = 1;
        int pageSize = 6;

        if (pageParam != null && !pageParam.isEmpty())
        {
            page = Integer.parseInt(pageParam);
        }

        List<Voucher> vouchers = this.voucherService.getVouchers(page, pageSize);

        String ajaxParam = request.getParameter("ajax");

        if ("true".equals(ajaxParam))
        {
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");

            Gson gson = new GsonBuilder()
                    .registerTypeAdapter(LocalDate.class, (JsonSerializer<LocalDate>) (src, typeOfSrc, context) ->
                            new JsonPrimitive(src.toString()) // yyyy-MM-dd
                    )
                    .create();

            try
            {
                String json = gson.toJson(vouchers);
                response.getWriter().write(json);
            } catch (Exception e)
            {
                e.printStackTrace();
                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                response.getWriter().write("{\"error\": \"Cannot get vouchers\"}");
            }
        }else
        {
            request.getRequestDispatcher("/customer/pages/Voucher.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        doGet(request, response);
    }
}