package service;

import dao.ProductDAO;
import model.product.ProductCard;

public class CartService
{
    private ProductDAO productDAO;

    public CartService()
    {
        this.productDAO = new ProductDAO();
    }

    public ProductCard getProductCard(int productId)
    {
        return this.productDAO.getProductCard(productId);
    }
}
