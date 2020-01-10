package top.aengus.service;

import top.aengus.dao.impl.AdminDao;
import top.aengus.dao.interfaces.AdminInterface;
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
@WebServlet("/addAuthor")
public class AddAuthorServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String authorId = request.getParameter("author_id");
        String authorPassword = request.getParameter("author_password");
        String authorName = request.getParameter("author_name");
        Author author = new Author(authorId, authorPassword, authorName);
        AdminInterface adminInterface = new AdminDao();
        if (adminInterface.addAuthor(author)) {
            request.setAttribute("addAuthorMessage", "添加作者成功");
        } else {
            request.setAttribute("addAuthorMessage", "添加作者失败");
        }
        if ((request.getSession().getAttribute("user") == null)
                || (request.getSession().getAttribute("user").toString().equals("admin"))) {
            request.getRequestDispatcher("getAllNews").forward(request, response);
        } else {
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
