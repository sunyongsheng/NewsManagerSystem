package top.aengus.service;

import top.aengus.dao.impl.NewsDao;
import top.aengus.dao.interfaces.NewsInterface;
import top.aengus.pojo.News;

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
@WebServlet("/editNews")
public class EditNewsServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        int newsId = Integer.parseInt(request.getParameter("news_id"));
        NewsInterface newsInterface = new NewsDao();
        News news = newsInterface.getNewsByNewsId(newsId, false);
        request.setAttribute("news", news);
        request.getRequestDispatcher("edit-news.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
