<%--
  Created by IntelliJ IDEA.
  User: 成家皓
  Date: 2020/1/9
  Time: 19:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>界面管理</title>
</head>
<body>
<div align="center">
    <h2>编辑新闻</h2>
    <form action="EditStuServlet" method="post">
        <table>
            <tr>
                <td>新闻标题:</td>
                <td><input type="text" name="" value="${news.newsTitle}" readonly></td>
            </tr>
            <tr>
                <td>发布日期:</td>
                <td><input type="text" name="" value="${news.newsPostDate}"></td>
            </tr>
            <tr>
                <td>关键词:</td>
                <td><input type="text" name="" value="${news.keywords}"></td>
            </tr>
            <tr>
                <td>类别：</td>
                <td><input type="text" name="" value="${news.newsCategory}"></td>
            </tr>
            <tr>
                <td>内容:</td>
                <td><input type="text" name="" value="${news.newsContent}"></td>
            </tr>

            <tr>
                <td colspan="2" align="center">
                    <input type="submit" value="提交">
                    <input type="button" value="取消" onclick="javascript:location.href='GetAllServlet'">
                </td>
            </tr>
        </table>
    </form>

</div>
</body>
</html>
