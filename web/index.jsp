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
    <title>新闻首页</title>
      <style>
          #menu {
              margin: 0;
              padding: 0;
          }

          #menu li {
              list-style: none;
              display: inline-block;
          }

          #menu li a {
              text-decoration: none;
              position: relative;
              color: black;
              font-size: 20px;
              font-weight: 700;
              font-family: sans-serif;
              display: block;
              overflow: hidden;
              transition: 0.7s all;
              padding: 14px 20px;
          "
          }

          #menu li a:before {
              content: '';
              width: 25px;
              position: absolute;
              border-bottom: 6px solid #000000;
              bottom: 0px;
              right: 150px;
              transition: 0.7s all;
          }

          #menu li a:hover:before {
              right: 50%;
          }

          body {
              margin: 0;
              padding: 0;
              background: white;
          }

          .search-box {
              position: absolute;
              top: 9%;
              left: 80%;
              transform: translate(-50, -50);
              background: #ffffff;
              height: 35px;
              border-radius: 35px;
              padding: 10px;

          }

          .search-box:hover > .search-txt {
              width: 190px;
              padding: 0 25px;
          }

          .search-box:hover > .search-btn {
              background: white;
          }

          .search-btn {
              color: black;
              float: left;
              width: 40px;
              height: 40px;
              border-radius: 50%;
              background: #ffffff;
              display: flex;
              justify-content: center;
              align-items: center;
              transition: 0.4s;
          }

          .search-txt {
              border: none;
              background: none;
              outline: none;
              float: left;
              padding: 0;
              color: white;
              font-size: 16px;
              transition: 0.4s;
              line-height: 20px;
              width: 0px;
          }

          .login-page:hover {
              color: black;
              border: 2px solid;
          }


          .login-page {
              position: absolute;
              top: 5%;
              right: 0%;
              transform: translate(-50%, -50%);


              padding: 1px;
              cursor: pointer;
              font-size: 5px;
              color: #666;
          }

          .news-form {
              position: absolute;
              top: 20%;
              width: 70%;
              justify-content: center;

          }

          #news-page td {
              text-decoration: none;
              position: relative;
              color: black;
              font-size: 20px;
              font-weight: 550px;
              font-family: sans-serif;
              overflow: hidden;
              transition: 0.7s all;
              padding: 10px 50px;
              content: '';
              border-bottom: 4px solid #666;
          }

      </style>
  </head>

<body>
  <form align="right">
      <div>
          <div class="login-page" onclick="javascript:location.href='login.jsp'">
              <i class="fa fa-sign-in" aria-hidden="true"></i> 登录/注册
          </div>

      </div>
  </form >

  <h1 align="center">新闻管理系统</h1>
  <div class="search-box">
      <input class="search-txt" type="text" id="search_title" placeholder="输入搜索内容" onchange="getInputValue()">
      <a class="search-btn" href="" id="press_to_search">
          <i class="fa fa-search" aria-hidden="true"></i>
      </a>
  </div>
  <form>
      <div style="margin: 0;padding: 0;background-color: #f1f1f1;" align="center">
          <ul id="menu">
              <ul>
                  <li>
                      <a href="#">全部</a>
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
          </ul>

      </div>
  </form>
<div>
    <div class="news-form">
        <table>

            <tr class="news-form">
                <c:forEach items="${newsList}" var="news">
            <tr id="news-page">
                    <td>${news.newsCategory}</td>
                    <td><a href="viewNews?news_id=${news.newsId}">${news.newsTitle}<a></a></td>
                    <td>${news.newsPostDate}</td>
                <td>浏览量:${news.viewCount}</td>
                </tr>
            </c:forEach>
            </tr>
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
