package dao;

import model.Address;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class AddressDao extends BaseDao {
    public Address getAddressByUserId(long userId) {
        String sql = "SELECT * FROM addresses WHERE user_id = :userId LIMIT 1";
        return get().withHandle(handle ->
            handle.createQuery(sql)
                .bind("userId", userId)
                .map((rs, ctx) -> new Address(
                    rs.getLong("id"),
                    rs.getLong("user_id"),
                    rs.getString("house_number"),
                    rs.getString("road"),
                    rs.getString("district"),
                    rs.getString("city")
                ))
                .findOne()
                .orElse(null)
        );
    }
    // Cập nhật địa chỉ khách hàng
    public void updateAddress(long userId, String houseNumber, String road, String district, String city) {
        int updated = get().withHandle(h ->
            h.createUpdate("""
                UPDATE addresses
                SET house_number = :houseNumber,
                    road = :road,
                    district = :district,
                    city = :city
                WHERE user_id = :userId
            """)
            .bind("userId", userId)
            .bind("houseNumber", houseNumber)
            .bind("road", road)
            .bind("district", district)
            .bind("city", city)
            .execute()
        );
        if (updated == 0) {
            // Nếu chưa có địa chỉ thì insert mới
            get().useHandle(h ->
                h.createUpdate("""
                    INSERT INTO addresses (user_id, house_number, road, district, city)
                    VALUES (:userId, :houseNumber, :road, :district, :city)
                """)
                .bind("userId", userId)
                .bind("houseNumber", houseNumber)
                .bind("road", road)
                .bind("district", district)
                .bind("city", city)
                .execute()
            );
        }
    }
}
