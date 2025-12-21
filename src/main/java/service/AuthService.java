package service;

import dao.AuthDao;
import model.Role;
import model.User;

public class AuthService {
    AuthDao authDao = new AuthDao();

    public User checkLogin(String name, String password_hashed) {
       User u = authDao.getUserByName(name);
       if (u != null && u.getPassword_hashed().equals(password_hashed)) {
           u.setPassword_hashed(null);
           return u;
       }
       return null;
    }

    public String register(String name,
                           String email,
                           String phone,
                           String password,
                           String confirmPassword) {

        if (!password.equals(confirmPassword)) {
            return "Mật khẩu xác nhận không khớp";
        }

        if (authDao.existsByEmail(email)) {
            return "Email đã tồn tại";
        }

        User user = new User();
        user.setName(name);
        user.setEmail(email);
        user.setRole(Role.customer);
        user.setPassword_hashed(password);
        user.setPhone_number(phone);

        authDao.insert(user);
        return null;
    }
}
