package model.orders;

import lombok.Getter;
import lombok.Setter;

import java.time.LocalDate;

@Getter
@Setter
public class FilterRequest {
    private String status;
    private LocalDate orderDate;
    private double from;
    private double to;

    public FilterRequest(){}

    public FilterRequest(String status, LocalDate orderDate, double from, double to) {
        this.status = status;
        this.orderDate = orderDate;
        this.from = from;
        this.to = to;
    }

    @Override
    public String toString() {
        final StringBuilder sb = new StringBuilder("FilterRequest{");
        sb.append("status='").append(status).append('\'');
        sb.append(", orderDate=").append(orderDate);
        sb.append(", from=").append(from);
        sb.append(", to=").append(to);
        sb.append('}');
        return sb.toString();
    }
}
