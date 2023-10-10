<!DOCTYPE html>
<html lang="en">

<head>
<jsp:include page="ExtraFiles/head.jsp"></jsp:include>

<!-- Template Main CSS File -->
<link href="assets/css/Algorithm2.css" rel="stylesheet">

<!-- =======================================================
  * Template Name: Gp
  * Updated: Jul 27 2023 with Bootstrap v5.3.1
  * Template URL: https://bootstrapmade.com/gp-free-multipurpose-html-bootstrap-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->

</head>

<body>

	<!-- ======= Header ======= -->
	<jsp:include page="ExtraFiles/header2.jsp"></jsp:include>
	<!-- End Header -->

	<!-- ======= Hero Section ======= -->
	<section id="hero" class="">
		<div class="container" data-aos="fade-up" id="formcontainer">

			<div class="" id="formcontainer2" data-aos="fade-up"
				data-aos-delay="150">
				<%
				String i = (String) session.getAttribute("error");
				if (i != null) {
				%>

				<div class="alert alert-danger alert-dismissible fade show"
					role="alert">
					<strong>Error.</strong>
					<%=i%>.

				</div>
				<%
				session.removeAttribute("error");
				}
				%>
				<div class="form-group" style="text-align: center;"
					data-aos="fade-up" data-aos-delay="150">
					<div class=" ">
						<h1>
							DES Encryption & Decryption<span>.</span>
						</h1>

					</div>
				</div>

				<form onsubmit="return (validatePassword()&& verifyPassword());"
					action="DESupload" method="POST" enctype="multipart/form-data">
					<div class="form-group">
						<label for="dropdown">Algorithms:</label> <select id="Algo"
							name="Algo">
							<option value="DES">DES</option>
							<option value="TDES">Triple DES</option>

						</select>
					</div>
					<div class="form-group">
						<label for="dropdown">Modes:</label> <select id="dropdown"
							name="Mode">
							<option value="Enc">Encryption</option>
							<option value="Dec">Decryption</option>

						</select>
					</div>
					<div class="form-group">
						<label for="name">Password:</label> <input type="text" id="key"
							onkeyup="validatePassword(); verifyPassword();" name="key" required>
						<span id="msg"></span>
					</div>
					<label id="message"> </label>
					<div class="form-group">
						<label for="file">Upload File:</label> <input type="file"
							id="file" name="file">
					</div>
					<button type="submit">Submit</button>
				</form>
			</div>


		</div>
	</section>
	<!-- End Hero -->

	<script>
		function verifyPassword() {

			const selectElement = document.getElementById("Algo");
			const selectedValue = selectElement.value;
			console.log(selectedValue);

			if (selectedValue == "TDES") {

				var pw = document.getElementById("key").value;

				if (pw.length < 8) {
					document.getElementById("message").innerHTML = "**Password length must be equal to 8 characters";
					document.getElementById("message").style.color = "red";
				}
				if (pw.length > 8) {
					document.getElementById("message").innerHTML = "**Password length must not exceed 8 characters";
					document.getElementById("message").style.color = "red";

				}
				if (pw.length == 8) {
					document.getElementById("message").innerHTML = "**Password length  Equal to 8 characters";
					document.getElementById("message").style.color = "green";
					return true;
				}

				return false;
			}

		}
		function validatePassword() {

			const password = document.getElementById("key").value;
			// Do not show anything when the length of password is zero.
			if (password.length === 0) {
				document.getElementById("msg").innerHTML = "";
				return false;
			}
			// Create an array and push all possible values that you want in password
			var matchedCase = new Array();
			matchedCase.push("[$@$!%*#?&]"); // Special Charector
			matchedCase.push("[A-Z]"); // Uppercase Alpabates
			matchedCase.push("[0-9]"); // Numbers
			matchedCase.push("[a-z]"); // Lowercase Alphabates

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
			console.log(pass);
			if (pass == 1)
				return true;
			else
				return false;

		}
	</script>
	<!-- Vendor JS Files -->
	<script src="assets/vendor/purecounter/purecounter_vanilla.js"></script>
	<script src="assets/vendor/aos/aos.js"></script>
	<script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
	<script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
	<script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
	<script src="assets/vendor/php-email-form/validate.js"></script>

	<!-- Template Main JS File -->
	<script src="assets/js/main.js"></script>
	<!-- <script src="assets/js/ScriptForm.js"></script> -->
</body>
</html>
