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
  </head>

<body>
  <form align="right">
    <td>
      <input type="button" value="登录" onclick="login()">
    </td>
  </form >
  <h1 align="center">网站名</h1>
  <form>
      <div style="margin: 0;padding: 0;background-color: #f1f1f1;">
          <ul id="menu" style="margin: 0;padding: 0;">
              <ul>
                  <li><a href="#"
                         style="text-decoration: none;position: relative;color: #313131;font-size: 50px;font-weight: 700;font-family sans-serif; display: block; overflow: hidden;transition: 0.7s all;padding: 14px 20px;">体育</a>
                  </li>
                  <li><a href="#"
                         style="text-decoration: none;position: relative;color: #313131;font-size: 50px;font-weight: 700;font-family sans-serif; display: block; overflow: hidden;transition: 0.7s all;padding: 14px 20px;">财经</a>
                  </li>
                  <li><a href="#"
                         style="text-decoration: none;position: relative;color: #313131;font-size: 50px;font-weight: 700;font-family sans-serif; display: block; overflow: hidden;transition: 0.7s all;padding: 14px 20px;">时政</a>
                  </li>
                  <li><a href="#"
                         style="text-decoration: none;position: relative;color: #313131;font-size: 50px;font-weight: 700;font-family sans-serif; display: block; overflow: hidden;transition: 0.7s all;padding: 14px 20px;"
                         v>教育</a></li>
                  <li><a href="#"
                         style="text-decoration: none;position: relative;color: #313131;font-size: 50px;font-weight: 700;font-family sans-serif; display: block; overflow: hidden;transition: 0.7s all;padding: 14px 20px;">文化</a>
                  </li>
                  <li><a href="#"
                         style="text-decoration: none;position: relative;color: #313131;font-size: 50px;font-weight: 700;font-family sans-serif; display: block; overflow: hidden;transition: 0.7s all;padding: 14px 20px;">科技</a>
                  </li>
              </ul>
          </ul>

      </div>
  </form>
  </body>
</html>
