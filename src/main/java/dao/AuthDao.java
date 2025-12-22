package dao;

import model.Role;
import model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class AuthDao extends BaseDao {

//    public User getUserByName(String name) {
//        return get().withHandle(h -> h.createQuery("SELECT * FROM users WHERE name = :name")
//                .bind("name", name)
//                .mapToBean(User.class)
//                .stream()
//                .findFirst()
//                .orElse(null));
//    }

    public User getUserByName(String name) {
        return get().withHandle(h ->
                h.createQuery("SELECT * FROM users WHERE name = :name")
                        .bind("name", name)
                        .map((rs, ctx) -> {
                            User u = new User();
                            u.setId(rs.getInt("id"));
                            u.setName(rs.getString("name"));
                            u.setEmail(rs.getString("email"));
                            u.setRole(Role.valueOf(rs.getString("role")));
                            u.setPassword_hashed(rs.getString("password_hashed"));
                            u.setPhone_number(rs.getString("phone_number"));
                            u.setAvt_url(rs.getString("avt_url"));
                            return u;
                        })
                        .findFirst()
                        .orElse(null)
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
                                    INSERT INTO users(name, email, role, password_hashed, phone_number)
                                    VALUES (:name, :email, :role, :password, :phone)
                                """)
                        .bind("name", user.getName())
                        .bind("email", user.getEmail())
                        .bind("role", user.getRole().name())
                        .bind("password", user.getPassword_hashed())
                        .bind("phone", user.getPhone_number())
                        .execute()
        );
    }
}
