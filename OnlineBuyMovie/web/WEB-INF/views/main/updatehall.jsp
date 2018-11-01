<%@page import="com.pjk.servlet.UpdateHallSvl"%>
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
<link href="css/selectseat.css" rel="stylesheet">
<link href="css/ppt.css" rel="stylesheet">
</head>

<body class="gray-bg">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="row">
			<div class="col-sm-12">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<h5>
							添加影厅 <small>请输入影厅的相关信息</small>
						</h5>
					</div>
					<div class="ibox-content">
						<form  id="myform" method="post" class="form-horizontal"
							action="<%=basePath%>admin/UpdateHallSvl">
							<div class="form-group">
								<label class="col-sm-2 control-label">影厅名</label>
								<label class="col-sm-2 control-label">座位行数</label>
								<label class="col-sm-2 control-label">座位列数</label>
							</div>
							<div class="hr-line-dashed"></div>
							<div class="form-group">
								<div class="col-sm-10">
									<div class="row">
									    <input type="hidden" name="hno" value="${hall.hno}" id="hno"></input>
										<div class="col-md-2">
											<input type="text" value="${hall.name}" id="name"  name="name"  class="form-control">
										</div>
										<div class="col-md-3">
											<input type="text" value="${hall.row}" id="row" name="row"  class="form-control">
										</div>
										<div class="col-md-4">
											<input type="text" value="${hall.col}" id="col" name="col"  class="form-control">
										</div>
										<div class="col-md-4">
											<input type="text" id="col" name="seats" value="120302023102301020203100203012301230321" 
											class="form-control" style="display:none;">
										</div>
									</div>
								</div>
							</div>
							
							<input type="text" id="seatsteat" name="seats" value="" class="form-control" style="display:none;">
										<div class="seat_list">
				<div style="padding-bottom:30px" class="seat-tip">
					<span style="background-color: #0e9aef;" class="seat can_select"></span><span style="padding-right:50px;">点击取消此座位</span>
					<span class="seat cant_select"></span><span>不设立座位</span>
				</div>
				<div class="screen"></div>
				<div class="screen_center">
					<span class="screens_name">
						1号厅（4k）
					</span> 屏幕中央
				</div>
				<div class="seat_box">
					<ul id="y_shaft">
					</ul>
					<ul id="seats">
					</ul>
				</div>
			</div>
							<div class="hr-line-dashed"></div>
							<div class="form-group">
								<div class="col-sm-4 col-sm-offset-2">
								    <input type="hidden" name="cbutton" value="" id="cbutton"></input>
									<button class="btn btn-primary" type="button" onclick="tijiao()">确定修改</button>
									<button class="btn btn-primary" type="button" onclick="shanchu()">删除影厅</button>
									<!-- <input class="btn btn-primary" type="button" value="提交" onclick="tijiao()"> -->
									<tr>
										<td colspan="2" id="tsmsg">${msg}<span id="tishi"></span>
										</td>
									</tr>
								</div>
							</div>
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
	
		var cbutton = document.getElementById("cbutton");
		function tijiao() {
		    if(window.confirm('你确定要删除吗？')){
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
		    cbutton.value="1";
			var myform = document.getElementById("myform");
			myform.submit();
			parent.location.reload();
		    }else{
		     return false;
		    }
		
		}
		
		function shanchu(){
		if(window.confirm('你确定要删除吗？')){
		    cbutton.value="0";
			var myform = document.getElementById("myform");
			myform.submit();
            parent.location.reload();
            return true;
            parent.location.reload();
        }else{
                 return false;
        }
		}
		
		
		var screens_name = document.getElementsByClassName("screens_name");

			
			var shafty = document.getElementById("y_shaft");
			var seats = document.getElementById("seats");
			var ticket_num = 0;
			var create_shafty = function(ul, count) {
				var fragment = document.createDocumentFragment();
				var li;

				for(var i = 0; i < count; i++) {
					li = document.createElement('li');
					li.innerHTML = (i + 1);
					fragment.appendChild(li);
				}
				return fragment;
			};

		var create_seats = function(ul, count, arr) {
				var fragment = document.createDocumentFragment();
				var li;

				for(var i = 0; i < count; i++) {
					li = document.createElement('li');
					if(arr[i] == 1) {
						li.className = 'seat can_select';
					} else if(arr[i] == 0) {
						li.className = 'seat SeatNone';
					}else {
						console.log("第" + (i + 1) + "号座位的状态码出错,快去查")
						li.className = 'seat cant_select';
					}
					fragment.appendChild(li);
				}
				return fragment;
			};
			
			
			var row; //行
			var col;
			var seat_row = 0; //行
			var seat_col = 0;
			var seats_count ;
			var state_arr = new Array();
			
			var surl = "<%=basePath%>admin/UpdateHallSvl?hno=" + ${hall.hno};
			$.ajax({
				type: "get",
				url: surl, //Svl
				success: function(msg) {
					//data处理代码
					var data = eval("(" + msg + ")");  //Ajax 从string变成对象 "()"不一定要
					console.log(data);
					
					row = data.row;
					col = data.col;
					seats_count = row * col;
					for(var i = 0; i < seats_count; i++) {
						state_arr[i] = data.states[i].state;
					}
					seats.insertBefore(create_seats(seats, data_length, state_arr), seats.childNodes[0]);
					shafty.insertBefore(create_shafty(shafty, row), shafty.childNodes[0]);
					seats.style.width = col * 26 + "px";
					
					var select_seat = document.getElementById("select_seat");
					
		
					// 代码都加这里	--------------------------------------------------------------------------	
					function rowonchange(){
						var row = document.getElementById("row").value;
						rows = row;
						seats_count = rows * cols;
						seats.innerHTML = "";
						shafty.innerHTML = "";
						seats.insertBefore(create_seats(seats, seats_count, state_arr), seats.childNodes[0]);
						shafty.insertBefore(create_shafty(shafty, rows), shafty.childNodes[0]);
						state_arr = new Array(seats_count);
						for(var i = 0; i < seats_count; i++) {
							state_arr[i] = 1;
						}
						var shafty_li = shafty.getElementsByTagName("li");
						var seats_li = seats.getElementsByTagName("li");
						var seat = seats.getElementsByClassName("seat");
						for(var i = 0; i < seat.length; i++) {
							seat[i].onclick = (function(i) {
								return function() {
									if(seat[i].className == "seat can_select") {
										var nowi = i + 1;
										ticket_num = ticket_num + 1;
										seat[i].className = "seat can_select cant_select seat_ticket_num" + ticket_num;
										state_arr[i] = 0;
										console.log(state_arr);
									} else {
										state_arr[i] = 1;
										seat[i].className = "seat can_select";
										ticket_num = ticket_num - 1;
										console.log(state_arr);
									}
			
								}
							})(i);
						}
					}		
				function colonchange(){
					var col = document.getElementById("col").value;
					cols = col;
					seats_count = rows * cols;
					seats.innerHTML = "";
					seats.insertBefore(create_seats(seats, seats_count, state_arr), seats.childNodes[0]);
					seats.style.width = cols * 26 + "px";
					state_arr = new Array(seats_count);
					for(var i = 0; i < seats_count; i++) {
						state_arr[i] = 1;
					}
					
					var shafty_li = shafty.getElementsByTagName("li");
					var seats_li = seats.getElementsByTagName("li");
					var seat = seats.getElementsByClassName("seat");
					for(var i = 0; i < seat.length; i++) {
						seat[i].onclick = (function(i) {
							return function() {
								if(seat[i].className == "seat can_select") {
									var nowi = i + 1;
									ticket_num = ticket_num + 1;
									seat[i].className = "seat can_select cant_select seat_ticket_num" + ticket_num;
									state_arr[i] = 0;
									console.log(state_arr);
								} else {
									state_arr[i] = 1;
									seat[i].className = "seat can_select";
									ticket_num = ticket_num - 1;
									console.log(state_arr);
								}
							}
						})(i);
					}
				}
			

			seats.insertBefore(create_seats(seats, seats_count, state_arr), seats.childNodes[0]);
			shafty.insertBefore(create_shafty(shafty, rows), shafty.childNodes[0]);
			seats.style.width = cols * 26 + "px";

			var select_seat = document.getElementById("select_seat");
			var create_rowcol = function(ul, seat_row, sear_col, ticket_num) {
				var fragment = document.createDocumentFragment();
				var span;

				span = document.createElement('span');
				span.innerHTML = seat_row + "排" + sear_col + "列 ";
				span.className = "ticket_num" + ticket_num;
				fragment.appendChild(span);
				return fragment;
			};

			var shafty_li = shafty.getElementsByTagName("li");
			var seats_li = seats.getElementsByTagName("li");
			var seat = seats.getElementsByClassName("seat");
			for(var i = 0; i < seat.length; i++) {
				seat[i].onclick = (function(i) {
					return function() {
						if(seat[i].className == "seat can_select") {
								var nowi = i + 1;
								ticket_num = ticket_num + 1;
								seat[i].className = "seat can_select cant_select seat_ticket_num" + ticket_num;
								state_arr[i] = 0;
								console.log(state_arr);
							} else {
								state_arr[i] = 1;
								seat[i].className = "seat can_select";
								ticket_num = ticket_num - 1;
								console.log(state_arr);
							}
					}
				})(i);
			}
					
				},
				// XMLHttpRequest 对象、错误信息、（可选）捕获的异常对象
				error: function(XMLHttpRequest, type, errorThrown) {
					//异常处理;
					console.log(type);
					alert("加载失败,请检查网络设置")
				}
			 });
			
			
			
			
			
			
			
			
			

	</script>

	<script type="text/javascript"
		src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
</body>
</html>
