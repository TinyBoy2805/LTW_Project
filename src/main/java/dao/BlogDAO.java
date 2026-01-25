package dao;

import model.Blog;

import java.util.List;

public class BlogDAO extends BaseDao
{
    public List<Blog> getBlogs(int page, int pageSize)
    {
        int offset = (page-1) * pageSize;

        String query = "SELECT id, user_id AS userId, title, content, thumbnail, url, created_at AS createdAt, updated_at AS updatedAt " +
                      "FROM blogs " +
                      "ORDER BY created_at DESC " +
                      "LIMIT :limit OFFSET :offset";

        return get().withHandle(h->
        {
           return h.createQuery(query)
                   .bind("limit", pageSize)
                   .bind("offset", offset)
                   .mapToBean(Blog.class)
                   .list();
        });
    }



}
