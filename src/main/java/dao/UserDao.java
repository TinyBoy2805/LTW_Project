package dao;

import model.User;
import java.util.*;

public class UserDao extends BaseDao {
    public User getUserById(long id) {
        String sql = "SELECT * FROM users WHERE id = :id";
        return get().withHandle(h ->
            h.createQuery(sql)
                .bind("id", id)
                .map((rs, ctx) -> {
                    User user = new User();
                    user.setId(rs.getInt("id"));
                    user.setName(rs.getString("name"));
                    user.setEmail(rs.getString("email"));
                    // ... set other fields if needed
                    return user;
                })
                .findFirst()
                .orElse(null)
        );
    }
}
