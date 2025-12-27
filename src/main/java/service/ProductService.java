package service;

import dao.ProductDAO;
import model.product.Product;
import model.product.ProductCard;

import java.sql.SQLException;
import java.util.List;

public class ProductService
{
    private ProductDAO db = new ProductDAO();
    public List<Product> getProducts() throws SQLException
    {
        return this.db.getListProduct();
    }

    public List<ProductCard> getProductByPage(int page, int pageSize) throws SQLException
    {
        return this.db.getProductByPage(page, pageSize);
    }

    public int getTotalProducts() throws SQLException
    {
        return this.db.getTotalProducts();
    }

    public Product getOneProduct(int id)
    {
        return this.db.getProduct(id);
    }

}
