package controller.auth;

import exception.PasswordStrength;
import exception.RegisterError;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.User;
import model.ValidateObject;
import service.AuthService;
import service.MailService;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;
import java.sql.Timestamp;
import java.util.Random;

@WebServlet(name = "AuthController", value = "/auth/*")
public class AuthController extends HttpServlet
{
    private final String pepper = "TOI IU NLU-FIT";

    private AuthService authService;
    private MailService mailService;


    @Override
    public void init() throws ServletException
    {
        this.authService = new AuthService();
        this.mailService = new MailService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        String pathInfo = request.getPathInfo();

        String action = pathInfo.substring(1);


        switch (action)
        {
            case "login" ->
            {
                try
                {
                    this.handleLogin(request, response);
                } catch (NoSuchAlgorithmException e)
                {
                    throw new RuntimeException(e);
                }
            }
            case "logout" ->
            {
                HttpSession session = request.getSession(false);
                if (session != null)
                {
                    session.invalidate();
                }
                response.sendRedirect(request.getContextPath() + "/index.jsp");
                return;
            }
            case "register" ->
            {
                try
                {
                    this.handleRegister(request, response);
                } catch (NoSuchAlgorithmException e)
                {
                    throw new RuntimeException(e);
                }
            }
            case "forgot-pass" ->
            {

            }
            case "verify"->
            {
                this.handleVerifyAccount(request, response);
            }
        }

    }



    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        doGet(request, response);
    }



    private void handleLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, NoSuchAlgorithmException
    {
        String method = request.getMethod();

        switch (method)
        {
            case "GET" ->
            {
                response.sendRedirect("/index.jsp");
            }
            case "POST" ->
            {
                String input = request.getParameter("login_account");
                String password = request.getParameter("login_password");

                // 1. Tìm user theo email hoặc phone
                User user = this.authService.findByEmailOrPhone(input);

                if (user == null)
                {
                    request.setAttribute("loginError", "Tài khoản không tồn tại");
                    request.setAttribute("activeTab", "login");
                    request.getRequestDispatcher("/index.jsp").forward(request, response);
                    return;
                }

                // 2. Check user đã verified chưa
                if (!user.checkVerified())
                {
                    request.setAttribute("loginError", "Tài khoản chưa được xác thực. Vui lòng check email.");
                    request.setAttribute("activeTab", "login");
                    request.getRequestDispatcher("/index.jsp").forward(request, response);
                    return;
                }

                // 3. Verify password với salt từ DB
                String storedHash = user.getPassword_hashed();
                String salt = user.getSalt();

                // Hash password user nhập vào với salt từ DB
                String inputHash = this.authService.hashPasswordUsingMD5(password, salt, pepper);

                // 4. So sánh hash
                if (!inputHash.equals(storedHash))
                {
                    request.setAttribute("loginError", "Mật khẩu không đúng");
                    request.setAttribute("activeTab", "login");
                    request.getRequestDispatcher("/index.jsp").forward(request, response);
                    return;
                }

                // 5. Login thành công - Tạo session
                HttpSession session = request.getSession();
                session.setAttribute("userId", user.getId());
                session.setAttribute("username", user.getName());
                session.setAttribute("email", user.getEmail());
                session.setAttribute("role", user.getRole());
                session.setAttribute("isLoggedIn", true);

                // 6. Redirect
                response.sendRedirect(request.getContextPath() + "/home");

            }
        }

    }

    private void handleRegister(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, NoSuchAlgorithmException
    {
        String method = request.getMethod();

        switch (method)
        {
            case "GET" ->
            {
                request.getRequestDispatcher("/index.jsp").forward(request, response);
            }
            case "POST" ->
            {
                String username = request.getParameter("username");
                String password = request.getParameter("password");
                String confirm_password = request.getParameter("confirm_password");
                String email = request.getParameter("email");
                String phone = request.getParameter("phone");

//                System.out.println("========== DEBUG REGISTER PARAMS ==========");
//                System.out.println("Username: " + username);
//                System.out.println("Password: " + password);
//                System.out.println("Confirm Password: " + confirm_password);
//                System.out.println("Email: " + email);
//                System.out.println("Phone: " + phone);
//                System.out.println("===========================================");


                ValidateObject errors = this.authService.validateRegistration(username, password, confirm_password, email, phone);

                if(errors.hasError())
                {
                    request.setAttribute("errors", errors);
                    request.setAttribute("activeTab", "register");

                    // Giữ lại data đã nhập
                    request.setAttribute("username", username);
                    request.setAttribute("email", email);
                    request.setAttribute("phone", phone);

                    request.getRequestDispatcher("/index.jsp").forward(request, response);
                    return;
                }




                //hash password
                String CHARACTERS = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
                Random ran = new Random();
                int length = 16; // Độ dài salt
                StringBuilder salt = new StringBuilder();
                for (int i = 0; i < length; i++)
                {
                    salt.append(CHARACTERS.charAt(ran.nextInt(CHARACTERS.length())));
                }
                String hashed_password = this.authService.hashPasswordUsingMD5(password, salt.toString(), pepper);

                //insert
                int userId = this.authService.createNewUser(username, hashed_password, email, phone, salt.toString());




                //verify email
                String emptyTokenLink = this.mailService.createVerifyLink(request);
                String token = this.mailService.createVerifyToken();

                String verifyLink = emptyTokenLink+token;
                int minutes = 10;
                Timestamp expirationTime = this.mailService.createExpirationTime(minutes);

                this.authService.createTokenAndExpiredTime(userId, token, expirationTime); //luu vao db

                this.mailService.sendVerifyLink(email, username, verifyLink, minutes);


            }
        }
    }


    private void handleVerifyAccount(HttpServletRequest request, HttpServletResponse response) throws IOException
    {

        String token = request.getParameter("token");

        boolean valid = this.authService.checkToken(token);
        System.out.println("valid: " + valid);
        if(!valid) response.sendRedirect(request.getContextPath()+"/index.jsp");


        int userId = this.authService.getUserIdFromVerifyToken(token);
        System.out.println("id: " + userId);
        if(userId == -1) response.sendRedirect(request.getContextPath()+"/index.jsp");

        //set verify for user
        boolean success = this.authService.setVerifyUser(userId);
        System.out.println("Success: " + success);
        if(!success) response.sendRedirect(request.getContextPath()+"/index.jsp");



        response.setContentType("text/html; charset=UTF-8");
        PrintWriter writer = response.getWriter();
        String contextPath = request.getContextPath();
        writer.println("""
                <!DOCTYPE html>
                       <html lang="vi">
                       <head>
                           <meta charset="UTF-8">
                           <meta name="viewport" content="width=device-width, initial-scale=1.0">
                           <title>Xác thực thành công - MiChiShop</title>
                           <style>
                               @keyframes slideUp{from{opacity:0;transform:translateY(20px)}to{opacity:1;transform:translateY(0)}}
                               @keyframes scaleIn{from{transform:scale(0)}to{transform:scale(1)}}
                               @keyframes checkmark{0%%{stroke-dashoffset:50}100%%{stroke-dashoffset:0}}
                               .container{animation:slideUp .5s ease}
                               .icon{animation:scaleIn .4s cubic-bezier(.68,-.55,.265,1.55) .2s both}
                               .checkmark{stroke-dasharray:50;stroke-dashoffset:50;animation:checkmark .4s ease .5s forwards}
                           </style>
                           <script>
                               let t=5;setInterval(()=>{if(--t>0)document.querySelector('.time').textContent=t;else window.location.href='%s/index.jsp'},1000);
                           </script>
                       </head>
                       <body style="margin:0;font-family:-apple-system,BlinkMacSystemFont,'Segoe UI',Roboto,sans-serif;background:#F564A9;min-height:100vh;display:flex;align-items:center;justify-content:center;padding:20px;">
                           <div class="container" style="background:#fff;border-radius:24px;max-width:420px;width:100%%;padding:48px 32px;text-align:center;box-shadow:0 20px 60px rgba(0,0,0,.15);">
                               <div class="icon" style="width:72px;height:72px;background:linear-gradient(135deg,#4CAF50,#66BB6A);border-radius:50%%;display:flex;align-items:center;justify-content:center;margin:0 auto 32px;box-shadow:0 8px 24px rgba(76,175,80,.3);">
                                   <svg width="40" height="40" viewBox="0 0 24 24" fill="none" stroke="#fff" stroke-width="3" stroke-linecap="round" stroke-linejoin="round"><polyline class="checkmark" points="20 6 9 17 4 12"></polyline></svg>
                               </div>
                               <h1 style="color:#F564A9;font-size:24px;font-weight:600;margin:0 0 12px;letter-spacing:-.5px;">Xác thực thành công</h1>
                               <p style="color:#64748b;font-size:15px;line-height:1.6;margin:0 0 32px;">Tài khoản đã được kích hoạt. Đăng nhập để bắt đầu mua sắm tại MiChiShop.</p>
                               <a href="%s/index.jsp" style="display:inline-flex;align-items:center;gap:8px;background:#F564A9;color:#fff;text-decoration:none;padding:14px 32px;border-radius:12px;font-size:15px;font-weight:500;transition:all .2s;box-shadow:0 4px 12px rgba(245,100,169,.3);">
                                   Đăng nhập ngay
                                   <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><line x1="5" y1="12" x2="19" y2="12"></line><polyline points="12 5 19 12 12 19"></polyline></svg>
                               </a>
                               <p style="margin:24px 0 0;font-size:13px;color:#94a3b8;">Tự động chuyển sau <span class="time" style="color:#F564A9;font-weight:600;">5</span>s</p>
                           </div>
                       </body>
                       </html>
            """.formatted(contextPath, contextPath));


    }


}