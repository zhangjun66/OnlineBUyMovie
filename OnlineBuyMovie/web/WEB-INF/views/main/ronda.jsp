<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'ronda.jsp' starting page</title>
    
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

		<div class="row">
		<form  id="myform" method="post" >
			<!-- col-sm-12 -->
			<div class="col-sm-5">
			
				<!--
				----第一个卡片-----------------------------------------------------------------------------------------------------
				--->
				<div class="ibox float-e-margins">
				
					<!-- 头 -->
				
					<div class="ibox-title">
						<h5>
							播放时间 
						</h5>
						<div class="ibox-tools">
							<a class="collapse-link"> <i class="fa fa-chevron-up"></i>
							
							
							</a>
						</div>
					</div>
					
					<!-- neir -->
					
					<div class="ibox-content">
							<!-- 天op -->
							<p>日期</p>
							<div class="form-group" id="data_1">
				
							<div class="input-group date">
								<span class="input-group-addon"><i class="fa fa-calendar"></i></span>
								<input type="text" class="form-control" value="${date}" name="playdate">
							</div>
							<!-- 时间op -->
							<div class="hr-line-dashed"></div>
							<p>开始时间</p>
							<div class="input-group clockpicker" data-autoclose="true">
								<input type="text" class="form-control" value="${begintime}" name="begintime"> <span
									class="input-group-addon"> <span class="fa fa-clock-o"></span>
								</span>
							</div>
							<div class="hr-line-dashed"></div>
							<p>结束时间</p>
							<div class="input-group clockpicker" data-autoclose="true">
								<input type="text" class="form-control" value="${endtime}" name="endtime"> <span
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
							信息 <small>影片、影厅、价格</small>
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
							<label class="font-noraml">电影</label>
							<div class="input-group">
							<input type="text" class="form-control" value="${mname}" name="mname">
<%-- 								<select data-placeholder="可搜索" class="chosen-select"
									style="width:350px;" tabindex="2" name="movieid">
									<option hassubinfo="true">...</option>
									<option hassubinfo="true" value="${movie.mid}">${movie.mname}</option>
								</select> --%>
							</div>
						</div>
						<!-- 下拉框op -->
							<div class="form-group">
							<label class="font-noraml">影厅</label>
							<div class="input-group">
							<input type="text" class="form-control" value="${hname}" name="hname">
<%-- 								<select data-placeholder="可搜索" class="chosen-select"
									style="width:350px;" tabindex="2" name="hallnob">
									<option  hassubinfo="true">...</option>
									<option  hassubinfo="true" value="${hall.hno}">${hall.name}</option>
								</select> --%>
							</div>
						</div>
						<!-- 下拉框ed -->
						<!-- 下拉框op -->
							<div class="form-group">
							<label class="font-noraml">选择语言</label>
							<div class="input-group">
							<input type="text" class="form-control" value="${ronda.language}" name="price">
<%--								<select data-placeholder="可搜索" class="chosen-select"
									style="width:350px;" tabindex="2" name="language">
									<option  hassubinfo="true">中文</option>
									<option  hassubinfo="true">英语</option>
								</select>--%>
							</div>
						</div>
						<!-- 下拉框ed -->
						<!-- 添加价格 -->
						<label class="font-noraml">价格</label>
							<div class="input-group date">
								<input type="text" style="width:350px;" value="${ronda.price}" class="form-control" placeholder="以元为单位的纯数字" name="price">
							</div>	
						<!-- 添加价格完 -->
							
						</div>

					</div>
				</div>
				
				</form>
			</div>
		</div>
  </body>
</html>
