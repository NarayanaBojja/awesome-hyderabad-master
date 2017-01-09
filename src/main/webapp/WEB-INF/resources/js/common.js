var warningTitle = "<i class=\"fa fa-warning\"></i> ";
var errorTitle = "<i class=\"fa fa-warning\"></i> ";
var successTitle = "<i class=\"fa fa-check\"></i> ";

function sendFeedbackMail() {
	try { 				
	
	var name = $("#feedbackMailName").val();
	var email =$("#feedbackMailEmail").val();
	var subject = $("#feedbackMailSubject").val();
	var mailBody = $("#feedbackMailMessage").val();
	var message = "";
	
	if(name == "" || email == "" || subject == "" || mailBody == "") {
		
		message = "All Fields are required. Please fill valid details before you proceed.";
	}
	else {
		message = validateEmail(email);
	}
	
	if(message != "") {
		$("#div_successMessage").css('display','none');
	     $("#div_errorMessage").css('display','block');
	     $("#div_errorMessage").html(errorTitle + message);
	     return false;
	}
	else {
		
		var json = name + "####@@@@####" + email + "####@@@@####" + subject + "####@@@@####" + mailBody;

		$.ajax({
			type : "POST",
			contentType : "application/json",
			url : "send-feedbackmail",
			data : JSON.stringify(json),
			success : function(data) {
				
				if(data.indexOf("fa-check") > -1) {
					$("#feedbackMailName").val('');
					$("#feedbackMailEmail").val('');
					$("#feedbackMailSubject").val('');
					$("#feedbackMailMessage").val('');
					
					$(".isa_success").css('display','block');
					$(".isa_error").css('display','none');
					$("#successMessage").html(data);
					
					console.log("Feedback mail success");
				}
				else {
					$(".isa_error").css('display','block');
					$(".isa_success").css('display','none');
					$("#errorMessage").html(data);
				}
				
			}
		});
		
		
	}
	
	}
	catch (e) {
		console.error(e);
	}
}