package top.aengus.dao.impl;

import top.aengus.dao.interfaces.AdminInterface;

/**
 * @author Aengus Sun
 * Email: sys6511@126.com | sunyongsheng6511@gmail.com
 * @link https://www.aengus.top
 * @since 2020/1/9
 */
public class AdminDao implements AdminInterface {

    @Override
    public boolean deleteAuthorByAuthorId(String authorId) {
        return false;
    }

    @Override
    public boolean deleteNewsByNewsId(int newsId) {
        return false;
    }
}
