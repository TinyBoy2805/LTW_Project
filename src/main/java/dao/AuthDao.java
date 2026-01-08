package dao;

import model.Role;
import model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

public class AuthDao extends BaseDao {

    public User getUserByName(String name)
    {
      return get().withHandle(h -> h.createQuery("SELECT * FROM users WHERE name = :name")
        .bind("name", name)
        .mapToBean(User.class)
        .stream()
        .findFirst()
        .orElse(null));
    }
    public User getUserByEmailOrPhone(String value) {
        return get().withHandle(h -> //get() : get connection to db from BaseDao
                //lambda function that return User
                h.createQuery("SELECT * FROM users WHERE email = :v OR phone_number = :v")
                        .bind("v", value)
                        //bind variable v into SQL with input info (value)
                        .map((rs, ctx) -> {
                            //user mapping function -> Change a single line into User
                            User u = new User();
                            u.setId(rs.getInt("id"));
                            u.setName(rs.getString("name"));
                            u.setEmail(rs.getString("email"));
                            u.setRole(Role.valueOf(rs.getString("role")));
                            u.setPassword_hashed(rs.getString("password_hashed"));
                            u.setPhone_number(rs.getString("phone_number"));
                            u.setAvt_url(rs.getString("avt_url"));
                            u.setSalt(rs.getString("salt"));
                            u.setVerified(rs.getInt("verified"));
                            return u;
                        })
                        .findFirst()
                        //take the first record that be found
                        .orElse(null)
                        //if no result is found, return null
        );
    }

    public boolean existsByEmail(String email) {
        return get().withHandle(h ->
                h.createQuery("SELECT 1 FROM users WHERE email = :email")
                        .bind("email", email)
                        .mapTo(Integer.class)
                        .findFirst()
                        .isPresent()
        );
    }

    public void insert(User user) {
        get().useHandle(h ->
                h.createUpdate("""
                                    INSERT INTO users(name, email, role, password_hashed, phone_number, salt, verified)
                                    VALUES (:name, :email, :role, :password, :phone, :salt, 0)
                                """)
                        .bind("name", user.getName())
                        .bind("email", user.getEmail())
                        .bind("role", user.getRole().name())
                        .bind("password", user.getPassword_hashed())
                        .bind("phone", user.getPhone_number())
                        .bind("salt", user.getSalt())
                        .execute()
        );
    }

    //service continue to call DAO to activate account into db
    public void activateAccount(String email) {
        get().useHandle(h ->
                h.createUpdate("UPDATE users SET verified = 1 WHERE email = :email")
                        .bind("email", email)
                        .execute()
        );
    }

    //update email for user
    public void updateEmail(String oldEmail, String newEmail) {
        get().useHandle(h ->
                h.createUpdate("UPDATE users SET email = :new, verified = 0 WHERE email = :old")
                        .bind("old", oldEmail)
                        .bind("new", newEmail)
                        .execute()
        );
    }


//    public void saveOTP(String email, String otp) {
//        String sql = "UPDATE users SET otp=:otp WHERE email=:email";
//        get().withHandle(h -> h.createUpdate(sql)
//                .bind("otp", otp).bind("email", email).execute());
//    }
//
//    public String getOTP(String email) {
//        String sql = "SELECT otp FROM users WHERE email=:email";
//        return get().withHandle(h ->
//                h.createQuery(sql).bind("email", email)
//                        .mapTo(String.class).findOne().orElse(null)
//        );
//    }
//
//    public void updateVerified(String email) {
//        String sql = "UPDATE users SET verified=1, otp=NULL WHERE email=:email";
//        get().withHandle(h -> h.createUpdate(sql)
//                .bind("email", email).execute());
//    }

    // Lấy danh sách tất cả người dùng có vai trò là khách hàng
    public List<User> getAllCustomers() {
         return get().withHandle(handle ->
             handle.createQuery("""
                  SELECT id, name, email, phone_number,
                      avt_url,
                      role
                  FROM users
                  WHERE role = 'customer'
                  """)
                .mapToBean(User.class)
                .list()
         );
    }

    // Lấy chi tiết 1 khách hàng theo ID
    public User getUserById(int id) {
            return get().withHandle(handle ->
                handle.createQuery("""
                    SELECT id, name, email, role, phone_number, avt_url
                    FROM users
                    WHERE id = :id
                    """)
                .bind("id", id)
                .mapToBean(User.class)
                .findOne()
                .orElse(null)
            );
    }
    // Tìm kiếm khách hàng theo tên
    public List<User> searchCustomersByName(String keyword) {
        return get().withHandle(handle ->
            handle.createQuery("""
                SELECT id, name, email, phone_number, avt_url, role
                FROM users
                WHERE role = 'customer' AND LOWER(name) LIKE CONCAT('%', LOWER(:keyword), '%')
            """)
            .bind("keyword", keyword)
            .mapToBean(User.class)
            .list()
        );
    }
    // Cập nhật thông tin khách hàng
    public void updateUserInfo(int id, String name, String email, String phoneNumber) {
        get().useHandle(h ->
            h.createUpdate("""
                UPDATE users
                SET name = :name,
                    email = :email,
                    phone_number = :phoneNumber
                WHERE id = :id
            """)
            .bind("id", id)
            .bind("name", name)
            .bind("email", email)
            .bind("phoneNumber", phoneNumber)
            .execute()
        );
    }
    
    // Xóa tài khoản người dùng
    public void deleteUser(int id) {
        get().useHandle(h ->
            h.createUpdate("DELETE FROM users WHERE id = :id")
            .bind("id", id)
            .execute()
        );
    }
}

