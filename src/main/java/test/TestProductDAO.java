package test;

import dao.ProductDAO;
import model.product.Product;
import java.util.List;

public class TestProductDAO {
    public static void main(String[] args) {
        try {
            ProductDAO dao = new ProductDAO();
            System.out.println("Testing database connection...");
            
            List<Product> products = dao.getListProduct();
            
            System.out.println("Found " + products.size() + " products:");
            
            for (Product p : products) {
                System.out.println(p);
            }
            
        } catch (Exception e) {
            System.err.println("Error: " + e.getMessage());
            e.printStackTrace();
        }
    }
}
