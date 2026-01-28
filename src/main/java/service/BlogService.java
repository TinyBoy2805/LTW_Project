package service;

import dao.BlogDAO;
import model.Blog;

import java.util.List;

public class BlogService
{
    private BlogDAO blogDAO;

    public BlogService()
    {
        this.blogDAO = new BlogDAO();
    }

    public List<Blog> getBlogs(int page, int pageSize)
    {
        return this.blogDAO.getBlogs(page, pageSize);
    }



}
