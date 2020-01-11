<%--
  Created by IntelliJ IDEA.
  User: 成家皓
  Date: 2020/1/9
  Time: 14:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<link href="css/bootstrap.css" rel="stylesheet">
<head>
    <title>新闻首页</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/font-awesome/4.7.0/css/font-awesome.css">
    <link rel="stylesheet" href="css/style.css">
</head>
<body style="background:whitesmoke">
<div align="center" style="margin-top: 150px">
    <form action="login" method="post">

        <div class="login-box">
            <form class="login-form">
                <div class="hide-login-btn"><i class="fa fa-times" aria-hidden="true" onclick="javascript: window.location.href = 'getAllNews'"></i>
                </div>
                <h2 style="font-weight: bold">Welcome</h2>
                <input class="circular-input-style" type="text" name="username" placeholder="用户名">
                <input class="circular-input-style" type="password" name="password" placeholder="密码">
                <input class="confirm-btn" type="submit" value="登录">
                <p style="color: black; font-size: 15px">没有账户？<a href="register-author.jsp">注册</a></p>
                <p style="color: indianred;">${addAuthorMessage}</p>
                <p style="color: indianred;">${loginMessage}</p>
            </form>
        </div>
    </form>
</div>

</body>
</html>
