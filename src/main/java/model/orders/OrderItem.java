package model.orders;

import lombok.Setter;
import lombok.Getter;
import model.product.Product;

import java.util.List;

@Getter
@Setter
public class OrderItem {
    /**
     * id, order_id, product_variant_id, quantity, price_at_purchase
     */

    private int id;
    private int orderId;
    private int productVariantId;
    private int quantity;
    private double priceAtPurchase;
    private Product productList;

    public OrderItem() {}


}
