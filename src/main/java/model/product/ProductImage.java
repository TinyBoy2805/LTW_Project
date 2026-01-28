package model.product;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.io.Serializable;
@Getter
@Setter
@ToString
public class ProductImage implements Serializable
{
    private int id;
    private int product_id;
    private String img_url;
    private boolean is_main;

    public ProductImage() {}

    public ProductImage(int id, int product_id, String img_url, boolean is_main)
    {
        this.id = id;
        this.product_id = product_id;
        this.img_url = img_url;
        this.is_main = is_main;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public String getImg_url() {
        return img_url;
    }

    public void setImg_url(String img_url) {
        this.img_url = img_url;
    }

    public boolean isIs_main() {
        return is_main;
    }

    public void setIs_main(boolean is_main) {
        this.is_main = is_main;
    }
}
