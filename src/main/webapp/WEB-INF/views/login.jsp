<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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

<script type="text/javascript" src="./resources/js/user.js"></script>

</head>
<body>
	<div id="wrapper">
		<div id="page-wrapper" class="gray-bg">
			<jsp:include page="header.jsp" />
			<div class="row wrapper border-bottom white-bg page-heading"></div>

			<img alt="" src="resources/images/hyd.jpg" style="height: 534px;">

			<div style="margin-top: -454px;">
				<h2
					style="font-family: monospace; font-size: 25px; font-style: italic; color: aliceblue; margin-left: 500px; padding-top: 20px; padding-bottom: 35px;">Login
					Here</h2>

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
						style="color: white; font-size: 18px; height: 50px;">Login</button>
						<div class="error_login"></div>
					<div style="padding-top: 15px;">
						<span style="font-size: 20px; color: beige;">Not yet
							registered? <a href="register">Register</a>
						</span>
					</div>

				</form>
			</div>

		</div>
		<jsp:include page="footer.jsp" />
	</div>
</body>
</html>