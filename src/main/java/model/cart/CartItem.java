package model.cart;

import model.product.Product;

import java.io.Serializable;

public class CartItem implements Serializable
{
    private Product product;
    private int quantity;
    private double price;

    public CartItem(Product product, int quantity, double price)
    {
        this.product = product;
        this.quantity = quantity;
        this.price = price;
    }



    public void updateQuantity(int newQuantity)
    {
        this.quantity += newQuantity;
    }

    public void decreaseQuantity()
    {
        this.quantity--;
    }
    public void increaseQuantity()
    {
        this.quantity++;
    }



    public double getTotalPrice()
    {
        return this.quantity * this.price;
    }



    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }




}
