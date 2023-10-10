
// it will use in jsp page where customize key is use for algorithm to check the strength of password

function validatePassword(password) {



	// Do not show anything when the length of password is zero.
	if (password.length === 0) {
		document.getElementById("msg").innerHTML = "";
		return;
	}
	// Create an array and push all possible values that you want in password
	var matchedCase = new Array();
	matchedCase.push("[$@$!%*#?&]"); // Special Charector
	matchedCase.push("[A-Z]");      // Uppercase Alpabates
	matchedCase.push("[0-9]");      // Numbers
	matchedCase.push("[a-z]");     // Lowercase Alphabates

	// Check the conditions
	var ctr = 0;
	for (var i = 0; i < matchedCase.length; i++) {
		if (new RegExp(matchedCase[i]).test(password)) {
			ctr++;
		}
	}
	// Display it
	var color = "";
	var strength = "";
	var pass = 0;

	switch (ctr) {
		case 0:
		case 1:
		case 2:
			strength = "Very Weak Password";
			color = "red";
			break;
		case 3:
			strength = "Medium Password";
			color = "orange";
			break;
		case 4:
			strength = "Strong Password";
			color = "green";
			pass = 1;
			break;
	}
	document.getElementById("msg").innerHTML = strength;
	document.getElementById("msg").style.color = color;

	if (pass == 1)
		return true;
	else
		return false;

}
