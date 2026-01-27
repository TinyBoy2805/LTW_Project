package controller;

import com.google.gson.Gson;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Notification;
import service.NotificationService;

import java.io.IOException;
import java.util.List;


//for customer
@WebServlet(name = "NotificationController", value = "/notification/*")
public class NotificationController extends HttpServlet
{

    private NotificationService notificationService;

    @Override
    public void init() throws ServletException
    {
        this.notificationService = new NotificationService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        String pathInfo = request.getPathInfo();
        int page = 1;
        int pageSize = 4;
        HttpSession session = request.getSession(false);

        if(session == null)
        {
            response.sendRedirect("/NotFoundPage.jsp"); return;
        }

        Object userIdObj = session.getAttribute("userId");
        if (userIdObj == null)
        {
            response.sendRedirect("/NotFoundPage.jsp");
            return;
        }
        int userId = Integer.parseInt(userIdObj.toString());

        if (pathInfo == null || pathInfo.equals("/"))
        {

            List<Notification> userNotifications = this.notificationService.getNotificationByPage(page, pageSize, userId);

            Gson gson = new Gson();
            String json = gson.toJson(userNotifications);

            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(json);
            return;
        }

        String action = pathInfo.substring(1);


        switch (action)
        {
            case "detail"->
            {
                String ajaxHeader = request.getHeader("X-Requested-With");
                if ("XMLHttpRequest".equals(ajaxHeader) || request.getParameter("ajax") != null)
                {
                    // Trả JSON cho fetch API
                    String pageParam = request.getParameter("page");
                    if(pageParam != null && !pageParam.isEmpty())
                    {
                        page = Integer.parseInt(pageParam);
                    }

                    List<Notification> userNotifications = this.notificationService.getNotificationByPage(page, pageSize, userId);

                    Gson gson = new Gson();
                    String json = gson.toJson(userNotifications);

                    response.setContentType("application/json");
                    response.setCharacterEncoding("UTF-8");
                    response.getWriter().write(json);
                }
                else
                {
                    // ⭐ Người dùng truy cập trực tiếp -> render JSP
                    request.getRequestDispatcher("/customer/pages/Inform.jsp").forward(request, response);
                }
            }
        }




    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {

    }
}