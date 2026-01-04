package model.cart;

import model.product.Product;

import java.util.HashMap;
import java.util.Map;

public class Cart
{
    private HashMap<Integer, CartItem> cart;

    public Cart()
    {
        this.cart = new HashMap<>();
    }


    public void addItem(Product item, int quantity)
    {
        if(quantity <= 0) quantity = 1;
        if(item == null) return;

        if(!this.cart.containsKey(item.getId()))
        {
            this.cart.put(item.getId(), new CartItem(item, quantity, item.getPrice()));
        }else
        {
            CartItem ci = this.cart.get(item.getId());
            ci.updateQuantity(quantity);
            this.cart.put(item.getId(), ci);
        }
    }


    public boolean deleteItem(int id)
    {
        if(!this.cart.containsKey(id)) return false;
        this.cart.remove(this.cart.get(id));
        return true;
    }


    public void deleteAllItem()
    {
        this.cart.clear();
    }


    public double getTotalCartPrice()
    {
        double price = 0;
        for(Map.Entry<Integer, CartItem> entry: this.cart.entrySet())
        {
            CartItem ci = entry.getValue();
            price += ci.getTotalPrice();
        }
        return price;
    }



    public void updateCartItem()
    {

    }




}
