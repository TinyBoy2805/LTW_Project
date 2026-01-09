package dao;

import model.Blog;
import java.sql.*;
import java.util.*;


public class BlogDao extends BaseDao {
    public boolean insertBlog(Blog blog) {
        String sql = "INSERT INTO blogs (user_id, title, content, thumbnail, url, created_at, updated_at) VALUES (:userId, :title, :content, :thumbnail, :url, :createdAt, :updatedAt)";
        int rows = get().withHandle(h ->
            h.createUpdate(sql)
                .bind("userId", blog.getUserId())
                .bind("title", blog.getTitle())
                .bind("content", blog.getContent())
                .bind("thumbnail", blog.getThumbnail())
                .bind("url", blog.getUrl())
                .bind("createdAt", blog.getCreatedAt())
                .bind("updatedAt", blog.getUpdatedAt())
                .execute()
        );
        return rows > 0;
    }

    // Có thể bổ sung các hàm lấy danh sách, xóa, sửa blog ở đây
}
