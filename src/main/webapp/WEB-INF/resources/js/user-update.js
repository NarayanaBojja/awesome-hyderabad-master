function saveUsersPersonalInfo(firstName,lastName, email, passWord) {
	try {
		firstName = firstName.replace(/['"]+/g, '');
		lastName = lastName.replace(/['"]+/g, '');
	email = email.replace(/['"]+/g, '');
	passWord = passWord.replace(/['"]+/g, '');
	
	
	
	var fName = document.getElementById('firstName').value;
	var lName = document.getElementById('lastName').value;
	var em = document.getElementById('email').value;
	var pwd = document.getElementById('password').value;
	var message = "";
	
	if(firstName === fName && lastName === lName && email === em && passWord===pwd) {
		return false;
	}
	
	if(fName === "" ||  lName === ""||pwd==="") 
		message = "Please fill all fields before you proceed.";
	else {
		message = validateName(firstName);
		message = message + validateName(lastName);
		message = message + validateEmail(email);
		
	}
	
	if(message != "") {
		$("#div_errorMessage").css('display','block');
		$("#div_successMessage").css('display','none');
		$("#errorMessage").html(warningTitle + message);
		return false;
	}
	else {
		var json = fName + "####@@@@####" + lName + "####@@@@####" + em+"####@@@@####"+pwd;
		
		$.ajax({
			type : "POST",
			contentType : "application/json",
			url : "updateUser.html",
			data : JSON.stringify(json),
			success : function(data) {	
				if(data.indexOf("fa-check") > -1) {
					if(firstName !== fName)
						$("#headerUserName").html(fName);
					$("#div_errorMessage").css('display','none');
					$("#div_successMessage").css('display','block');
					$("#successMessage").html(data);
				} 
				else {
					$("#div_errorMessage").css('display','block');
					$("#div_successMessage").css('display','none');
					$("#errorMessage").html(data);
				}
			}
		});
	}
		
	}
	catch (e) {
		console.error(e.message);
	}
}
