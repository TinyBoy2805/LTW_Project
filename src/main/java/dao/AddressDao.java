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
}
