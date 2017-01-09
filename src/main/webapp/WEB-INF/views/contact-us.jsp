<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Awesome Hyderabad | Contact Us</title>
<link rel="icon" type="image/png"
	href="<%=request.getContextPath()%>/resources/images/logo.jpg">
<link rel="icon" type="image/png"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootswatch/3.3.7/cerulean/bootstrap.min.css">
<script src="./resources/js/jquery.min.js"></script>
<script src="./resources/js/bootstrap.js"></script>
<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDmIWxH5BNvDhRi8K8gVNwx0OoLQ1BVmHM&callback=initialize"></script>
<script>
	var myCenter = new google.maps.LatLng(17.4474780, 78.3859510);

	function initialize() {
		var mapProp = {
			center : myCenter,
			zoom : 15,
			mapTypeId : google.maps.MapTypeId.ROADMAP
		};

		var map = new google.maps.Map(document.getElementById("googleMap"),
				mapProp);

		var marker = new google.maps.Marker({
			position : myCenter,
		});

		marker.setMap(map);
	}

	google.maps.event.addDomListener(window, 'load', initialize);
</script>
<script src="./resources/js/validation.js"></script>
<script src="./resources/js/common.js"></script>
</head>
<body>
	<div id="header-container">
		<jsp:include page="header.jsp" />
	</div>

	<div>
		<div class="col-md-2 hidden-xs hidden-sm"></div>
		<div id="body-area-middle-container"
			class="col-xs-12 col-sm-12 col-md-8 col-lg-8">
			<div class="panel panel-primary">
				<div class="panel-heading" align="center">
					<h3>Contact us</h3>
					<p>
						Phone : +91 9848022338 <br> Email : <a style="color: aliceblue"
							href="mailto:narayana.bojja143@gmail.com?subject=Customer%20Feedback">narayana.bojja143@gmail.com</a>
					</p>

				</div>

				<div class="panel-body">
					<div id="div_successMessage" class="isa_success"
						style="display: none">
						<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
						<span id="successMessage"
							style="background-color: darkseagreen; color: beige;">${message}</span>
					</div>
					<div id="div_errorMessage" class="isa_error"
						style="display: none; background-color: antiquewhite; color: brown;">
						<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
						<span id="errorMessage">${message}</span>
					</div>

					<div align="left">
						<h4>Send your feedback</h4>


						<div class="input-group" style="margin-left: 0%">
							<span class="input-group-addon glyphicon glyphicon-user"
								id="icon_feedbackMailName"></span> <input type="text"
								id="feedbackMailName" name="feedbackMailName"
								class="form-control common-input-transparent"
								aria-describedby="icon_feedbackMailName"
								placeholder="Enter Name*" style="width: 70%" required />
						</div>

						<div class="input-group" style="margin-left: 0%">
							<span class="input-group-addon glyphicon glyphicon-envelope"
								id="icon_feedbackMailEmail"></span> <input type="email"
								id="feedbackMailEmail" name="feedbackMailEmail"
								class="form-control common-input-transparent"
								aria-describedby="icon_feedbackMailEmail"
								placeholder="Enter Email*" style="width: 70%" required />
						</div>

						<div class="input-group" style="margin-left: 0%">
							<span class="input-group-addon glyphicon glyphicon-header"
								id="icon_feedbackMailSubject"></span> <input type="text"
								id="feedbackMailSubject" name="feedbackMailSubject"
								class="form-control common-input-transparent"
								aria-describedby="icon_feedbackMailSubject"
								placeholder="Enter Subject*" style="width: 70%" />
						</div>

						<div class="input-group" style="margin-left: 0%">
							<span class="input-group-addon glyphicon glyphicon-edit"
								id="icon_feedbackMailMessage"></span>
							<textarea id="feedbackMailMessage" name="feedbackMailMessage"
								class="form-control common-input-transparent"
								aria-describedby="icon_feedbackMailMessage"
								placeholder="Enter Messages*" style="height: 100px; width: 70%"
								required></textarea>
						</div>

						<div class="input-group" style="margin-left: 0%">
							<span class="input-group-addon glyphicon glyphicon-send"
								id="icon_sendMailMessage" style="display: none"></span> <input
								type="submit" class="form-control common-btn"
								onclick="sendFeedbackMail(); return false;"
								style="width: 130%; height: 45px; background-color: rgb(65, 105, 179); color: ghostwhite;"
								aria-describedby="icon_sendMailMessage" value="Send Feedback" />
						</div>

					</div>
					<br> <br>

					<p>
					<h3>Find Us :</h3>
					</p>

					<div align="right" id="googleMap"
						style="width: 500px; height: 380px;"></div>


				</div>
			</div>

		</div>

		<div class="col-md-2 hidden-xs hidden-sm"></div>
	</div>
	<div id="map"></div>









	<jsp:include page="footer.jsp" />


</body>
</html>