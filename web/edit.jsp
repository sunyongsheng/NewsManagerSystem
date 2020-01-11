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
    <link rel="stylesheet" href="css/style.css">
</head>
<body style="background: white">
<form action="save" method="post">
    <table class="edit-news-page" align="center">
        <tr>
            <td colspan="2" align="center">
                <h1 align="center" style="font-weight: bold;">新闻编辑</h1>
            </td>
        </tr>

        <tr>
            <td class="news-category" align="left">
                <input type="hidden" name="news_id" value="${news.newsId}">
                <span style="font-weight: bold">新闻标题：</span><br>
                <input class="edit-news-input-style" name="news_title" value="${news.newsTitle}"><br>
                <span style="font-weight: bold">发布时间：</span><br>
                <input class="edit-news-input-style" type="date" name="news_post_date" value="${news.newsPostDate}" readonly><br>
                <span style="font-weight: bold">更新时间：</span><br>
                <input class="edit-news-input-style" type="date" name="news_update_date" value="${news.newsUpdateDate}"><br>
                <span style="font-weight: bold">关键词：</span><br>
                <input class="edit-news-input-style" type="text" name="keywords" value="${news.keywords}"><br>
                <span style="font-weight: bold">阅读量：</span><br>
                <input class="edit-news-input-style" type="number" name="view_count" value="${news.viewCount}" readonly><br>
                <span style="font-weight: bold">分类：</span><br>
                <select class="edit-news-input-style" name="news_category" style="width: 200px">
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


</body>
</html>
