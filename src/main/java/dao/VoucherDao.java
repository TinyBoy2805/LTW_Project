package dao;

import model.Voucher;
import org.jdbi.v3.core.statement.Query;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.List;

public class VoucherDao extends BaseDao {

    public List<Voucher> findAll() {
        return get().withHandle(h ->
                h.createQuery("""
                        SELECT id, category_id, code, description,
                               discount_amount, discount_percentage,
                               start_date, end_date,
                               usage_limit, current_amount,
                               min_order_value, voucher_type
                        FROM vouchers
                        ORDER BY id DESC
                        """)
                        .mapToBean(Voucher.class)
                        .list()
        );
    }

    public void insert(Voucher voucher) {
        get().useHandle(h ->
                h.createUpdate("""
                        INSERT INTO vouchers(
                            category_id, code, description,
                            discount_amount, discount_percentage,
                            start_date, end_date,
                            usage_limit, current_amount,
                            min_order_value, voucher_type
                        ) VALUES (
                            :categoryId, :code, :description,
                            :discountAmount, :discountPercentage,
                            :startDate, :endDate,
                            :usageLimit, :currentAmount,
                            :minOrderValue, :voucherType
                        )
                        """)
                        .bindBean(voucher)
                        .execute()
        );
    }

    public Voucher findById(int id) {
        return get().withHandle(h ->
                h.createQuery("""
                        SELECT id, category_id, code, description,
                               discount_amount, discount_percentage,
                               start_date, end_date,
                               usage_limit, current_amount,
                               min_order_value, voucher_type
                        FROM vouchers
                        WHERE id = :id
                        """
                )
                .bind("id", id)
                .mapToBean(Voucher.class)
                .findOne()
                .orElse(null)
        );
    }
}
