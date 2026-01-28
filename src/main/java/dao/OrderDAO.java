package dao;

import model.orders.*;

import java.sql.Timestamp;
import model.order.Order;
import model.order.OrderItem;
import java.util.List;

public class OrderDAO extends BaseDao {

    public int countOrders() {
        String query = """
                SELECT Count(DISTINCT id) from orders
                """;
        return get().withHandle(h ->
                h.createQuery(query).mapTo(int.class).one()
        );
    }

    public List<OrderCard> getOrders(int pageIndex, int pageSize) {

        String query = """
                SELECT O.order_code, PI.img_url, P.name, O.order_status, O.total_price, O.created_at, O.id
                FROM ORDERS AS O JOIN order_items AS OI ON
                O.id = OI.order_id
                JOIN products AS P ON
                OI.product_id = P.id
                JOIN product_images AS PI ON
                P.id = PI.product_id AND PI.is_main = 1
                GROUP BY O.order_code
                ORDER BY O.created_at DESC
                limit :limit offset :offset
                """;

        return get()
                .withHandle(h ->
                        h.createQuery(query)
                                .bind("limit", pageSize)
                                .bind("offset", (pageIndex - 1) * pageSize)
                                .map((rs, ctx) -> {
                                    OrderCard orderCard = new OrderCard();

                                    orderCard.setOrder_code(rs.getString("order_code"));
                                    orderCard.setName(rs.getString("name"));
                                    orderCard.setUrl(rs.getString("img_url"));
                                    orderCard.setTotal_price(rs.getDouble("total_price"));
                                    orderCard.setOrder_status(rs.getString("order_status"));
                                    Timestamp ts = rs.getTimestamp("created_at");
                                    orderCard.setCreated_at(ts.toLocalDateTime());
                                    orderCard.setOrderID(rs.getInt("id"));


                                    return orderCard;
                                })
                                .list()
                );
    }

    public List<OrderCard> searchOrders(String orderName, int pageIndex, int pageSize) {
        String query = """
                SELECT O.order_code, PI.img_url, P.name, O.order_status, O.total_price, O.created_at, O.id
                FROM ORDERS AS O JOIN order_items AS OI ON
                O.id = OI.order_id
                JOIN products AS P ON
                OI.product_id = P.id
                JOIN product_images AS PI ON
                P.id = PI.product_id AND PI.is_main = 1
                WHERE P.name like :name
                GROUP BY O.order_code
                ORDER BY O.created_at DESC
                limit :limit offset :offset
                """;
        var data = get().withHandle(h ->
                h.createQuery(query)
                        .bind("name", "%" + orderName + "%")
                        .bind("limit", pageSize)
                        .bind("offset", (pageIndex - 1) * pageSize)
                        .map((rs, ctx) -> {
                            OrderCard orderCard = new OrderCard();

                            orderCard.setOrder_code(rs.getString("O.order_code"));
                            orderCard.setName(rs.getString("P.name"));
                            orderCard.setUrl(rs.getString("PI.img_url"));
                            orderCard.setTotal_price(rs.getDouble("O.total_price"));
                            orderCard.setOrder_status(rs.getString("order_status"));

                            Timestamp ts = rs.getTimestamp("created_at");
                            orderCard.setCreated_at(ts.toLocalDateTime());

                            orderCard.setOrderID(rs.getInt("id"));

                            return orderCard;
                        })
                        .list());
        return data;
    }

    public int countSearchOrders(String orderName) {
        String sql = """
                    SELECT COUNT(DISTINCT O.id)
                    FROM ORDERS O
                    JOIN order_items OI ON O.id = OI.order_id
                    JOIN products P ON OI.product_id = P.id
                    WHERE P.name LIKE :name
                """;

        return get().withHandle(h ->
                h.createQuery(sql)
                        .bind("name", "%" + orderName + "%")
                        .mapTo(int.class)
                        .one()
        );
    }

