package dao;

import model.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class AuthDao extends BaseDao {

    public User getUserByName(String name) {
      return get().withHandle(h -> h.createQuery("SELECT * FROM users WHERE name = :name")
        .bind("name", name)
        .mapToBean(User.class)
        .stream()
        .findFirst()
        .orElse(null));
    }

    public boolean existsByEmail(String email) {
        String sql = "SELECT id FROM users WHERE email = ?";
        try (Connection c = getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {

            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            return rs.next();

        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public void insert(User user) {
        String sql = """
                INSERT INTO users(name, email,role, password, phone)
                VALUES (?, ?, ?, ?, ?)
                """;

        try (Connection c = getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {

            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            ps.setBoolean(3, user.getRole());
            ps.setString(4, user.getPassword_hashed());
            ps.setString(5, user.getPhone_number());

            ps.executeUpdate();

        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
