package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectDB{
    public Connection getConnection() throws Exception {
        String url = "jdbc:mysql://localhost:3306/michishop_db";
        String user = "root";
        String password = "";

        Class.forName("com.mysql.cj.jdbc.Driver");

        return DriverManager.getConnection(url, user, password);
    }

    public static void main(String[] args) {
        try {
            ConnectDB db = new ConnectDB();
            Connection conn = db.getConnection();
            if (conn != null) {
                System.out.println("--------------------------------");
                System.out.println("KẾT NỐI THÀNH CÔNG!");
                System.out.println("--------------------------------");
            }
        } catch (Exception e) {
            System.out.println("--------------------------------");
            System.out.println("LỖI" + e.getMessage());
            System.out.println("--------------------------------");
        }
    }
}