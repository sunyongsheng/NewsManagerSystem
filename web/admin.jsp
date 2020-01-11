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
    <link rel="stylesheet" href="css/style.css">
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
        function editNews(){
            var chks = document.getElementsByName("chk");
            var count = 0;
            var index = 0;
            for (var i = 0; i < chks.length; i++) {
                if (chks[i].checked) {
                    count ++;//等价于count + 1
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
                alert("请选择要编辑的作者");
            } else if (count > 1){
                alert("只能选择一条数据进行编辑");
            } else {
                var authorId = chks[index].value;
                window.location.href = "editAuthor?author_id=" + authorId;
            }

        }
        function delNews(){
            //获取所有复选框,查看是否选择了记录
            var chks = document.getElementsByName("chk");
            var news_ids = ""; //用来存储要删除的学生学号
            for (var i = 0; i < chks.length; i++) {
                if(chks[i].checked){
                    //当前复选框被选中,获取当前学生的学号
                    news_ids += chks[i].value ;
                    news_ids  += ","; //学号之间的分隔符
                }
            }
            if(news_ids === ""){
                alert("请选择要删除的新闻");
            }else{
                if(confirm("确定删除么?")){
                    //调用后台,执行删除操作
                    window.location.href = "deleteNews?news_ids=" + news_ids + "&admin_id=${userMessage}";
                }
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
        // 检查权限
        function checkAuth() {
            if ("${user}" !== "admin") {
                alert("请先登录");
                location.href = "login.jsp";
            }
        }
    </script>
</head>
<body  onload="checkAuth()">
<div>
    <input type="button" class="quit-button" value="退出" onclick="back()">
</div>
<div align="center">
    <h1>欢迎${userMessage}使用新闻管理系统</h1>
</div>
<div align="center"  style="margin-top: 20px">
    <h2>新闻管理</h2>
    <div>
        <input class="add-news-button" type="button" value="新增" onclick="addNews()">
        <input class="edit-news-button" type="button" value="编辑" onclick="editNews()">
        <input class="del-news-button" type="button" value="删除" onclick="delNews()">
    </div>
    <a style="color:red">${addNewsMessage}</a>
    <a style="color:red">${editMessage}</a>
    <table class="table-news">
        <tr class="table-news-header">
            <td align="center">
                <input type="checkbox" onclick="checkAll()" id="chkAll">
            </td>
            <td align="center">新闻标题</td>
            <td align="center">上传时间</td>
            <td align="center">更新时间</td>
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

<div align="center">
    <h2>作者管理</h2>
    <input class="add-author-button" type="button" value="新增" onclick="addAuthor()">
    <input class="edit-author-button" type="button" value="编辑" onclick="editAuthor()">
    <input class="del-author-button" type="button" value="删除" onclick="delAuthor()">
    <a style="color:red">${addAuthorMessage}</a>
    <a style="color:red">${editAuthorMessage}</a>
    <table class="table-author">
        <tr class="table-author-header">
            <td align="center">
                <input type="checkbox" onclick="checkAll2()" id="chkAll2">
            </td>
            <td align="center">作者编号</td>
            <td align="center">作者密码</td>
            <td align="center">作者姓名</td>
        </tr>
        <c:forEach items="${authorList}" var="author">
            <tr class="table-row">
                <td align="center"><input type="checkbox" value="${author.authorId}" name="chk2" onclick="unCheck2(this)"></td>
                <td align="center">${author.authorId}</td>
                <td align="center">${author.authorPassword}</td>
                <td align="center">${author.authorName}</td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>