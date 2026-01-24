package model.orders;

import java.time.LocalDateTime;
import lombok.Getter;
import lombok.Setter;
import model.Date;

@Getter
@Setter
public class OrderCard {
    private String order_code;
    private String name;
    private String url;
    private String order_status;
    private double total_price;
    private LocalDateTime created_at;
//    private Date created_att;

    public OrderCard() {};

    public OrderCard(String order_code, String name, String url, String order_status, double total_price, LocalDateTime created_at) {

        System.out.println("Call constructor here");
        this.order_code = order_code;
        this.name = name;
        this.url = url;
        this.order_status = order_status;
        this.total_price = total_price;
        this.created_at = created_at;
    }


    @Override
    public String toString() {
        final StringBuilder sb = new StringBuilder("OrderCard{");
        sb.append("order_code=").append(order_code);
        sb.append(", name='").append(name).append('\'');
        sb.append(", url='").append(url).append('\'');
        sb.append(", order_status=").append(order_status);
        sb.append(", total_price=").append(total_price);
        sb.append(", created_at=").append(created_at);
        sb.append('}');
        return sb.toString();
    }

//    public void setCreated_at(LocalDateTime created_at) {
//        this.created_att = new Date(
//                created_at.getDayOfMonth(),
//                created_at.getMonthValue(),
//                created_at.getYear()
//        );
//    }
}
