package dao;

import model.product.Product;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import model.product.ProductCard;
import org.jdbi.v3.core.statement.PreparedBatch;

public class ProductDAO extends BaseDao
{

    public List<ProductCard> getProductByPage(int page, int pageSize)
    {
        int offset = (page-1) * pageSize;
        String query =
                    "SELECT p.id, p.name, p.price, p.buy_count, avg(r.rating) as avg_rating, p.is_active, pi.img_url\n" +
                    "FROM products p \n"+
                    "left join product_images pi on pi.product_id = p.id \n"+
                    "left join reviews r on r.product_id = p.id \n"+
                    "GROUP BY p.id \n"+
                    "limit :limit OFFSET :offset";

            return get().withHandle(h->
                    h.createQuery(query)
                            .bind("limit", pageSize)
                            .bind("offset", offset)
                            .mapToBean(ProductCard.class)
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
        String query = "SELECT \n" +
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
                "    p.quantity,\n" +
                "    p.is_active AS isActive\n" +
                "FROM product_images pi\n" +
                "JOIN products p ON pi.product_id = p.id\n" +
                "JOIN brands b ON p.brand_id = b.id\n" +
                "JOIN categories c ON p.category_id = c.id\n" +
                "WHERE p.id=:id AND p.is_active = 1";

        return get().withHandle(h -> h.createQuery(query)
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


    public List<ProductCard> getProductsByName(String productName)
    {
        String query = "SELECT p.id, p.name, p.price, p.buy_count, avg(r.rating) as avg_rating, p.is_active, pi.img_url\n" +
                "FROM products p \n" +
                "left join product_images pi on pi.product_id = p.id\n" +
                "left join reviews r on r.product_id = p.id \n" +
                "WHERE p.name like :name\n" +
                "GROUP BY p.id";


        return get().withHandle(h->
                    h.createQuery(query)
                            .bind("name", "%"+productName+"%")
                            .mapToBean(ProductCard.class)
                            .list()
                );
    }

    public List<ProductCard> getProductsByCategory(String categoryParam)
    {
        String query = "SELECT p.id, p.name, p.price, p.buy_count, avg(r.rating) as avg_rating, p.is_active, pi.img_url\n" +
                "FROM products p \n" +
                "left join product_images pi on pi.product_id = p.id\n" +
                "left join reviews r on r.product_id = p.id \n" +
                "join categories c on p.category_id = c.id \n"+
                "WHERE p.name like :category\n" +
                "GROUP BY p.id";


        return get().withHandle(h->
                h.createQuery(query)
                        .bind("category", "%"+categoryParam+"%")
                        .mapToBean(ProductCard.class)
                        .list()
        );
    }
}