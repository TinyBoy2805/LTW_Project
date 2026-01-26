package dao;

import model.Email;
import java.util.*;
import java.sql.*;

public class EmailDao extends BaseDao {
    public List<Email> getAllEmails() {
        String sql = "SELECT n.*, u.name as user_name FROM notifications n LEFT JOIN users u ON n.user_id = u.id ORDER BY n.created_at DESC";
        return get().withHandle(h ->
            h.createQuery(sql)
                .map((rs, ctx) -> {
                    Email email = new Email();
                    email.setId(rs.getInt("id"));
                    email.setUserId(rs.getInt("user_id"));
                    email.setTitle(rs.getString("title"));
                    email.setMessage(rs.getString("message"));
                    email.setIsRead(rs.getBoolean("is_read"));
                    email.setIsImportant(rs.getBoolean("is_important"));
                    email.setCreatedAt(rs.getTimestamp("created_at"));
                    email.setUserName(rs.getString("user_name"));
                    return email;
                })
                .list()
        );
    }

    public Email getEmailById(int id) {
        String sql = "SELECT n.*, u.name as user_name, u.email as user_email FROM notifications n LEFT JOIN users u ON n.user_id = u.id WHERE n.id = :id";
        return get().withHandle(h ->
            h.createQuery(sql)
                .bind("id", id)
                .map((rs, ctx) -> {
                    Email email = new Email();
                    email.setId(rs.getInt("id"));
                    email.setUserId(rs.getInt("user_id"));
                    email.setTitle(rs.getString("title"));
                    email.setMessage(rs.getString("message"));
                    email.setIsRead(rs.getBoolean("is_read"));
                    email.setIsImportant(rs.getBoolean("is_important"));
                    email.setCreatedAt(rs.getTimestamp("created_at"));
                    email.setUserName(rs.getString("user_name"));
                    email.setUserEmail(rs.getString("user_email"));
                    return email;
                })
                .findFirst()
                .orElse(null)
        );
    }
}