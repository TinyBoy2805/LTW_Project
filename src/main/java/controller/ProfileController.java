package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.UserProfile;
import service.ProfileService;

import java.io.IOException;

@WebServlet(name = "ProfileController", value = "/profile/*")
public class ProfileController extends HttpServlet
{
    private ProfileService profileService;

    @Override
    public void init() throws ServletException
    {
        this.profileService = new ProfileService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {

        HttpSession session =  request.getSession(false);
        if(session == null)
        {
            response.sendRedirect(request.getContextPath() + "/customer/pages/NotFoundPage.jsp");
            return;
        }

        Integer userId = (Integer) session.getAttribute("userId");

        if(userId == null)
        {
            response.sendRedirect(request.getContextPath() + "/customer/pages/NotFoundPage.jsp");
            return;
        }


        UserProfile userProfile = this.profileService.getUserProfile(userId);
        System.out.println("USER PROFILE: " + userProfile);

        request.setAttribute("userProfile", userProfile);

        try {
            request.getRequestDispatcher("/customer/pages/Profile.jsp").forward(request, response);
        } catch(Exception e) {
            e.printStackTrace(); // check console server
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        doGet(request, response);
    }
}