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
<script
	src="./resources/js/jquery.min.js"></script>
<script
	src="./resources/js/bootstrap.js"></script>
<script
	src="./resources/js/jquery.validate.min.js"></script>

<script type="text/javascript" src="./resources/js/user.js"></script>

</head>
<body>
	<div id="wrapper">
		<div id="page-wrapper" class="gray-bg">
			<jsp:include page="header.jsp" />
			<div class="row wrapper border-bottom white-bg page-heading"></div>
			<h2>Login Here</h2>

			<form id="login_form" method="post">

				<div class="container">
					<label><b>Username</b></label> <input type="text"
						placeholder="Enter Email" id="Username" name="Username"> <label><b>Password</b></label>
					<input type="password" placeholder="Enter Password" name="Password">

					<button type="submit">Login</button>

				</div>

				<div class="container" style="background-color: #f1f1f1">

					<span>Not yet registered? <a href="register">Register</a></span>
				</div>
			</form>
		</div>
		<jsp:include page="footer.jsp" />
	</div>
</body>
</html>