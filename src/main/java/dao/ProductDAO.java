package dao;

import model.product.*;

import java.util.List;

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


    public ProductCard getProductCard(int productId) {
        String query = "SELECT p.id, p.name, p.price, p.buy_count, avg(r.rating) as avg_rating, p.is_active, pi.img_url\n" +
                "FROM products p \n" +
                "left join product_images pi on pi.product_id = p.id\n" +
                "left join reviews r on r.product_id = p.id \n" +
                "WHERE p.id like :id\n" +
                "GROUP BY p.id";


        return get().withHandle(h ->
                h.createQuery(query)
                        .bind("id", productId)
                        .mapToBean(ProductCard.class)
                        .first()
        );

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

    public List<ProductCard> getProductsByCategory(String categoryParam) {
        String query = "SELECT p.id, p.name, p.price, p.buy_count, avg(r.rating) as avg_rating, p.is_active, pi.img_url\n" +
                "FROM products p \n" +
                "left join product_images pi on pi.product_id = p.id\n" +
                "left join reviews r on r.product_id = p.id \n" +
                "join categories c on p.category_id = c.id \n" +
                "WHERE p.name like :category\n" +
                "GROUP BY p.id";


        return get().withHandle(h ->
                h.createQuery(query)
                        .bind("category", "%" + categoryParam + "%")
                        .mapToBean(ProductCard.class)
                        .list()
        );
    }

    public List<ProductCard> getFilteredProducts(List<String> brands, List<String> types, List<Integer> ratings) {
        StringBuilder query = new StringBuilder(
                "SELECT p.id, p.name, p.price, p.buy_count, " +
                        "COALESCE(AVG(r.rating), 0) as avg_rating, p.is_active, pi.img_url " +
                        "FROM products p " +
                        "LEFT JOIN product_images pi ON pi.product_id = p.id " +
                        "LEFT JOIN reviews r ON r.product_id = p.id " +
                        "LEFT JOIN brands b ON p.brand_id = b.id " +
                        "LEFT JOIN categories c ON p.category_id = c.id " +
                        "WHERE 1=1 "
        );

        // Thêm filter cho brands
        if (brands != null && !brands.isEmpty()) {
            query.append("AND b.name IN (<brands>) ");
        }

        // Thêm filter cho categories/types
        if (types != null && !types.isEmpty()) {
            query.append("AND c.name IN (<types>) ");
        }

        query.append("GROUP BY p.id ");

        // Thêm filter cho ratings (sau khi GROUP BY)
        if (ratings != null && !ratings.isEmpty()) {
            query.append("HAVING ");
            for (int i = 0; i < ratings.size(); i++) {
                if (i > 0) query.append("OR ");
                query.append("(AVG(r.rating) >= :rating").append(i)
                        .append(" AND AVG(r.rating) < :rating").append(i).append("_max) ");
            }
        }

        return get().withHandle(h -> {
            var q = h.createQuery(query.toString());

            // Bind brands
            if (brands != null && !brands.isEmpty()) {
                q.bindList("brands", brands);
            }

            // Bind types
            if (types != null && !types.isEmpty()) {
                q.bindList("types", types);
            }

            // Bind ratings
            if (ratings != null && !ratings.isEmpty()) {
                for (int i = 0; i < ratings.size(); i++) {
                    int rating = ratings.get(i);
                    q.bind("rating" + i, rating);
                    q.bind("rating" + i + "_max", rating + 1);
                }
            }

            return q.mapToBean(ProductCard.class).list();
        });
    }


    //admin DAO cho product
    public List<AdminProductCard> getProducts(int pageIndex, int pageSize) {
        int offset = (pageIndex - 1) * pageSize;
        String query = """
                SELECT p.id, p.name, p.price, p.buy_count, pi.img_url, p.quantity, p.is_active
                FROM products p
                left join product_images pi on pi.product_id = p.id
                where pi.is_main = 1
                Group by p.id
                limit :limit OFFSET :offset
                """;

        return get().withHandle(h ->
                h.createQuery(query)
                        .bind("limit", pageSize)
                        .bind("offset", offset)
                        .mapToBean(AdminProductCard.class)
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

    public List<AdminProductCard> searchProduct(String productName, int pageIndex, int pageSize) {
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
                        .mapToBean(AdminProductCard.class)
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

    public List<AdminProductCard> filterProduct(FilterRequest filter, int pageIndex, int pageSize) {

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
                AdminProductCard p = new AdminProductCard();
                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setPrice(rs.getDouble("price"));
                p.setQuantity(rs.getInt("quantity"));
                p.setBuy_count(rs.getInt("buy_count"));
                p.set_active(rs.getBoolean("is_active"));
                p.setImg_url(rs.getString("img_url"));
                return p;
            }).list();
        });
    }

    public int getBrandIDByName(String brandName) {
        String query = """
                SELECT id
                FROM brands
                WHERE name like :brand
                """;
        return get().withHandle(h ->
                h.createQuery(query)
                        .bind("brand", brandName)
                        .mapTo(int.class)
                        .one()
        );
    }

    public int getCategoryIDByName(String categoryName) {
        String query = """
                SELECT id
                FROM categories
                WHERE name like :category
                """;
        return get().withHandle(h ->
                h.createQuery(query)
                        .bind("category", categoryName)
                        .mapTo(int.class)
                        .one()
        );
    }

    public int addNewProduct(Product product, List<ProductImage> productImages) {
        int brandID = getBrandIDByName(product.getBrand());
        int categoryID = getCategoryIDByName(product.getCategory());

        String createNewProduct = """
                INSERT INTO products (name, description, brand_id, category_id, price, is_active, buy_count, start_date, end_date, quantity)
                VALUES (:name, :description, :brandID, :categoryID, :price, 1, 0, :startDate, :endDate, :quantity)
                """;

        int productID = get().withHandle(h ->
                h.createUpdate(createNewProduct)
                        .bind("name", product.getName())
                        .bind("description", product.getDescription())
                        .bind("brandID", brandID)
                        .bind("categoryID", categoryID)
                        .bind("startDate", product.getStartDate())
                        .bind("endDate", product.getEndDate())
                        .bind("price", product.getPrice())
                        .bind("quantity", product.getQuantity())
                        .executeAndReturnGeneratedKeys("id")
                        .mapTo(int.class)
                        .one()
        );

        String updateProductIMG = """
                INSERT INTO product_images(product_id, img_url, is_main)
                VALUES (:productID, :imgURL, :isMain)
                """;
        for (ProductImage image : productImages) {
            get().withHandle(h ->
                    h.createUpdate(updateProductIMG)
                            .bind("productID", productID)
                            .bind("imgURL", image.getUrl())
                            .bind("isMain", image.getIsMain())
                            .execute()
            );
        }

        return productID;
    }


    public Product getProductByID(int productID) {
        String query = """
                SELECT p.name, p.price, p.id, p.description, b.name as brand, c.name as category, p.quantity, p.start_date, p.end_date, p.is_active 
                From products p
                join brands b on p.brand_id = b.id
                join categories c on p.category_id = c.id
                where p.id = :productID
                """;
        return get().withHandle(h ->
                h.createQuery(query)
                        .bind("productID", productID)
                        .mapToBean(Product.class)
                        .one()
        );
    }


    public List<ProductImage> getImagesByID(int productID) {
        String query = """
                Select pi.*
                from product_images pi
                join products p on pi.product_id = p.id
                WHERE pi.product_id = :productID
                """;
        return get().withHandle(h ->
                h.createQuery(query)
                        .bind("productID", productID)
                        .map((rs, ctx) -> {
                            ProductImage productImage = new ProductImage();
                            productImage.setUrl(rs.getString("img_url"));
                            productImage.setIsMain(rs.getInt("is_main"));
                            return productImage;
                        })
                        .list()
        );
    }

    public void updateProduct(Product product, List<ProductImage> images, int productID) {
        int brandID = getBrandIDByName(product.getBrand());
        int categoryID = getCategoryIDByName(product.getCategory());

        String updateProduct = """
                Update products
                Set name = :name, description = :description, brand_id = :brandID, category_id = :categoryID,
                 start_date = :startDate, end_date = :endDate, price = :price, quantity = :quantity
                Where id = :productID
                """;

        get().withHandle(h ->
                h.createUpdate(updateProduct)
                        .bind("productID", productID)
                        .bind("name", product.getName())
                        .bind("description", product.getDescription())
                        .bind("brandID", brandID)
                        .bind("categoryID", categoryID)
                        .bind("startDate", product.getStartDate())
                        .bind("endDate", product.getEndDate())
                        .bind("price", product.getPrice())
                        .bind("quantity", product.getQuantity())
                        .execute()
        );


        get().withHandle(h ->
                h.createUpdate("DELETE FROM product_images WHERE product_id = :productID")
                        .bind("productID", productID)
                        .execute()
        );


        String updateProductIMG = """
                INSERT INTO product_images(product_id, img_url, is_main)
                VALUES (:productID, :imgURL, :isMain)
                """;
        for (ProductImage image : images) {
            get().withHandle(h ->
                    h.createUpdate(updateProductIMG)
                            .bind("productID", productID)
                            .bind("imgURL", image.getUrl())
                            .bind("isMain", image.getIsMain())
                            .execute()
            );
        }

    }

    public boolean deleteProduct(int productID) {
        try {
            get().useTransaction(handle -> {
                handle.createUpdate("DELETE FROM product_images WHERE product_id = :productID")
                        .bind("productID", productID)
                        .execute();

                int rowsAffected = handle.createUpdate("DELETE FROM products WHERE id = :productID")
                        .bind("productID", productID)
                        .execute();


                if (rowsAffected == 0) {
                    throw new RuntimeException("Product not found with ID: " + productID);
                }
            });
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

//    public static void main(String[] args) {
//        var p = new ProductDAO().getProductByID(4);
//        //System.out.println(p.toString());
//        var vari = new ProductDAO().getVariantsByID(4);
//        //vari.forEach(System.out::println);
//        var img = new ProductDAO().getImagesByID(4);
//        img.forEach(System.out::println);
//    }
}
