<%--
  Created by IntelliJ IDEA.
  User: 成家皓
  Date: 2020/1/9
  Time: 14:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<script>
    function manage() {


    }
</script>
<head>
    <title>新闻首页</title>
</head>
<body>
<div align="center">
    <h2>后台管理</h2>
    <form action="login" method="post">
        <h4>管理员登录</h4>
        <table>
            <tr>
                <td align="right">用户名:</td>
                <td><input type="text" name="username"></td>
            </tr>
            <tr>
                <td align="right">密码：</td>
                <td><input type ="text" name="password"></td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" value="登录" >
                </td>
            </tr>
        </table>
    </form>
</div>

</body>
</html>
