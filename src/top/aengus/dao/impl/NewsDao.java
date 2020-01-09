package top.aengus.dao.impl;

import top.aengus.dao.interfaces.NewsInterface;
import top.aengus.pojo.News;
import top.aengus.utils.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.sql.Date;
import java.util.List;

/**
 * @author Aengus Sun
 * Email: sys6511@126.com | sunyongsheng6511@gmail.com
 * @link https://www.aengus.top
 * @since 2020/1/9
 */
public class NewsDao implements NewsInterface {

    Connection connection;
    PreparedStatement preparedStatement;
    ResultSet resultSet;

    @Override
    public boolean addNews(String authorId, News news) {
        try {
            connection = DBUtil.getConnection();
            String sql = "INSERT INTO `news`(news_title, news_content, news_post_date, news_update_date, keywords, author_id, news_category) VALUES (?,?,?,?,?,?,?)";
            assert connection != null;
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, news.getNewsTitle());
            preparedStatement.setString(2, news.getNewsContent());
            preparedStatement.setDate(3, news.getNewsPostDate());
            preparedStatement.setDate(4, news.getNewsUpdateDate());
            preparedStatement.setString(5, news.getKeywords());
            preparedStatement.setString(6, news.getAuthorId());
            preparedStatement.setString(7, news.getNewsCategory());
            return preparedStatement.executeUpdate() == 1;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.close(connection, preparedStatement, resultSet);
        }
        return false;
    }

    @Override
    public List<News> getAllNews() {
        List<News> result = new ArrayList<>();
        try {
            connection = DBUtil.getConnection();
            String sql = "SELECT * FROM `news`";
            assert connection != null;
            preparedStatement = connection.prepareStatement(sql);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("news_id");
                String title = resultSet.getString("news_title");
                String content = resultSet.getString("news_content");
                Date postDate = resultSet.getDate("news_post_date");
                Date updateDate = resultSet.getDate("news_update_date");
                String keywords = resultSet.getString("keywords");
                String authorId = resultSet.getString("author_id");
                String category = resultSet.getString("news_category");
                int viewCount = resultSet.getInt("view_count");
                result.add(new News(id, title, content, postDate, updateDate, keywords, authorId, category, viewCount));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.close(connection, preparedStatement, resultSet);
        }
        return result;
    }

    @Override
    public List<News> getNewsByAuthorId(String authorId) {
        return null;
    }

    @Override
    public List<News> getNewsByCategory(String category) {
        return null;
    }

    @Override
    public int deleteNewsByNewsId(String adminId, String authorId, int newsId) {
        return 0;
    }

    @Override
    public int editNewsByNewsId(String adminId, String authorId, News latestNews) {
        return 0;
    }

    public static void main(String[] args) {
        List<News> temp = new NewsDao().getAllNews();
        System.out.println(temp.get(0));
    }
}
