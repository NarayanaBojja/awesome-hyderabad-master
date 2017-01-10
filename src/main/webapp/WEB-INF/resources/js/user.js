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

		$('#user_submit').prop('disabled', true);

		$.ajax({
			type : 'POST',
			contentType : 'application/json',
			url : 'addUser',
			data : JSON.stringify(userData),

			success : function(result) {
				if (result.status == "SUCCESS") {
					successMsgFun(result.message);
					
				} else {
					$('#user_submit').prop('disabled', false);
					failureMsgFun(result.message);
				}
			}

		});

	});

});

$(document)
		.ready(
				function() {

					$("#login_form")
							.validate(
									{

										rules : {
											Username : {
												required : true,
												email : true,
												regex : /^[a-zA-Z0-9]+[a-zA-Z0-9._-]+@[a-zA-Z0-9]+\.[a-zA-Z0-9.]{2,7}$/
											},
											Password : {
												required : true,
												regex : /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,32}$/
											}

										},

										messages : {
											Username : {
												required : "Please Enter Email",
												email : "Please enter a valid email address"
											},

											password : {
												required : "Please Enter Password",
												regex : "Please Enter Minimum 6 Characters and atleast One Digit,One Lower case letter,One Upper case letter"

											}

										},
										errorPlacement : function(error,
												element) {
											if (element.attr("name") == "Username") {
												error.appendTo($(element)
														.parent());
											} else {
												error.insertAfter(element);
											}
										},
										success : function(label, element) {
											label.remove();
										}

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
