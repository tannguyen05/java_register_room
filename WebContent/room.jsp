<%@ page pageEncoding="utf-8"%>
<%@ page import="com.hello.ojb.Register"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="com.hello.ojb.Room"%>

<!doctype html>
<html class="no-js" lang="en">
<!--<![endif]-->

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Đăng kí phòng thực hành</title>
<meta name="description">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="apple-touch-icon" href="apple-icon.png">
<link rel="shortcut icon" href="favicon.ico">

<link rel="stylesheet"
	href="vendors/bootstrap/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="vendors/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet"
	href="vendors/themify-icons/css/themify-icons.css">
<link rel="stylesheet"
	href="vendors/flag-icon-css/css/flag-icon.min.css">
<link rel="stylesheet" href="vendors/selectFX/css/cs-skin-elastic.css">
<link rel="stylesheet" href="vendors/jqvmap/dist/jqvmap.min.css">


<link rel="stylesheet" href="assets/css/style.css">

<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800'
	rel='stylesheet' type='text/css'>
<link rel="shortcut icon" type="image/png" href="images/logo3.png"/>

<style type="text/css">
</style>

</head>

<body>
	
	<!-- Left Panel -->
	
	<aside id="left-panel" class="left-panel">
		<nav class="navbar navbar-expand-sm navbar-default">

			<div class="navbar-header">
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#main-menu" aria-controls="main-menu"
					aria-expanded="false" aria-label="Toggle navigation">
					<i class="fa fa-bars"></i>
				</button>
				<h3 class="navbar-brand">
					<a href="/Hello"> <i class="menu-icon fa fa-home"></i>Nhóm 5
					</a>
				</h3>
				<a class="navbar-brand hidden" href=""><img
					src="images/twitter_corner_blue.png" alt="Logo"></a>
			</div>

			<div id="main-menu" class="main-menu collapse navbar-collapse">
				<ul class="nav navbar-nav">
					<li class="menu-item-has-children dropdown show"><a href=""
						class="dropdown-toggle" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false"> <i
							class="menu-icon fa fa-tv"></i>Danh sách phòng máy
					</a>
						<ul class="sub-menu children dropdown-menu show">
							<% 
								ArrayList<Room> listRoom = (ArrayList<Room>)request.getAttribute("listRoom");
								if(listRoom != null){
									for(Room ro : listRoom)
								    {
							%>        
										<li>
											<i class="menu-icon fa fa-laptop"></i>
											<a href="register-room?room=<%= ro.getId() %>"><%= ro.getRoom() %></a>
										</li>
							<% }} %>
						</ul>
					</li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</nav>
	</aside>
	<!-- /#left-panel -->

	<!-- Left Panel -->

	<!-- Right Panel -->

	<div id="right-panel" class="right-panel">

		<!-- Header-->
		<header id="header" class="header">
			
			<div class="header-menu">

				<div class="col-sm-7">

					<a id="menuToggle" class="menutoggle pull-left"><i
						class="fa fa fa-tasks"></i></a>

				</div>

				<div class="col-sm-5">
					<div class="user-area dropdown float-right">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown"
							aria-haspopup="true" aria-expanded="false"> <i
							class="menu-icon fa fa-user"></i> ${ name }
						</a>

						<div class="user-menu dropdown-menu">
							<a class="nav-link" href="logout"><i class="fa fa-power-off"></i>
								Đăng xuất
							</a>
						</div>
					</div>

				</div>
			</div>

		</header>
		<!-- /header -->
		<!-- Header-->

		<%
			Register[][] list = (Register[][]) request.getAttribute("list");
			int current_user_id = (int)request.getAttribute("current_user_id");
			if(list != null){
		%>
		
		<div class="main">
			<div class="row">
				<div class="col-md-12 col-sm-12 col-xs-12">
					<div class="card">
						<div class="card-header">
							<strong class="card-title text-danger">Đăng Kí Phòng Máy
								${ room } 
							</strong>
							<!-- <button class="btn btn-success pull-right" onclick="exportTableToExcel('tblData', 'dang-ki')">
								<i class="fa fa-file-excel-o"></i>
								Export To Excel
							</button> -->
						</div>
						<div class="card-body">
							<table class="table table-bordered" id="tblData">
								<thead>
									<tr>
										<th scope="col" width="2%">Ca/Ngày</th>
										<th scope="col" width="14%">Thứ 2</th>
										<th scope="col" width="14%">Thứ 3</th>
										<th scope="col" width="14%">Thứ 4</th>
										<th scope="col" width="14%">Thứ 5</th>
										<th scope="col" width="14%">Thứ 6</th>
										<th scope="col" width="14%">Thứ 7</th>
										<th scope="col" width="14%">Chủ Nhật</th>
									</tr>
								</thead>
								<tbody id="table">
									<tr>
										<th scope="row">Sáng</th>
										<% for(int i=0; i<7 ; i++){ 
											String id = Integer.toString(i) + 0;
											String id1 = id + "button";
										%>
										
											<td>
												<% if(list[0][i] == null){  %>
												<div class="text-center">
													<p id="<%= id %>" class="text-warning"></p>
													<button id="<%= id1 %>" type="button" onclick="SelectChange('1', '<%= i+1 %>', '<%= id %>')"
														class="btn btn-link select-change">Đăng
														kí</button> 
												</div>
												<% }else{ %>
														<b>GV: </b><%= list[0][i].getName()%><br />
														<b>Môn: </b><%= list[0][i].getMon()%><br />
														<b>Lớp: </b><%= list[0][i].getLop()%><br />
														<b>Thay: </b><%= list[0][i].getBuoithaythe()%>
												<% } %>
											</td>
										<% } %>
									</tr>
									<tr>
										<th scope="row">Chiều</th>
										<% for(int i=0; i<7 ; i++){ 
											String id = Integer.toString(i) + 1;
											String id1 = id + "button";
										%>
											<td>
												<% if(list[1][i] == null){  %>
												<div class="text-center">
													<p id="<%= id %>" class="text-warning"></p>
													<button id="<%= id1 %>" type="button"
														onclick="SelectChange('2', '<%=i + 1%>', '<%= id %>')"
														class="btn btn-link pull-center select-change">Đăng
														kí</button>
												</div> 
												<% }else{ %>
														<b>GV: </b><%= list[1][i].getName()%><br />
														<b>Môn: </b><%= list[1][i].getMon()%><br />
														<b>Lớp: </b><%= list[1][i].getLop()%><br />
														<b>Thay: </b><%= list[1][i].getBuoithaythe()%>
												<% } %>
											</td>
										<% } %>
									</tr>
									<tr>
										<th scope="row">Tối</th>
										<% for(int i=0; i<7 ; i++){ 
											String id = Integer.toString(i) + 2;
											String id1 = id + "button";
										%>
											<td>
												<% if(list[2][i] == null){  %>
												<div class="text-center">
													<p id="<%= id %>" class="text-warning"></p>
													<button id="<%= id1 %>" type="button" onclick="SelectChange('3', '<%= i+1 %>', '<%= id %>')"
														class="btn btn-link select-change">Đăng
														kí</button> 
												</div>
												<% }else{ %>
													<b>GV: </b><%= list[2][i].getName()%><br />
													<b>Môn: </b><%= list[2][i].getMon()%><br />
													<b>Lớp: </b><%= list[2][i].getLop()%><br />
													<b>Thay: </b><%= list[2][i].getBuoithaythe()%>										
												<% } %>
											</td>
										<% } %>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-12 col-sm-12 col-xs-12" id="form">
				<form action="" method="post">
					<div class="row form-group">
						<div class="col col-md-3">
							<label for="ca" class=" form-control-label"> Ca thực hành
							</label>
						</div>
						<div class="col-12 col-md-9">
							<select class="form-control" id="ca" disabled>
								<option value="1">Sáng</option>
								<option value="2">Chiều</option>
								<option value="3">Tối</option>
							</select> <input type="hidden" name="ca" id="inpCa" required="required" />
						</div>
					</div>
					<div class="row form-group">
						<div class="col col-md-3">
							<label for="ca" class=" form-control-label"> Ngày </label>
						</div>
						<div class="col-12 col-md-9">
							<select class="form-control" id="ngay" disabled>
								<option value="1">Thứ 2</option>
								<option value="2">Thứ 3</option>
								<option value="3">Thứ 4</option>
								<option value="4">Thứ 5</option>
								<option value="5">Thứ 6</option>
								<option value="6">Thứ 7</option>
								<option value="7">Chủ nhật</option>
							</select> <input type="hidden" name="thu" id="inpNgay"
								required="required" />
						</div>
					</div>
					<div class="row form-group">
						<div class="col col-md-3">
							<label for="monhoc" class=" form-control-label"> Môn Học
							</label>
						</div>
						<div class="col-12 col-md-9">
							<input type="text" id="monhoc" name="monhoc"
								placeholder="Nhập môn" class="form-control" required>
						</div>
					</div>

					<div class="row form-group">
						<div class="col col-md-3">
							<label for="lophoc" class=" form-control-label"> Lớp học
							</label>
						</div>
						<div class="col-12 col-md-9">
							<input type="text" id="lophoc" name="lophoc"
								placeholder="Nhập lớp" class="form-control" required>
						</div>
					</div>
					<div class="row form-group">
						<div class="col col-md-3">
							<label for="buoithaythe" class=" form-control-label">
								Buổi thay thế </label>
						</div>
						<div class="col-12 col-md-9">
							<input type="text" id="buoithaythe" name="buoithaythe"
								placeholder="Nhập buổi thay thế" class="form-control" required>
						</div>
					</div>
					<input type="hidden" name="room" value="${room}" />
					<div class="row form-group col-12 col-md-9 float-md-right">
						<button type="submit" class="btn btn-primary" disabled="disabled" onclick="return confirm('Xác nhận đăng kí ?');"
							id="submitbutton">
							<i class="fa fa-dot-circle-o"></i> Đăng kí
						</button>
						<button type="reset" class="btn btn-danger" style="margin-left: 20px"
							id="cancelbutton">
							<i class="fa fa-dot-circle-o"></i> Hủy
						</button>
					</div>
				</form>
			</div>
		</div>
		<% }else{ %>
			<div class="w3-container w3-green" style="padding:32px 64px">
				<h1>Sorry</h1>
				<h1>404 - The page cannot be found</h1>
				<h2><a href="/Hello" style="text-decoration: underline;"> <i class="menu-icon fa fa-home "></i> Go home</a></h2>
			</div>
		<% } %>
	</div>
	<!-- /#right-panel -->

	<!-- Right Panel -->

	<script src="vendors/jquery/dist/jquery.min.js"></script>
	<script src="vendors/popper.js/dist/umd/popper.min.js"></script>
	<script src="vendors/bootstrap/dist/js/bootstrap.min.js"></script>
	<script src="assets/js/main.js"></script>


	<script src="vendors/chart.js/dist/Chart.bundle.min.js"></script>
	<script src="assets/js/dashboard.js"></script>
	<script src="assets/js/widgets.js"></script>
	<script src="vendors/jqvmap/dist/jquery.vmap.min.js"></script>
	<script src="vendors/jqvmap/examples/js/jquery.vmap.sampledata.js"></script>
	<script src="vendors/jqvmap/dist/maps/jquery.vmap.world.js"></script>
	<script>
		(function($) {
			"use strict";

			jQuery('#vmap').vectorMap({
				map : 'world_en',
				backgroundColor : null,
				color : '#ffffff',
				hoverOpacity : 0.7,
				selectedColor : '#1de9b6',
				enableZoom : true,
				showTooltip : true,
				values : sample_data,
				scaleColors : [ '#1de9b6', '#03a9f5' ],
				normalizeFunction : 'polynomial'
			});
		})(jQuery);
	</script>
	<script>
		var websocket = new WebSocket("ws://localhost:8080/Hello/actions");
		websocket.onopen = function(message) {processOpen(message);};
		websocket.onclose = function(message) {processClose(message);};
		websocket.onerror = function(message) {processError(message);};
		websocket.onmessage = function(message) {processMessage(message);};
	
		function processOpen(message) {
			console.log("Server connect...");
		}
		function processClose(message) {
			console.log("Server Disconnect...");
		}
		function processError(message) {
			console.log("Error... " + message);
		}
		
		function processMessage(message) {
			console.log(message);
			if(message.data.indexOf("cancel") > 0){
				var id = message.data.replace("cancel", "");
				document.getElementById(id).innerHTML = "";
				document.getElementById(id + "button").disabled = false;
			}else{
				document.getElementById(message.data).innerHTML = "Có người đang nhập <img src='images/tenor.gif' />";
				document.getElementById(message.data + "button").disabled = true;
			}
			
			document.getElementById('cancelbutton').onclick = function(){
				var mess = message.data + "cancel";
				websocket.send(mess);
				document.getElementById('submitbutton').disabled = true;
			}
		}
		
		var ca = document.getElementById('ca');
		var ngay = document.getElementById('ngay');
		function SelectChange(val1, val2, id) {
			var opts1 = ca.options;
			var opts2 = ngay.options;

			//select ca
			for (var opt1, j = 0; opt = opts1[j]; j++) {
				if (opt.value == val1) {
					ca.selectedIndex = j;
					document.getElementById("inpCa").value = opt.value;
					break;
				}
			}
			//select ngay
			for (var opt2, j = 0; opt = opts2[j]; j++) {
				if (opt.value == val2) {
					ngay.selectedIndex = j;
					document.getElementById("inpNgay").value = opt.value;
					break;
				}
			}
			document.getElementById("form").scrollIntoView();
			document.getElementById('submitbutton').disabled = false;
			document.getElementById('monhoc').focus();

			//websocket
			websocket.send(id);
		}
		
	
		
	</script>
	
	
</body>

</html>
