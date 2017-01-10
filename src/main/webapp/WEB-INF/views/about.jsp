<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/bootstrap.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/styles.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/font-awesome.min.css" />

<title>Awesome Hyderabad</title>

<link rel="icon" type="image/png"
	href="<%=request.getContextPath()%>/resources/images/logo.jpg">

<body>

	<div id="header-container">
		<jsp:include page="header.jsp"/>
	</div>
	
	
	<div>
		<div class="col-md-2 hidden-xs hidden-sm"></div>
		<div id="body-area-middle-container" class="col-xs-12 col-sm-12 col-md-8 col-lg-8">
				<div id="div_successMessage" class="isa_success" style="display: none">
					<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
    				<span id="successMessage">${message}</span>
				</div>
				<div id="div_errorMessage" class="isa_error" style="display: none">
					<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
    				<span id="errorMessage">${message}</span>
				</div>
				
				<div class="panel panel-warning">
					<div class="panel-heading">
   						<h1 class="panel-title"><strong>About Awesome Hyderabad</strong> </h1>
  					</div>
 					<div class="panel-body">
 						<p>Awesome Hyderabad is the place where you can see information about all famous places in Hyderabad.
 						Here You can find whole information regarding a particular place.
 						</p>
					</div>
  				</div>
  				
  				<div class="panel panel-primary">
					<div class="panel-heading">
   						<h1 class="panel-title"><strong>About Developer</strong> </h1>
  					</div>
 					<div class="panel-body">
 					<img src="resources/images/myphoto.jpg" class="img-rounded" alt="Cinque Terre" width="150" height="200">
 					<p>
 						<strong>Narayana Bojja</strong><br>
 						Software Engineer <br/>
 						B.Tech   <br/>
 						Email   : narayana.bojja143@gmail.com<br/>
 						Contact : +91 9848022338<br/>
 						
 					</p>	
						<br /> Follow me on: 
						<a 	href="https://www.facebook.com/BojjaNarayana" target="_blank"><img
							style="width: 30px; height: 30px"
							src="<%=request.getContextPath()%>/resources/images/facebook.png" /></a>
						<a href="https://plus.google.com/u/1/114786590460274739658" target="_blank"><img
							style="width: 30px; height: 30px"
						src="<%=request.getContextPath()%>/resources/images/google.png" /></a>
						<a href="https://in.linkedin.com/in/narayanabojja" target="_blank"><img
							style="width: 30px; height: 30px"
							src="<%=request.getContextPath()%>/resources/images/linked-in.png" /></a>
						<a href="https://github.com/NarayanaBojja" target="_blank"><img
							style="width: 35px; height: 35px"
							src="<%=request.getContextPath()%>/resources/images/github-mark.png" /></a>
					</div>
  				</div>					
			</div>

			<div class="col-md-2 hidden-xs hidden-sm"></div>
		</div>

	

	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 padding-zero" id="footer-container">
		<jsp:include page="footer.jsp" />
	</div>

	

	<!-- JavaScript -->
	
	
<script type="text/javascript"
		src="<%=request.getContextPath()%>/resources/js/jquery.js"></script>
<script type="text/javascript"
		src="<%=request.getContextPath()%>/resources/js/bootstrap.js"></script>
<script>
	$(document).ready(function(){
		$("#menu_about").addClass("mainmenu-underline");
	});
</script>
	
</body>
</html>
