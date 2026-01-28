package model.order;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import java.io.Serializable;

@Getter
@Setter
@ToString
public class OrderItem implements Serializable {
    private int id;
    private int orderId;
    private int productId;
    private int quantity;
    private double priceAtPurchase;

    // Optional: for rendering
    private String productName;
    private String productUrl;

    public OrderItem() {}
}
