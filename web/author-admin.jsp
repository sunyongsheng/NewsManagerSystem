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
    <title>读者界面</title>
</head>
<script>
    function back() {
        location.href = "index.jsp";

    }
    function addNews() {
        location.href="add.jsp";
    }

    function editNews(){
        //首先判断用户是否选择了要编辑的记录
        var chks = document.getElementsByName("chk");
        var count = 0;//用来记录用户选择的记录数
        var index = 0;//用来记录被选中的复选框的序号
        for (var i = 0; i < chks.length; i++) {
            if (chks[i].checked) {
                count ++;//等价于count + 1
                index = i;
            }
        }
        //判断用户选择的记录数是否符合要求
        if (count === 0) {
            alert("请选择要编辑的新闻");
        } else if (count > 1){
            alert("只能选择一条数据进行编辑");
        } else {
            //进行编辑操作
            //获取要编辑新闻的信息
            var news_id = chks[index].value;
            alert(news_id);
            //进入编辑页面,将当前新闻的信息显示在编辑页面中
            //我们从数据库中获取新闻信息,首先要调用后台获取数据
            //然后再把数据返回到前台,进行显示
            window.location.href = "edit?news_id="+news_id;
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
                window.location.href = "devareNews?news_ids=" + news_ids + "&&author_id=" + ${userMessage};
            }
        }
    }

    function checkAll() {
        //获取全选框
        var node = document.getElementById("chkAll");
        //获取记录前的复选框
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

    function unCheck(chk_s){
        //获取全选框
        var chkall = document.getElementById("chkAll");
        if (!chk_s.checked) {//当前复选框没有选中,那么全选框也不被选中
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
<body>
<form align="right">
    <td>
        <input type="button" value="退出" onclick="back()">
    </td>
</form>
<div align="center">
    <h2>欢迎${userMessage}使用新闻管理系统</h2>
    <input type="button" value="新增" onclick=" addNews()">
    <input type="button" value="编辑" onclick="editNews()">
    <input type="button" value="删除" onclick="delNews()">
</div>
<div align="center">
    <table>
        <tr>
            <td align="center">
                <input type="checkbox" onclick="" id="chkAll">
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
</body>
</html>
