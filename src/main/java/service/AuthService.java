package service;

import dao.AuthDao;
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

}
