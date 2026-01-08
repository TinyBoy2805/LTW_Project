package dao;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

import org.jdbi.v3.core.Jdbi;

import com.mysql.cj.jdbc.MysqlDataSource;

public abstract class BaseDao {
    Jdbi jdbi;

    protected Jdbi get() {
        if (jdbi == null) {
           connect();
        }
        return jdbi;
    }

    private void connect() {
        MysqlDataSource dataSource = new MysqlDataSource();
        System.out.println("jdbc:mysql://" + DBProperties.host + ":" + DBProperties.port + "/" + DBProperties.dbname);
        dataSource.setURL("jdbc:mysql://" + DBProperties.host + ":" + DBProperties.port + "/" + DBProperties.dbname);
        dataSource.setUser(DBProperties.username);
        dataSource.setPassword(DBProperties.password);
        try {
            dataSource.setUseCompression(true);
            dataSource.setAutoReconnect(true);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        jdbi = Jdbi.create(dataSource);
    }
}
