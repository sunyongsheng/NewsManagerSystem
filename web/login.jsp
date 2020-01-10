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
    <style>
        * {
            font-family: "montserrat", sans-serif;
        }

        body {
            margin: 0;
            padding: 0;
            background: #333;
        }

        .login-box {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100vh;
            background-image: linear-gradient(45deg, #9fbaa8, #31354c);
            transition: 0.4s;
        }

        .login-form {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
        }
    </style>
</head>
<body>
<div align="center">
    <h2>后台管理</h2>
    <form>
        <h4>管理员登录</h4>
        <a style="color:red">${loginMessage}</a>
        <div class="login-box">
            <form class="login-form" action="login" method="post">
                <h3>欢迎登录 </h3>
                <input class="txtb" type="text" name="username">
                <input class="txtb" type="password" name="password">
                <input type="submit" value="登录">
            </form>
        </div>

    </form>
</div>

</body>
</html>
