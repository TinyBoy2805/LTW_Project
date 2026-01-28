package model.product;

import lombok.Getter;
import lombok.Setter;
import lombok.Setter;

@Setter
@Getter
public class AdminProductCard {
    private int id;
    private String name;
    private double price;
    private int buy_count;
    private boolean is_active;
    private String img_url;
    private int quantity;

    public AdminProductCard() {}

    @Override
    public String toString() {
        final StringBuilder sb = new StringBuilder("AdminProductCard{");
        sb.append("id=").append(id);
        sb.append(", name='").append(name).append('\'');
        sb.append(", price=").append(price);
        sb.append(", buy_count=").append(buy_count);
        sb.append(", is_active=").append(is_active);
        sb.append(", img_url='").append(img_url).append('\'');
        sb.append(", quantity=").append(quantity);
        sb.append('}');
        return sb.toString();
    }
}
