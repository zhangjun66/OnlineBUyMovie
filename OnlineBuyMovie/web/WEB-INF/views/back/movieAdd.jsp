<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">

    <title>My JSP 'BookAdd.jsp' starting page</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>css/easyui.css">
    <%--<link rel="stylesheet" type="text/css" href="<%=basePath%>css/themes/icon.css">--%>

    <link type="text/css" href="<%=basePath%>/css/jquery-ui-1.8.17.custom.css" rel="stylesheet" />
    <link type="text/css" href="<%=basePath%>/css/jquery-ui-timepicker-addon.css" rel="stylesheet" />
    <script type="text/javascript" src="<%=basePath%>/js/jquery-1.7.1.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>/js/jquery-ui-1.8.17.custom.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>/js/jquery-ui-timepicker-addon.js"></script>
    <script type="text/javascript" src="<%=basePath%>/js/jquery-ui-timepicker-zh-CN.js"></script>

    <script type="text/javascript">
        $(function () {
            $(".ui_timepicker").datetimepicker({
                //showOn: "button",
                //buttonImage: "./css/images/icon_calendar.gif",
                //buttonImageOnly: true,
                showSecond: true,
                timeFormat: 'hh:mm:ss',
                stepHour: 1,
                stepMinute: 1,
                stepSecond: 1
            })
        })
    </script>
</head>

<body>


<table align="center" width=90%>

    <tr>
        <td align="left"><h2>影片上架</h2></td>
    </tr>
    <tr>
        <td>
            <form id="jvForm" action="<%=basePath%>back/addMovie.do" method="post" enctype="multipart/form-data"
                  onsubmit="return validName()">
                <table border="0" width=60% align="center">
                    <tr>
                        <td>影片类型</td>
                        <td>
                            <c:forEach var="mt" items="${types}">
                                <input type="checkbox" name="types" value="${mt.tyno}"/>${mt.tyname}
                            </c:forEach>
                        </td>
                    </tr>
                    <tr>
                        <td>影片id</td>
                        <td><input type="text" name="mid" value="m001"/></td>
                    </tr>
                    <tr>
                        <td>影片名</td>
                        <td><input type="text" name="mname" value="mmmm"/></td>
                    </tr>
                    <tr>
                        <td>长度</td>
                        <td><input type="text" name="length"/><span id="NameNull"></span></td>
                    </tr>
                    <tr>
                        <td>导演</td>
                        <td><input type="text" name="director" value="aaa"/></td>
                    </tr>
                    <tr>
                        <td>地域</td>
                        <td><input type="text" name="area" value="aaa"/></td>
                    </tr>
                    <tr>
                        <td>上映时间</td>
                        <td><input type="text" name="date" class="ui_timepicker" value=""/></td>
                    </tr>
                    <tr>
                        <td>简介</td>
                        <td><input type="text" name="details" precision="2" value="aaa"></td>
                    </tr>
                    <tr>
                        <td>演员</td>
                        <td><input type="text" name="actor" value="nnnn"/></td>
                    </tr>
                    <tr>
                        <td>上映状态</td>
                        <td>
                            <select name="state">
                                <option value="1">正在热映</option>
                                <option value="2">即将上映</option>
                            </select>
                        </td>
                    </tr>

                    <tr>
                        <td>封面</td>
                        <td>
                            <!-- 方便提交给后台，存到数据库 -->
                            <input type="hidden" name="cover" id="path"/>
                                <img width="100" height="100" id="allImgUrl" src=""/>
                            <input type="file" onchange="uploadPic()" name="pic"/>
                            </td>
                    </tr>
                    <script type="text/javascript">
                        //上传图片
                        function uploadPic() {
                            var jvForm = new FormData(document.getElementById("jvForm"));
                            //定义参数
                            $.ajax({
                                url: "<%=basePath%>back/upPic.do",
                                type: "post",
                                data: jvForm,
                                dataType: "json",
                                processData: false,
                                contentType: false,
                                success: function (data) {
                                    for (var k in data) {
                                        var allImgUrl = document.getElementById("allImgUrl");
                                        var path = document.getElementById("path");
                                        path.value = data[k].url;
                                        allImgUrl.src = data[k].url;
                                    }
                                }
                            });
                        }
                    </script>


                    <tr>
                        <td colspan=2 align=center><input type=submit value="提交"/></td>
                    </tr>
                    <tr>
                        <td>${msg}</td>
                    </tr>
                </table>
            </form>
        </td>
    </tr>
</table>

</body>
</html>
