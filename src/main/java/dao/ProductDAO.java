package dao;

import model.Product;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.jdbi.v3.core.statement.PreparedBatch;

public class ProductDAO extends BaseDao
{
    static Map<Integer, Product> data = new HashMap<>();



    public List<Product> getProductByPage(int page, int pageSize)
    {
        int offset = (page-1) * pageSize;
        String query =
                    "SELECT \n" +
                    "    p.id,\n" +
                    "    pi.product_id AS productId,\n" +
                    "    pi.img_url AS url,\n" +
                    "    p.name,\n" +
                    "    p.description,\n" +
                    "    b.name AS brand,\n" +
                    "    c.name AS category,\n" +
                    "    p.price,\n" +
                    "    p.buy_count AS buyCount,\n" +
                    "    p.start_date AS startDate,\n" +
                    "    p.end_date AS endDate,\n" +
                    "    p.quantity\n" +
                    "FROM product_images pi\n" +
                    "JOIN products p ON pi.product_id = p.id\n" +
                    "JOIN brands b ON p.brand_id = b.id\n" +
                    "JOIN categories c ON p.category_id = c.id\n"+
                    "LIMIT :limit OFFSET :offset";

            return get().withHandle(h->
                    h.createQuery(query)
                            .bind("limit", pageSize)
                            .bind("offset", offset)
                            .mapToBean(Product.class)
                            .list()
                    );
    }


    public int getTotalProducts()
    {
        String query = "SELECT COUNT(DISTINCT p.id) as total FROM products p";
        return get().withHandle(h ->
                h.createQuery(query)
                        .mapTo(Integer.class)
                        .one()
        );
    }

    public List<Product> getListProduct()
    {
        String query =
                "SELECT \n" +
                "    p.id,\n" +
                "    pi.product_id AS productId,\n" +
                "    pi.img_url AS url,\n" +
                "    p.name,\n" +
                "    p.description,\n" +
                "    b.name AS brand,\n" +
                "    c.name AS category,\n" +
                "    p.price,\n" +
                "    p.buy_count AS buyCount,\n" +
                "    p.start_date AS startDate,\n" +
                "    p.end_date AS endDate,\n" +
                "    p.quantity\n" +
                "FROM product_images pi\n" +
                "JOIN products p ON pi.product_id = p.id\n" +
                "JOIN brands b ON p.brand_id = b.id\n" +
                "JOIN categories c ON p.category_id = c.id;";

        return get().withHandle(h -> h.createQuery(query)
                    .mapToBean(Product.class)
                    .list());
    }

    public Product getProduct(int id)
    {
        return get().withHandle(h -> h.createQuery("SELECT * FROM products WHERE id = :id")
        .bind("id", id)
        .mapToBean(Product.class)
             .first());

    }
    public void insert(List<Product> products)
    {
        get().useHandle(handle ->
        {
            PreparedBatch batch = handle.prepareBatch ("insert into products(id,name,price) values(:id,:name,:price)");
            products.forEach(product ->
            {
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