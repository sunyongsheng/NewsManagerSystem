package top.aengus.service;

import top.aengus.dao.impl.AuthorDao;
import top.aengus.dao.interfaces.AuthorInterface;
import top.aengus.pojo.Author;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author Aengus Sun
 * Email: sys6511@126.com | sunyongsheng6511@gmail.com
 * @link https://www.aengus.top
 * @since 2020/1/10
 */
@WebServlet("/saveAuthor")
public class SaveEditedAuthorServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String authorId = request.getParameter("author_id");
        String authorPassword = request.getParameter("author_password");
        String authorName = request.getParameter("author_name");
        AuthorInterface authorInterface = new AuthorDao();
        if (authorInterface.authorUpdate(authorId, new Author(authorId, authorPassword, authorName))) {
            request.setAttribute("addAuthorMessage", "更新信息成功");
        } else {
            request.setAttribute("addAuthorMessage", "更新信息失败");
        }
        request.getRequestDispatcher("getAllNews").forward(request, response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
