package top.aengus.service;

import top.aengus.dao.impl.AuthorDao;
import top.aengus.dao.impl.NewsDao;
import top.aengus.dao.interfaces.NewsInterface;
import top.aengus.pojo.Author;
import top.aengus.pojo.News;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

/**
 * @author Aengus Sun
 * Email: sys6511@126.com | sunyongsheng6511@gmail.com
 * @link https://www.aengus.top
 * @since 2020/1/9
 */
@WebServlet("/getAllNews")
public class GetAllNewsServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        if (request.getParameter("quit") != null) {
            // 如果点击了退出，对session进行清除
            if (request.getParameter("quit").equals("true")) {
                request.getSession().setAttribute("user", null);
                request.getSession().setAttribute("userMessage", null);
            }
        }
        NewsInterface newsInterface = new NewsDao();
        if (request.getSession().getAttribute("user") == null) {
            // 主页
            List<News> newsList = newsInterface.getAllNews();
            request.setAttribute("newsList", newsList);
            request.getRequestDispatcher("index.jsp").forward(request, response);
        } else if (request.getSession().getAttribute("user").toString().equals("admin")) {
            // 管理员页面
            List<News> newsList = newsInterface.getAllNews();
            List<Author> authorList = new AuthorDao().getAllAuthor();
            request.setAttribute("newsList", newsList);
            request.setAttribute("authorList", authorList);
            request.getRequestDispatcher("admin.jsp").forward(request, response);
        } else if (request.getSession().getAttribute("user").toString().equals("author")) {
            // 作者页面
            HttpSession session = request.getSession();
            String authorId = session.getAttribute("userMessage").toString();
            List<News> newsList = newsInterface.getNewsByAuthorId(authorId);
            request.setAttribute("newsList", newsList);
            request.getRequestDispatcher("author-admin.jsp").forward(request, response);
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
