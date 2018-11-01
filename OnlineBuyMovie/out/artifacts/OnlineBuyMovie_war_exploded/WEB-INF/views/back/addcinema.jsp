<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/10/30
  Time: 14:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <link href="css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <script src="js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
</head>
<body class="gary-bg">
<div class="wrapper wrapper-content animate fadeInRight">
    <form action="<%=basePath%>back/addcinema.do" method="post">
        <table>
            <label class="col-sm-2 control-label" style="font-size: 15px">填入信息</label>

            <tr>
                <td>城市</td>
                <td>
                    <select name="cno" onchange="getarea()" id="cno">
                        <option value="">城市选择</option>
                        <c:forEach var="city" items="${citys}">
                            <option value="${city.cno}">${city.cityname}</option>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            <script TYPE="text/javascript">
                function getarea() {
                    var cno = document.getElementById("cno");
                    var arurl = "<%=basePath%>back/getarea.do?cno="+cno.value;
                    $.ajax({
                        type: "get",
                        url: arurl,
                        success: function (msg) {
                            var json = eval("(" + msg + ")");
                            $('#dno').empty();
                            for(var j = 0;j <json.length; j++){
                                $('#dno').append("<option value="+json[j].dno+">"+json[j].dname+"</option>");
                            }
                        }
                    })
                }
            </script>
            <tr>
                <td>区域</td>
                <td>
                    <select name="dno" id="dno">
                    </select>
                </td>
            </tr>
            <tr style="font-size: 15px">
                <td>影院编号</td>
                <td><input type="text" name="cid" /></td>
            </tr>
            <tr style="font-size: 15px">
                <td>影院名称</td>
                <td><input type="text" name="cname" /></td>
            </tr>
            <tr style="font-size: 15px">
                <td>影院地址</td>
                <td><input type="text" name="address" /></td>
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
