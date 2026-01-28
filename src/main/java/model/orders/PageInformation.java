package model.orders;

import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
public class PageInformation<T>{
    private List<T> data; //danh sách sau khi query
    private int pageIndex; //số trang đang được hiển thị
    private int pageSize; //kích thước hiển thị 1 trang
    private int totalItems; //tổng số lượng của 1 query
    private int totalPage; //tổng số trang

    public PageInformation() {}

    public PageInformation(List<T> data, int pageIndex, int pageSize, int totalItems, int totalPage) {
        this.data = data;
        this.pageIndex = pageIndex;
        this.pageSize = pageSize;
        this.totalItems = totalItems;
        this.totalPage = totalPage;
    }

    @Override
    public String toString() {
        final StringBuilder sb = new StringBuilder("PageInformation{");
        sb.append("data=").append(data);
        sb.append(", pageIndex=").append(pageIndex);
        sb.append(", pageSize=").append(pageSize);
        sb.append(", totalItems=").append(totalItems);
        sb.append(", totalPage=").append(totalPage);
        sb.append('}');
        return sb.toString();
    }
}
