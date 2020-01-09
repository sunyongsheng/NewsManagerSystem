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
      location.href = "author-admin.jsp";
    
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
    <div align="center">
      <tr align="center">
        <td>
          <input type="submit" name="财经" value="财经">
        </td>
        <td>
          <input type="submit" name="时政" value="时政">
        </td>
        <td>
          <input type="submit" name="教育" value="教育">
        </td>
        <td>
          <input type="submit" name="娱乐" value="娱乐">
        </td>
        <td>
          <input type="submit" name="文化" value="文化">
        </td>
        <td>
          <input type="submit" name="体育" value="体育">
        </td>
      </tr>
    </div>
  </form>
  </body>
</html>
