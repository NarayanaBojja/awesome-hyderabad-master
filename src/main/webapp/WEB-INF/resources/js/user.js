$(document).ready(function() {

	$('#user_submit').on('click', function() {
		
		/*if($("#usersubmit").validate(e)){
			 e.preventDefault();*/
		alert("Hi")
			var firstName = $("#firstName").val();
			var lastName = $("#lastName").val();
			var email = $("#email").val();
			var password = $("#passWord").val();

			var userData = {
				"firstName" : firstName,
				"lastName" : lastName,
				"email" : email,
				"password" : password

			};

			alert(JSON.stringify(userData));
			
			$('#usersubmit').prop('disabled', true);

			$.ajax({
				type : 'POST',
				contentType : 'application/json',
				url : 'addUser',
				data : JSON.stringify(userData),

				success : function(result) {
					if (result.status == "SUCCESS") {
						successMsgFun(result.message);
						location.href="login";	
					} else {
						$('#user_submit').prop('disabled', false);
						failureMsgFun(result.message);
					}
				}

			});

		/*}else{
			
		}*/
			

	});

	/*$("#usersubmit")
	.validate(
			{

				rules : {
					firstName : {
						required : true,

						regex : /^[A-Za-z\s]+$/
					},
					lastName : {
						required : true,
						regex : /^[A-Za-z\s]+$/
					},
					email : {
						required : true,
						email : true,
						regex : /^[a-zA-Z0-9]+[a-zA-Z0-9._-]+@[a-zA-Z0-9]+\.[a-zA-Z0-9.]{2,7}$/
					},
					passWord : {
						required : true,
						regex : /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,32}$/
					}

				},

				messages : {
					firstName : {
						required : "Please Enter First Name",
						email : "Please enter only Alphabets"
					},

					lastName : {
						required : "Please Enter Last Name",
						regex : "Please enter only Alphabets"

					},
					email : {
						required : "Please Enter Email",
						email : "Please enter a valid email address"
					},

					passWord : {
						required : "Please Enter Password",
						regex : "Please Enter Minimum 6 Characters and atleast One Digit,One Lower case letter,One Upper case letter"

					}

				},
				errorPlacement : function(error,
						element) {
					if (element.attr("name") == "firstName") {
						error
								.appendTo(".firstNameError");
					} else if (element.attr("name") === "lastName") {
						error
								.appendTo(".lastNameError");
					} else if (element.attr("name") === "email") {
						error.appendTo(".emailError");
					} else if (element.attr("name") === "passWord") {
						error
								.appendTo(".passWordError");
					}

					else {
						error.insertAfter(element);
					}
				}

			});
	
	*/
	/*$("#login_form")
	.validate(
			{

				rules : {
					userName : {
						required : true,
						email : true,
						regex : /^[a-zA-Z0-9]+[a-zA-Z0-9._-]+@[a-zA-Z0-9]+\.[a-zA-Z0-9.]{2,7}$/
					},
					passWord : {
						required : true,
						regex : /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,32}$/
					}

				},

				messages : {
					userName : {
						required : "Please Enter Email",
						email : "Please enter a valid email address"
					},

					passWord : {
						required : "Please Enter Password",
						regex : "Please Enter Minimum 6 Characters and atleast One Digit,One Lower case letter,One Upper case letter"

					}

				},
				errorPlacement : function(error,
						element) {
					if (element.attr("name") == "userName") {
						error
								.appendTo(".usernameError");
					} else if (element.attr("name") === "passWord") {
						error
								.appendTo(".passwordError");
					}

					else {
						error.insertAfter(element);
					}
				}

			});
	
	
	*/
	
	
	
	
	
	
	
	
	
	
	
	
	
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
