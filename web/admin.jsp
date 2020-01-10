<%--
  Created by IntelliJ IDEA.
  User: 10037
  Date: 2020/1/10
  Time: 9:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>管理员界面</title>
</head>
<body>
<form align="right">
    <td>
        <input type="button" value="退出" onclick="back()">
    </td>
</form>
<div align="center">
    <h2>欢迎${userMessage}使用新闻管理系统</h2>
    <input type="button" value="新增" onclick="addNews()">
    <input type="button" value="编辑" onclick="editNews()">
    <input type="button" value="删除" onclick="delNews()">
</div>
<div align="center">
    <a style="color:red">${addNewsMessage}</a>
    <a style="color:red">${editMessage}</a>
    <table>
        <tr>
            <td align="center">
                <input type="checkbox" onclick="checkAll()" id="chkAll">
            </td>
            <td>新闻标题</td>
            <td>上传时间</td>
            <td>更新时间</td>
        </tr>
        <c:forEach items="${newsList}" var="news">
            <tr>
                <td align="center"><input type="checkbox" value="${news.newsId}" name="chk" onclick="unCheck(this)"></td>
                <td align="center">${news.newsTitle}</td>
                <td align="center">${news.newsPostDate}</td>
                <td align="right">${news.newsUpdateDate}</td>
            </tr>
        </c:forEach>
    </table>
</div>

<div align="center">
    <input type="button" value="新增" onclick="addAuthor()">
    <input type="button" value="编辑" onclick="editAuthor()">
    <input type="button" value="删除" onclick="delAuthor()">
</div>
<div align="center">
    <a style="color:red">${addAuthorMessage}</a>
    <a style="color:red">${editAuthorMessage}</a>
    <table>
        <tr>
            <td align="center">
                <input type="checkbox" onclick="checkAll2()" id="chkAll2">
            </td>
            <td>作者编号</td>
            <td>作者密码</td>
            <td>作者姓名</td>
        </tr>
        <c:forEach items="${authorList}" var="author">
            <tr>
                <td align="center"><input type="checkbox" value="${author.authorId}" name="chk2" onclick="unCheck2(this)"></td>
                <td align="center">${author.authorId}</td>
                <td align="center">${author.authorPassword}</td>
                <td align="right">${author.authorName}</td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
<script>
    function back() {
        window.location.href = "getAllNews?quit=true";
    }
    function addNews() {
        location.href="add-news.jsp";
    }
    function addAuthor() {
        location.href = "add-author.jsp";
    }

    function editAuthor(){
        var chks = document.getElementsByName("chk2");
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
            window.location.href = "editAuthor?news_id=" + news_id;
        }

    }

    function delAuthor(){
        var chks = document.getElementsByName("chk2");
        var authorIds = "";
        for (var i = 0; i < chks.length; i++) {
            if(chks[i].checked){
                authorIds += chks[i].value ;
                authorIds  += ",";
            }
        }
        if(authorIds === ""){
            alert("请选择要删除的作者");
        }else{
            if(confirm("确定删除么?")){
                window.location.href = "deleteAuthor?author_id=" + authorIds;
            }
        }
    }

    function checkAll() {
        var node = document.getElementById("chkAll");
        var chks = document.getElementsByName("chk");
        if (node.checked) {//全选框被选中
            for (var i = 0; i < chks.length; i++) {
                chks[i].checked = true;
            }
        } else {
            for (var i = 0; i < chks.length; i++) {
                chks[i].checked = false;
            }
        }

    }

    function checkAll2() {
        var node = document.getElementById("chkAll2");
        var chks = document.getElementsByName("chk2");

        if (node.checked) {//全选框被选中
            for (var i = 0; i < chks.length; i++) {
                chks[i].checked = true;
            }
        } else {
            for (var i = 0; i < chks.length; i++) {
                chks[i].checked = false;
            }
        }

    }

    function unCheck2(chk_s){
        var chkall = document.getElementById("chkAll2");
        if (!chk_s.checked) {
            chkall.checked = false;
        } else {
            var chks = document.getElementsByName("chk2");
            var isAll = true;//标记目前是否全选
            for (var i = 0; i < chks.length; i++) {
                if(!chks[i].checked){
                    isAll = false;
                    break;
                }
            }
            chkall.checked = isAll;

        }
    }

    function unCheck(chk_s){
        var chkall = document.getElementById("chkAll");
        if (!chk_s.checked) {
            chkall.checked = false;
        } else {
            var chks = document.getElementsByName("chk");
            var isAll = true;//标记目前是否全选
            for (var i = 0; i < chks.length; i++) {
                if(!chks[i].checked){
                    isAll = false;
                    break;
                }
            }
            chkall.checked = isAll;
        }
    }
</script>
</html>