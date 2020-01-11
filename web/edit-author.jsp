<%--
  Created by IntelliJ IDEA.
  User: aengus
  Date: 2020/1/11
  Time: 13:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>编辑作者</title>
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

        .edit-news-input-style {
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

        .confirm-btn {
            width: 5em;
            background: #0099CC;
            border: 0;
            color: white;
            padding: 8px 10px;
            border-radius: 20px;
            cursor: pointer;
            margin-top: 5px;
            margin-bottom: 10px;
        }
        .cancel-btn {
            width: 5em;
            background: #FF0033;
            border: 0;
            color: white;
            padding: 8px 10px;
            border-radius: 20px;
            cursor: pointer;
            margin-top: 5px;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
<div align="center" style="margin-top: 150px">
    <form action="saveAuthor" method="post" onsubmit="return canSave()">
        <div class="login-box">
            <form class="login-form">
                <h1 style="font-weight: bold">修改信息</h1>
                <table border="0" style="position: relative;left: 4%">
                    <tr>
                        <td>
                            <input class="circular-input-style" type="text" name="author_id" id="author_id" placeholder="用户名" value="${author.authorId}" readonly>
                        </td>
                        <td><p id="author_id_msg" style="color: indianred; width: 120px; font-size: 13px"></p></td>
                    </tr>
                    <tr>
                        <td>
                            <input class="circular-input-style" type="password" name="author_password" id="password" placeholder="密码" value="${author.authorPassword}" onblur="checkPasswordStrength()">
                        </td>
                        <td>
                            <p id="password_msg" style="color: indianred; width: 120px; font-size: 13px"></p>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input class="circular-input-style" type="password" name="password_again" id="password_again" placeholder="确认密码" value="${author.authorPassword}" onblur="checkPasswordAgain()">
                        </td>
                        <td>
                            <p id="password_again_msg" style="color: indianred; width: 120px; font-size: 13px"></p>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input class="circular-input-style" type="text" name="author_name" value="${author.authorName}" placeholder="姓名">
                        </td>
                        <td>

                        </td>
                    </tr>
                    <tr>
                        <td style="position: relative;left: 13%">
                            <input class="login-btn" type="submit" value="保存">
                            <input class="cancel-btn" type="button" value="取消" onclick="javascript: window.location.href='getAllNews'">
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </form>
</div>
</body>
<script>
    function canSave() {
        return checkPasswordStrength()&&checkPasswordAgain();
    }

    function checkPasswordStrength() {
        var password = document.getElementById("password");
        var passwordMsg = document.getElementById("password_msg");
        if (password.value.length <= 6) {
            passwordMsg.innerText = "长度必须大于6";
            return false;
        } else {
            passwordMsg.innerText = null;
            return true;
        }
    }

    function checkPasswordAgain() {
        var password = document.getElementById("password");
        var passwordAgain = document.getElementById("password_again");
        var passwordAgainMsg = document.getElementById("password_again_msg");
        if (password.value !== passwordAgain.value) {
            passwordAgainMsg.innerText = "两次密码必须一致！";
            return false;
        } else {
            passwordAgainMsg.innerText = null;
            return true;
        }
    }

</script>
</html>