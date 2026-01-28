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

    public boolean addVoucherToUser(int userId, int voucherId) {
        String checkSql = """
            SELECT COUNT(*) FROM user_vouchers
            WHERE user_id = :uid AND voucher_id = :vid AND used_at IS NULL
        """;

        String insertSql = """
            INSERT INTO user_vouchers(user_id, voucher_id, used_at)
            VALUES(:uid, :vid, NULL)
        """;

        return get().withHandle(handle -> {
            int count = handle.createQuery(checkSql)
                    .bind("uid", userId)
                    .bind("vid", voucherId)
                    .mapTo(Integer.class)
                    .one();

            if (count > 0) return false; // đã nhận rồi

            int rows = handle.createUpdate(insertSql)
                    .bind("uid", userId)
                    .bind("vid", voucherId)
                    .execute();

            return rows > 0;
        });
    }

    public List<Voucher> getUserVouchers(int userId) {
        String query = """
            SELECT
                v.id,
                c.name as category_name,
                v.code,
                v.description,
                v.discount_amount,
                v.discount_percentage,
                v.start_date,
                v.end_date,
                v.usage_limit,
                v.current_amount,
                v.min_order_value,
                v.voucher_type
            FROM vouchers v
            JOIN user_vouchers uv ON uv.voucher_id = v.id
            JOIN categories c ON c.id = v.category_id
            WHERE uv.user_id = :userId AND uv.used_at IS NULL
        """;

        return get().withHandle(h ->
                h.createQuery(query)
                        .bind("userId", userId)
                        .mapToBean(Voucher.class)
                        .list()
        );
    }
    public Voucher getVoucherByCode(String code) {
        String query = """
            SELECT
                v.id,
                c.name as category_name,
                v.code,
                v.description,
                v.discount_amount,
                v.discount_percentage,
                v.start_date,
                v.end_date,
                v.usage_limit,
                v.current_amount,
                v.min_order_value,
                v.voucher_type
            FROM vouchers v
            JOIN categories c ON c.id = v.category_id
            WHERE v.code = :code
        """;
        return get().withHandle(h ->
            h.createQuery(query)
                .bind("code", code)
                .mapToBean(Voucher.class)
                .findFirst()
                .orElse(null)
        );
    }

    public boolean markVoucherAsUsed(int userId, int voucherId) {
        String query = """
            UPDATE user_vouchers
            SET used_at = CURRENT_TIMESTAMP
            WHERE user_id = :userId AND voucher_id = :voucherId AND used_at IS NULL
        """;
        int rows = get().withHandle(h ->
            h.createUpdate(query)
                .bind("userId", userId)
                .bind("voucherId", voucherId)
                .execute()
        );
        return rows > 0;
    }
}
