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

    <title>增加放映厅</title>
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
                <div class="ibox-content">
                    <form id="myform" method="post" class="form-horizontal"
                          action="<%=basePath%>cinema/addhall.do">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">填入信息</label>

                            <div class="col-sm-10">
                                <div class="row">
                                    <div class="col-md-3">
                                        <input type="text" id="name" name="hno" placeholder="影厅名" class="form-control">
                                    </div>
                                    <div class="col-md-3">
                                        <input type="text" oninput="rowonchange()" onpropertychange="rowonchange()"
                                               id="row" name="allrow" placeholder="座位总行数(小于99)" class="form-control">
                                    </div>
                                    <div class="col-md-3">
                                        <input type="text" oninput="colonchange()" onpropertychange="colonchange()"
                                               id="col" name="allcol" placeholder="座位总列数(小于99)" class="form-control">
                                    </div>
                                    <div class="col-sm-1">
                                        <button class="btn btn-primary" type="button" onclick="tijiao()">确定</button>
                                        <!-- <input class="btn btn-primary" type="button" value="提交" onclick="tijiao()"> -->

                                    </div>
                                </div>
                            </div>
                        </div>
                        <div align="center">
                            <tr align="center">
                                <td colspan="2" id="tsmsg" style="font-size: 15px;color: #0F769F">${msg}<span id="tishi" style="font-size: 20px;color: red"></span>
                                </td>
                            </tr>
                        </div>

                        <div class="hr-line-dashed"></div>
                        <input type="text" id="seatsteat" name="seats" value="" class="form-control"
                               style="display:none;">
                        <div class="seat_list">
                            <div style="padding-bottom:30px" class="seat-tip">
                                <span style="background-color: #0e9aef;" class="seat can_select"></span><span
                                    style="padding-right:50px;">点击取消此座位</span>
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
    $(document).ready(function () {
        $(".i-checks").iCheck({
            checkboxClass: "icheckbox_square-green",
            radioClass: "iradio_square-green",
        })
    });


    function tijiao() {
        var col = document.getElementById("col").value;
        var row = document.getElementById("row").value;
        var x = true;
        var y = true;
        //seatsteat
        var seatsteat = document.getElementById("seatsteat");
        var tishi = document.getElementById("tishi");
        var name = document.getElementById("name").value;
        if (name.trim() == '') {
            tishi.innerHTML = "影厅名不能为空";
            return false;
        }
        if (row.trim() == '') {
            tishi.innerHTML = "行数不能为空";
            return false;
        }
        if ((/^[0-9_-]{3,100}$/).test($("#row").val())) {
            tishi.innerHTML = "行数输入错误";
            x = false;
            return false;
        }
        if (col.trim() == '') {
            tishi.innerHTML = "列数不能为空";
            return false;
        }
        if ((/^[0-9_-]{1,2}$/).test($("#col").val())) {
        } else {
            tishi.innerHTML = "列数输入错误";
            y = false;
            return false;
        }
        /*var stateString = state_arr.join("");
        seatsteat.value = stateString;
        var destURL = "back/addhall.do";
        $.ajax({
            type: "post",
            url: "back/addhall.do",
            data: $('#myform').serialise(),
            success: function (msg) {
                var msg = document.getElementById("tsmsg");
                if (msg == 1) {
                    tsmsg.innerHTML = "录入成功";
                } else {
                    tsmsg.innerHTML = "录入失败，请与网络管理员联系";
                }
            }
        });*/

        var stateString = state_arr.join("");
        seatsteat.value = stateString;
        console.log(stateString);
        if (x == true && y == true) {
            var myform = document.getElementById("myform");
            myform.submit();
        }

    }


    var screens_name = document.getElementsByClassName("screens_name");


    var shafty = document.getElementById("y_shaft");
    var seats = document.getElementById("seats");
    var ticket_num = 0;
    var create_shafty = function (ul, count) {
        var fragment = document.createDocumentFragment();
        var li;

        for (var i = 0; i < count; i++) {
            li = document.createElement('li');
            li.innerHTML = (i + 1);
            fragment.appendChild(li);
        }
        return fragment;
    };

    var create_seats = function (ul, count, arr) {
        var fragment = document.createDocumentFragment();
        var li;

        for (var i = 0; i < count; i++) {
            li = document.createElement('li');
            li.className = 'seat can_select';
            fragment.appendChild(li);
        }
        return fragment;
    };

    var rows = 9; //行
    var cols = 19;
    var seats_count = rows * cols;
    var state_arr = new Array(seats_count);
    for (var i = 0; i < seats_count; i++) {
        state_arr[i] = 1;
    }

    function rowonchange() {
        var row = document.getElementById("row").value;
        rows = row;
        seats_count = rows * cols;
        seats.innerHTML = "";
        shafty.innerHTML = "";
        seats.insertBefore(create_seats(seats, seats_count, state_arr), seats.childNodes[0]);
        shafty.insertBefore(create_shafty(shafty, rows), shafty.childNodes[0]);
        state_arr = new Array(seats_count);
        for (var i = 0; i < seats_count; i++) {
            state_arr[i] = 1;
        }
        var shafty_li = shafty.getElementsByTagName("li");
        var seats_li = seats.getElementsByTagName("li");
        var seat = seats.getElementsByClassName("seat");
        for (var i = 0; i < seat.length; i++) {
            seat[i].onclick = (function (i) {
                return function () {
                    if (seat[i].className == "seat can_select") {
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

    function colonchange() {
        var col = document.getElementById("col").value;
        cols = col;
        seats_count = rows * cols;
        seats.innerHTML = "";
        seats.insertBefore(create_seats(seats, seats_count, state_arr), seats.childNodes[0]);
        seats.style.width = cols * 26 + "px";
        state_arr = new Array(seats_count);
        for (var i = 0; i < seats_count; i++) {
            state_arr[i] = 1;
        }

        var shafty_li = shafty.getElementsByTagName("li");
        var seats_li = seats.getElementsByTagName("li");
        var seat = seats.getElementsByClassName("seat");
        for (var i = 0; i < seat.length; i++) {
            seat[i].onclick = (function (i) {
                return function () {
                    if (seat[i].className == "seat can_select") {
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
    var create_rowcol = function (ul, seat_row, sear_col, ticket_num) {
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
    for (var i = 0; i < seat.length; i++) {
        seat[i].onclick = (function (i) {
            return function () {
                if (seat[i].className == "seat can_select") {
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
</script>
</body>
</html>
