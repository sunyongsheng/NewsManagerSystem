<%--
  Created by IntelliJ IDEA.
  User: 成家皓
  Date: 2020/1/9
  Time: 15:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>作者界面</title>
    <link rel="stylesheet" href="css/style.css">
    <script>
        function back() {
            window.location.href = "getAllNews?quit=true";
        }
        function addNews() {
            location.href="add-news.jsp";
        }

        function editNews(){
            var chks = document.getElementsByName("chk");
            var count = 0;
            var index = 0;
            for (var i = 0; i < chks.length; i++) {
                if (chks[i].checked) {
                    count ++;
                    index = i;
                }
            }
            if (count === 0) {
                alert("请选择要编辑的新闻");
            } else if (count > 1){
                alert("只能选择一条数据进行编辑");
            } else {
                var news_id = chks[index].value;
                window.location.href = "editNews?news_id=" + news_id;
            }
        }

        function delNews(){
            var chks = document.getElementsByName("chk");
            var news_ids = "";
            for (var i = 0; i < chks.length; i++) {
                if(chks[i].checked){
                    news_ids += chks[i].value ;
                    news_ids  += ",";
                }
            }
            if(news_ids === ""){
                alert("请选择要删除的新闻");
            }else{
                if(confirm("确定删除么?")){
                    window.location.href = "deleteNews?news_ids=" + news_ids + "&author_id=${userMessage}";
                }
            }
        }

        function checkAll() {
            var node = document.getElementById("chkAll");
            var chks = document.getElementsByName("chk");
            if (node.checked) {
                for (var i = 0; i < chks.length; i++) {
                    chks[i].checked = true;
                }
            } else {
                for (var i = 0; i < chks.length; i++) {
                    chks[i].checked = false;
                }
            }
        }

        function unCheck(chk_s){
            var chkall = document.getElementById("chkAll");
            if (!chk_s.checked) {
                chkall.checked = false;
            } else {
                var chks = document.getElementsByName("chk");
                var isAll = true;
                for (var i = 0; i < chks.length; i++) {
                    if(!chks[i].checked){
                        isAll = false;
                        break;
                    }
                }
                chkall.checked = isAll;

            }
        }
        function checkAuth() {
            if ("${user}" !== "author") {
                alert("请先登录");
                location.href = "login.jsp";
            }
        }
    </script>
</head>
<body  onload="checkAuth()">
<form align="right">
    <td>
        <input class="quit-button" type="button" value="退出" onclick="back()">
    </td>
</form>
<div align="center" style="margin-top: 60px">
    <h1>欢迎${userMessage}使用新闻管理系统</h1>
    <input class="add-news-button" type="button" value="新增" onclick="addNews()">
    <input class="edit-news-button" type="button" value="编辑" onclick="editNews()">
    <input class="del-news-button" type="button" value="删除" onclick="delNews()">
    <a style="color:red">${addNewsMessage}</a>
    <a style="color:red">${editMessage}</a>
    <table class="table-news">
        <tr class="table-news-header">
            <td align="center">
                <input type="checkbox" onclick="checkAll()" id="chkAll">
            </td>
            <td align="center" class="table-row">新闻标题</td>
            <td align="center" class="table-row">上传时间</td>
            <td align="center" class="table-row">更新时间</td>
        </tr>
        <c:forEach items="${newsList}" var="news">
            <tr class="table-row">
                <td align="center"><input type="checkbox" value="${news.newsId}" name="chk" onclick="unCheck(this)"></td>
                <td align="center"><a class="no-baseline-href" href="viewNews?news_id=${news.newsId}">${news.newsTitle}</a></td>
                <td align="center">${news.newsPostDate}</td>
                <td align="center">${news.newsUpdateDate}</td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>
