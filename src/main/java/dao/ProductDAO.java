package dao;

import model.product.FilterRequest;
import model.product.Product;

import java.util.List;

import model.product.ProductCard;
import org.jdbi.v3.core.statement.PreparedBatch;

public class ProductDAO extends BaseDao {

    public List<ProductCard> getProductByPage(int page, int pageSize) {
        int offset = (page - 1) * pageSize;
        String query =
                "SELECT p.id, p.name, p.price, p.buy_count, avg(r.rating) as avg_rating, p.is_active, pi.img_url\n" +
                        "FROM products p \n" +
                        "left join product_images pi on pi.product_id = p.id \n" +
                        "left join reviews r on r.product_id = p.id \n" +
                        "GROUP BY p.id \n" +
                        "limit :limit OFFSET :offset";

        return get().withHandle(h ->
                h.createQuery(query)
                        .bind("limit", pageSize)
                        .bind("offset", offset)
                        .mapToBean(ProductCard.class)
                        .list()
        );
    }


    public int getTotalProducts() {
        String query = "SELECT COUNT(DISTINCT p.id) as total FROM products p";
        return get().withHandle(h ->
                h.createQuery(query)
                        .mapTo(Integer.class)
                        .one()
        );
    }


    public List<Product> getListProduct() {
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

    public Product getProduct(int id) {
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

    public void insert(List<Product> products) {
        get().useHandle(handle ->
        {
            PreparedBatch batch = handle.prepareBatch("insert into products(id,name,price) values(:id,:name,:price)");
            products.forEach(product ->
            {
                batch.bindBean(product).add();
            });
            batch.execute();
        });
    }


    public List<ProductCard> getProductsByName(String productName) {
        String query = "SELECT p.id, p.name, p.price, p.buy_count, avg(r.rating) as avg_rating, p.is_active, pi.img_url\n" +
                "FROM products p \n" +
                "left join product_images pi on pi.product_id = p.id\n" +
                "left join reviews r on r.product_id = p.id \n" +
                "WHERE p.name like :name\n" +
                "GROUP BY p.id";


        return get().withHandle(h ->
                h.createQuery(query)
                        .bind("name", "%" + productName + "%")
                        .mapToBean(ProductCard.class)
                        .list()
        );
    }

    public List<ProductCard> getProducts(int pageIndex, int pageSize) {
        int offset = (pageIndex - 1) * pageSize;
        String query = """
                SELECT p.id, p.name, p.price, p.buy_count, pi.img_url, p.quantity, p.is_active
                FROM products p
                left join product_images pi on pi.product_id = p.id
                GROUP BY p.id
                limit :limit OFFSET :offset
                """;

        return get().withHandle(h ->
                h.createQuery(query)
                        .bind("limit", pageSize)
                        .bind("offset", offset)
                        .mapToBean(ProductCard.class)
                        .list()
        );
    }

    public int countSearchProduct(String productName) {
        String query = """
                SELECT Count(DISTINCT p.id)
                                FROM products p
                                WHERE p.name like :name
                """;
        return get().withHandle(h ->
                h.createQuery(query)
                        .bind("name", "%" + productName + "%")
                        .mapTo(int.class)
                        .one()
        );
    }

    public List<ProductCard> searchSearch(String productName, int pageIndex, int pageSize) {
        String query = """
                SELECT p.id, p.name, p.price, p.buy_count, pi.img_url, p.quantity, p.is_active
                                FROM products p
                                left join product_images pi on pi.product_id = p.id
                                WHERE p.name like :name
                                GROUP BY p.id
                                limit :limit OFFSET :offset
                """;
        var data = get().withHandle(h ->
                h.createQuery(query)
                        .bind("name", "%" + productName + "%")
                        .bind("limit", pageSize)
                        .bind("offset", (pageIndex - 1) * pageSize)
                        .mapToBean(ProductCard.class)
                        .list());
        return data;
    }

    public int countFilterProducts(FilterRequest fr) {
        StringBuilder sql = new StringBuilder("""
                    SELECT COUNT(DISTINCT P.id)
                    FROM products P
                    JOIN categories C ON P.category_id = C.id
                    WHERE 1 = 1
                """);

        if (fr.getQuantity() > 0) {
            sql.append(" AND P.quantity >= :quantity");
        }

        if (fr.getCategory() != null && !fr.getCategory().isBlank()) {
            sql.append(" AND C.name LIKE :category COLLATE utf8mb4_unicode_ci");
        }

        if (fr.getStatus() != null && !fr.getStatus().isBlank()) {
            sql.append("""
                        AND (
                            (:status = 'active'      AND P.quantity >= 50)
                         OR (:status = 'low'    AND P.quantity > 0 AND P.quantity < 50)
                         OR (:status = 'out-of-stock' AND P.quantity = 0)
                        )
                    """);
        }

        return get().withHandle(h -> {
            var q = h.createQuery(sql.toString());

            if (fr.getQuantity() > 0) {
                q.bind("quantity", fr.getQuantity());
            }

            if (fr.getCategory() != null && !fr.getCategory().isBlank()) {
                q.bind("category", fr.getCategory());
            }

            if (fr.getStatus() != null && !fr.getStatus().isBlank()) {
                q.bind("status", fr.getStatus());
            }

            return q.mapTo(int.class).one();
        });
    }

    public List<ProductCard> filterProduct(FilterRequest filter, int pageIndex, int pageSize) {

        StringBuilder sql = new StringBuilder("""
                    SELECT
                        P.id,
                        P.name,
                        P.price,
                        P.quantity,
                        P.is_active,
                        PI.img_url,
                        P.buy_count
                    FROM products P
                    left join product_images pi on pi.product_id = p.id
                    JOIN categories C ON P.category_id = C.id
                    WHERE 1 = 1 AND PI.is_main = 1
                """);

        if (filter.getQuantity() >= 0) {
            sql.append(" AND P.quantity >= :quantity");
        }

        if (filter.getCategory() != null && !filter.getCategory().isBlank()) {
            sql.append(" AND C.name LIKE :category COLLATE utf8mb4_unicode_ci");
        }

        if (!filter.getStatus().isBlank()) {
            sql.append("""
                        AND (
                            (:status = 'active'      AND P.quantity >= 50)
                         OR (:status = 'low'    AND P.quantity > 0 AND P.quantity < 50)
                         OR (:status = 'out-of-stock' AND P.quantity = 0)
                        )
                    """);
        }

        sql.append(" ORDER BY P.id DESC LIMIT :limit OFFSET :offset");

        return get().withHandle(h -> {
            var query = h.createQuery(sql.toString());

            if (filter.getQuantity() >= 0) {
                query.bind("quantity", filter.getQuantity());
            }

            if (!filter.getStatus().isBlank()) {
                query.bind("status", filter.getStatus());
            }

            if (filter.getCategory() != null && !filter.getCategory().isBlank()) {
                query.bind("category", filter.getCategory());
            }

            query.bind("limit", pageSize);
            query.bind("offset", (pageIndex - 1) * pageSize);

            return query.map((rs, ctx) -> {
                ProductCard p = new ProductCard();
                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setPrice(rs.getDouble("price"));
                p.setQuantity(rs.getInt("quantity"));
                p.setBuy_count(rs.getInt("buy_count"));
                p.setIs_active(rs.getBoolean("is_active"));
                p.setImg_url(rs.getString("img_url"));
                return p;
            }).list();
        });
    }

    public List<String> getAllCategoryNames() {
        String query = "SELECT DISTINCT name FROM categories";
        return get().withHandle(h ->
                h.createQuery(query)
                        .mapTo(String.class)
                        .list()
        );
    }
}