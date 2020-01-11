<%--
  Created by IntelliJ IDEA.
  User: aengus
  Date: 2020/1/9
  Time: 9:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<script>
  function login() {
      location.href = "login.jsp";
  }
</script>
  <head>
      <link rel="stylesheet" href="https://cdn.staticfile.org/font-awesome/4.7.0/css/font-awesome.css">
      <link rel="stylesheet" href="css/style.css">
      <title>新闻首页</title>
  </head>

<body>
<div style="margin-top: 5%" align="right">
    <div class="index-login-page" onclick="javascript:location.href='login.jsp'">
        <i class="fa fa-sign-in" aria-hidden="true"></i> 登录/注册
    </div>
</div>
<div class="index-search-box">
    <input class="index-search-txt" type="text" id="search_title" placeholder="输入搜索内容" onchange="getInputValue()">
    <a class="index-search-btn" href="" id="press_to_search">
        <i class="fa fa-search" aria-hidden="true"></i>
    </a>
</div>
<div style="background-color: #f1f1f1;" align="center">
    <ul id="index-menu">
        <li>
            <a href="getAllNews">首页</a>
        </li>
        <li>
            <a href="getNewsByCategory?category=体育">体育</a>
        </li>
        <li>
            <a href="getNewsByCategory?category=财经">财经</a>
        </li>
        <li>
            <a href="getNewsByCategory?category=时政">时政</a>
        </li>
        <li>
            <a href="getNewsByCategory?category=教育">教育</a>
        </li>
        <li>
            <a href="getNewsByCategory?category=文化">文化</a>
        </li>
        <li>
            <a href="getNewsByCategory?category=科技">科技</a>
        </li>
    </ul>
</div>
<div align="center">
    <div>
        <table class="index-news-form">
            <c:forEach items="${newsList}" var="news">
                <tr id="index-news-page">
                    <td align="center">${news.newsCategory}</td>
                    <td align="center"><a class="no-baseline-href" href="viewNews?news_id=${news.newsId}">${news.newsTitle}<a></a></td>
                    <td align="center">${news.newsPostDate}</td>
                    <td align="center">浏览量:${news.viewCount}</td>
                </tr>
            </c:forEach>
        </table>
        </div>
    </div>
</body>
<script>
    function getInputValue() {
        var inputValue = document.getElementById("search_title").value;
        var searchPress = document.getElementById("press_to_search");
        searchPress.href = "searchNewsByTitle?search_title=" + inputValue;
    }
</script>
</html>
