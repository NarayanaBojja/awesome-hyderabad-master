<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Awesome Hyderabad | User Profile</title>
<link rel="icon" type="image/png"
	href="<%=request.getContextPath()%>/resources/images/logo.jpg">
<script type="text/javascript"
	src="http://ajax.aspnetcdn.com/ajax/jquery/jquery-1.9.1.min.js"></script>

</head>
<body>


	<div style="margin-top: 0px;">
		<jsp:include page="header.jsp" /></div>
	<br>
	<br>

	<div class="col-md-1 hidden-xs hidden-sm"></div>






	<div id="div_successMessage" class="isa_success"
		style="display: none; font-family: monospace; font-size: 18px; font-style: italic; color: blue; margin-right: 534px; margin-left: 178px;
	/* padding-top: 20px; */
	/* padding-bottom: 35px; */ background-color: darkgray;">
		<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
		<span id="successMessage">${message}</span>
	</div>
	<div id="div_errorMessage" class="isa_error"
		style="display: none; background-color: bisque; margin-left: 262px; color: red; margin-right: 636px;">
		<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
		<span id="errorMessage">${message}</span>
	</div>


	<div class="col-xs-12 col-sm-9 col-md-9"
		style="padding: 0px 0px 0px 0px; margin-top: 40px; margin-left: 40px;">

		<div id="div_userPersonalInfo" class="panel panel-info" align="center">
			<div class="panel-heading">
				<h1 class="panel-title">Personal Information</h1>
			</div>

			<div class="panel-body">
				<div class="input-group" style="margin-left: 12%">
					<span class="input-group-addon glyphicon glyphicon-user"
						id="icon_profileUserName"></span> <input type="text"
						id="firstName" name="profileUserName" value="${user.firstName}"
						class="form-control common-input-transparent" style="width: 70%"
						placeholder="Enter First Name*"
						aria-describedby="icon_profileUserName" />
				</div>
				<div class="input-group" style="margin-left: 12%">
					<span class="input-group-addon glyphicon glyphicon-user"
						id="icon_profileUserName"></span> <input type="text" id="lastName"
						name="profileUserName" value="${user.lastName}"
						class="form-control common-input-transparent" style="width: 70%"
						placeholder="Enter Last Name*"
						aria-describedby="icon_profileUserName" />
				</div>
				<div class="input-group" style="margin-left: 12%">
					<span class="input-group-addon glyphicon glyphicon-envelope"
						id="icon_profileUserEmail"></span> <input type="text" id="email"
						name="profileUserEmail" value="${user.email}"
						aria-describedby="icon_profileUserEmail" style="width: 70%"
						class="form-control common-input-transparent" disabled />
				</div>
				<div class="input-group" style="margin-left: 12%">
					<span class="input-group-addon glyphicon glyphicon-envelope"
						id="icon_profileUserEmail"></span> <input type="text"
						id="password" name="profileUserEmail" value="${user.password}"
						aria-describedby="icon_profileUserEmail" style="width: 70%"
						class="form-control common-input-transparent" />
				</div>

				<div class="input-group" style="margin-left: -19%">
					<span class="input-group-addon glyphicon glyphicon-send"
						id="icon_updateUserInfoBTN" style="display: none"></span> <input
						style="height: 45px; width: 115%; padding-left: 14px; background-color: rgb(65, 105, 179); color: ghostwhite;"
						id="updateUserInfoBTN" type="submit"
						class="form-control common-btn" value="Save Changes"
						onclick="saveUsersPersonalInfo('${user.firstName}','${user.lastName}', '${user.email}', '${user.password}'); return false;"
						aria-describedby="icon_updateUserInfoBTN" />

				</div>

			</div>
		</div>
	</div>


	<div class="col-md-1 hidden-xs hidden-sm"></div>

	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 padding-zero"
		id="footer-container">
		<jsp:include page="footer.jsp" />
	</div>



	<!-- JavaScript -->

	<script type="text/javascript" src="./resources/js/bootstrap.js"></script>
	<script type="text/javascript" src="./resources/js/common.js"></script>
	<script type="text/javascript" src="./resources/js/validation.js"></script>
	<script type="text/javascript" src="./resources/js/user-update.js"></script>
	<script>
		$(document).ready(function() {
			$("#menu_profile").addClass("mainmenu-underline");
		});
	</script>
</body>
</html>