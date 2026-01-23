package model.product;

public enum Unit {
    BOX(12),
    PACK(4),
    BOTTLE(1),
    BARREL(24);

    private int quantity;

    Unit(int quantity) {
        this.quantity = quantity;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
}
