package dao;

import model.Voucher;
import model.VoucherType;
import org.jdbi.v3.core.statement.Query;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.List;

public class VoucherDAO extends BaseDao {

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
                        .map((rs, ctx) -> {
                            Voucher v = new Voucher();
                            v.setId(rs.getInt("id"));
                            v.setCategory_name(rs.getString("category_id"));
                            v.setCode(rs.getString("code"));
                            v.setDescription(rs.getString("description"));
                            v.setDiscount_amount(rs.getDouble("discount_amount"));
                            v.setDiscount_percentage(rs.getDouble("discount_percentage"));
                            v.setStart_date(rs.getDate("start_date") != null ? rs.getDate("start_date").toLocalDate() : null);
                            v.setEnd_date(rs.getDate("end_date") != null ? rs.getDate("end_date").toLocalDate() : null);
                            v.setUsage_limt(rs.getInt("usage_limit"));
                            v.setCurrent_amount(rs.getInt("current_amount"));
                            v.setMin_order_value(rs.getDouble("min_order_value"));
                            String typeStr = rs.getString("voucher_type");
                            try {
                                v.setVoucher_type(typeStr != null ? VoucherType.valueOf(typeStr.toUpperCase()) : null);
                            } catch (IllegalArgumentException e) {
                                v.setVoucher_type(null);
                            }
                            return v;
                        })
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
                        .bind("categoryId", voucher.getCategory_name())
                        .bind("code", voucher.getCode())
                        .bind("description", voucher.getDescription())
                        .bind("discountAmount", voucher.getDiscount_amount())
                        .bind("discountPercentage", voucher.getDiscount_percentage())
                        .bind("startDate", voucher.getStart_date())
                        .bind("endDate", voucher.getEnd_date())
                        .bind("usageLimit", voucher.getUsage_limt())
                        .bind("currentAmount", voucher.getCurrent_amount())
                        .bind("minOrderValue", voucher.getMin_order_value())
                        .bind("voucherType", voucher.getVoucher_type() != null ? voucher.getVoucher_type().name() : null)
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
            .map((rs, ctx) -> {
                Voucher v = new Voucher();
                v.setId(rs.getInt("id"));
                v.setCategory_name(rs.getString("category_id"));
                v.setCode(rs.getString("code"));
                v.setDescription(rs.getString("description"));
                v.setDiscount_amount(rs.getDouble("discount_amount"));
                v.setDiscount_percentage(rs.getDouble("discount_percentage"));
                v.setStart_date(rs.getDate("start_date") != null ? rs.getDate("start_date").toLocalDate() : null);
                v.setEnd_date(rs.getDate("end_date") != null ? rs.getDate("end_date").toLocalDate() : null);
                v.setUsage_limt(rs.getInt("usage_limit"));
                v.setCurrent_amount(rs.getInt("current_amount"));
                v.setMin_order_value(rs.getDouble("min_order_value"));
                String typeStr = rs.getString("voucher_type");
                try {
                v.setVoucher_type(typeStr != null ? VoucherType.valueOf(typeStr.toUpperCase()) : null);
                } catch (IllegalArgumentException e) {
                v.setVoucher_type(null);
                }
                return v;
            })
            .findOne()
            .orElse(null)
        );
    }

    public int deleteById(int id) {
        return get().withHandle(h ->
                h.createUpdate("DELETE FROM vouchers WHERE id = :id")
                        .bind("id", id)
                        .execute()
        );
    }

    public int update(Voucher voucher) {
        return get().withHandle(h ->
            h.createUpdate("""
                UPDATE vouchers SET
                    category_id = :categoryId,
                    code = :code,
                    description = :description,
                    discount_amount = :discountAmount,
                    discount_percentage = :discountPercentage,
                    start_date = :startDate,
                    end_date = :endDate,
                    usage_limit = :usageLimit,
                    current_amount = :currentAmount,
                    min_order_value = :minOrderValue,
                    voucher_type = :voucherType
                WHERE id = :id
                """
            )
            .bind("categoryId", voucher.getCategory_name())
            .bind("code", voucher.getCode())
            .bind("description", voucher.getDescription())
            .bind("discountAmount", voucher.getDiscount_amount())
            .bind("discountPercentage", voucher.getDiscount_percentage())
            .bind("startDate", voucher.getStart_date())
            .bind("endDate", voucher.getEnd_date())
            .bind("usageLimit", voucher.getUsage_limt())
            .bind("currentAmount", voucher.getCurrent_amount())
            .bind("minOrderValue", voucher.getMin_order_value())
            .bind("voucherType", voucher.getVoucher_type() != null ? voucher.getVoucher_type().name() : null)
            .bind("id", voucher.getId())
            .execute()
        );
    }

    // Methods required by VoucherService

    public List<Voucher> getVouchers(int page, int pageSize) {
        int offset = (page - 1) * pageSize;
        return get().withHandle(h ->
            h.createQuery("""
                SELECT * FROM vouchers
                WHERE current_amount > 0
                and start_date <= NOW()
                and end_date >= NOW()
                ORDER BY id DESC
                LIMIT :limit OFFSET :offset
                """)
                .bind("limit", pageSize)
                .bind("offset", offset)
                .mapToBean(Voucher.class)
                .list()
        );
    }

    public boolean addVoucherToUser(int userId, int voucherId) {
        // Check if user already has this voucher
        Integer count = get().withHandle(h ->
            h.createQuery("SELECT COUNT(*) FROM user_vouchers WHERE user_id = :uid AND voucher_id = :vid")
                .bind("uid", userId)
                .bind("vid", voucherId)
                .mapTo(Integer.class)
                .one()
        );
        if (count != null && count > 0) return false;

        int rows = get().withHandle(h ->
            h.createUpdate("INSERT INTO user_vouchers(user_id, voucher_id, is_used) VALUES (:uid, :vid, 0)")
                .bind("uid", userId)
                .bind("vid", voucherId)
                .execute()
        );
        return rows > 0;
    }

    public List<Voucher> getUserVouchers(int userId) {
        return get().withHandle(h ->
            h.createQuery("""
                SELECT v.*
                FROM vouchers v
                JOIN user_vouchers uv ON v.id = uv.voucher_id
                WHERE uv.user_id = :uid
                AND uv.is_used = 0
                AND v.end_date >= NOW()
                """)
                .bind("uid", userId)
                .mapToBean(Voucher.class)
                .list()
        );
    }

    public Voucher getVoucherByCode(String code) {
        return get().withHandle(h ->
            h.createQuery("SELECT * FROM vouchers WHERE code = :code")
                .bind("code", code)
                .mapToBean(Voucher.class)
                .findOne()
                .orElse(null)
        );
    }

    public boolean markVoucherAsUsed(int userId, int voucherId) {
        int rows = get().withHandle(h ->
            h.createUpdate("UPDATE user_vouchers SET is_used = 1 WHERE user_id = :uid AND voucher_id = :vid")
                .bind("uid", userId)
                .bind("vid", voucherId)
                .execute()
        );
        return rows > 0;
    }

}
