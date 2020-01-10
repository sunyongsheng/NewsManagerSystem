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
            background-color: grey;
        }

        .login-box {
            position: relative;
            top: 30%;
            left: 0;
            width: 100%;
            height: 100%;
        }

        .login-form {
            position: absolute;
            top: 0;
            left: 50%;
            color: black;
            text-align: center;
            background-color: white;
        }

        .login-form h1 {
            font-weight: 400;
            margin-top: 0;
        }

        .txtb {
            display: block;
            box-sizing: border-box;
            width: 240px;
            background: #ffffff28;
            border: 1px solid black;
            padding: 10px 20px;
            color: black;
            outline: none;
            margin: 10px 0;
            border-radius: 10px;
            text-align: center;
        }

        .login-btn {
            width: 240px;
            background: #2c3e50;
            border: 0;
            color: white;
            padding: 10px;
            border-radius: 6px;
            cursor: pointer;
        }

        .hide-login-btn {
            color: black;
            position: absolute;;
            top: 40px;
            right: 40px;
            cursor: pointer;
            font-size: 24px;
        }
    </style>
</head>
<body>
<div align="center" style="margin-top: 120px">
    <form action="login" method="post">
        <div class="login-box">
            <form class="login-form">
                <div class="hide-login-btn"><i class="fa fa-times" aria-hidden="true" onclick="javascript: window.location.href = 'getAllNews'"></i>
                </div>
                <h3 style="color: black; font-weight: bold">Welcome</h3>
                <input class="txtb" type="text" name="username" placeholder="用户名">
                <input class="txtb" type="password" name="password" placeholder="密码">
                <input class="login-btn" type="submit" value="登录">
                <p class="message" style="color: black">没有账户？<a href="add-author.jsp">注册</a></p>
                <a class="message" style="color: red;">${loginMessage}</a>
            </form>
        </div>

    </form>
</div>

</body>
</html>
