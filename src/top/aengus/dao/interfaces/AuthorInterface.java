package top.aengus.dao.interfaces;

import top.aengus.pojo.Author;

import java.util.List;

/**
 * @author Aengus Sun
 * Email: sys6511@126.com | sunyongsheng6511@gmail.com
 * @link https://www.aengus.top
 * @since 2020/1/9
 */
public interface AuthorInterface {
    boolean authorLogin(Author author);
    boolean authorIdAvailable(String authorId);
    List<Author> getAllAuthor();
    boolean authorUpdate(String authorId, Author author);
    Author getAuthorByAuthorId(String authorId);
}
