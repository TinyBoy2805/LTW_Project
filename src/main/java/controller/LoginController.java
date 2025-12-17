package controller;

import service.AuthService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import model.User;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "LoginController", value = "login")
public class LoginController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
request .getRequestDispatcher("index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       String name = request.getParameter("name");
       String password_hashed = request.getParameter("password_hashed");
       AuthService as = new AuthService();
       User u = as.checkLogin(name, password_hashed);
if(u!=null){
    request.getSession().setAttribute("user", u);
    response.sendRedirect("home.jsp");
}else{
    request.setAttribute("error", "Invalid name or password_hashed");
    request.getRequestDispatcher("index.jsp").forward(request, response);
}
    }
}