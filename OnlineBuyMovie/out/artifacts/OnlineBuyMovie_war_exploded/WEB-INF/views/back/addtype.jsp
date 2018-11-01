<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">

    <title>增加电影类型</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link href="css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
</head>
<body class="gary-bg">
<div class="wrapper wrapper-content animate fadeInRight">
    <form action="<%=basePath%>back/addtype.do" method="post">
        <table>
            <label class="col-sm-2 control-label" style="font-size: 15px">填入信息</label>
            <tr style="font-size: 15px">
                <td>类型编号</td>
                <td><input type="text" name="tyno" /></td>
            </tr>
            <tr style="font-size: 15px">
                <td>类型名称</td>
                <td><input type="text" name="tyname" /></td>
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
