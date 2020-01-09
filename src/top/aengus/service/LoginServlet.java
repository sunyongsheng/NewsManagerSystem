package top.aengus.service;

import top.aengus.dao.impl.AdminDao;
import top.aengus.dao.impl.AuthorDao;
import top.aengus.dao.interfaces.AdminInterface;
import top.aengus.dao.interfaces.AuthorInterface;
import top.aengus.pojo.Admin;
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
 * @since 2020/1/9
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        AdminInterface adminInterface = new AdminDao();
        AuthorInterface authorInterface = new AuthorDao();
        Admin admin = new Admin(username, password);
        Author author = new Author(username, password, null);
        if (adminInterface.adminLogin(admin)) {
            // 管理员登录成功
            request.setAttribute("userMessage", username);
            request.getRequestDispatcher("admin.jsp").forward(request, response);
        } else if (authorInterface.authorLogin(author)) {
            // 作者登录成功
            request.setAttribute("userMessage", username);
            request.getRequestDispatcher("author-admin.jsp").forward(request, response);
        } else {
            // 登录失败
            request.setAttribute("loginMessage", "登陆失败，用户名或密码错误");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
