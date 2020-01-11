<%--
  Created by IntelliJ IDEA.
  User: 成家皓
  Date: 2020/1/9
  Time: 19:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>新闻编辑</title>
    <style>
        .edit-page {
            width: 60%;
            height: 100%;
            background: rgba(,,, 1);

        }

        .shuxing {
            vertical-align: top;
            border: none;
        }

        .edit-content {
            width: 500px;
            height: 290px;
        }

        .bottom {
            cursor: pointer;
        }
    </style>
</head>
<body style="background: #43506c">
<form action="save" method="post">
    <table class="edit-page" align="center">
        <tr>
            <td colspan="2" align="center">
                <h3 align="center" style="font-size: 30px; font-weight: 500; color: white">新闻编辑</h3>
            </td>
        </tr>

        <tr>
            <td class="shuxing" align="left">
                <input type="hidden" name="news_id" value="${news.newsId}">
                <span style="color: white">新闻标题：</span><br>
                <textarea style="border: none; height: 45px;width: 200px" name="news_title">${news.newsTitle}</textarea><br>
                <span style="color: white">发布时间：</span><br>
                <input style="border: none; width: 200px" type="date" name="news_post_date" value="${news.newsPostDate}"
                       readonly><br>
                <span style="color: white">更新时间：</span><br>
                <input style="border: none; width: 200px" type="date" name="news_update_date"
                       value="${news.newsUpdateDate}"><br>
                <span style="color: white">关键词：</span><br>
                <input style="border: none; width: 200px" type="text" name="keywords" value="${news.keywords}"><br>
                <span style="color: white">阅读量：</span><br>
                <input style="border: none; width: 200px" type="number" name="view_count" value="${news.viewCount}"
                       readonly><br>
                <span style="color: white">分类：</span><br>
                <select name="news_category" style="width: 200px">
                    <c:if test="${news.newsCategory=='默认'}">
                    <option selected>默认</option>
                    <option>体育</option>
                    <option>财经</option>
                    <option>时政</option>
                    <option>教育</option>
                    <option>文化</option>
                    <option>科技</option>
                    </c:if>
                    <c:if test="${news.newsCategory=='体育'}">
                    <option>默认</option>
                    <option selected>体育</option>
                    <option>财经</option>
                    <option>时政</option>
                    <option>教育</option>
                    <option>文化</option>
                    <option>科技</option>
                    </c:if>
                    <c:if test="${news.newsCategory=='财经'}">
                    <option>默认</option>
                    <option>体育</option>
                    <option selected>财经</option>
                    <option>时政</option>
                    <option>教育</option>
                    <option>文化</option>
                    <option>科技</option>
                    </c:if>
                    <c:if test="${news.newsCategory=='时政'}">
                    <option>默认</option>
                    <option>体育</option>
                    <option>财经</option>
                    <option selected>时政</option>
                    <option>教育</option>
                    <option>文化</option>
                    <option>科技</option>
                    </c:if>
                    <c:if test="${news.newsCategory=='教育'}">
                    <option>默认</option>
                    <option>体育</option>
                    <option>财经</option>
                    <option>时政</option>
                    <option selected>教育</option>
                    <option>文化</option>
                    <option>科技</option>
                    </c:if>
                    <c:if test="${news.newsCategory=='文化'}">
                    <option>默认</option>
                    <option>体育</option>
                    <option>财经</option>
                    <option>时政</option>
                    <option>教育</option>
                    <option selected>文化</option>
                    <option>科技</option>
                    </c:if>
                    <c:if test="${news.newsCategory=='科技'}">
                    <option selected>默认</option>
                    <option>体育</option>
                    <option>财经</option>
                    <option>时政</option>
                    <option>教育</option>
                    <option>文化</option>
                    <option selected>科技</option>
                    </c:if>
                    <select>

                <br>
            </td>
            <td class="edit-content" align="left">
                <textarea rows="30" cols="100" name="news_content"
                          style="font-size:15px; color: black;left: 10%">${news.newsContent}</textarea>
            </td>
        </tr>
        <tr>
        <td style="font-size:20px; color: black;" align="center" colspan="2"
            style="background-color:#FFA500;text-align:center;">
            <input class="bottom" type="submit" value="提交">
            <input class="bottom" type="button" value="取消" onclick="javascript:location.href='getAllNews'">
        </td>
        </tr>
    </table>
</form>


</body>
</html>
