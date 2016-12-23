$(document).ready(function() {

	$('#user_submit').on('click', function() {

		var firstName = $("#firstName").val();
		var lastName = $("#lastName").val();
		var email = $("#email").val();
		var password = $("#password").val();

		var userData = {

			"firstName" : firstName,
			"lastName" : lastName,
			"email" : email,
			"password" : password

		};
		
	alert(JSON.stringify(userData));
	
		$('#user_submit').prop('disabled', true);	
		
		$.ajax({
			type : 'POST',
			contentType : 'application/json',
			url : 'addUser',
			data : JSON.stringify(userData),

			success : function(result) {
				if (result.status == "SUCCESS") {
					successMsgFun(result.message);
					location.href = "home";
				} else {
					$('#user_submit').prop('disabled', false);
					failureMsgFun(result.message);
				}
			}

		});
		
		

	});

});

function successMsgFun(content) {
	$('.ibox-content #DataTables_Table_0_wrapper .alert-success').remove();
	$('.ibox-content #DataTables_Table_0_wrapper .alert-danger').remove();
	var closeBtn = $('<button>').addClass('close').attr('type', 'button').attr(
			'data-dismiss', 'alert').attr('aria-hidden', 'true').append('x');
	var successDiv = $('<div>').addClass(
			'alert alert-success alert-dismissable').append(closeBtn).append(
			content);
	$('.ibox-content #DataTables_Table_0_wrapper').prepend(successDiv);
}

// show failure message
function failureMsgFun(content) {
	$('.ibox-content #DataTables_Table_0_wrapper .alert-success').remove();
	$('.ibox-content #DataTables_Table_0_wrapper .alert-danger').remove();
	var closeBtn = $('<button>').addClass('close').attr('type', 'button').attr(
			'data-dismiss', 'alert').attr('aria-hidden', 'true').append('x');
	var failureDiv = $('<div>')
			.addClass('alert alert-danger alert-dismissable').append(closeBtn)
			.append(content);
	$('.ibox-content #DataTables_Table_0_wrapper').prepend(failureDiv);
}


