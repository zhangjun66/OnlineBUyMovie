<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/10/30
  Time: 11:33
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

    <title>网站后台内容管理系统登录</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <link href="<%=basePath%>public/css/base.css" rel="stylesheet" type="text/css">
    <link href="<%=basePath%>public/css/login.css" rel="stylesheet" type="text/css">
</head>
<body>

<div class="login">
    <form action="" method="post" id="form">
        <div class="logo"></div>
        <div class="login_form">
            <div class="user">
                <input class="text_value" value="" name="uname" type="text" id="username">
                <input class="text_value" value="" name="pwd" type="password" id="password">
            </div>
            <button class="button" id="submit" type="submit">登录</button>
        </div>

        <div id="tip"></div>
    </form>
</div>
<script>var basedir='<%=basePath%>public/ui/';</script>
<script src="<%=basePath%>public/ui/do.js"></script>
<script src="<%=basePath%>public/ui/config.js"></script>
<script>
    Do.ready('form', function() {
        $("#form").Validform({
            ajaxPost:true,
            postonce:true,
            tiptype:function(msg,o,cssctl){
                if(!o.obj.is("form")){
                    var objtip=o.obj.siblings(".Validform_checktip");
                    cssctl(objtip,o.type);
                    objtip.text(msg);
                }else{
                    var objtip=o.obj.find("#tip");
                    cssctl(objtip,o.type);
                    if(o.type==2){
                        window.location.href='index.php?r=admin/index/index';
                    }else{
                        objtip.text(msg);
                    }
                }
            }
        });
    });

</script>
</body>
</html>