package service;

import dao.AddressDao;
import dao.UserDAO;
import model.Address;
import model.User;
import model.UserProfile;

import java.util.ArrayList;
import java.util.List;

public class ProfileService
{
    private UserDAO userDAO;
    private AddressDao addressDao;

    public ProfileService()
    {
        this.userDAO = new UserDAO();
        this.addressDao = new AddressDao();
    }


    public UserProfile getUserProfile(Integer userId)
    {
        User user = this.userDAO.getUserById(userId);
        if (user == null) return null;
        List<Address> addresses = this.addressDao.getAllAddressesByUserId(userId);
        System.out.println(addresses);
        UserProfile userProfile = new UserProfile();

        userProfile.setName(user.getName());
        userProfile.setEmail(user.getEmail());
        userProfile.setPhone_number(user.getPhone_number());
        userProfile.setAvt_url(user.getAvt_url());
        userProfile.setMyAddresses(addresses);

        System.out.println("lay db duoc roi");
        return userProfile;
    }

        public boolean updateAdminProfile(int userId, String name, String email, String phone, String avtUrl) {
        boolean ok1 = userDAO.updateName(userId, name);
        boolean ok2 = userDAO.updateEmail(userId, email);
        boolean ok3 = userDAO.updatePhone(userId, phone);
        boolean ok4 = true;
        if (avtUrl != null && !avtUrl.isEmpty()) {
            ok4 = userDAO.updateAvatar(userId, avtUrl);
        }
        return ok1 && ok2 && ok3 && ok4;
    }
}
