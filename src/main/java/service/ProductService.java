package service;

import dao.ProductDAO;
import model.ProductReview;
import model.product.Product;
import model.product.ProductCard;
import model.product.ProductImage;

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

    public List<ProductCard> getProductsByCategory(String categoryParam)
    {
        return this.productDAO.getProductsByCategory(categoryParam);
    }

    public List<ProductCard> getFilteredProducts(List<String> brands, List<String> types, List<Integer> ratings)
    {
        return this.productDAO.getFilteredProducts(brands, types, ratings);
    }

    public List<ProductImage> getImagesByProductId(int productId)
    {
        return this.productDAO.getImagesByProductId(productId);
    }

    public List<ProductReview> getProductReviewsByProductId(int id)
    {
        return this.productDAO.getProductReviewsByProductId(id);
    }

    public double getAvgRating(List<ProductReview> reviews)
    {
        double total = 0;
        for(ProductReview r: reviews)
        {
            total += r.getRating();
        }

        return Math.ceil((double)(total/reviews.size()));
    }

    public List<ProductReview> getProductReviewsByProductIdHasPagination(int id, int pageReview, int pageReviewSize)
    {
        return this.productDAO.getProductReviewsByProductIdHasPagination(id, pageReview, pageReviewSize);
    }

    public List<ProductCard> getProductsByCategoryHasPagination(String category, int pageProduct, int pageProductSize)
    {
        return this.productDAO.getProductsByCategoryHasPagination(category, pageProduct, pageProductSize);
    }

    public void saveReview(int userId, int productId, int rating, String comment) {
        this.productDAO.saveReview(userId, productId, rating, comment);
    }
}
