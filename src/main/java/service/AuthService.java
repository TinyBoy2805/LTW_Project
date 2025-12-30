package service;

import dao.AuthDao;
import exception.LoginError;
import exception.RegisterError;
import model.Role;
import model.User;

import jakarta.servlet.http.HttpSession;
import java.util.Random;

public class AuthService {
    AuthDao authDao = new AuthDao();

    public LoginError checkLogin(String input, String password) {
        User u = authDao.getUserByEmailOrPhone(input);

        if (u == null) {
            return LoginError.INVALID_USERNAME; //Wrong username -> Login failed
        }

        //hash input password with salt of user to check
        String hashInput = HashPassword.hashPasswordWithSalt(password, u.getSalt());
        if (!hashInput.equals(u.getPassword_hashed())) {
            return LoginError.WRONG_PASSWORD; //Wrong password -> Login failed
        }

        if (u.getVerified() == 0) return LoginError.NOT_VERIFIED;

        return LoginError.NONE;
    }

    public User getUserData(String input) {
        if (isValidEmail(input) || isValidPhonenumber(input)) {
            User u = authDao.getUserByEmailOrPhone(input);
            if (u != null) {
                //not fail -> set hashpass to null to avoid session include the hashpass
                //u.setPassword_hashed(null);
                return u;
            }
        }
        return null;
    }

    public boolean isValidEmail(String email) {
        return email != null && email.matches("^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$");
        /*  ^ : start of the string
            [A-Za-z0-9+_.-] : approve upcase / lowcase character, number, special character
            + : at least one character long
            @ : an email identify
            $ : end of string
         */
    }

    public boolean isValidPhonenumber(String phone) {
        return phone != null && phone.matches("^[0-9]{10}$");
        /*  ^ : start of the string
            [0-9] : approve only number
            {10}} : exactly 10 digit
            $ : end of string
         */
    }

    public boolean isStrongPassword(String password) {
        if (password != null) {
            return (password.length() >= 8) &&
                    password.matches("^(?=.*[A-Za-z])(?=.*\\d)(?=.*[^A-Za-z0-9]).+$");
        } else
            return false;
        /*  ^ : start of the string
            (?=.*[A-Za-z]) : obligatory at least one alphabet character
            (?=.*\d) : obligatory at least one digit
            (?=.*[^A-Za-z0-9]) : obligatory at least one special character
            .+ : have at least one random character
            $ : end of string
         */
    }

    public RegisterError register(String name,
                                  String email,
                                  String phone,
                                  String password,
                                  String confirmPassword) {

        if (!password.equals(confirmPassword)) {
            return RegisterError.PASSWORD_MISMATCH;
        }

        if (authDao.existsByEmail(email)) {
            return RegisterError.EMAIL_EXIST;
        }

        if (!isValidEmail(email)) {
            return RegisterError.INVALID_EMAIL_FORMAT;
        }

        if (!isStrongPassword(password) || !isStrongPassword(confirmPassword)) {
            return RegisterError.WEAK_PASSWORD;
        }

        if (!isValidPhonenumber(phone)) {
            return RegisterError.PHONE_ISVALID;
        }

        //generate salt then hash the password to store to database
        String salt = HashPassword.generateSalt();
        String hashPassword = HashPassword.hashPasswordWithSalt(password, salt);

        User user = new User();
        user.setName(name);
        user.setEmail(email);
        user.setRole(Role.customer);
        user.setPassword_hashed(hashPassword);
        user.setPhone_number(phone);
        user.setSalt(salt);
        user.setVerified(0);

        authDao.insert(user);

        return RegisterError.NONE;
    }

    //when user submit info -> controller call to service to activate account
    public void activateAccount(String email) {
        authDao.activateAccount(email);
    }

}
