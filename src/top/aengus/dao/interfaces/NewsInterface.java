package top.aengus.dao.interfaces;

import top.aengus.pojo.News;

import java.util.List;

/**
 * @author Aengus Sun
 * Email: sys6511@126.com | sunyongsheng6511@gmail.com
 * @link https://www.aengus.top
 * @since 2020/1/9
 */
public interface NewsInterface {

    /**
     * 作者ID为[authorId]的作者添加了一篇新闻
     * @param authorId 作者ID
     * @param news 添加的新闻
     * @return 成功与否
     */
    boolean addNews(String authorId, News news);

    /**
     * 获取所有的新闻
     * @return 新闻组成的List
     */
    List<News> getAllNews();

    /**
     * 指定作者Id获取此作者写的左右新闻
     * @param authorId 作者ID
     * @return 此作者写的新闻组成的List
     */
    List<News> getNewsByAuthorId(String authorId);

    /**
     * 通过分类选出新闻
     * @param category 新闻分类名
     * @return 此分类下的所有新闻
     */
    List<News> getNewsByCategory(String category);

    /**
     * 作者ID为[authorId]的作者通过新闻ID删除指定新闻
     * 如果[adminId]非空，则可以任意删除新闻；否则[authorId]非空，删除其写的新闻；
     * [adminId]与[authorId]必须有一个为空！
     *
     * @param adminId 管理员ID
     * @param authorId 作者ID
     * @param newsId 新闻ID
     * @return 0: 删除失败，未知错误；1：删除成功；-1：删除失败，作者无权限
     */
    int deleteNewsByNewsId(String adminId, String authorId, int newsId);

    /**
     * 通过新闻ID编辑新闻
     * 如果[adminId]非空，则可以任意编辑新闻；否则[authorId]非空，则只能编辑其写的新闻；
     * [adminId]与[authorId]必须有一个为空！
     *
     * @param adminId 管理员ID
     * @param authorId 作者ID
     * @param latestNews 更新后的新闻
     * @return 0：删除失败，未知错误；1：删除成功；-1：编辑失败，作者无权限
     */
    int editNewsByNewsId(String adminId, String authorId, News latestNews);

    List<News> getNewsByNewsTitle(String newsTitle);
    News getNewsByNewsId(int newsId, boolean addView);
}
