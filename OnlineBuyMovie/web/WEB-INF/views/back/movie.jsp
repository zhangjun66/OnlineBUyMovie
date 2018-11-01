<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>查看电影</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/ppt.css" />
	<link rel="stylesheet" type="text/css" href="fonts/iconfont.css">
	<link rel="stylesheet" type="text/css" href="css/selectCinema.css" />
	<meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
	<meta content="width=device-width; initial-scale=1; maximum-scale=1" name="viewport">
	<meta content="Washington Botelho" name="author">
	<meta content="jQuery Raty - A Star Rating Plugin" name="description">
	<meta content="jquery,plugin,rating,raty,voto,star,staring,classificacao,classificar,votar,plugin" name="keywords">

  </head>
  
	<body>
	<c:forEach var="movie" items="${movies}">
		<div class="lunbo lunbo1" style ="overflow: hidden; height: 500px; padding-bottom: 25px;">
			<div class="ppt_stage">
				<div class="ppt_bg_1">
					<div class="ppt_text_1">
						<p>${movie.type}</p>
						<p>${movie.area}/${movie.length}</p>
						<p>${movie.bgdata}上映</p>
					</div>
				</div>
				<div class="ppt_module_1"><!--  --><%-- src="img/movie.png" --%>
					<img class="ppt_movie" src="<%=basePath%>admin/PicSvl?mid=${movie.mid}"/>
					<h1>${movie.mname}</h1>
					<h2>${movie.director}</h2>
					<div class="ppt_text_2">
						<p>用户评分</p>
						<h3>
							<span class="movie_score">${movie.score}</span>
							<img class="icon_star" src="img/icon_star.png"/>
							<div class="icon_star_r" >
								<img src="img/icon_star_r.png"/>
							</div>
						</h3>
						<p class="people_score">60088人评分</p>
					</div>
				</div>
				<div class="ppt_module_2">
					<div class="ppt_text_3">
						<h1>累计票房</h1>
						<h2>${movie.sealnum}</h2>
					</div>
				</div>
			</div>
		</div>
	</c:forEach>
	<script src="js/jquery.min.js?v=2.1.4"></script>
	<script>
			var ppt_left = document.getElementsByClassName("lunbo")[0].offsetLeft;
			var ppt_top = document.getElementsByClassName("lunbo")[0].offsetTop;
			var camera_left;
			var index = 0;

			// 3D组件
			$(".lunbo").mousemove(function(e) {
				check(e);

			})

			$(".lunbo").mouseleave(function(e) {
				$(".ppt_bg_1").css("transform", "translateX(" + 0 + "px)translateY(" + 0 + "px)");
				$(".ppt_module_1").css("transform", "translateX(" + 0 + "px)translateY(" + 0 + "px)");
				$(".ppt_module_2").css("transform", "translateX(" + 0 + "px)translateY(" + 0 + "px)");
				$(".ppt_stage").css("transform", "rotateX(" + 0 + "deg)rotateY(" + 0 + "deg)");
			})

			function check(e) {
				var a = e ? e : window.event;
				var x_mid = ppt_left + 610 - e.clientX;
				var y_mid = ppt_top + 250 - e.clientY;
				$(".ppt_bg_1").css("transform", "translateX(" + x_mid * 0.012 + "px)translateY(" + y_mid * 0.011 + "px)");
				$(".ppt_module_1").css("transform", "translateX(" + x_mid * 0.015 + "px)translateY(" + y_mid * 0.015 + "px)");
				$(".ppt_module_2").css("transform", "translateX(" + x_mid * 0.005 + "px)translateY(" + y_mid * 0.005 + "px)");
				$(".ppt_stage").css("transform", "rotateX(" + (y_mid / 500 * 12) + "deg)rotateY(" + -x_mid / 1220 * 12 + "deg)");
			}
			
			//电影评分
			var movie_score = document.getElementsByClassName("movie_score");
			var movie_star = document.getElementsByClassName("icon_star_r");
			for(var i = 0; i < movie_score.length ;i++){
				var score = movie_score[i].innerHTML;
				movie_star[i].style.width = 20.4 * score + "px";
			}
			



		</script>
	</body>	
</html>
