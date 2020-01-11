package top.aengus.service;

import top.aengus.dao.impl.AuthorDao;
import top.aengus.dao.interfaces.AuthorInterface;

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
@WebServlet("/existId")
public class ExistIdServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        String authorId = request.getParameter("author_id");
        AuthorInterface authorInterface = new AuthorDao();
        if (!authorInterface.authorIdAvailable(authorId)) {
            response.getWriter().print("用户名已被占用");
        } else {
            response.getWriter().print("此账号可用");
        }
    }
}
