package model.product;

import lombok.Getter;
import lombok.Setter;


@Getter
@Setter
public class ProductVariant {

    private int id;
    private int productId;
    private Unit unit;
    private String unitValue;
    private double price;
    private int stock;
    private String sku;
    private boolean isActive;

    public ProductVariant() {}

    public ProductVariant(int id, int productId, Unit unit, String unitValue, double price, int stock, String sku, boolean isActive) {
        this.id = id;
        this.productId = productId;
        this.unit = unit;
        this.unitValue = unitValue;
        this.price = price;
        this.stock = stock;
        this.sku = sku;
        this.isActive = isActive;
    }
}
