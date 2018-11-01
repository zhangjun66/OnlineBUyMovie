<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/10/30
  Time: 14:29
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

    <title>My JSP 'index.jsp' starting page</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
    <link href="css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
</head>

<body>
<div class="wrapper wrapper-content animate fadeInRight">
    <form action="<%=basePath%>back/addcity.do" method="post">
        <table>
            <label class="col-sm-2 control-label" style="font-size: 15px">填入信息</label>
            <tr style="font-size: 15px">
                <td>城市编号</td>
                <td><input type="text" name="cno" /></td>
            </tr>
            <tr style="font-size: 15px">
                <td>城市名称</td>
                <td><input type="text" name="cityname" /></td>
            </tr>
            <tr style="font-size: 15px">
                <td><input type=submit value=提交 /></td>
            </tr>
            <tr style="font-size: 15px;color: #2b542c">
                <td>${msg}</td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
