<%@ page pageEncoding="utf-8"%>
<%@ page import="com.hello.ojb.Register"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="com.hello.ojb.Room"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Admin page</title>
<meta charset="utf-8">
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
</head>
<body>
	<% Register[][] list = (Register[][]) request.getAttribute("list"); %>
	<% int room = (int) request.getAttribute("room"); %>
	<div class="card">
		<div style="margin: 10px">
			<form action="" method="get">
				<div class="row form-group">
					<div class="col col-md-1">
						<label class=" form-control-label"> Phòng Máy </label>
					</div>
					<div class="col col-md-2">
						<select class="form-control" name="room" id="room">
							<% 
								ArrayList<Room> listRoom = (ArrayList<Room>)request.getAttribute("listRoom");
								if(listRoom != null){
									for(Room ro : listRoom)
								    {
							%>        
										<option value="<%= ro.getId() %>"><%= ro.getRoom() %></option>
							<% }} %>
						</select>
					</div>
					<div class="col col-md-2">
						<button type="submit" class="btn btn-primary">Lọc dữ liệu</button>
					</div>
				</div>
			</form>
		</div>
		<div class="card-header">
			<strong class="card-title text-danger">Danh Sách Đăng Kí Phòng Máy
				${ room } 
			</strong>
			<a class="nav-link pull-right" href="logout"><i class="fa fa-power-off"></i>
				Đăng xuất
			</a>
			<button class="btn btn-success pull-right" onclick="exportTableToExcel('tblData', 'danh-sach-phong-${room}')">
				<i class="fa fa-file-excel-o"></i>
				Export To Excel
			</button>
		</div>
		<div class="card-body">
			<table class="table table-bordered" id="tblData">
				<thead>
					<tr class="text-center">
						<th scope="col" width="10%">STT</th>
						<th scope="col" width="10%">Thứ</th>
						<th scope="col" width="20%">Sáng</th>
						<th scope="col" width="20%">Chiều</th>
						<th scope="col" width="20%">Tối</th>
						<th scope="col" width="20%">Ghi chú</th>
					</tr>
				</thead>
				<tbody>
						<% for(int i=0; i<7 ; i++){ %>
							<tr>
								<td class="text-center"><%= i+1 %></td>
								<td class="text-center">
									<% 
										String result;
										switch(i+1){
											case 1: result = "Thứ 2"; break;
											case 2: result = "Thứ 3"; break;
											case 3: result = "Thứ 4"; break;
											case 4: result = "Thứ 5"; break;
											case 5: result = "Thứ 6"; break;
											case 6: result = "Thứ 7"; break;
											default: result = "Chủ nhật"; break;
										}
										out.print(result);
									%>
								</td>
								<td>
									<% if(list[0][i] != null){ %>
										<div class="text-right">
											<form action="delete" method="post">
												<input type="hidden" name="room" value="${room}" />
												<input type="hidden" value="<%= list[0][i].getId() %>" name="id" />
												<button class="btn btn-outline-danger btn-sm" type="submit" onclick="return confirm('Xác nhận xóa ?');"><i class="fa fa-remove"></i></button>
											</form>
										</div>
										<b>GV: </b><%= list[0][i].getName()%><br />
										<b>Môn: </b><%= list[0][i].getMon()%><br />
										<b>Lớp: </b><%= list[0][i].getLop()%><br />
										<b>Thay: </b><%= list[0][i].getBuoithaythe()%>
									<% } %>
								</td>
								<td>
									<% if(list[1][i] != null) {%>
										<div class="text-right">
											<form action="delete" method="post">
												<input type="hidden" name="room" value="${room}" />
												<input type="hidden" value="<%= list[1][i].getId() %>" name="id" />
												<button class="btn btn-outline-danger btn-sm" type="submit" onclick="return confirm('Xác nhận xóa ?');"><i class="fa fa-remove"></i></button>
											</form>
										</div>
										<b>GV: </b><%= list[1][i].getName()%><br />
										<b>Môn: </b><%= list[1][i].getMon()%><br />
										<b>Lớp: </b><%= list[1][i].getLop()%><br />
										<b>Thay: </b><%= list[1][i].getBuoithaythe()%>
									<% } %>
								</td>
								<td>
									<% if(list[2][i] != null){ %>
										<div class="text-right">
											<form action="delete" method="post">
												<input type="hidden" name="room" value="${room}" />
												<input type="hidden" value="<%= list[2][i].getId() %>" name="id" />
												<button class="btn btn-outline-danger btn-sm" type="submit" onclick="return confirm('Xác nhận xóa ?');"><i class="fa fa-remove"></i></button>
											</form>
										</div>
										<b>GV: </b><%= list[2][i].getName()%><br />
										<b>Môn: </b><%= list[2][i].getMon()%><br />
										<b>Lớp: </b><%= list[2][i].getLop()%><br />
										<b>Thay: </b><%= list[2][i].getBuoithaythe()%>
									<% } %>
								</td>
								<td></td>
							</tr>
						<% } %>
				</tbody>
			</table>
		</div>
	</div>
	
	<script>
		document.getElementById("room").selectedIndex = <%= room - 1 %>;
	</script>
	
	<script type="text/javascript">
		function exportTableToExcel(tableID, filename = ''){
		    var downloadLink;
		    var dataType = 'application/vnd.ms-excel';
		    var tableSelect = document.getElementById(tableID);
		    var tableHTML = tableSelect.outerHTML.replace(/ /g, '%20');
		    
		    // Specify file name
		    filename = filename?filename+'.xls':'excel_data.xls';
		    
		    // Create download link element
		    downloadLink = document.createElement("a");
		    
		    document.body.appendChild(downloadLink);
		    
		    if(navigator.msSaveOrOpenBlob){
		        var blob = new Blob(['\ufeff', tableHTML], {
		            type: dataType
		        });
		        navigator.msSaveOrOpenBlob( blob, filename);
		    }else{
		        // Create a link to the file
		        downloadLink.href = 'data:' + dataType + ', ' + tableHTML;
		    
		        // Setting the file name
		        downloadLink.download = filename;
		        
		        //triggering the function
		        downloadLink.click();
		    }
		}
	</script>
</body>
</html>