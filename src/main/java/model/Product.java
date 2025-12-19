package model;

import java.io.Serializable;
import java.time.LocalDate;

public class Product implements Serializable {
    private int id;
    private int productId;  // Thêm field này cho product_images.product_id
    private String name;
    private String description;
    private int price;
    private String url;  // img_url từ product_images
    private String brand;
    private String category;
    private int buyCount;
    private int quantity;
    private LocalDate startDate;
    private LocalDate endDate;

    // Constructor rỗng (BẮT BUỘC cho JDBI)
    public Product() {
    }

    // Constructor đầy đủ
    public Product(int id, int productId, String name, String description, int price, String url, 
                   String brand, String category, int buyCount, int quantity,
                   LocalDate startDate, LocalDate endDate) {
        this.id = id;
        this.productId = productId;
        this.name = name;
        this.description = description;
        this.price = price;
        this.url = url;
        this.brand = brand;
        this.category = category;
        this.buyCount = buyCount;
        this.quantity = quantity;
        this.startDate = startDate;
        this.endDate = endDate;
    }

    // Getters
    public int getId() {
        return id;
    }

    public int getProductId() {
        return productId;
    }

    public String getName() {
        return name;
    }

    public String getDescription() {
        return description;
    }

    public int getPrice() {
        return price;
    }

    public String getUrl() {
        return url;
    }

    public String getBrand() {
        return brand;
    }

    public String getCategory() {
        return category;
    }

    public int getBuyCount() {
        return buyCount;
    }

    public int getQuantity() {
        return quantity;
    }

    public LocalDate getStartDate() {
        return startDate;
    }

    public LocalDate getEndDate() {
        return endDate;
    }

    // Setters (BẮT BUỘC cho JDBI)
    public void setId(int id) {
        this.id = id;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public void setBuyCount(int buyCount) {
        this.buyCount = buyCount;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public void setStartDate(LocalDate startDate) {
        this.startDate = startDate;
    }

    public void setEndDate(LocalDate endDate) {
        this.endDate = endDate;
    }

    @Override
    public String toString() {
        return "Product{" +
                "id=" + id +
                ", productId=" + productId +
                ", name='" + name + '\'' +
                ", price=" + price +
                ", brand='" + brand + '\'' +
                ", category='" + category + '\'' +
                '}';
    }
}
