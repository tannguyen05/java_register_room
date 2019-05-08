<%@ page pageEncoding="utf-8"%>
<!doctype html>
<html>

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Đăng kí tài khoản</title>
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
					<form action="signup" method="post">
						<div class="form-group">
							<label for="fullname">Họ và tên<span style="color: red">
									*</span></label> <input type="text" id="fullname" class="form-control"
								name="fullname" placeholder="Họ và tên" required="required">
						</div>
						<div class="form-group">
							<label for="uname">Tên đăng nhập<span style="color: red">
									*</span></label> <input type="text" id="uname" class="form-control"
								name="username" placeholder="Tên đăng nhập" required="required">
						</div>
						<div class="form-group">
							<label for="password">Mật khẩu<span style="color: red">
									*</span></label> <input type="password" id="password" class="form-control"
								name="password" placeholder="Mật khẩu" required="required">
						</div>
						<div class="form-group">
							<label for="confirm_password">Nhập lại mật khẩu<span
								style="color: red"> *</span></label> <input type="password"
								id="confirm_password" class="form-control"
								placeholder="Xác nhận mật khẩu">
						</div>
						<button type="submit"
							class="btn btn-success btn-flat m-b-30 m-t-30">Sign up</button>
						<div class="register-link m-t-15 text-center">
							<p>
								You have account ? <a href="login"> Sign In Here</a>
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
	<script type="text/javascript">
		var password = document.getElementById("password");
		var confirm_password = document.getElementById("confirm_password");
		
		function validatePassword() {
			if (password.value != confirm_password.value) {
				confirm_password.setCustomValidity("Nhập sai mật khẩu");
			} else {
				confirm_password.setCustomValidity('');
			}
		}

		password.onchange = validatePassword;
		confirm_password.onkeyup = validatePassword;
	</script>


</body>

</html>
