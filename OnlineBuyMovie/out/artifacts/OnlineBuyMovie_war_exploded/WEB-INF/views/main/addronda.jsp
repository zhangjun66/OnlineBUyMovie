<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>增加场次</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" href="favicon.ico">
<link href="css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
<link href="css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
<link href="css/plugins/iCheck/custom.css" rel="stylesheet">
<link href="css/plugins/chosen/chosen.css" rel="stylesheet">
<link href="css/plugins/colorpicker/css/bootstrap-colorpicker.min.css"
	rel="stylesheet">
<link href="css/plugins/cropper/cropper.min.css" rel="stylesheet">
<link href="css/plugins/switchery/switchery.css" rel="stylesheet">
<link href="css/plugins/jasny/jasny-bootstrap.min.css" rel="stylesheet">
<link href="css/plugins/nouslider/jquery.nouislider.css"
	rel="stylesheet">
<link href="css/plugins/datapicker/datepicker3.css" rel="stylesheet">
<link href="css/plugins/ionRangeSlider/ion.rangeSlider.css"
	rel="stylesheet">
<link href="css/plugins/ionRangeSlider/ion.rangeSlider.skinFlat.css"
	rel="stylesheet">
<link
	href="css/plugins/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css"
	rel="stylesheet">
<link href="css/plugins/clockpicker/clockpicker.css" rel="stylesheet">
<link href="css/animate.min.css" rel="stylesheet">
<link href="css/style.min862f.css?v=4.1.0" rel="stylesheet">

</head>

