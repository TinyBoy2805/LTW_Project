package model.orders;

import java.time.LocalDateTime;
import lombok.Getter;
import lombok.Setter;
import model.Date;

@Getter
@Setter
public class OrderCard {
    private int orderID;
    private String order_code;
    private String name;
    private String url;
    private String order_status;
    private double total_price;
    private LocalDateTime created_at;
//    private Date created_att;

    public OrderCard() {};

    @Override
    public String toString() {
        final StringBuilder sb = new StringBuilder("OrderCard{");
        sb.append("orderID='").append(orderID).append('\'');
        sb.append(", order_code='").append(order_code).append('\'');
        sb.append(", name='").append(name).append('\'');
        sb.append(", url='").append(url).append('\'');
        sb.append(", order_status='").append(order_status).append('\'');
        sb.append(", total_price=").append(total_price);
        sb.append(", created_at=").append(created_at);
        sb.append('}');
        return sb.toString();
    }
}
