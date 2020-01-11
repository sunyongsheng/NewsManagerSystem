<%--
  Created by IntelliJ IDEA.
  User: aengus
  Date: 2020/1/10
  Time: 19:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
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
            margin: 5px 0;
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
            margin-top: 5px;
            margin-bottom: 10px;
        }

        .hide-login-btn {
            color: black;
            position: absolute;
            right:40px;
            cursor: pointer;
            font-size: 24px;
        }
    </style>
</head>
<body>
<div align="center" style="margin-top: 150px">
    <form action="addAuthor" method="post">
        <div class="login-box">
            <form class="login-form">
                <div class="hide-login-btn"><i class="fa fa-times" aria-hidden="true" onclick="javascript: window.location.href = 'getAllNews'"></i>
                </div>
                <h1 style="font-weight: bold">Welcome</h1>
                <table border="0" style="position: relative;left: 4%">
                    <tr>
                        <td>
                            <input class="input-style" type="text" name="author_id" id="author_id" placeholder="用户名" onblur="checkIdCanUse()">
                        </td>
                        <td><p id="author_id_msg" style="color: indianred; width: 120px; font-size: 13px"></p></td>
                    </tr>
                    <tr>
                        <td>
                            <input class="input-style" type="password" name="author_password" id="password" placeholder="密码" onblur="checkPasswordStrength()">
                        </td>
                        <td>
                            <p id="password_msg" style="color: indianred; width: 120px; font-size: 13px"></p>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input class="input-style" type="password" name="password_again" id="password_again" placeholder="确认密码" onblur="checkPasswordAgain()">
                        </td>
                        <td>
                            <p id="password_again_msg" style="color: indianred; width: 120px; font-size: 13px"></p>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input class="input-style" type="text" name="author_name" placeholder="姓名">
                        </td>
                        <td>

                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="position: relative;left: 13%">
                            <input class="login-btn" type="submit" value="注册">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="position: relative;left: 18%">
                            <p style="color: black; font-size: 15px">已有账户？<a href="login.jsp">登录</a></p>
                        </td>
                    </tr>
                </table>

            </form>
        </div>
    </form>
</div>
</body>
<script>

    function checkPasswordStrength() {
        var password = document.getElementById("password");
        var passwordMsg = document.getElementById("password_msg");
        if (password.value.length <= 6) {
            passwordMsg.innerText = "长度必须大于6"
        } else {
            passwordMsg.innerText = null;
        }
    }

    function checkPasswordAgain() {
        var password = document.getElementById("password");
        var passwordAgain = document.getElementById("password_again");
        var passwordAgainMsg = document.getElementById("password_again_msg");
        if (password.value !== passwordAgain.value) {
            passwordAgainMsg.innerText = "两次密码必须一致！"
        } else {
            passwordAgainMsg.innerText = null;
        }
    }
    function crateXml() {
        try {
            return new XMLHttpRequest();
        } catch (e) {
            e.printStackTrace();
            try {
                return new ActiveObject("Microsoft.XMLHttp");
            } catch (e) {
                alert("浏览器版本过低");
            }
        }
    }
    function checkIdCanUse() {
        let name = document.getElementById("author_id").value;
        let msg = document.getElementById("author_id_msg");
        let xmlHttp = crateXml();
        xmlHttp.open("get", "existId?author_id=" + name, true);
        xmlHttp.send(null);
        xmlHttp.onreadystatechange = function () {
            if (xmlHttp.readyState === 4 && xmlHttp.status === 200) {
                msg.innerText = xmlHttp.responseText;
            } else {
                msg.innerText = "此账号可用";
            }
        }
    }
</script>
</html>
