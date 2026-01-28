package model.order;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import java.io.Serializable;
import java.sql.Timestamp;
import java.util.List;

@Getter
@Setter
@ToString
public class Order implements Serializable {
    private int id;
    private int userId;
    private int addressId;
    private String orderCode;
    private double totalPrice;
    private double shippingFee;
    private double discountAmount;
    private double finalAmount;
    private String paymentStatus;
    private String orderStatus;
    private Timestamp createdAt;
    private List<OrderItem> items;

    public Order() {}
}
