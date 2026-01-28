package model.product;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class FilterRequest {
    private String category;
    private String status;
    private int quantity;

    public FilterRequest() {}

    public FilterRequest(String category, String status, int quantity) {
        this.category = category;
        this.status = status;
        this.quantity = quantity;
    }

    @Override
    public String toString() {
        final StringBuilder sb = new StringBuilder("FilterRequest{");
        sb.append("category='").append(category).append('\'');
        sb.append(", status='").append(status).append('\'');
        sb.append(", quantity=").append(quantity);
        sb.append('}');
        return sb.toString();
    }
}
