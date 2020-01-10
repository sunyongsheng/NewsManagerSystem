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
        if (!authorId.equals(news.getAuthorId())) return false;
        try {
            connection = DBUtil.getConnection();
            String sql = "INSERT INTO `news`(news_title, news_content, news_post_date, keywords, author_id, news_category) VALUES (?,?,?,?,?,?,?)";
            assert connection != null;
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, news.getNewsTitle());
            preparedStatement.setString(2, news.getNewsContent());
            preparedStatement.setDate(3, news.getNewsPostDate());
            preparedStatement.setString(4, news.getKeywords());
            preparedStatement.setString(5, news.getAuthorId());
            preparedStatement.setString(6, news.getNewsCategory());
            return preparedStatement.executeUpdate() == 1;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.close(connection, preparedStatement, resultSet);
        }
        return false;
    }

    @Override
    public int editNewsByNewsId(String adminId, String authorId, News latestNews) {
        int res = 0;
        connection = DBUtil.getConnection();
        assert connection != null;
        try {
            if (adminId != null && authorId == null) {
                String sql = "UPDATE `news` SET news_title=?,news_content=?,news_update_date=?,keywords=?,author_id=?,news_category=? WHERE news_id=?";
                preparedStatement = connection.prepareStatement(sql);
                preparedStatement.setString(1, latestNews.getNewsTitle());
                preparedStatement.setString(2, latestNews.getNewsContent());
                preparedStatement.setDate(3, latestNews.getNewsUpdateDate());
                preparedStatement.setString(4, latestNews.getKeywords());
                preparedStatement.setString(5, latestNews.getAuthorId());
                preparedStatement.setString(6, latestNews.getNewsCategory());
                preparedStatement.setInt(7, latestNews.getNewsId());
                return preparedStatement.executeUpdate();
            } else if (adminId == null && authorId != null) {
                String sql = "UPDATE `news` SET news_title=?,news_content=?,news_update_date=?,keywords=?,author_id=?,news_category=? WHERE news_id=? AND author_id=" + authorId;
                preparedStatement = connection.prepareStatement(sql);
                preparedStatement.setString(1, latestNews.getNewsTitle());
                preparedStatement.setString(2, latestNews.getNewsContent());
                preparedStatement.setDate(3, latestNews.getNewsUpdateDate());
                preparedStatement.setString(4, latestNews.getKeywords());
                preparedStatement.setString(5, latestNews.getAuthorId());
                preparedStatement.setString(6, latestNews.getNewsCategory());
                preparedStatement.setInt(7, latestNews.getNewsId());
                try {
                    res = preparedStatement.executeUpdate();
                } catch (SQLException e) {
                    res = -1;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.close(connection, preparedStatement, resultSet);
        }
        return res;
    }

    @Override
    public int deleteNewsByNewsId(String adminId, String authorId, int newsId) {
        int res = 0;
        connection = DBUtil.getConnection();
        assert connection != null;
        try {
            if (adminId != null && authorId == null) {
                String sql = "DELETE  FROM `news` where news_id=?";
                preparedStatement = connection.prepareStatement(sql);
                preparedStatement.setInt(1, newsId);
                return preparedStatement.executeUpdate();
            } else if (adminId == null && authorId != null) {
                String sql = "UPDATE `news` set news_title=?,set news_content=?, set news_update_date=?,set keywords=?,set author_id=?,set news_category=?)WHERE author_id=" + authorId;
                preparedStatement = connection.prepareStatement(sql);
                preparedStatement.setInt(1, newsId);
                try {
                    res = preparedStatement.executeUpdate();
                } catch (SQLException e) {
                    res = -1;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.close(connection, preparedStatement, resultSet);
        }
        return res;
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
        List<News> res = new ArrayList<>();
        try {
            connection = DBUtil.getConnection();
            String sql = "SELECT * FROM news WHERE author_id=?";
            assert connection != null;
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, authorId);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("news_id");
                String title = resultSet.getString("news_title");
                String content = resultSet.getString("news_content");
                Date postDate = resultSet.getDate("news_post_date");
                Date updateDate = resultSet.getDate("news_update_date");
                String keywords = resultSet.getString("keywords");
                String category = resultSet.getString("news_category");
                int viewCount = resultSet.getInt("view_count");
                res.add(new News(id, title, content, postDate, updateDate, keywords, authorId, category, viewCount));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return res;
    }

    @Override
    public List<News> getNewsByCategory(String category) {
        List<News> list = new ArrayList<>();
        connection = DBUtil.getConnection();
        try {
            String sql = "SELECT * FROM news WHERE news_category=?;";
            assert connection != null;
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, category);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int newsId = resultSet.getInt("news_id");
                String c_title = resultSet.getString("news_title");
                String c_content = resultSet.getString("news_content");
                Date c_postDate = resultSet.getDate("news_post_date");
                Date c_updateDate = resultSet.getDate("news_update_date");
                String c_keywords = resultSet.getString("keywords");
                String c_authorId = resultSet.getString("author_id");
                int c_viewCount = resultSet.getInt("view_count");
                list.add(new News(newsId, c_title, c_content, c_postDate, c_updateDate, c_keywords, c_authorId, category, c_viewCount));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.close(connection, preparedStatement, resultSet);
        }
        return list;
    }

    @Override
    public List<News> getNewsByNewsTitle(String newsTitle) {
        List<News> list = new ArrayList<>();
        connection = DBUtil.getConnection();
        try {
            String sql = "SELECT * FROM news WHERE news_title LIKE ?;";
            assert connection != null;
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, "%"+newsTitle+"%");
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int newsId = resultSet.getInt("news_id");
                String newsTitle1 = resultSet.getString("news_title");
                String newsContent = resultSet.getString("news_content");
                Date newsPostDate = resultSet.getDate("news_post_date");
                Date newsUpdateDate = resultSet.getDate("news_update_date");
                String newsCategory = resultSet.getString("news_category");
                String keywords = resultSet.getString("keywords");
                String authorId = resultSet.getString("author_id");
                int viewCount = resultSet.getInt("view_count");
                list.add(new News(newsId, newsTitle1, newsContent, newsPostDate, newsUpdateDate, keywords, authorId, newsCategory, viewCount));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.close(connection, preparedStatement, resultSet);
        }
        return list;
    }

    @Override
    public News getNewsByNewsId(int newsId, boolean addView) {
        connection = DBUtil.getConnection();
        String sql = "SELECT * FROM news WHERE news_id=?";
        try {
            assert connection != null;
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, newsId);
            resultSet = preparedStatement.executeQuery();
            resultSet.next();
            String newsTitle1 = resultSet.getString("news_title");
            String newsContent = resultSet.getString("news_content");
            Date newsPostDate = resultSet.getDate("news_post_date");
            Date newsUpdateDate = resultSet.getDate("news_update_date");
            String newsCategory = resultSet.getString("news_category");
            String keywords = resultSet.getString("keywords");
            String authorId = resultSet.getString("author_id");
            int viewCount = resultSet.getInt("view_count");
            if (addView) {
                String addSql = "UPDATE news SET view_count=? WHERE news_id=?";
                preparedStatement = connection.prepareStatement(addSql);
                preparedStatement.setInt(1, viewCount+1);
                preparedStatement.setInt(2, newsId);
                preparedStatement.executeUpdate();
            }
            return new News(newsId, newsTitle1, newsContent, newsPostDate, newsUpdateDate, newsCategory, keywords, authorId, viewCount);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.close(connection, preparedStatement, resultSet);
        }
        return null;
    }

    public static void main(String[] args) {
        List<News> temp = new NewsDao().getAllNews();
        System.out.println(temp.get(0));
    }
}
