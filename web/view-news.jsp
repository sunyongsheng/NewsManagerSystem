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
    <style>
        .search-box {
            position: absolute;
            top: 1.2%;
            left: 5%;
            transform: translate(-50, -50);
            background: #3aafa9;
            height: 30px;
            border-radius: 30px;
            padding: 5px;

        }

        .search-box:hover > .search-txt {
            width: 190px;
            padding: 0 25px;
        }

        .search-box:hover > .search-btn {
            background: #3aafa9;
        }

        .search-btn {
            color: white;
            float: left;
            width: 30px;
            height: 30px;
            border-radius: 50%;
            background: #3aafa9;
            display: flex;
            justify-content: center;
            align-items: center;
            transition: 0.4s;
        }

        .search-txt {
            border: none;
            background: white;
            outline: none;
            float: left;
            padding: 0;
            color: black;
            font-size: 16px;
            transition: 0.4s;
            line-height: 15px;
            width: 0px;
        }

        .news-top {
            margin-top: 5%;
        }

        .news-content {
            background: whitesmoke;
            margin-top: 3%;
            line-height: 2.2;
            margin-bottom: 2em;
            overflow-wrap: break-word;
            word-wrap: break-word;
            width: 60%;
            border: none;
            height: 100%;
        }
        .news-info {
            margin-top: 3%;
        }
        * {
            margin: 0;
            padding: 0;
        }



        .navbar {
            width: 100%;
            height: 50px;
            background: #3aafa9;
            box-shadow: 0 -2px 2px #0099CC;
        }

        .navbar ul {
            list-style: none;
        }

        .navbar ul li {
            float: right;
            width: 150px;
            height: 50px;
            background: #3aafa9;
            margin-right: 1px;
            font-size: 14px;
        }

        .navbar ul li:hover {
            color: #2a7b78;
            background: #2a7b78;
        }

        .navbar ul li a {
            text-decoration: none;
            color: white;
            display: block;
            text-align: center;
            line-height: 50px;
            font-weight: bold;
            text-transform: uppercase;
        }

        .navbar ul li ul li {
            display: none;
            width: 220px;
            height: 50px;
            float: initial;
            background: #666;
            font-size: 10px;
        }

        .navbar ul li:hover ul li {
            display: block;
            border-top: 1px solid rgba(0, 119, 100, 0.5);
        }
    </style>
</head>
<body style="background:whitesmoke">
    <div class="navbar">
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
    <div class="search-box">
        <input class="search-txt" type="text" id="search_title" placeholder="输入搜索内容" onchange="getInputValue()">
        <a class="search-btn" href="" id="press_to_search">
            <i class="fa fa-search" aria-hidden="true"></i>
        </a>
    </div>
    </div>
    <div align="center">
        <div class="news-top"><h2>${news.newsTitle}</h2></div>
        <div class="news-info"><span style="font-weight: bold">发布时间：</span>${news.newsPostDate}&nbsp;&nbsp;|&nbsp;&nbsp;
            <span style="font-weight: bold">分类：</span>${news.newsCategory}&nbsp;&nbsp;|&nbsp;&nbsp;
            <span style="font-weight: bold">来源：</span>${news.authorId}</div>
        <div>
            <textarea readonly class="news-content">
                ${news.newsContent}
            </textarea>
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
