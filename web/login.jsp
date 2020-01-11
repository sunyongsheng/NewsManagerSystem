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
            background-color: #FFFFFF;
        }

        .login-box {
            position: relative;
            top: 50%;
            left: 0;
            width: 100%;
            height: 100%;
        }

        .login-form {
            position: absolute;
            top: 10%;
            left: 50%;
            color: #0099CC;
            text-align: center;
            background-color: white;
        }

        .login-form h1 {
            margin-top: 0;
            font-weight: bold;
        }

        .input-style {
            display: block;
            box-sizing: border-box;
            width: 240px;
            background: white;
            border: 1px solid #0099CC;
            padding: 10px 20px;
            color: #666666;
            outline: none;
            margin: 15px 0;
            border-radius: 20px;
            text-align: center;
        }

        .login-btn {
            width: 150px;
            background: #0099CC;
            border: 0;
            color: white;
            padding: 8px 10px;
            border-radius: 20px;
            cursor: pointer;
            margin-bottom: 10px;
        }

        .hide-login-btn {
            color: black;
            position: absolute;
            top: 0%;
            right:40px;
            cursor: pointer;
            font-size: 24px;
        }
    </style>
</head>
<body>
<div align="center" style="margin-top: 150px">
    <form action="login" method="post">

        <div class="login-box">
            <form class="login-form">
                <div class="hide-login-btn"><i class="fa fa-times" aria-hidden="true" onclick="javascript: window.location.href = 'getAllNews'"></i>
                </div>
                <h2 style="font-weight: bold">Welcome</h2>
                <input class="input-style" type="text" name="username" placeholder="用户名">
                <input class="input-style" type="password" name="password" placeholder="密码">
                <input class="login-btn" type="submit" value="登录">
                <p style="color: black; font-size: 15px">没有账户？<a href="add-author.jsp">注册</a></p>
                <p style="color: indianred;">${loginMessage}</p>
            </form>
        </div>
    </form>
</div>

</body>
</html>
