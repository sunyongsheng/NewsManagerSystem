<%--
  Created by IntelliJ IDEA.
  User: 成家皓
  Date: 2020/1/9
  Time: 19:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<body>
<form action="save" method="post">
    <table width="500" border="0" align="center">
        <tr>
            <td colspan="2" style="background-color:#808080;" align="center">
                <h3>新闻编辑</h3>
            </td>
        </tr>

        <tr>
            <td style="background-color:#DCDCDC;width:100px;vertical-align:top;">
                <input type="hidden" name="news_id" value="${news.newsId}">
                新闻标题：<br>
                <input type="text" name="news_title" value="${news.newsTitle}" style="background-color: #C0C0C0"><br>
                发布时间：<br>
                <input style="background-color: #C0C0C0" type="date" name="news_post_date" value="${news.newsPostDate}"
                       readonly><br>
                更新时间：<br>
                <input style="background-color: #C0C0C0" type="date" name="news_update_date" value="${news.newsUpdateDate}"><br>
                关键词：<br>
                <input style="background-color: #C0C0C0" type="text" name="keywords" value="${news.keywords}"><br>
                类别：<br>
                <input style="background-color: #C0C0C0" type="text" name="news_category" value="${news.newsCategory}"><br>
                阅读量：<br>
                <input style="background-color: #C0C0C0" type="number" name="view_count" value="${news.viewCount}" readonly>
            </td>
            <td>
                <textarea rows="30" cols="50" name="news_content" style="font-size:15px; color: black;" >${news.newsContent}</textarea>
            </td>
        </tr>

        <td style="font-size:20px; color: black;" align="center" colspan="2"
            style="background-color:#FFA500;text-align:center;">
            <input type="submit" value="提交">
            <input type="button" value="取消" onclick="javascript:location.href='getAllNews'">
        </td>
    </table>
</form>


</body>
</html>
