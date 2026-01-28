package dao;

import model.User;
import model.Role;
import model.UserProfile;

public class UserDAO extends BaseDao {

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

    // Xóa địa chỉ (trả false nếu lỗi, true nếu thành công - kể cả không có địa chỉ nào)
    public boolean deleteAddresses(int userId) {
        if (userId <= 0) {
            return false;
        }

        try {
            int rowsDeleted = get().withHandle(handle ->
                    handle.execute("DELETE FROM addresses WHERE user_id = ?", userId)
            );
            // Log nếu cần debug
            // System.out.println("Deleted " + rowsDeleted + " addresses for userId: " + userId);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // Xóa user (trả false nếu lỗi hoặc không tồn tại, true nếu xóa thành công)
    public boolean deleteUser(int userId) {
        if (userId <= 0) {
            return false;
        }

        try {
            int deleted = get().withHandle(handle ->
                    handle.createUpdate("DELETE FROM users WHERE id = :userId")
                            .bind("userId", userId)
                            .execute()
            );
            return deleted > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean deleteAccount(Integer userId) {
        if (userId == null || userId <= 0) {
            return false;
        }

        try {
            return get().inTransaction(handle -> {
                handle.execute("DELETE FROM addresses WHERE user_id = ?", userId);
                handle.execute("DELETE FROM notifications WHERE user_id = ?", userId);
                handle.execute("DELETE FROM orders WHERE user_id = ?", userId);  // nếu có
                handle.execute("DELETE FROM contacts WHERE user_id = ?", userId);  // nếu có
                handle.execute("DELETE FROM reviews WHERE user_id = ?", userId);  // nếu có
                handle.execute("DELETE FROM search_histories WHERE user_id = ?", userId);  // nếu có
                handle.execute("DELETE FROM store_reviews WHERE user_id = ?", userId);  // nếu có
                handle.execute("DELETE FROM user_vouchers WHERE user_id = ?", userId);  // nếu có
                handle.execute("DELETE FROM verification_tokens WHERE user_id = ?", userId);  // nếu có


                int userDeleted = handle.execute("DELETE FROM users WHERE id = ?", userId);
                System.out.println("Deleted user rows: " + userDeleted);
                return userDeleted > 0;
            });
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }

    }

    public boolean changeAvt(Integer userId, String avtUrl) {
        if (avtUrl == null || avtUrl.isEmpty()) return false;
        String query = """
                    UPDATE users
                    SET avt_url = :avt
                    WHERE id = :uid
                """;
        int rows = get().withHandle(h ->
                h.createUpdate(query)
                        .bind("avt", avtUrl)
                        .bind("uid", userId)
                        .execute()
        );
        return rows > 0;
    }
}