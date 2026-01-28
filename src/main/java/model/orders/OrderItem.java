package model.orders;

import lombok.Setter;
import lombok.Getter;
import model.product.Product;

import java.util.List;

@Getter
@Setter
public class OrderItem {

    private String orderCode;
    private String name;
    private String img_url;
    private int quantity;
    private double priceAtPurchase;
    private String unit;
    private String orderStatus;

    public OrderItem() {}

    @Override
    public String toString() {
        final StringBuilder sb = new StringBuilder("OrderItem{");
        sb.append("orderCode='").append(orderCode).append('\'');
        sb.append(", name='").append(name).append('\'');
        sb.append(", img_url='").append(img_url).append('\'');
        sb.append(", quantity=").append(quantity);
        sb.append(", priceAtPurchase=").append(priceAtPurchase);
        sb.append(", unit='").append(unit).append('\'');
        sb.append(", orderStatus=").append(orderStatus);
        sb.append('}');
        return sb.toString();
    }
}
