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
        return db.getListProduct();
    }


}
