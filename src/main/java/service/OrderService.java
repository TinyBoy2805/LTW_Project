package service;

import dao.OrderDAO;
import model.orders.FilterRequest;
import model.orders.OrderCard;

import java.time.LocalDate;
import java.util.*;

import lombok.Getter;
import lombok.Setter;
import model.orders.PageInformation;

@Getter
@Setter
public class OrderService {

    private final OrderDAO orderDAO = new OrderDAO();
    private final int PAGE_SIZE = 8;
    public OrderService() {
    }

    public PageInformation<OrderCard> getOrders(int pageIndex){
        int totalOrders = this.orderDAO.countOrders();
        int totalPage = (totalOrders % PAGE_SIZE != 0) ? (totalOrders / PAGE_SIZE) + 1 : totalOrders / PAGE_SIZE;

        List<OrderCard> data = this.orderDAO.getOrders(pageIndex, PAGE_SIZE);

        PageInformation<OrderCard> infor = new PageInformation<>();
        infor.setData(data);
        infor.setPageIndex(pageIndex);
        infor.setPageSize(PAGE_SIZE);
        infor.setTotalItems(totalOrders);
        infor.setTotalPage(totalPage);

        return infor;
    }

    public PageInformation<OrderCard> searchOrder(String orderName, int pageIndex){
        int totalOrders = this.orderDAO.countSearchOrders(orderName);
        int totalPage = (totalOrders % PAGE_SIZE != 0) ? (totalOrders / PAGE_SIZE) + 1 : totalOrders / PAGE_SIZE;

        List<OrderCard> data = this.orderDAO.searchOrders(orderName, pageIndex, PAGE_SIZE);

        PageInformation<OrderCard> infor = new PageInformation<>();
        infor.setData(data);
        infor.setPageIndex(pageIndex);
        infor.setPageSize(PAGE_SIZE);
        infor.setTotalItems(totalOrders);
        infor.setTotalPage(totalPage);

        return infor;
    }

    public PageInformation<OrderCard> filterOrders(Map<String, Object> filterRaw, int pageIndex) {
        // lấy trạng thái trên filter
        String status = (filterRaw.get("status")) != null ? (String) filterRaw.get("status") : null;
        // lấy ngày đặt hàng
        String filterDate = (filterRaw.get("orderDate")) != null ? (String) filterRaw.get("orderDate") : null;
        LocalDate date = filterDate != null ? LocalDate.parse(filterDate) : null;
        // lấy khoảng tiền
        double from = Double.parseDouble((String) filterRaw.get("from"));
        double to = Double.parseDouble((String) filterRaw.get("to"));

        FilterRequest fr = new FilterRequest(status, date, from, to);

        int totalOrders = this.orderDAO.countFilterOrders(fr);
        int totalPage = (totalOrders % PAGE_SIZE != 0) ? (totalOrders / PAGE_SIZE) + 1 : totalOrders / PAGE_SIZE;

        List<OrderCard> data = this.orderDAO.filterOrder(fr, pageIndex, PAGE_SIZE);

        PageInformation<OrderCard> infor = new PageInformation<>();
        infor.setData(data);
        infor.setPageIndex(pageIndex);
        infor.setPageSize(PAGE_SIZE);
        infor.setTotalItems(totalOrders);
        infor.setTotalPage(totalPage);

        return infor;
    }



}
