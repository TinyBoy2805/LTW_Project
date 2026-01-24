package model.orders;

public enum OrderStatus {
    PENDING("Chờ xác nhận"),
    SHIPPED("Đang giao hàng"),
    CONFIRMED("Đã xác nhận"),
    CANCELLED("Đã huỷ"),
    COMPLETED("Hoàn thành");

    private String status;

    OrderStatus(String status) {
        this.status = status;
    }

    public String getStatus() {
        return status;
    }
}
