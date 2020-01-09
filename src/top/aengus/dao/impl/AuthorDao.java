package top.aengus.dao.impl;

import top.aengus.dao.interfaces.AuthorInterface;
import top.aengus.pojo.Author;
import top.aengus.utils.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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
        }
        return false;
    }


}
