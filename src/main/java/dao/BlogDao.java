package dao;

import model.Blog;
import java.sql.*;
import java.util.*;


public class BlogDao extends BaseDao {

        public List<Blog> getAllBlogs() {
            String sql = "SELECT * FROM blogs ORDER BY created_at DESC";
            return get().withHandle(h ->
                h.createQuery(sql)
                    .map((rs, ctx) -> {
                        Blog blog = new Blog();
                        blog.setId(rs.getInt("id"));
                        blog.setUserId(rs.getInt("user_id"));
                        blog.setTitle(rs.getString("title"));
                        blog.setContent(rs.getString("content"));
                        blog.setThumbnail(rs.getString("thumbnail"));
                        blog.setUrl(rs.getString("url"));
                        blog.setCreatedAt(rs.getTimestamp("created_at"));
                        blog.setUpdatedAt(rs.getTimestamp("updated_at"));
                        return blog;
                    })
                    .list()
            );
        }

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

     public Blog getBlogById(int id) {
            String sql = "SELECT * FROM blogs WHERE id = :id";
            return get().withHandle(h ->
             h.createQuery(sql)
           .bind("id", id)
           .map((rs, ctx) -> {
                  Blog blog = new Blog();
                   blog.setId(rs.getInt("id"));
                   blog.setUserId(rs.getInt("user_id"));
                   blog.setTitle(rs.getString("title"));
                   blog.setContent(rs.getString("content"));
                   blog.setThumbnail(rs.getString("thumbnail"));
                   blog.setUrl(rs.getString("url"));
                   blog.setCreatedAt(rs.getTimestamp("created_at"));
                   blog.setUpdatedAt(rs.getTimestamp("updated_at"));
                    return blog;
                        })
                        .findOne()
                        .orElse(null)
                );
            }

         public boolean deleteBlogById(int id) {
                    String sql = "DELETE FROM blogs WHERE id = :id";
                    int rows = get().withHandle(h ->
                        h.createUpdate(sql)
                            .bind("id", id)
                            .execute()
                    );
                    return rows > 0;
                }
    
    public boolean updateBlog(Blog blog) {
        String sql = "UPDATE blogs SET title = :title, content = :content, thumbnail = :thumbnail, url = :url, created_at = :createdAt, updated_at = :updatedAt WHERE id = :id";
        int rows = get().withHandle(h ->
            h.createUpdate(sql)
                .bind("id", blog.getId())
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


}
