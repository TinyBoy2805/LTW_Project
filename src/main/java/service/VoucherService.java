package service;

import dao.VoucherDAO;
import model.Voucher;

import java.util.List;

public class VoucherService
{
    private VoucherDAO voucherDAO;

    public VoucherService()
    {
        this.voucherDAO = new VoucherDAO();
    }

    public List<Voucher> getVouchers(int page, int pageSize)
    {
        return this.voucherDAO.getVouchers(page, pageSize);
    }

}
