package book.util;

import org.apache.commons.dbutils.DbUtils;

import java.io.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class JdbcUtils {

    public static Connection getConnection() throws IOException, SQLException {
        DbUtils.loadDriver("com.mysql.cj.jdbc.Driver");
        InputStream resourceAsStream = JdbcUtils.class.getClassLoader().getResourceAsStream("jdbc.properties");
        Properties properties = new Properties();
        properties.load(resourceAsStream);
        return DriverManager.getConnection(properties.getProperty("url"),
                properties.getProperty("username"), properties.getProperty("password"));
    }

    public static void close(Connection connection) throws SQLException {
        if (connection != null) {
            connection.close();
        }
    }
}
