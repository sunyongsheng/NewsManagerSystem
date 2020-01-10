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
import java.sql.Date;

/**
 * @author Aengus Sun
 * Email: sys6511@126.com | sunyongsheng6511@gmail.com
 * @link https://www.aengus.top
 * @since 2020/1/9
 */
@WebServlet("/addNews")
public class AddNewsServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String newsTitle = request.getParameter("news_title");
        String newsContent = request.getParameter("news_content");
        Date newsPostDate = Date.valueOf(request.getParameter("news_post_date"));
        String keywords = request.getParameter("keywords");
        String authorId = request.getSession().getAttribute("userMessage").toString();
        String category = request.getParameter("category");
        News news = new News(newsTitle, newsContent, newsPostDate, keywords, authorId, category);
        NewsInterface newsInterface = new NewsDao();
        if (newsInterface.addNews(authorId, news)) {
            request.setAttribute("addNewsMessage", "添加成功");
        } else {
            request.setAttribute("addNewsMessage", "添加失败");
        }
        request.getRequestDispatcher("getAllNews").forward(request, response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
