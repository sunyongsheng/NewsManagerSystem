<%--
  Created by IntelliJ IDEA.
  User: aengus
  Date: 2020/1/10
  Time: 15:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>新闻详情</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/font-awesome/4.7.0/css/font-awesome.css">
    <link rel="stylesheet" href="css/style.css">
</head>
<body style="background:whitesmoke">
    <div class="view-navbar">
    <ul>
        <li>
            <a href="getNewsByCategory?category=教育">教育</a>
        </li>
        <li>
            <a href="getNewsByCategory?category=科技">科技</a>
        </li>
        <li>
            <a href="getNewsByCategory?category=文化">文化</a>
        </li>
        <li>
            <a href="getNewsByCategory?category=时政">时政</a>
        </li>
        <li>
            <a href="getNewsByCategory?category=财经">财经</a>
        </li>
        <li>
            <a href="getNewsByCategory?category=体育">体育</a>
        </li>
        <li>
            <a href="getAllNews">首页</a>
        </li>

    </ul>
    <div class="view-search-box">
        <input class="view-search-txt" type="text" id="search_title" placeholder="输入搜索内容" onchange="getInputValue()">
        <a class="view-search-btn" href="" id="press_to_search">
            <i class="fa fa-search" aria-hidden="true"></i>
        </a>
    </div>
    </div>
    <div align="center">
        <div class="view-news-top"><h2>${news.newsTitle}</h2></div>
        <div class="view-news-info"><span style="font-weight: bold">发布时间：</span>${news.newsPostDate}&nbsp;&nbsp;|&nbsp;&nbsp;
            <span style="font-weight: bold">分类：</span>${news.newsCategory}&nbsp;&nbsp;|&nbsp;&nbsp;
            <span style="font-weight: bold">来源：</span>${news.authorId}</div>
        <div>
            <textarea readonly class="view-news-content">
                ${news.newsContent}
            </textarea>
        </div>
    </div>
</body>
<script>
    function getInputValue() {
        var inputValue = document.getElementById("search_title").value;
        var searchPress = document.getElementById("press_to_search");
        searchPress.href = "searchNewsByTitleAndKeywords?search_text=" + inputValue;
    }
</script>
</html>
