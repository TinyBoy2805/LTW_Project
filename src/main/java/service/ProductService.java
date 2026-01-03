package service;

import dao.ProductDAO;
import model.product.Product;
import model.product.ProductCard;

import java.sql.SQLException;
import java.util.List;

public class ProductService
{
    private ProductDAO productDAO = new ProductDAO();
    public List<Product> getProducts() throws SQLException
    {
        return this.productDAO.getListProduct();
    }

    public List<ProductCard> getProductByPage(int page, int pageSize) throws SQLException
    {
        return this.productDAO.getProductByPage(page, pageSize);
    }

    public int getTotalProducts() throws SQLException
    {
        return this.productDAO.getTotalProducts();
    }

    public Product getOneProduct(int id)
    {
        return this.productDAO.getProduct(id);
    }

    public List<ProductCard> getProductsByName(String productName)
    {
        return this.productDAO.getProductsByName(productName);
    }
}
