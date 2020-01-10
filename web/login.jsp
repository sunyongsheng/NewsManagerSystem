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
            top: 70%;
            left: 50%;
            transform: translate(-50%, -50%);
            color: slategray;
            text-align: center;
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
            border: 1px solid white;
            padding: 10px 20px;
            color: black;
            outline: none;
            margin: 10px 0;
            border-radius: 6px;
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
            opacity: .7;
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
                <div class="hide-login-btn"><i class="fa fa-times" aria-hidden="true"></i>

                </div>
                <h3>欢迎登录 </h3>
                <input class="txtb" type="text" name="username">
                <input class="txtb" type="password" name="password">
                <input class="login-btn" type="submit" value="登录">
            </form>
        </div>

    </form>
</div>

</body>
</html>
