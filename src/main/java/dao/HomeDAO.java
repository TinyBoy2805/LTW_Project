package dao;

import model.Voucher;

import java.util.List;

public class HomeDAO extends BaseDao
{
    public int getAmountUsers()
    {
        String query = "SELECT COUNT(*) FROM users WHERE role = 'customer'";

        return get().withHandle(h->
                h.createQuery(query)
                        .mapTo(Integer.class)
                        .one()
                );
    }


    public int getAvgRating()
    {
        String query = "select avg(rating) as avg_rating from store_reviews";

        return get().withHandle(h->
                h.createQuery(query)
                        .mapTo(Integer.class)
                        .one()
        );
    }

    public List<String> getCategories()
    {
        String query = "select name from categories";

        return get().withHandle(h->
                h.createQuery(query)
                        .mapTo(String.class)
                        .list()

        );
    }


    public List<Voucher> getVouchers()
    {
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
                "join categories c on c.id = v.category_id";

        return  get().withHandle(h->
                    h.createQuery(query)
                            .mapToBean(Voucher.class)
                            .list()
                );
    }




}
