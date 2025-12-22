package service;

import dao.ProductDAO;
import model.Product;
import java.sql.SQLException;
import java.util.List;

public class ProductService
{
    private ProductDAO db = new ProductDAO();
    public List<Product> getProducts() throws SQLException
    {
        return this.db.getListProduct();
    }

    public List<Product> getProductByPage(int page, int pageSize) throws SQLException
    {
        return this.db.getProductByPage(page, pageSize);
    }

    public int getTotalProducts() throws SQLException
    {
        return this.db.getTotalProducts();
    }


}
