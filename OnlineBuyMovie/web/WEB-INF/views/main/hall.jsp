<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'addhall.jsp' starting page</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="keywords" content="H+后台主题,后台bootstrap框架,会员中心主题,后台HTML,响应式后台">
<meta name="description"
	content="H+是一个完全响应式，基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术">

<link rel="shortcut icon" href="favicon.ico">
<link href="css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
<link href="css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
<link href="css/plugins/iCheck/custom.css" rel="stylesheet">
<link href="css/animate.min.css" rel="stylesheet">
<link href="css/style.min862f.css?v=4.1.0" rel="stylesheet">

</head>

<body class="gray-bg">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="row">
			<div class="col-sm-12">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<h5>
							影厅 <small>影厅的相关信息</small>
						</h5>
					</div>
					<div class="ibox-content">
						<form  id="myform" method="post" class="form-horizontal"
							action="<%=basePath%>admin/AddHallSvl">
							<div class="form-group">
								<label class="col-sm-2 control-label">信息如下</label>

								<div class="col-sm-10">
									<div class="row">
										<div class="col-md-2">
											<input value="${hall.name}" type="text" id="name"  name="name" placeholder="影厅名" class="form-control">
										</div>
										<div class="col-md-3">
											<input value="${hall.row}行" type="text" id="row" name="row" placeholder="座位总行数(小于99)" class="form-control">
										</div>
										<div class="col-md-4">
											<input value="${hall.col}列" type="text" id="col" name="col" placeholder="座位总列数(小于99)" class="form-control">
										</div>
									</div>
								</div>
							</div>
							<div class="hr-line-dashed"></div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="js/jquery.min.js?v=2.1.4"></script>
	<script src="js/bootstrap.min.js?v=3.3.6"></script>
	<script src="js/content.min.js?v=1.0.0"></script>
	<script src="js/plugins/iCheck/icheck.min.js"></script>
	<script>
		$(document).ready(function() {
			$(".i-checks").iCheck({
				checkboxClass : "icheckbox_square-green",
				radioClass : "iradio_square-green",
			})
		});
	
		function tijiao() {
			var tishi = document.getElementById("tishi");
			var name = document.getElementById("name").value;
			if (name.trim() == '') {
				tishi.innerHTML = "影厅名不能为空";
				return false;
			}
			var row = document.getElementById("row").value;
			if (row.trim() == '') {
				tishi.innerHTML = "行数不能为空";
				return false;
			}
			if ((/^[0-9_-]{3,100}$/).test($("#row").val())) {
				tishi.innerHTML = "行数输入错误";
				return false;
			}
			var col = document.getElementById("col").value;
			if (col.trim() == '') {
				tishi.innerHTML = "列数不能为空";
				return false;
			}
			if ((/^[0-9_-]{1,2}$/).test($("#col").val())) {
			}else{
				tishi.innerHTML = "列数输入错误";
				return false;
			}
			debugger;

<%-- 	        var destURL = "<%=basePath%>admin/AddHallSvl";
	      
	        $.ajax({
   			   type: "post",
   			   url: destURL,
   			   success: function(msg){     			
                   var msg = document.getElementById("tsmsg");
                   if(msg == 1){
                      tsmsg.innerHTML = "录入成功";
                   }else{
                      tsmsg.innerHTML = "录入失败，请与网络管理员联系";
                   } 
   			   }
		     }); --%>
			var myform = document.getElementById("myform");
			myform.submit();
		}
	</script>

	<script type="text/javascript"
		src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
</body>
</html>
