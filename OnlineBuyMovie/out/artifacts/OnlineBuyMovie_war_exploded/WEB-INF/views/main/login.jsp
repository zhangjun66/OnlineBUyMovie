<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/10/20
  Time: 23:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">

    <title>影院登陆</title>
    <meta name="keywords" content="" />
    <meta name="description" content="" />
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel='stylesheet' href='http://fonts.googleapis.com/css?family=PT+Sans:400,700'>
    <link rel="stylesheet" href="<%=basePath%>assets/css/reset.css">
    <link rel="stylesheet" href="<%=basePath%>assets/css/supersized.css">
    <link rel="stylesheet" href="<%=basePath%>assets/css/style.css">
    <script src="<%=basePath%>assets/js/jquery-1.8.2.min.js"></script>
    <script src="<%=basePath%>assets/js/supersized.3.2.7.min.js"></script>
    <script src="<%=basePath%>assets/js/supersized-init.js"></script>
    <script src="<%=basePath%>assets/js/scripts.js"></script>

</head>

<body>

<div class="page-container">
    <h1>影院管理员登陆管理员登陆</h1>
    <form action="<%=basePath%>cinema/login.do" method="post">
        <input type="text" name="uname" class="username" required="" placeholder="用户名">
        <input type="password" name="pwd" class="password" required="" placeholder="密码">
        <button type="submit">登陆</button>
        <div class="error"><span>+</span></div>
    </form>
</div>
</body>

</html>