<%@ page pageEncoding="utf-8"%>
<!doctype html>
<html>

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Đăng nhập</title>
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

<link rel="stylesheet" href="assets/css/style.css">

<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800'
	rel='stylesheet' type='text/css'>
<link rel="shortcut icon" type="image/png" href="images/logo3.png"/>


</head>

<body>


	<div class="sufee-login d-flex align-content-center flex-wrap">
		<div class="container">
			<div class="login-content">
				<div class="login-form">
					<p style="color: red">${ err }</p>
					<p class="text-success">${ mess }</p>
					<form action="login" method="post">
						<div class="form-group">
							<label for="uname">Tên đăng nhập<span style="color: red">
									*</span></label> <input type="text" id="uname" class="form-control" name="username"
								placeholder="Tên đăng nhập">
						</div>
						<div class="form-group">
							<label for="password">Mật khẩu<span style="color: red">
									*</span></label> <input type="password" id="password" class="form-control" name="password"
								placeholder="Mật khẩu" value="123456789a">
						</div>
						<div class="checkbox">
							<label> <input type="checkbox"> Remember Me
							</label> <label class="pull-right"> <a href="#">Forgotten
									Password?</a>
							</label>

						</div>
						<button type="submit"
							class="btn btn-success btn-flat m-b-30 m-t-30">Sign in</button>
						<div class="register-link m-t-15 text-center">
							<p>
								Don't have account ? <a href="signup"> Sign Up Here</a>
							</p>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>


	<script src="vendors/jquery/dist/jquery.min.js"></script>
	<script src="vendors/popper.js/dist/umd/popper.min.js"></script>
	<script src="vendors/bootstrap/dist/js/bootstrap.min.js"></script>
	<script src="assets/js/main.js"></script>


</body>

</html>
