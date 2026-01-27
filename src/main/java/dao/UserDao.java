package dao;

import model.User;
import model.Role;
import java.util.*;

public class UserDao extends BaseDao {
    public User getUserById(int userId) {
        String sql = "SELECT * FROM users WHERE id = :userId";
        return get().withHandle(handle ->
            handle.createQuery(sql)
                .bind("userId", userId)
                .map((rs, ctx) -> new User(
                    rs.getInt("id"),
                    rs.getString("name"),
                    rs.getString("email"),
                    Role.valueOf(rs.getString("role").toUpperCase()),
                    rs.getString("password_hashed"),
                    rs.getString("phone_number"),
                    rs.getString("avt_url"),
                    rs.getString("salt"),
                    rs.getInt("verified")
                ))
                .findOne()
                .orElse(null)
        );
    }
    
    // Thêm phương thức cập nhật mật khẩu
    public void updatePassword(int id, String passwordHashed, String salt) {
        get().useHandle(h ->
            h.createUpdate("""
                UPDATE users SET password_hashed = :password, salt = :salt WHERE id = :id
            """)
            .bind("id", id)
            .bind("password", passwordHashed)
            .bind("salt", salt)
            .execute()
        );
    }
}
