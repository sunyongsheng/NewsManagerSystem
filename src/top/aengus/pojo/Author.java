package top.aengus.pojo;

/**
 * @author Aengus Sun
 * Email: sys6511@126.com | sunyongsheng6511@gmail.com
 * @link https://www.aengus.top
 * @since 2020/1/9
 */
public class Author {
    private String authorId;
    private String authorPassword;
    private String authorName;

    public Author() {
    }

    public Author(String authorId, String authorPassword, String authorName) {
        this.authorId = authorId;
        this.authorPassword = authorPassword;
        this.authorName = authorName;
    }

    public String getAuthorId() {
        return authorId;
    }

    public void setAuthorId(String authorId) {
        this.authorId = authorId;
    }

    public String getAuthorPassword() {
        return authorPassword;
    }

    public void setAuthorPassword(String authorPassword) {
        this.authorPassword = authorPassword;
    }

    public String getAuthorName() {
        return authorName;
    }

    public void setAuthorName(String authorName) {
        this.authorName = authorName;
    }

    @Override
    public String toString() {
        return "Author{" +
                "authorId='" + authorId + '\'' +
                ", authorPassword='" + authorPassword + '\'' +
                ", authorName='" + authorName + '\'' +
                '}';
    }
}
