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
        NewsInterface newsInterface = new NewsDao();
        List<News> newsList = newsInterface.getAllNews();
        request.setAttribute("newsList", newsList);
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}