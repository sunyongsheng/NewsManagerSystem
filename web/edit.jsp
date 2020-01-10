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
    <form action="edit" method="post">
        <table>
            <tr>
                <td>
                    <textarea rows="30" cols="60" name="新闻内容" style="font-size:20px; color: black;"></textarea>
                </td>
                <td>
                    <table border="0">
                        <td>
                            <tr align="right">
                                <td style="font-size:20px; color: black;">新闻标题:</td>
                                <td><input type="text" name="" value="${news.newsTitle}"></td>
                            </tr>
                            <tr align="right">
                                <td style="font-size:20px; color: black;">发布日期:</td>
                                <td><input type="text" name="" value="${news.newsPostDate}"></td>
                            </tr>
                            <tr align="right">
                                <td style="font-size:20px; color: black;">关键词:</td>
                                <td><input type="text" name="" value="${news.keywords}"></td>
                            </tr>
                            <tr align="right">
                                <td style="font-size:20px; color: black;">类别:</td>
                                <td><input type="text" name="" value="${news.newsCategory}"></td>
                            </tr>
                            <tr align="right">
                                <td style="font-size:20px; color: black;">阅读量:</td>
                                <td><input type="text" name="" value="${news.viewCount}"></td>
                            </tr>
                            <tr align="right">
                                <td style="font-size:20px; color: black;" colspan="2" align="center">
                                    <input type="submit" value="提交">
                                    <input type="button" value="取消" onclick="javascript:location.href='GetAllServlet'">
                                </td>
                            </tr>
                        </td>
                    </table>
                </td>

            </tr>
        </table>

    </form>
</div>
</body>
</html>
