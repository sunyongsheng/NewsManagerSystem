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
            background: #666666;
            height: 30px;
            border-radius: 30px;
            padding: 5px;

        }

        .search-box:hover > .search-txt {
            width: 190px;
            padding: 0 25px;
        }

        .search-box:hover > .search-btn {
            background: #666;
        }

        .search-btn {
            color: white;
            float: left;
            width: 30px;
            height: 30px;
            border-radius: 50%;
            background: #666;
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
            position: absolute;
            top: 9%;
            left: 30%;
            right: 30%;


        }

        .news-date {
            position: absolute;
            top: 19%;
            left: 40%;
        }

        .news-body {
            position: absolute;
            top: 25%;
            left: 20%;
            right: 20%;
            font-size: 1.2em;

        }

        * {
            margin: 0;
            padding: 0;
        }

        .body2 {
            margin: 0;
            padding: 0;
            font-family: sans-serif;
        }

        .navbar {
            width: 100%;
            height: 50px;
            background: #666;
            box-shadow: 0 -2px 2px #0099CC;
        }

        .navbar ul {
            list-style: none;
        }

        .navbar ul li {
            float: right;
            width: 150px;
            height: 50px;
            background: #666;
            margin-right: 1px;
            font-size: 14px;
        }

        .navbar ul li:hover {
            color: whitesmoke;
            background: #fff;
        }

        .navbar ul li a {
            text-decoration: none;
            color: #0099CC;
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
            border-top: 1px solid rgba(0, 119, 0, 0.5);
        }
    </style>
</head>
<body class="body2">

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

</body>
<body>


<div class="news-top"><h2>${news.newsTitle}</h2></div>
<span class="news-date">${news.newsPostDate} | ${news.newsCategory} | ${news.authorId}</span>

<div class="news-body">${news.newsContent}</div>
</body>
<script>
    function getInputValue() {
        var inputValue = document.getElementById("search_title").value;
        var searchPress = document.getElementById("press_to_search");
        searchPress.href = "searchNewsByTitle?search_title=" + inputValue;
    }
</script>
</html>
