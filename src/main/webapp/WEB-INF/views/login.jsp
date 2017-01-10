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
<script src="./resources/js/jquery.min.js"></script>
<script src="./resources/js/bootstrap.js"></script>
<script src="./resources/js/jquery.validate.min.js"></script>

<script type="text/javascript" src="./resources/js/user.js"></script>

</head>
<body>
	<div id="wrapper">
		<div id="page-wrapper" class="gray-bg">
			<jsp:include page="header.jsp" />
			<div class="row wrapper border-bottom white-bg page-heading"></div>
			<h2
				style="font-family: monospace; font-size: 25px; font-style: italic; margin-left: 500px; padding-top: 20px; padding-bottom: 35px;">Login
				Here</h2>

			<form id="login_form" class="form-horizontal" method="post">


				<div class="form-group">
					<label class="control-label col-sm-2" for="firstName">User
						Name</label>
					<div class="col-sm-3">
						<input type="text" class="form-control" id="userName"
							placeholder="Enter Email">
					</div>
				</div>

				<div class="form-group">
					<label class="control-label col-sm-2" for="email">Password</label>
					<div class="col-sm-3">
						<input type="text" class="form-control" id="passWord"
							placeholder="Enter Password">
					</div>
				</div>

				<button type="submit"
					style="color: white; font-size: 18px; height: 50px;">Login</button>
				<div style="padding-top: 15px;"><span>Not yet registered? <a href="register">Register</a></span>
				</div>
				
			</form>
		</div>
		<jsp:include page="footer.jsp" />
	</div>
</body>
</html>