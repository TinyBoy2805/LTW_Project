package dao;

import model.Voucher;

import java.util.List;

public class VoucherDAO extends BaseDao
{
    public List<Voucher> getVouchers(int page, int pageSize)
    {
        int offset = (page-1) * pageSize;
        String query = "select \n" +
                "v.id,\n" +
                "c.name as category_name,\n" +
                "v.code,\n" +
                "v.description,\n" +
                "v.discount_amount,\n" +
                "v.discount_percentage,\n" +
                "v.start_date,\n" +
                "v.end_date,\n" +
                "v.usage_limit,\n" +
                "v.current_amount,\n" +
                "v.min_order_value,\n" +
                "v.voucher_type\n" +
                "from vouchers v \n" +
                "join categories c on c.id = v.category_id\n"+
                "limit :limit offset :offset"
                ;

        return  get().withHandle(h->
                h.createQuery(query)
                        .bind("limit", pageSize)
                        .bind("offset", offset)
                        .mapToBean(Voucher.class)
                        .list()
        );
    }
}
