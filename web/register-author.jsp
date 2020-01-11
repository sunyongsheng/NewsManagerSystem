<%--
  Created by IntelliJ IDEA.
  User: aengus
  Date: 2020/1/11
  Time: 15:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>作者注册</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/font-awesome/4.7.0/css/font-awesome.css">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
<div align="center" style="margin-top: 150px">
    <form action="addAuthor" method="post" onsubmit="return canRegister()">
        <div class="login-box">
            <form class="login-form">
                <div class="hide-login-btn"><i class="fa fa-times" aria-hidden="true" onclick="javascript: window.location.href = 'getAllNews'"></i>
                </div>
                <h1 style="font-weight: bold">Welcome</h1>
                <table border="0" style="position: relative;left: 4%">
                    <tr>
                        <td>
                            <input class="circular-input-style" type="text" name="author_id" id="author_id" placeholder="用户名" onblur="checkIdCanUse()">
                        </td>
                        <td><p id="author_id_msg" style="color: indianred; width: 120px; font-size: 13px"></p></td>
                    </tr>
                    <tr>
                        <td>
                            <input class="circular-input-style" type="password" name="author_password" id="password" placeholder="密码" onblur="checkPasswordStrength()">
                        </td>
                        <td>
                            <p id="password_msg" style="color: indianred; width: 120px; font-size: 13px"></p>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input class="circular-input-style" type="password" name="password_again" id="password_again" placeholder="确认密码" onblur="checkPasswordAgain()">
                        </td>
                        <td>
                            <p id="password_again_msg" style="color: indianred; width: 120px; font-size: 13px"></p>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input class="circular-input-style" type="text" name="author_name" placeholder="姓名">
                        </td>
                        <td>

                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="position: relative;left: 13%">
                            <input class="confirm-btn" type="submit" value="注册">
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
    function canRegister() {
        return checkIdCanUse()&&checkPasswordStrength()&&checkPasswordAgain();
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
                return xmlHttp.responseText === "此账号可用";
            } else {
                msg.innerText = "此账号可用";
                return true;
            }
        };
    }
</script>
</html>
