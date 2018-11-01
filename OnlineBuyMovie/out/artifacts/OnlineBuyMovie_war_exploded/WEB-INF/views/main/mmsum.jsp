<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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

<title>My JSP 'index_context.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	
	<meta name="keywords" content="H+后台主题,后台bootstrap框架,会员中心主题,后台HTML,响应式后台">
    <meta name="description" content="H+是一个完全响应式，基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术">
    -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" href="favicon.ico">
<link href="css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
<link href="css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">

<!-- Morris -->
<link href="css/plugins/morris/morris-0.4.3.min.css" rel="stylesheet">

<!-- Gritter -->
<link href="js/plugins/gritter/jquery.gritter.css" rel="stylesheet">

<link href="css/animate.min.css" rel="stylesheet">
<link href="css/style.min862f.css?v=4.1.0" rel="stylesheet">

</head>

<body class="gray-bg">
	<div class="wrapper wrapper-content">
		<div class="row">
        <c:forEach var="con" items="${cons}">
			<div class="col-sm-3">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
					<span class="label label-primary pull-right">本影院</span>
					<h5>${con.name}</h5>
				</div>
				<div class="ibox-content">
					<h1 class="no-margins">${Viewtoday}</h1>
					<div style="display:none;"
						class="stat-percent font-bold text-navy">
						44% <i class="fa fa-level-up"></i>
					</div>
					<small style="font-size:16px;font-weight:600;color:orange;">${con.conmoney}元</small>
				</div>
			</div>
		</div>
		</c:forEach>
			<%-- <div class="col-sm-3">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<span class="label label-danger pull-right">最近一个月</span>
						<h5>活跃用户</h5>
					</div>
					<div class="ibox-content">
						<h1 class="no-margins">${Viewmonth}</h1>
						<div style="display:none;"
							class="stat-percent font-bold text-danger">
							38% <i class="fa fa-level-down"></i>
						</div>
						<small id="month"></small>
					</div>
				</div>
			</div> --%>
			<!-- <div class="col-sm-3">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<span class="label label-success pull-right">月</span>
						<h5>收入</h5>
					</div>
					<div class="ibox-content">
						<h1 class="no-margins">暂时不支持</h1>
						<div style="display:none;"
							class="stat-percent font-bold text-success">
							98% <i class="fa fa-bolt"></i>
						</div>
						<small>总收入</small>
					</div>
				</div>
			</div> -->
            <!--<div class="col-sm-3">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<span class="label label-info pull-right">全年</span>
						<h5>订单</h5>
					</div>
					<div class="ibox-content">
						<h1 class="no-margins">暂时不支持</h1>
						<div style="display:none;"
							class="stat-percent font-bold text-info">
							20% <i class="fa fa-level-up"></i>
						</div>
						<small>新订单</small>
					</div>
				</div>
			</div> -->
		</div>
		<div style="display:none;" class="row">
			<div class="col-sm-12">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<h5>订单</h5>
						<div class="pull-right">
							<div class="btn-group">
								<button type="button" class="btn btn-xs btn-white active">天</button>
								<button type="button" class="btn btn-xs btn-white">月</button>
								<button type="button" class="btn btn-xs btn-white">年</button>
							</div>
						</div>
					</div>
					<div class="ibox-content">
						<div class="row">
							<div class="col-sm-9">
								<div class="flot-chart">
									<div class="flot-chart-content" id="flot-dashboard-chart"></div>
								</div>
							</div>
							<div class="col-sm-3">
								<ul class="stat-list">
									<li>
										<h2 class="no-margins">2,346</h2> <small>订单总数</small>
										<div class="stat-percent">
											48% <i class="fa fa-level-up text-navy"></i>
										</div>
										<div class="progress progress-mini">
											<div style="width: 48%;" class="progress-bar"></div>
										</div>
									</li>
									<li>
										<h2 class="no-margins ">4,422</h2> <small>最近一个月订单</small>
										<div class="stat-percent">
											60% <i class="fa fa-level-down text-navy"></i>
										</div>
										<div class="progress progress-mini">
											<div style="width: 60%;" class="progress-bar"></div>
										</div>
									</li>
									<li>
										<h2 class="no-margins ">9,180</h2> <small>最近一个月销售额</small>
										<div class="stat-percent">
											22% <i class="fa fa-bolt text-navy"></i>
										</div>
										<div class="progress progress-mini">
											<div style="width: 22%;" class="progress-bar"></div>
										</div>
									</li>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>


	</div>

	<script src="js/jquery.min.js?v=2.1.4"></script>
	<script src="js/bootstrap.min.js?v=3.3.6"></script>
	<script src="js/plugins/flot/jquery.flot.js"></script>
	<script src="js/plugins/flot/jquery.flot.tooltip.min.js"></script>
	<script src="js/plugins/flot/jquery.flot.spline.js"></script>
	<script src="js/plugins/flot/jquery.flot.resize.js"></script>
	<script src="js/plugins/flot/jquery.flot.pie.js"></script>
	<script src="js/plugins/flot/jquery.flot.symbol.js"></script>
	<script src="js/plugins/peity/jquery.peity.min.js"></script>
	<script src="js/demo/peity-demo.min.js"></script>
	<script src="js/content.min.js?v=1.0.0"></script>
	<script src="js/plugins/jquery-ui/jquery-ui.min.js"></script>
	<script src="js/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
	<script src="js/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
	<script src="js/plugins/easypiechart/jquery.easypiechart.js"></script>
	<script src="js/plugins/sparkline/jquery.sparkline.min.js"></script>
	<script src="js/demo/sparkline-demo.min.js"></script>
	<script>
		
	</script>
</body>

</html>