    public List<OrderCard> filterOrder(FilterRequest filter, int pageIndex, int pageSize) {
        StringBuilder sql = new StringBuilder("""
                SELECT O.order_code, PI.img_url, P.name, O.order_status, O.total_price, O.created_at, O.id
                FROM ORDERS AS O 
                JOIN order_items AS OI ON O.id = OI.order_id
                JOIN products AS P ON OI.product_id = P.id
                JOIN product_images AS PI ON P.id = PI.product_id AND PI.is_main = 1
                WHERE 1 = 1
                """);
        if (filter.getStatus() != null) {
            sql.append(" AND O.order_status = :status");
        }
        if (filter.getOrderDate() != null) {
            sql.append(" AND DATE(O.created_at) = :orderDate");
        }
        if (filter.getFrom() > 0) {
            sql.append(" AND O.total_price >= :from");
        }
        if (filter.getTo() > 0) {
            sql.append(" AND O.total_price <= :to");
        }
        sql.append(" GROUP BY O.order_code ORDER BY O.created_at DESC limit :limit offset :offset");
        return get().withHandle(h -> {
            var query = h.createQuery(sql.toString());
            if (filter.getStatus() != null) {
                query.bind("status", filter.getStatus());
            }

            if (filter.getOrderDate() != null) {
                query.bind("orderDate", filter.getOrderDate());
            }

            if (filter.getFrom() > 0) {
                query.bind("from", filter.getFrom());
            }

            if (filter.getTo() > 0) {
                query.bind("to", filter.getTo());
            }

            query.bind("limit", pageSize);

            query.bind("offset", (pageIndex - 1) * pageSize);

            return query.map((rs, ctx) -> {
                        OrderCard orderCard = new OrderCard();

                        orderCard.setOrder_code(rs.getString("O.order_code"));
                        orderCard.setName(rs.getString("P.name"));
                        orderCard.setUrl(rs.getString("PI.img_url"));
                        orderCard.setTotal_price(rs.getDouble("O.total_price"));
                        orderCard.setOrder_status(rs.getString("order_status"));

                        Timestamp ts = rs.getTimestamp("created_at");
                        orderCard.setCreated_at(ts.toLocalDateTime());

                        orderCard.setOrderID(rs.getInt("id"));

                        return orderCard;
                    })
                    .list();
        });

    }

    public int countFilterOrders(FilterRequest f) {
        StringBuilder sql = new StringBuilder("""
                    SELECT COUNT(DISTINCT O.id)
                    FROM ORDERS O
                    JOIN order_items OI ON O.id = OI.order_id
                    JOIN products P ON OI.product_id = P.id
                    WHERE 1=1
                """);

        if (f.getStatus() != null)
            sql.append(" AND O.order_status = :status");

        if (f.getOrderDate() != null)
            sql.append(" AND DATE(O.created_at) = :orderDate");

        if (f.getFrom() > 0)
            sql.append(" AND O.total_price >= :from");

        if (f.getTo() > 0)
            sql.append(" AND O.total_price <= :to");

        return get().withHandle(h -> {
            var q = h.createQuery(sql.toString());
            if (f.getStatus() != null) q.bind("status", f.getStatus());
            if (f.getOrderDate() != null) q.bind("orderDate", f.getOrderDate());
            if (f.getFrom() > 0) q.bind("from", f.getFrom());
            if (f.getTo() > 0) q.bind("to", f.getTo());
            return q.mapTo(int.class).one();
        });
    }

    public List<OrderItem> getOrderItemByID(String orderID) {
        String query = """
                SELECT oi.quantity, oi.price_at_purchase, 
                p.name, pi.img_url, o.order_status, o.order_code
                from order_items oi
                JOIN products p
                on p.id = oi.product_id
                JOIN product_images pi
                ON pi.product_id = p.id
                JOIN orders o
                on o.id = oi.order_id
                WHERE oi.order_id = :id AND pi.is_main = 1
                """;
        return get().withHandle(h ->
                h.createQuery(query)
                        .bind("id", Integer.parseInt(orderID))
                        .map((rs, ctx) -> {
                            OrderItem orderItem = new OrderItem();
                            orderItem.setOrderCode(rs.getString("order_code"));
                            orderItem.setName(rs.getString("name"));
                            orderItem.setImg_url(rs.getString("img_url"));
                            orderItem.setQuantity(rs.getInt("quantity"));
                            orderItem.setPriceAtPurchase(rs.getDouble("price_at_purchase"));
                            orderItem.setOrderStatus(rs.getString("order_status"));
                            return orderItem;
                        })
                        .list()
        );
    }

