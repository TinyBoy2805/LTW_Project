package dao;

import model.Product;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.jdbi.v3.core.statement.PreparedBatch;

public class ProductDAO extends BaseDao {
    static Map<Integer, Product> data = new HashMap<>();
    static {
        data.put(1, new Product(1, "Product 1", 100));
        data.put(2, new Product(2, "Product 2", 200));
        data.put(3, new Product(3, "Product 3", 300));
    }
    public List<Product> getListProduct() {
        return get().withHandle(h -> h.createQuery("SELECT * FROM products")
                    .mapToBean(Product.class)
                    .list());
    }

    public Product getProduct(int id) {
        return get().withHandle(h -> h.createQuery("SELECT * FROM products WHERE id = :id")
        .bind("id", id)
        .mapToBean(Product.class)
             .first());

    }
    public void insert(List<Product> products) {
        get().useHandle(handle -> {
            PreparedBatch batch = handle.prepareBatch ("insert into products(id,name,price) values(:id,:name,:price)");
            products.forEach(product -> {
                batch.bindBean(product).add();
            });
            batch.execute();
        });
    }
    // public static void main(String[] args) {
    //     ProductDAO dao = new ProductDAO();
    //     List<Product> products = dao.getListProduct();
    //     dao.insert(products);
    // }
}