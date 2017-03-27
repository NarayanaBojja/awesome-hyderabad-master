<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Awesome Hyderabad</title>
<script src="./resources/js/jquery.min.js"></script>
<script src="./resources/js/bootstrap.js"></script>
<script src="./resources/js/validation.js"></script>
<script src="./resources/js/common.js"></script>
</head>
<body>

	<jsp:include page="header.jsp" />
	<div id="div_successMessage" class="isa_success"
		style="display: none; background-color: darkseagreen; color: beige; padding-top: 145px; padding-bottom: 40px; padding-left: 170px; margin-right: 400px; margin-left: 320px;">
		<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
		<span id="successMessage"
			style="background-color: darkseagreen; color: beige;">${message}</span>
	</div>
	<div id="div_errorMessage" class="isa_error"
		style="display: none; background-color: antiquewhite; color: brown; padding-top: 145px; padding-bottom: 40px; padding-left: 170px; margin-right: 400px; margin-left: 320px;">
		<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
		<span id="errorMessage">${message}</span>
	</div>

	<div style="display: block;" id="enterEmail">
		<form class="form-horizontal" method="POST" id="emailsubmit"
			style="margin-left: 417px; font-size: 15px; font-family: monospace; padding-top: 30px;">
			<div class="form-group">
				<label class="control-label col-sm-2" for="firstName"
					style="margin-top: 50px;">Enter Email:</label>
				<div class="col-sm-3">
					<input type="text" class="form-control" id="forgotEmail"
						style="margin-top: 50px;" name="firstName"
						placeholder="Enter Your Email">
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<input type="submit" class="btn btn-default" id="user_submit"
						onclick="forgotPassword(); return false;"
						style="background-color: rgb(65, 105, 179); color: white; height: 35px; width: 90px; margin-left: 250px; margin-top: -80px;"
						value="Submit"></input>
				</div>
			</div>
		</form>
	</div>
	<div style="margin-left: 420px; display: none;" id="setPassword">
		<form class="form-horizontal" method="POST" id="newPasswords"
			style="font-size: 15px; font-family: monospace; padding-top: 170px;">
			<div class="form-group">
				<label class="control-label col-sm-2" for="password"
					style="margin-top: 30;">Enter Password:</label>
				<div class="col-sm-3">
					<input type="password" class="form-control" id="password"
						style="margin-top: 10px;" name="password"
						placeholder="Enter New Password">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="confirmPassword"
					style="margin-top: 20px;">Confirm Password:</label>
				<div class="col-sm-3">
					<input type="password" class="form-control" id="confirmPassword"
						style="margin-top: 20px;" name="confirmPassword"
						placeholder="Confirm Password">
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<input type="submit" class="btn btn-default" id="user_submit"
						onclick="setPassword(); return false;"
						style="background-color: rgb(65, 105, 179); color: white; height: 35px; width: 180px; margin-left: 0px; margin-top: -15px;"
						value="Submit"></input>
				</div>
			</div>


		</form>

	</div>


	<jsp:include page="footer.jsp" />
</body>
</html>