package dao;

import model.Product;
import org.jdbi.v3.core.Jdbi;

import java.io.InputStream;
import java.sql.SQLException;
import java.util.List;
import java.util.Properties;

public class ProductDAO
{
    private static String URL;
    private static String USER;
    private static String PASSWORD;
    private static String DRIVER;

    static
    {
        try(InputStream is = ProductDAO.class.getClassLoader().getResourceAsStream("db.properties"))
        {
            Properties props = new Properties();
            props.load(is);

            DRIVER = props.getProperty("db.driver");
            URL = props.getProperty("db.url");
            USER = props.getProperty("db.username");
            PASSWORD = props.getProperty("db.password");

            Class.forName(DRIVER);

        } catch (Exception e)
        {
            throw new RuntimeException(e);
        }
    }

    public static Jdbi get() throws SQLException
    {
        return Jdbi.create(URL, USER, PASSWORD);
    }

    public List<Product> getProducts() throws SQLException
    {
        String query = "SELECT * FROM products WHERE is_active = 1";
        return get().withHandle(h->
                h.createQuery(query)
                        .mapToBean(Product.class)
                        .list()
                );
    }


}
