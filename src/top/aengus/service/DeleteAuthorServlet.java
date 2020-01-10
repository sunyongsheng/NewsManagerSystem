package top.aengus.service;

import top.aengus.dao.impl.AdminDao;
import top.aengus.dao.interfaces.AdminInterface;

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
@WebServlet("/deleteAuthor")
public class DeleteAuthorServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String authorId = request.getParameter("author_id");
        AdminInterface adminInterface = new AdminDao();
        String[] authorIds = authorId.split(",");
        int count = 0;
        for (String a : authorIds) {
            if (adminInterface.deleteAuthorByAuthorId(a)) count++;
        }
        request.setAttribute("deleteAuthorMessage", "删除了" + count + "个作者账号");
        request.getRequestDispatcher("getAllNews").forward(request, response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
