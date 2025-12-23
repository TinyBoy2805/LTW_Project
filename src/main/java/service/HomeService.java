package service;

import dao.HomeDAO;
import model.Voucher;

import java.util.List;

public class HomeService
{
    private HomeDAO homeDao = new HomeDAO();

    public int getAmountUsers()
    {
        return this.homeDao.getAmountUsers();
    }

    public int getAvgRating()
    {
        return this.homeDao.getAvgRating();
    }

    public List<String> getCategories()
    {
        return this.homeDao.getCategories();
    }

    public List<Voucher> getVouchers()
    {
        return this.homeDao.getVouchers();
    }



}
