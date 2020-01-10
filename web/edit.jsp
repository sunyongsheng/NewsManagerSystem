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

<table width="500" border="0" align="center">
    <tr>
        <td colspan="2" style="background-color:#808080;" align="center">
            <h3>新闻编辑</h3>
        </td>
    </tr>

    <tr>
        <td style="background-color:#DCDCDC;width:100px;vertical-align:top;">
            新闻标题：<br>
            <input type="text" name="" value="${news.newsTitle}" style="background-color: #C0C0C0"><br>
            发布时间：<br>
            <input style="background-color: #C0C0C0" type="date" name="" value="${news.newsPostDate}" readonly><br>
            更新时间：<br>
            <input style="background-color: #C0C0C0" type="date" name="" value="${news.newsUpdateDate}"><br>
            关键词：<br>
            <input style="background-color: #C0C0C0" type="text" name="" value="${news.keywords}"><br>
            类别：<br>
            <input style="background-color: #C0C0C0" type="text" name="" value="${news.newsCategory}"><br>
            阅读量：<br>
            <input style="background-color: #C0C0C0" type="text" name="" value="${news.viewCount}" readonly>
        </td>
        <td>
            <textarea rows="30" cols="50" name="新闻内容" style="font-size:15px; color: black;"></textarea>
        </td>
    </tr>

    <td style="font-size:20px; color: black;" align="center" colspan="2"
        style="background-color:#FFA500;text-align:center;">
        <input type="submit" value="提交">
        <input type="button" value="取消" onclick="javascript:location.href='getAllNews'">
    </td>
</table>

</body>
</html>
