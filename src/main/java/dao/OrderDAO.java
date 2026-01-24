package dao;

import model.Date;
import model.orders.FilterRequest;
import model.orders.OrderCard;
import model.orders.OrderStatus;

import java.sql.PreparedStatement;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

public class OrderDAO extends BaseDao {

    public int countOrders(){
        String query = """
                SELECT Count(DISTINCT id) from orders
                """;
        return get().withHandle(h ->
            h.createQuery(query).mapTo(int.class).one()
        );
    }

    public List<OrderCard> getOrders(int pageIndex, int pageSize) {

        String query = """
                SELECT O.order_code, PI.img_url, P.name, O.order_status, O.total_price, O.created_at\s
                FROM ORDERS AS O JOIN order_items AS OI ON
                O.id = OI.order_id
                JOIN product_variants AS PV ON
                OI.product_variant_id = PV.id
                JOIN products AS P ON
                PV.product_id = P.id
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

                                    orderCard.setOrder_code(rs.getString("O.order_code"));
                                    orderCard.setName(rs.getString("P.name"));
                                    orderCard.setUrl(rs.getString("PI.img_url"));
                                    orderCard.setTotal_price(rs.getDouble("O.total_price"));
                                    String status = rs.getString("order_status");
                                    orderCard.setOrder_status(OrderStatus.valueOf(status.trim().toUpperCase()).getStatus());
                                    Timestamp ts = rs.getTimestamp("created_at");
                                    orderCard.setCreated_at(ts.toLocalDateTime());


                                    return orderCard;
                                })
                                .list()
                );
    }

    public List<OrderCard> searchOrders(String orderName, int pageIndex, int pageSize) {
        String query = """
                SELECT O.order_code, PI.img_url, P.name, O.order_status, O.total_price, O.created_at
                FROM ORDERS AS O JOIN order_items AS OI ON
                O.id = OI.order_id
                JOIN product_variants AS PV ON
                OI.product_variant_id = PV.id
                JOIN products AS P ON
                PV.product_id = P.id
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
                            String status = rs.getString("order_status");
                            orderCard.setOrder_status(OrderStatus.valueOf(status.trim().toUpperCase()).getStatus());

                            Timestamp ts = rs.getTimestamp("created_at");
                            orderCard.setCreated_at(ts.toLocalDateTime());

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
        JOIN product_variants PV ON OI.product_variant_id = PV.id
        JOIN products P ON PV.product_id = P.id
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
                SELECT O.order_code, PI.img_url, P.name, O.order_status, O.total_price, O.created_at 
                FROM ORDERS AS O 
                JOIN order_items AS OI ON O.id = OI.order_id
                JOIN product_variants AS PV ON OI.product_variant_id = PV.id
                JOIN products AS P ON PV.product_id = P.id
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
                        String status = rs.getString("order_status");
                        orderCard.setOrder_status(OrderStatus.valueOf(status.trim().toUpperCase()).getStatus());

                        Timestamp ts = rs.getTimestamp("created_at");
                        orderCard.setCreated_at(ts.toLocalDateTime());


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
        JOIN product_variants PV ON OI.product_variant_id = PV.id
        JOIN products P ON PV.product_id = P.id
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

//    public static void main(String[] args) {
//        LocalDate ld = null;
//        FilterRequest fr = new FilterRequest(null, ld, 100000, 1000000);
//        List<OrderCard> orders = new OrderDAO().filterOrder(fr);
//        orders.forEach(System.out::println);
//    }

//    public static void main(String[] args) {
//        var data = new OrderDAO().searchOrders("an dam", 0, 8);
//        data.forEach(System.out::println);
//        int order = new OrderDAO().countSearchOrders("an dam");
//        System.out.println(order);
//    }
}
