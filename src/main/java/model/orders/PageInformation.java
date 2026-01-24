package model.orders;

import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
public class PageInformation<T>{
    private List<T> data; //danh sách các đơn hàng sau khi query
    private int pageIndex; //số trang đang được hiển thị
    private int pageSize; //kích thước hiển thị 1 trang = 8 sản phẩm
    private int totalOrders; //tổng đơn hàng của 1 query
    private int totalPage; //tổng số trang

    public PageInformation() {}

    public PageInformation(List<T> data, int pageIndex, int pageSize, int totalOrders, int totalPage) {
        this.data = data;
        this.pageIndex = pageIndex;
        this.pageSize = pageSize;
        this.totalOrders = totalOrders;
        this.totalPage = totalPage;
    }
}
