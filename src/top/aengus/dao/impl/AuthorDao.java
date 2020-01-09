package top.aengus.dao.impl;

import top.aengus.dao.interfaces.AdminInterface;
import top.aengus.dao.interfaces.AuthorInterface;
import top.aengus.pojo.Admin;
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
            String sql = "Select * from author u where u.author_id=? and u.author_password=?";
            assert connection != null;
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, author.getAuthorId());
            preparedStatement.setString(2, author.getAuthorPassword());
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                return true;
            } else return false;


        } catch (SQLException e) {
            e.printStackTrace();
        }


        return false;
    }


}
