<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Awesome Hyderabad | Register</title>
<link rel="icon" type="image/png"
	href="<%=request.getContextPath()%>/resources/images/logo.jpg">
<link rel="stylesheet" href="./resources/css/styles.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="./resources/js/user.js"></script>

</head>
<body>
	<div id="wrapper">
		<div id="page-wrapper" class="gray-bg">
			<jsp:include page="header.jsp" />
			<div class="row wrapper border-bottom white-bg page-heading"></div>


			<h4 style="padding-left: 140px; margin-left: 500px; margin-top: 36px;">Register
				Here</h4>

			<div class="ibox float-e-margins">
				<div class="ibox-content">
					<div id="DataTables_Table_0_wrapper"
						class="dataTables_wrapper no-footer">

						<div id="successmessage"></div>
						<div id="updatesuccessmessage"></div>
						<div id="errorblock"></div>
						<form class="form-horizontal" method="post"
							style="margin-left: 417px; font-size: 15px; font-family: monospace; padding-top: 30px;">
							<div class="form-group">
								<label class="control-label col-sm-2" for="firstName">First
									Name:</label>
								<div class="col-sm-3">
									<input type="text" class="form-control" id="firstName"
										placeholder="Enter First Name">
								</div>
							</div>

							<div class="form-group">
								<label class="control-label col-sm-2" for="email">Last
									Name:</label>
								<div class="col-sm-3">
									<input type="text" class="form-control" id="lastName"
										placeholder="Enter LastName">
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-2" for="email">Email:</label>
								<div class="col-sm-3">
									<input type="text" class="form-control" id="email"
										placeholder="Enter email">
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-2" for="pwd">Password:</label>
								<div class="col-sm-3">
									<input type="password" class="form-control" id="password"
										placeholder="Enter password">
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-offset-2 col-sm-10">
									<input type="submit" class="btn btn-default" id="user_submit"
										style="background-color: rgb(65, 105, 179); color: white;height: 45px; width: 160px; margin-left: -178px; margin-top: 10px;" value="Register"></input>
									<span>Already registered? <a href="login">Login</a></span>
								</div>

							</div>
						</form>

					</div>
				</div>
			</div>
		</div>
		<jsp:include page="footer.jsp" />
	</div>
</body>
</html>