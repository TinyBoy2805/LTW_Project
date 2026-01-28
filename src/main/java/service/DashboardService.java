package service;

import dao.DashboardDao;
import model.MonthlyRevenue;
import model.TopInventory;
import model.product.Product;

import java.util.List;

public class DashboardService {
    private DashboardDao dashboardDao = new DashboardDao();

    public List<TopInventory> getTopInventory() {
        return dashboardDao.getTopInventory();
    }

    public List<MonthlyRevenue> getMonthlyRevenue(int year) {
        return dashboardDao.getMonthlyRevenue(year);
    }

    public List<Product> getTopProducts() {
        return dashboardDao.getTopProducts();
    }

    public long getYearRevenue() {
        return dashboardDao.getYearRevenue();
    }

    public long getMonthRevenue() {
        return dashboardDao.getMonthRevenue();
    }

    public long getTodayRevenue() {
        return dashboardDao.getTodayRevenue();
    }


}