<body class="gray-bg">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div align="center"><span style="align-content: center;color: #00C1B3;font-size: 16px">${msg}</span></div>

		<div class="row">
		<form  id="myform" method="post" action="<%=basePath%>cinema/addronda.do">
			<!-- col-sm-12 -->
			<div class="col-sm-5">
				<!--
				----第一个卡片-----------------------------------------------------------------------------------------------------
				--->
				<div class="ibox float-e-margins">
				
					<!-- 头 -->
				
					<div class="ibox-title">
						<h5>
							选择播放时间 
						</h5>
						<div class="ibox-tools">
							<a class="collapse-link"> <i class="fa fa-chevron-up"></i>
							
							
							</a>
						</div>
					</div>
					
					<!-- neir -->
					
					<div class="ibox-content">
							<!-- 天op -->
							<p>选择日期</p>
							<div class="form-group" id="data_1">
				
							<div class="input-group date">
								<span class="input-group-addon"><i class="fa fa-calendar"></i></span>
								<input id ="ptime" type="text" required="" class="form-control" value="2018-10-23" name="playtimes">
							</div>
							<!-- 时间op -->
							<div class="hr-line-dashed"></div>
							<p>选择开始时间</p>
							<div class="input-group clockpicker" data-autoclose="true">
								<input id="btime" type="text" required="" class="form-control" value="09:30" name="begintime" >
                                <span	class="input-group-addon"> <span class="fa fa-clock-o"></span>
								</span>
							</div>
							<!-- 时间op -->
							<div class="hr-line-dashed"></div>
							<p>选择结束时间</p>
							<div class="input-group clockpicker" data-autoclose="true">
								<input id="etime" type="text" required="" class="form-control" value="10:45" name="endtime"> <span
									class="input-group-addon"> <span class="fa fa-clock-o"></span>
								</span>
							</div>
						</div>

					</div>
				</div>
				<!--
				-----第二个卡片----------------------------------------------------------------------------------------------------------------
				--->
			</div>
				<!--
				----右边-----------------------------------------------------------------------------------------------------
				--->
			<div class="col-sm-6">
				<!--
				----第一个卡片-----------------------------------------------------------------------------------------------------
				--->
				<div class="ibox float-e-margins">
					<!-- 头 -->
					<div class="ibox-title">
						<h5>
							添加信息 <small>影片、影厅、价格</small>
						</h5>
						<div class="ibox-tools">
							<a class="collapse-link"> <i class="fa fa-chevron-up"></i>
							
							</a>
						</div>
					</div>
					<!-- neir -->
					
					<div class="ibox-content">
							<!-- 下拉框op -->
							<div class="form-group">
							<label class="font-noraml">选择电影</label>
							<div class="input-group">
								<select data-placeholder="可搜索" class="chosen-select"
									style="width:350px;" tabindex="2" name="mid" required="">
									<option hassubinfo="true">...</option>
									<c:forEach var="movie" items="${movies}">
									<option hassubinfo="true" value="${movie.mid}">${movie.mname}</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<!-- 下拉框op -->
							<div class="form-group">
							<label class="font-noraml">选择影厅</label>
							<div class="input-group">
								<select data-placeholder="可搜索" class="chosen-select"
									style="width:350px;" tabindex="2" name="hno" required="">
									<option  hassubinfo="true">...</option>
									<c:forEach var="hall" items="${halls}">
									<option  hassubinfo="true" value="${hall.hno}">${hall.hno}</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<!-- 下拉框ed -->
						<!-- 下拉框op -->
							<div class="form-group">
							<label class="font-noraml">选择语言</label>
							<div class="input-group">
								<select data-placeholder="可搜索" class="chosen-select"
									style="width:350px;" tabindex="2" name="language" required="">
									<option  hassubinfo="true" value="中文">中文</option>
									<option  hassubinfo="true" value="英语">英语</option>
								</select>
							</div>
						</div>
						<!-- 下拉框ed -->
						<!-- 添加价格 -->
						<label class="font-noraml">添加价格</label>
							<div class="input-group date">
								<input type="text" required="" style="width:350px;" class="form-control" placeholder="以元为单位的纯数字" name="price">
							</div>	
						
							<!-- 提交按钮 -->
							<div class="hr-line-dashed"></div>
							<div class="col-sm-6 col-sm-offset-2">
									<button class="btn btn-primary" type="submit" onclick="tijiao()">确定添加</button>
							</div>
							<div class="hr-line-dashed"></div>
						<!-- 添加价格完 -->
							
						</div>

					</div>
				</div>
				
				</form>
		</div>
	</div>


	<div class="ibox-title  back-change">
	</div>


	<script type="text/javascript">
	  function tijiao(){
	  var ptime = document.getElementById("ptime");
	  var btime = document.getElementById("btime");
	  var etime = document.getElementById("etime");
	  btime.value = ptime.value +" "+ btime.value;
	  etime.value = ptime.value +" "+ etime.value;

	  }

	
	</script>
	<script src="js/jquery.min.js?v=2.1.4"></script>
	<script src="js/bootstrap.min.js?v=3.3.6"></script>
	<script src="js/content.min.js?v=1.0.0"></script>
	<script src="js/plugins/chosen/chosen.jquery.js"></script>
	<script src="js/plugins/jsKnob/jquery.knob.js"></script>
	<script src="js/plugins/jasny/jasny-bootstrap.min.js"></script>
	<script src="js/plugins/datapicker/bootstrap-datepicker.js"></script>
	<script src="js/plugins/prettyfile/bootstrap-prettyfile.js"></script>
	<script src="js/plugins/nouslider/jquery.nouislider.min.js"></script>
	<script src="js/plugins/switchery/switchery.js"></script>
	<script src="js/plugins/ionRangeSlider/ion.rangeSlider.min.js"></script>
	<script src="js/plugins/iCheck/icheck.min.js"></script>
	<script src="js/plugins/metisMenu/jquery.metisMenu.js"></script>
	<script src="js/plugins/colorpicker/bootstrap-colorpicker.min.js"></script>
	<script src="js/plugins/clockpicker/clockpicker.js"></script>
	<script src="js/plugins/cropper/cropper.min.js"></script>
	<script src="js/demo/form-advanced-demo.min.js"></script>
	<script type="text/javascript"
		src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
</body>
</html>
