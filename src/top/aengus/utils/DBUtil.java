package top.aengus.utils;

import java.sql.*;

/**
 * @author Aengus Sun
 * Email: sys6511@126.com | sunyongsheng6511@gmail.com
 * @link https://www.aengus.top
 * @since 2020/1/9
 */
public class DBUtil {

    public static Connection getConnection() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection =  DriverManager
                    .getConnection("jdbc:mysql://localhost:3306/news_system?useUnicode=true&characterEncoding=utf8",
                            "root", "19990403");
            if (connection != null) {
                System.out.println("数据库连接成功");
                return connection;
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        System.out.println("数据库连接失败");
        return null;
    }

    public static void close(Connection connection, PreparedStatement preparedStatement, ResultSet resultSet) {
        try {
            // 先打开的最后关闭
            if (resultSet != null) {
                resultSet.close();
                System.out.println("ResultSet关闭");
            }
            if (preparedStatement != null) {
                preparedStatement.close();
                System.out.println("PreparedStatement关闭");
            }
            if (connection != null) {
                connection.close();
                System.out.println("数据库连接关闭");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        Connection connection = getConnection();
        try {
            if (connection != null)
                connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