    public CustomerInfo getCustomerInfoByOrder(String orderID) {
        String query = """
                SELECT u.name, u.email, u.phone_number, CONCAT(a.house_number, ', ', a.road, ', ', a.hamlet, ', ',
                 a.ward, ', ', a.district, ', ', a.city) as address, o.payment_status, o.created_at
                FROM users u
                JOIN orders o
                on u.id = o.user_id
                join adresses a
                ON u.id = a.user_id
                WHERE o.id = :id
                """;
        return get().withHandle(h ->
                h.createQuery(query)
                        .bind("id", Integer.parseInt(orderID))
                        .map((rs, ctx) -> {
                            CustomerInfo info = new CustomerInfo();
                            info.setName(rs.getString("name"));
                            info.setEmail(rs.getString("email"));
                            info.setAddress(rs.getString("address"));
                            info.setPhoneNumber(rs.getString("phone_number"));
                            String paymentStatus = rs.getString("payment_status");
                            info.setPaymentMethod(Payment.valueOf(paymentStatus.trim().toUpperCase()).getStatus());
                            Timestamp ts = rs.getTimestamp("created_at");
                            info.setOrderCreateAt(ts.toLocalDateTime());
                            return info;
                        })
                        .one()
        );
    }

    public Order getTotalPriceByOrder(String orderID){
        String query = """
                SELECT o.total_price, o.shipping_fee, o.discount_amount, o.final_amount
                From orders o
                where o.id = :id
                GROUP BY o.order_code
                """;
        return get().withHandle(h ->
                h.createQuery(query)
                        .bind("id", Integer.parseInt(orderID))
                        .mapToBean(Order.class)
                        .one()
                );
    }

    public int createOrder(Order order) {
        String sql = """
            INSERT INTO orders (user_id, address_id, order_code, total_price, shipping_fee, discount_amount, final_amount, payment_status, order_status)
            VALUES (:userId, :addressId, :orderCode, :totalPrice, :shippingFee, :discountAmount, :finalAmount, :paymentStatus, :orderStatus)
        """;
        return get().withHandle(handle ->
            handle.createUpdate(sql)
                .bindBean(order)
                .executeAndReturnGeneratedKeys("id")
                .mapTo(Integer.class)
                .one()
        );
    }

    public void createOrderItem(OrderItem item) {
        String sql = """
            INSERT INTO order_items (order_id, product_id, quantity, price_at_purchase)
            VALUES (:orderId, :productId, :quantity, :priceAtPurchase)
        """;
        get().useHandle(handle ->
            handle.createUpdate(sql)
                .bindBean(item)
                .execute()
        );
    }

    public List<Order> getOrdersByUserId(int userId) {
        String sql = "SELECT * FROM orders WHERE user_id = :userId ORDER BY created_at DESC";
        return get().withHandle(handle ->
            handle.createQuery(sql)
                .bind("userId", userId)
                .mapToBean(Order.class)
                .list()
        );
    }

    public List<OrderItem> getOrderItemsByOrderId(int orderId) {
        String sql = """
            SELECT oi.*, p.name as productName, pi.img_url as productUrl
            FROM order_items oi
            JOIN products p ON oi.product_id = p.id
            LEFT JOIN product_images pi ON p.id = pi.product_id AND pi.is_main = 1
            WHERE oi.order_id = :orderId
        """;
        return get().withHandle(handle ->
            handle.createQuery(sql)
                .bind("orderId", orderId)
                .mapToBean(OrderItem.class)
                .list()
        );
    }

    public boolean hasOrderedProduct(int userId, int productId) {
        String sql = """
            SELECT COUNT(*)
            FROM orders o
            JOIN order_items oi ON o.id = oi.order_id
            WHERE o.user_id = :userId
            AND oi.product_id = :productId
            AND o.order_status = 'DELIVERED'
        """;
        return get().withHandle(handle ->
            handle.createQuery(sql)
                .bind("userId", userId)
                .bind("productId", productId)
                .mapTo(Integer.class)
                .one() > 0
        );
    }

    public Order getOrderById(int orderId) {
        String sql = "SELECT * FROM orders WHERE id = :orderId";
        return get().withHandle(handle ->
            handle.createQuery(sql)
                .bind("orderId", orderId)
                .mapToBean(Order.class)
                .findOne()
                .orElse(null)
        );
    }
}
