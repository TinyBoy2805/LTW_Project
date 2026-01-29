package service;

import dao.NotificationDAO;
import dao.OrderDAO;
import dao.ProductDAO;
import model.cart.Cart;
import model.cart.CartItem;
import model.order.Order;
import model.order.OrderItem;
import model.orders.CustomerInfo;
import model.orders.FilterRequest;
import model.orders.OrderCard;
import model.orders.PageInformation;
import java.time.LocalDate;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class OrderService {

    private final OrderDAO orderDAO;
    private final ProductDAO productDAO;
    private final NotificationDAO notificationDAO;
    private final int PAGE_SIZE = 8;

    public OrderService() {
        this.orderDAO = new OrderDAO();
        this.productDAO = new ProductDAO();
        this.notificationDAO = new NotificationDAO();
    }

    public PageInformation<OrderCard> getOrders(int pageIndex){
        int totalOrders = this.orderDAO.countOrders();
        int totalPage = (totalOrders % PAGE_SIZE != 0) ? (totalOrders / PAGE_SIZE) + 1 : totalOrders / PAGE_SIZE;

        List<OrderCard> data = this.orderDAO.getOrders(pageIndex, PAGE_SIZE);

        PageInformation<OrderCard> infor = new PageInformation<>();
        infor.setData(data);
        infor.setPageIndex(pageIndex);
        infor.setPageSize(PAGE_SIZE);
        infor.setTotalItems(totalOrders);
        infor.setTotalPage(totalPage);

        return infor;
    }

    public PageInformation<OrderCard> searchOrder(String orderName, int pageIndex){
        int totalOrders = this.orderDAO.countSearchOrders(orderName);
        int totalPage = (totalOrders % PAGE_SIZE != 0) ? (totalOrders / PAGE_SIZE) + 1 : totalOrders / PAGE_SIZE;

        List<OrderCard> data = this.orderDAO.searchOrders(orderName, pageIndex, PAGE_SIZE);

        PageInformation<OrderCard> infor = new PageInformation<>();
        infor.setData(data);
        infor.setPageIndex(pageIndex);
        infor.setPageSize(PAGE_SIZE);
        infor.setTotalItems(totalOrders);
        infor.setTotalPage(totalPage);

        return infor;
    }

    public PageInformation<OrderCard> filterOrders(Map<String, Object> filterRaw, int pageIndex) {
        // lấy trạng thái trên filter
        String status = (filterRaw.get("status")) != null ? (String) filterRaw.get("status") : null;
        // lấy ngày đặt hàng
        String filterDate = (filterRaw.get("orderDate")) != null ? (String) filterRaw.get("orderDate") : null;
        LocalDate date = filterDate != null ? LocalDate.parse(filterDate) : null;
        // lấy khoảng tiền
        double from = Double.parseDouble((String) filterRaw.get("from"));
        double to = Double.parseDouble((String) filterRaw.get("to"));

        FilterRequest fr = new FilterRequest(status, date, from, to);

        int totalOrders = this.orderDAO.countFilterOrders(fr);
        int totalPage = (totalOrders % PAGE_SIZE != 0) ? (totalOrders / PAGE_SIZE) + 1 : totalOrders / PAGE_SIZE;

        List<OrderCard> data = this.orderDAO.filterOrder(fr, pageIndex, PAGE_SIZE);

        PageInformation<OrderCard> infor = new PageInformation<>();
        infor.setData(data);
        infor.setPageIndex(pageIndex);
        infor.setPageSize(PAGE_SIZE);
        infor.setTotalItems(totalOrders);
        infor.setTotalPage(totalPage);

        return infor;
    }

    // Method from first version of OrderService
    public List<OrderItem> getOrderItemByID(String orderID){
        return this.orderDAO.getOrderItemByID(orderID);
    }

    public CustomerInfo getCustomerInfoByOrder(String orderID){
        return this.orderDAO.getCustomerInfoByOrder(orderID);
    }

    public Order getTotalPriceByOrder(String orderID){
        return this.orderDAO.getTotalPriceByOrder(orderID);
    }

    // Methods from second version of OrderService
    public int placeOrder(int userId, int addressId, Cart cart, double shippingFee, double discountAmount) {
        System.out.println("OrderService.placeOrder called");
        // 1. Create Order object
        Order order = new Order();
        order.setUserId(userId);
        order.setAddressId(addressId);
        String orderCode = "DH" + UUID.randomUUID().toString().substring(0, 8).toUpperCase();
        order.setOrderCode(orderCode);
        order.setTotalPrice(cart.getTotalAmount());
        order.setShippingFee(shippingFee);
        order.setDiscountAmount(discountAmount);
        order.setFinalAmount(cart.getTotalAmount() + shippingFee - discountAmount);
        order.setPaymentStatus("PAID");
        order.setOrderStatus("DELIVERED");

        // 2. Insert Order into DB
        int orderId = orderDAO.createOrder(order);

        // 3. Create Order Items and Update Inventory
        for (CartItem cartItem : cart.getCart().values()) {
            OrderItem orderItem = new OrderItem();
            orderItem.setOrderId(orderId);
            orderItem.setProductId(cartItem.getProduct().getId());
            orderItem.setQuantity(cartItem.getQuantity());
            orderItem.setPriceAtPurchase(cartItem.getPrice());

            orderDAO.createOrderItem(orderItem);

            // Update quantity and buy count
            productDAO.updateQuantity(cartItem.getProduct().getId(), cartItem.getQuantity());
            productDAO.increaseBuyCount(cartItem.getProduct().getId(), cartItem.getQuantity());
        }

        // 4. Create Notification
        String title = "Đặt hàng thành công!";
        String message = "Đơn hàng #" + orderCode + " của bạn đã được thanh toán và giao hàng thành công.";
        notificationDAO.createNotification(userId, title, message);

        return orderId;
    }

    public List<Order> getOrdersByUser(int userId) {
        List<Order> orders = orderDAO.getOrdersByUserId(userId);
        for (Order order : orders) {
            order.setItems(orderDAO.getOrderItemsByOrderId(order.getId()));
        }
        return orders;
    }

    public List<OrderItem> getOrderItems(int orderId) {
        return orderDAO.getOrderItemsByOrderId(orderId);
    }

    public Order getOrderById(int orderId) {
        Order order = orderDAO.getOrderById(orderId);
        if (order != null) {
            order.setItems(orderDAO.getOrderItemsByOrderId(orderId));
        }
        return order;
    }

    public boolean hasUserPurchasedProduct(int userId, int productId) {
        return orderDAO.hasOrderedProduct(userId, productId);
    }
}
