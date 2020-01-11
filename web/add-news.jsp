<%--
  Created by IntelliJ IDEA.
  User: aengus
  Date: 2020/1/10
  Time: 19:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>新增新闻</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body onload="checkAuth()"  style="background:whitesmoke">
<div align="center">
    <form action="addNews" method="post">
        <table class="edit-news-page" align="center">
            <tr style="height: 5em">
                <td colspan="2" align="center">
                    <h1 align="center" style="font-weight: bold;">新增新闻</h1>
                </td>
            </tr>

            <tr>
                <td class="news-category" align="left">
                    <input type="hidden" name="news_id" value="">
                    <span style="font-weight: bold">新闻标题：</span><br>
                    <input class="edit-news-input-style" name="news_title" value=""><br>
                    <span style="font-weight: bold">发布时间：</span><br>
                    <input class="edit-news-input-style" type="date" name="news_post_date"><br>
                    <span style="font-weight: bold">关键词</span><span class="small-hint-text">（用英文逗号分隔）：</span><br>
                    <input class="edit-news-input-style" type="text" name="keywords"><br>
                    <span style="font-weight: bold">阅读量：</span><br>
                    <input class="edit-news-input-style" type="number" name="view_count" value="0" readonly><br>
                    <span style="font-weight: bold">分类：</span><br>
                    <select class="edit-news-input-style" name="news_category" style="width: 200px">
                        <option selected>默认</option>
                        <option>体育</option>
                        <option>财经</option>
                        <option>时政</option>
                        <option>教育</option>
                        <option>文化</option>
                        <option>科技</option>
                    </select>
                    <br>
                </td>
                <td align="left">
                    <textarea class="edit-news-content" name="news_content">${news.newsContent}</textarea>
                </td>
            </tr>
            <tr>
                <td align="center" colspan="2">
                    <input class="confirm-btn" type="submit" value="提交">
                    <input class="cancel-btn" type="button" value="取消" onclick="javascript:location.href='getAllNews'">
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
<script>
    // 检查权限
    function checkAuth() {
        if ("${user}" !== "admin" && "${user}" !== "author") {
            alert("请先登录");
            location.href = "login.jsp";
        }
    }
</script>
</html>
