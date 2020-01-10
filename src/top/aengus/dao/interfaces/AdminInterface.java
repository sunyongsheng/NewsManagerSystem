package top.aengus.dao.interfaces;

import top.aengus.pojo.Admin;
import top.aengus.pojo.Author;

/**
 * @author Aengus Sun
 * Email: sys6511@126.com | sunyongsheng6511@gmail.com
 * @link https://www.aengus.top
 * @since 2020/1/9
 */
public interface AdminInterface {
    boolean adminLogin(Admin admin);
    boolean deleteAuthorByAuthorId(String authorId);

    boolean addAuthor(Author author);
    boolean deleteNewsByNewsId(int newsId);
}
