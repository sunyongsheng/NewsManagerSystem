package top.aengus.dao.impl;

import top.aengus.dao.interfaces.AdminInterface;
import top.aengus.pojo.Admin;
import top.aengus.pojo.Author;
import top.aengus.utils.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * @author Aengus Sun
 * Email: sys6511@126.com | sunyongsheng6511@gmail.com
 * @link https://www.aengus.top
 * @since 2020/1/9
 */
public class AdminDao implements AdminInterface {
    Connection connection;
    PreparedStatement preparedStatement;
    ResultSet resultSet;

    @Override
    public boolean adminLogin(Admin admin) {
        try {
            connection = DBUtil.getConnection();
            String sql = "Select * from administrator u where u.admin_id=? and u.admin_password=?";
            assert connection != null;
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, admin.getAdminId());
            preparedStatement.setString(2, admin.getAdminPassword());
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                return true;
            } else return false;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean deleteAuthorByAuthorId(String authorId) {
        boolean flag = false;
        try {
            connection = DBUtil.getConnection();
            String sql = "Delete from author where author_id =?";
            assert connection != null;
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, authorId);

            if (preparedStatement.executeUpdate() > 0) {
                flag = true;
            }
            return flag;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.close(connection, preparedStatement, resultSet);
        }


        return false;
    }

    @Override
    public boolean deleteNewsByNewsId(int newsId) {
        boolean flag = false;
        try {
            connection = DBUtil.getConnection();
            String sql = "Delete from news where news_id =?";
            assert connection != null;
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, newsId);

            if (preparedStatement.executeUpdate() > 0) {
                flag = true;
            }
            return flag;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.close(connection, preparedStatement, resultSet);
        }


        return false;
    }

    public static void main(String[] args) {
        AdminDao adminDao = new AdminDao();
        Admin admin = new Admin("admin", "1234");
        System.out.println(adminDao.deleteNewsByNewsId(1));
    }
}
