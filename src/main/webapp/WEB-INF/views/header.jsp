<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html>
<head>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/bootstrap.css" />

<link rel="stylesheet" href="./resources/css/styles.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/font-awesome.min.css" />

<script src="<%=request.getContextPath()%>/resources/js/jquery.js" /></script>
</head>
<body>

	<%
		String userName = null;
			Cookie[] cookies = request.getCookies();
			if(cookies !=null){
		for(Cookie ck : cookies) {
			if(ck.getName().equalsIgnoreCase("userName")) {
		userName = ck.getValue();
			}
		}
			}
			if(userName == null) 
		//((HttpServletResponse)response).sendRedirect(".");
	%>
	<c:if test="${loginUserSesson != null}">
		<c:set var="loginUserName" value="${loginUserSesson}" />
		<%
			userName = (String)pageContext.getAttribute("loginUserName");
				if(userName == "logout")
				userName = null;
		%>
	</c:if>


	<header class="header">
		<ul class="nav  navbar-nav">
			<li id="#"><a href="#"><span> Home </span></a></li>
			<li id="menu_man"><a href="#"><span>
						Famous Places </span></a></li>
			<li id="menu_cart" class="hidden-xs"><a href="#"
				onclick="goToViewCart(); return false;"> <span
					class="glyphicon glyphicon-shopping-cart"> </span> <c:if
						test="${favoritePlacesCount == null}">
						<c:set var="favoritePlacesCount" value="0" scope="page"></c:set>
					</c:if> Favorite Places <strong><span
						class="badge crtProductCount">${favoritePlacesCount}</span></strong>
			</a></li>
			<li id="menu_about" class="hidden-xs hidden-sm hidden-md"><a
				href="about"><span class="glyphicon glyphicon-info-sign"></span>
					About</a></li>
			<li id="menu_contact" class="hidden-xs hidden-sm hidden-md"><a
				href="contact"><span class="glyphicon glyphicon-phone-alt"></span>
					Contact</a></li>

			<%
				if(userName == null || userName.length() == 0){
			%>
			<li class="hidden-xs"><a href="login"> <span
					class="glyphicon glyphicon glyphicon-log-in"></span> Log In /
					SignUp
			</a></li>

			<%
				} else {
			%>

			<li id="menu_profile" class="dropdown hidden-xs"><a href="#"
				class="dropdown-toggle" data-toggle="dropdown" role="button"
				aria-haspopup="true" aria-expanded="false">Hi <span
					id="headerUserName"><%=userName%></span><span class="caret"></span></a>
				<ul id="list" class="dropdown-menu"
					aria-labelledby="dropdownMenuDivider">
					<li><a href="user-profile?type=1"><span
							class="glyphicon glyphicon-user"></span> Profile</a></li>
					<li><a href="logout"><span
							class="glyphicon glyphicon-log-out"></span> Log Out</a></li>
				</ul></li>
			<%
				}
			%>

		</ul>
	</header>







	<div class="visible-xs-block isa_error">
		<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
		<i class="fa fa-warning"></i> Please increase window size for better
		experience.
	</div>



	<!-- Refresh page on back button -->
	<input type="hidden" id="refresh" value="no">

	<!-- Success and error messages -->
	<input type="hidden" id="messageStatus" value="${messageStatus}">

	<!-- Success and error messages -->
	<input type="hidden" id="profileType" value="${profileType}">

	<!-- Success and error messages -->
	<input type="hidden" id="loginUserName" value="<%=userName%>">
	<script>
		$(document).ready(function() {
			$("#menu_profile").mouseover(function() {
				$("#list").show();
			});

			$("#menu_profile").mouseleave(function() {
				$("#list").hide();
			});
		});
	</script>
</body>
</html>