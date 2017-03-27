<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html >
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Awesome Hyderabad | Login</title>
<link rel="icon" type="image/png"
	href="<%=request.getContextPath()%>/resources/images/logo.jpg">
<link
	href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css"
	rel="stylesheet">
<link href="./resources/css/login.css" rel="stylesheet">
<!-- <script src="./resources/js/jquery.min.js"></script> -->

<script type="text/javascript"
	src="http://ajax.aspnetcdn.com/ajax/jquery/jquery-1.9.1.min.js"></script>
<script type="text/javascript"
	src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.7/jquery.validate.min.js"></script>
<script src="./resources/js/bootstrap.js"></script>
<!-- <script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.9/jquery.validate.js"></script> -->
<!-- <script src="./resources/js/jquery.validate.min.js"></script> -->

<script src="./resources/js/validation.js"></script>
<script type="text/javascript" src="./resources/js/login.js"></script>

</head>
<body>
	<div id="wrapper">
		<div id="page-wrapper" class="gray-bg">
			<jsp:include page="header.jsp" />
			<div class="row wrapper border-bottom white-bg page-heading"></div>

			<img alt="" src="resources/images/hyd.jpg" style="height: 472px;">

			<div style="margin-top: -454px;">
				<h2
					style="font-family: monospace; font-size: 25px; font-style: italic; color: aliceblue; margin-left: 500px; padding-top: 20px; padding-bottom: 35px;">Login
					Here</h2>
				<div id="div_loginModelSuccessMessage" class="isa_success_modal"
					style="display: none">
					<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
					<span id="loginModelSuccessMessage"></span>
				</div>
				<div id="div_loginModelErrorMessage" class="isa_error_modal"
					style="display: none; background-color: ivory; margin-left: 373px; color: brown;">
					<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
					<span id="loginModelErrorMessage"
						style="background-color: aliceblue;"></span>
				</div>
				<form id="login_form" class="form-horizontal" method="post">


					<div class="form-group">

						<div class="col-sm-3">
							<input type="text" class="form-control" id="userName"
								name="userName" placeholder="Enter Email">
						</div>
					</div>
					<div class="usernameError"
						style="color: rgba(255, 0, 0, 0.7); background-color: aliceblue; padding-right: 15px;"></div>

					<div class="form-group">

						<div class="col-sm-3">
							<input type="password" class="form-control" id="passWord"
								name="passWord" placeholder="Enter Password">
						</div>
					</div>
					<div class="passwordError"
						style="color: rgba(255, 0, 0, 0.7); background-color: aliceblue; padding-right: 15px;"></div>
					<button type="submit"
						style="color: white; font-size: 18px; height: 50px;"
						onclick="loginUser(); return false;">Login</button>
					<div class="error_login"></div>
					<div style="padding-top: 15px;">
						<span style="font-size: 20px; color: beige;">Not yet
							registered? <a href="register">Register</a>
						</span>
					</div>

				</form>



			</div>
			<div style="margin-left: 330px; margin-top: 100px;">
				<span style="font-family: cursive; font-size: 20px;">Or Login
					with</span> <a href="facebook"><button
						style="color: white; font-size: 18px; height: 50px; width: 150px; background: #3b5998;">Facebook</button>
				</a> <a href="#"><button
						style="color: white; font-size: 18px; height: 50px; width: 150px; background: #c32f10;">Google+</button>
				</a>

			</div>

			<div
				style="margin-left: 372px; padding-top: 25px; padding-bottom: 13px;">
				<p>
					<a href="forgot-password">Forgot your password ?</a>
				</p>
			</div>

		</div>
		<jsp:include page="footer.jsp" />
	</div>
</body>
</html>