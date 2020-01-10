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
@WebServlet("/save")
public class SaveEditedNewsServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        int newsId = Integer.parseInt(request.getParameter("news_id"));
        String newsTitle = request.getParameter("news_title");
        String newsContent = request.getParameter("news_content");
        Date newsUpdateDate = Date.valueOf(request.getParameter("news_update_date"));
        String keywords = request.getParameter("keywords");
        String userId = request.getSession().getAttribute("userMessage").toString();
        String category = request.getParameter("category");
        News news = new News(newsId, newsTitle, newsContent, newsUpdateDate, keywords, userId, category);
        NewsInterface newsInterface = new NewsDao();
        int res = 0;
        if (request.getSession().getAttribute("user").toString().equals("admin")) {
             res = newsInterface.editNewsByNewsId(userId, null, news);
        } else if (request.getSession().getAttribute("user").toString().equals("author")){
             res = newsInterface.editNewsByNewsId(null, userId, news);
        }
        if (res == -1) {
            request.setAttribute("editMessage", "编辑失败，无权限");
        } else if (res == 0) {
            request.setAttribute("editMessage", "编辑失败");
        } else {
            request.setAttribute("editMessage", "编辑成功");
        }
        request.getRequestDispatcher("getAllNews").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
