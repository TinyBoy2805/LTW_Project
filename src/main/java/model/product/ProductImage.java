package model.product;

import lombok.Setter;
import lombok.Getter;

@Setter
@Getter
public class ProductImage {
    private String url;
    private int isMain;

    public ProductImage() {}

    public ProductImage(String url, int isMain) {
        this.url = url;
        this.isMain = isMain;
    }

    @Override
    public String toString() {
        final StringBuilder sb = new StringBuilder("ProductImage{");
        sb.append("url='").append(url).append('\'');
        sb.append(", isMain=").append(isMain);
        sb.append('}');
        return sb.toString();
    }
}
