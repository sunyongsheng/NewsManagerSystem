package top.aengus.service;

import top.aengus.dao.impl.NewsDao;
import top.aengus.dao.interfaces.NewsInterface;

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
@WebServlet("/deleteNews")
public class DeleteNewsServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String newsIds=request.getParameter("news_ids");
        String authorId = request.getParameter("author_id");
        String adminId = request.getParameter("admin_id");
        String[] newsIdArray = newsIds.split(",");

        NewsInterface newsInterface = new NewsDao();
        int count = 0;
        for (String s : newsIdArray) {
            if (newsInterface.deleteNewsByNewsId(adminId, authorId, Integer.parseInt(s)) == 1) {
                count++;
            }
        }
        if (count == newsIdArray.length) {
            request.setAttribute("editMessage", "删除了" + count + "条纪录");
        } else if (authorId != null){
            request.setAttribute("editMessage", "删除了" + count + "条纪录，中间有问题出现，可能无权限");
        } else {
            request.setAttribute("editMessage", "删除了" + count + "条纪录，中间有问题出现，请与开发者联系");
        }

        if (adminId != null) {
            request.getRequestDispatcher("admin.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("author-admin.jsp").forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
