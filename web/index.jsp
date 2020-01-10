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
              color: #313131;
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
              width: 30px;
              position: absolute;
              border-bottom: 6px solid #313131;
              bottom: 0px;
              right: 200px;
              transition: 0.7s all;
          }

          #menu li a:hover:before {
              right: 0;
          }

          body {
              margin: 0;
              padding: 0;
              background: #DCDCDC;
          }

          .search-box {
              position: absolute;
              top: 19.5%;
              left: 80%;
              transform: translate(-50, -50);
              background: #2f3640;
              height: 15px;
              border-radius: 10px;
              padding: 10px;

          }

          .search-box:hover > .search-txt {
              width: 170px;
              padding: 0 25px;
          }

          .search-box:hover > .search-btn {
              background: white;
          }

          .search-btn {
              color: #e84118;
              float: left;
              width: 35px;
              height: 35px;
              border-radius: 50%;
              background: #2f3640;
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
      </style>
  </head>

<body>
  <form align="right">
    <td>
      <input type="button" value="登录" onclick="login()">
    </td>
  </form >
  <h1 align="center">新闻管理系统</h1>
  <div class="search-box">
      <input class="search-txt" type="text" name="search_title" placeholder="输入搜索内容">
      <a class="search-btn" href="#">
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
<form>
    <div align="center">
        <table border="1">
            <c:forEach items="${newsList}" var="news">
                <tr>
                    <td>${news.newsCategory}</td>
                    <td>${news.newsTitle}</td>
                    <td>${news.newsPostDate}</td>
                    <td>${news.viewCount}</td>
                </tr>
            </c:forEach>
        </table>
    </div>

</form>
  </body>
</html>
