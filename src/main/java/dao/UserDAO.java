package dao;

import model.User;
import model.Role;
import model.UserProfile;

public class UserDAO extends BaseDao
{







    
    // Lấy user theo ID
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
    
    // Cập nhật tên
    public boolean updateName(int userId, String newName) {
        String sql = "UPDATE users SET name = :name WHERE id = :userId";
        int updated = get().withHandle(handle ->
            handle.createUpdate(sql)
                .bind("userId", userId)
                .bind("name", newName)
                .execute()
        );
        return updated > 0;
    }
    
    // Cập nhật số điện thoại
    public boolean updatePhone(int userId, String newPhone) {
        String sql = "UPDATE users SET phone_number = :phone WHERE id = :userId";
        int updated = get().withHandle(handle ->
            handle.createUpdate(sql)
                .bind("userId", userId)
                .bind("phone", newPhone)
                .execute()
        );
        return updated > 0;
    }
    
    // Xóa tài khoản
    public boolean deleteUser(int userId) {
        String sql = "DELETE FROM users WHERE id = :userId";
        int deleted = get().withHandle(handle ->
            handle.createUpdate(sql)
                .bind("userId", userId)
                .execute()
        );
        return deleted > 0;
    }
}
