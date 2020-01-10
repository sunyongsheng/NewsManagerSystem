<%--
  Created by IntelliJ IDEA.
  User: aengus
  Date: 2020/1/9
  Time: 9:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<script>
  function login() {
      location.href = "admin.jsp";
  }
</script>
  <head>
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
              font-family sans-serif;
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
      </style>
  </head>

<body>
  <form align="right">
    <td>
      <input type="button" value="登录" onclick="login()">
    </td>
  </form >
  <h1 align="center">网站名</h1>
  <div class="search-box">
      <input class="search-txt" type="text" name="" placeholder="Type to search">
      <a class="search-btn" href="#">

      </a>

  </div>
  <form>
      <div style="margin: 0;padding: 0;background-color: #f1f1f1;" align="center">
          <ul id="menu">
              <ul>
                  <li>
                      <a href="#">体育</a>
                  </li>
                  <li>
                      <a href="#">财经</a>
                  </li>
                  <li>
                      <a href="#">时政</a>
                  </li>
                  <li>
                      <a href="#">教育</a>
                  </li>
                  <li>
                      <a href="#">文化</a>
                  </li>
                  <li>
                      <a href="#">科技</a>
                  </li>
              </ul>
          </ul>

      </div>
  </form>
  </body>
</html>
