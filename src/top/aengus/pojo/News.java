package top.aengus.pojo;

import java.text.SimpleDateFormat;
import java.sql.Date;

/**
 * @author Aengus Sun
 * Email: sys6511@126.com | sunyongsheng6511@gmail.com
 * @link https://www.aengus.top
 * @since 2020/1/9
 */
public class News {
    private int newsId;
    private String newsTitle;
    private String newsContent;
    private Date newsPostDate;
    private Date newsUpdateDate;
    private String keywords;
    private String authorId;
    private String newsCategory;
    private int viewCount;

    public News() {
    }

    // 编辑新闻使用
    public News(int newsId, String newsTitle, String newsContent, Date newsUpdateDate, String keywords, String authorId, String newsCategory) {
        this.newsId = newsId;
        this.newsTitle = newsTitle;
        this.newsContent = newsContent;
        this.newsUpdateDate = newsUpdateDate;
        this.keywords = keywords;
        this.authorId = authorId;
        this.newsCategory = newsCategory;
    }

    // 新增新闻使用
    public News(String newsTitle, String newsContent, Date newsPostDate, String keywords, String authorId, String newsCategory) {
        this.newsTitle = newsTitle;
        this.newsContent = newsContent;
        this.newsPostDate = newsPostDate;
        this.keywords = keywords;
        this.authorId = authorId;
        this.newsCategory = newsCategory;
    }

    // 全部参数
    public News(int newsId, String newsTitle, String newsContent, Date newsPostDate, Date newsUpdateDate, String keywords, String authorId, String newsCategory, int viewCount) {
        this.newsId = newsId;
        this.newsTitle = newsTitle;
        this.newsContent = newsContent;
        this.newsPostDate = newsPostDate;
        this.newsUpdateDate = newsUpdateDate;
        this.keywords = keywords;
        this.authorId = authorId;
        this.newsCategory = newsCategory;
        this.viewCount = viewCount;
    }

    public int getNewsId() {
        return newsId;
    }

    public void setNewsId(int newsId) {
        this.newsId = newsId;
    }

    public String getNewsTitle() {
        return newsTitle;
    }

    public void setNewsTitle(String newsTitle) {
        this.newsTitle = newsTitle;
    }

    public String getNewsContent() {
        return newsContent;
    }

    public void setNewsContent(String newsContent) {
        this.newsContent = newsContent;
    }

    public Date getNewsPostDate() {
        return newsPostDate;
    }

    public void setNewsPostDate(Date newsPostDate) {
        this.newsPostDate = newsPostDate;
    }

    public Date getNewsUpdateDate() {
        return newsUpdateDate;
    }

    public void setNewsUpdateDate(Date newsUpdateDate) {
        this.newsUpdateDate = newsUpdateDate;
    }

    public String getKeywords() {
        return keywords;
    }

    public void setKeywords(String keywords) {
        this.keywords = keywords;
    }

    public String getAuthorId() {
        return authorId;
    }

    public void setAuthorId(String authorId) {
        this.authorId = authorId;
    }

    public String getNewsCategory() {
        return newsCategory;
    }

    public void setNewsCategory(String newsCategory) {
        this.newsCategory = newsCategory;
    }

    public int getViewCount() {
        return viewCount;
    }

    public void setViewCount(int viewCount) {
        this.viewCount = viewCount;
    }

    @Override
    public String toString() {
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        return "News{" +
                "newsId=" + newsId +
                ", newsTitle='" + newsTitle + '\'' +
                ", newsContent='" + newsContent + '\'' +
                ", newsPostDate=" + format.format(newsPostDate) +
                ", newsUpdateDate=" + format.format(newsUpdateDate) +
                ", keywords='" + keywords + '\'' +
                ", authorId='" + authorId + '\'' +
                ", newsCategory='" + newsCategory + '\'' +
                ", viewCount=" + viewCount +
                '}';
    }
}
