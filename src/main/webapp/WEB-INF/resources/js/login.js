var modalLoadingState = false;
var warningTitle = "<i class=\"fa fa-warning\"></i> ";
var errorTitle = "<i class=\"fa fa-warning\"></i> ";
var successTitle = "<i class=\"fa fa-check\"></i> ";

function loginUser() {
	try {
		modalLoadingState = true;

		var email = document.getElementById('userName').value;
		var password = document.getElementById('passWord').value;

		var message = "";
		if (email == "" || password == "")
			message = "Please fill valid email and password before you proceed. <br>";
		else
			message = validateEmail(email);

		if (message != "") {
			$(".isa_success_modal").css('display', 'none');
			$(".isa_error_modal").css('display', 'block');
			$("#loginModelErrorMessage").html(warningTitle + message);

		} else {
			var json = email + "####@@@@####" + password;
			alert(json)
			$.ajax({
				type : "POST",
				contentType : "application/json",
				url : "login-user",
				data : JSON.stringify(json),
				success : function(data) {
					if (data.indexOf("fa-check") > -1) {
						location.href = "home";

					} else {
						$(".isa_success_modal").css('display', 'none');
						$(".isa_error_modal").css('display', 'block');
						$("#loginModelErrorMessage").html(data);
					}
				}
			});
		}

	} catch (e) {
		console.error(e.message);
	}

}
