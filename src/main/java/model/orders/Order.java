package model.orders;

import model.Date;
import model.product.Product;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
public class Order {

    /**
     * user_id, address_id, order_code, total_price, shipping_fee, discount_amount, final_amount, payment_status, order_status, created_at
     */

    private Product products;
    private int userID;
    private int addressID;
    private String orderCode;
    private double totalPrice;
    private double shippingFee;
    private double discountAmount;
    private double finalAmount;
    private Payment paymentStatus;
    private OrderStatus orderStatus;
    private Date createdAt;
    private List<OrderItem> orderItems;

    public Order() {

    }

    public Order(Product products, int userID, int addressID, String orderCode, double totalPrice, double shippingFee, double discountAmount, double finalAmount, Payment paymentStatus, OrderStatus orderStatus, Date createdAt) {
        this.products = products;
        this.userID = userID;
        this.addressID = addressID;
        this.orderCode = orderCode;
        this.totalPrice = totalPrice;
        this.shippingFee = shippingFee;
        this.discountAmount = discountAmount;
        this.finalAmount = finalAmount;
        this.paymentStatus = paymentStatus;
        this.orderStatus = orderStatus;
        this.createdAt = createdAt;
    }
}
