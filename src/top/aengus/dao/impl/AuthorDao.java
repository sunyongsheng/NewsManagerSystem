package top.aengus.dao.impl;

import top.aengus.dao.interfaces.AuthorInterface;
import top.aengus.pojo.Author;
import top.aengus.utils.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AuthorDao implements AuthorInterface {
    Connection connection;
    PreparedStatement preparedStatement;
    ResultSet resultSet;

    @Override
    public boolean authorLogin(Author author) {
        try {
            connection = DBUtil.getConnection();
            String sql = "SELECT * FROM author WHERE author_id=? AND author_password=?";
            assert connection != null;
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, author.getAuthorId());
            preparedStatement.setString(2, author.getAuthorPassword());
            resultSet = preparedStatement.executeQuery();
            return resultSet.next();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.close(connection, preparedStatement, resultSet);
        }
        return false;
    }

    @Override
    public boolean authorIdAvailable(String authorId) {
        try {
            connection = DBUtil.getConnection();
            String sql1 = "SELECT * FROM author WHERE author_id=?";
            String sql2 = "SELECT * FROM administrator WHERE admin_id=?";
            assert connection != null;
            preparedStatement = connection.prepareStatement(sql1);
            preparedStatement.setString(1, authorId);
            resultSet = preparedStatement.executeQuery();
            boolean b1 = resultSet.next();
            preparedStatement = connection.prepareStatement(sql2);
            preparedStatement.setString(1, authorId);
            resultSet = preparedStatement.executeQuery();
            boolean b2 = resultSet.next();
            return !b1 && !b2;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.close(connection, preparedStatement, resultSet);
        }
        return false;
    }

    @Override
    public List<Author> getAllAuthor() {
        List<Author> res = new ArrayList<>();
        try {
            connection = DBUtil.getConnection();
            String sql = "SELECT * FROM author";
            assert connection != null;
            preparedStatement = connection.prepareStatement(sql);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                res.add(new Author(resultSet.getString("author_id"),
                        resultSet.getString("author_password"),
                        resultSet.getString("author_name")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.close(connection, preparedStatement, resultSet);
        }
        return res;
    }
}
