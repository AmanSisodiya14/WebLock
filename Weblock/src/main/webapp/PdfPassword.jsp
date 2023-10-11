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
			<div class=""
				id="formcontainer2"
				data-aos="fade-up" data-aos-delay="150">
				<div class="form-group" style="text-align: center"
					data-aos="fade-up" data-aos-delay="150">
					<div class=" ">
						<h1>
							Password Protected PDF<span>.</span>
						</h1>
					</div>
				</div>

				<form onsubmit=" return validatePassword();" action="ApplyPassPdf" method="POST" enctype="multipart/form-data">
					<div class="form-group">
						<label for="dropdown">Modes:</label>
						 <select id="mode" name="mode">
							<option value="AP">Apply password to
								PDF</option>
							<option value="PP">Create a password
								protected PDF</option>
						</select>
					</div>

					<div class="form-group" id="hidden-panel">
						<label for="file">Upload File:</label> <input type="file"
							id="file" name="file" accept="application/pdf" />
					</div>

					<div class="form-group" id="hidden-panel2" style="display: none">
						<label for="name">Enter the file name:</label> <input type="text"
							id="FileName" name="FileName" />

					</div>
					<div class="form-group" id="hidden-panel3" style="display: none">
						<label for="name">Enter the message:</label>
						<textarea style="width: 500px;"  id="Message"
							name="Message"></textarea>

					</div>

					<div class="form-group">
						<label for="name">Password:</label> <input type="text" id="key"
							onkeyup="validatePassword(); " name="key" />
						<span id="msg"></span>
					</div>

					<button type="submit">Submit</button>
				</form>
			</div>
		</div>
	</section>
	<!-- End Hero -->

	<script>
      Algo = document.querySelector("#mode");

      Algo.addEventListener("change", (event) => {
        output = Algo.value;
        if (output === "AP") {
          console.log("AP")
          // Check if the selected radio button has a value of "CC"
          document.getElementById("hidden-panel").style.display = "flex";
          document.getElementById("hidden-panel2").style.display = "none";
          document.getElementById("hidden-panel3").style.display = "none";
        } else if (output === "PP") {
          // Check if the selected radio button has a value of "MONO"
          document.getElementById("hidden-panel").style.display = "none";
          document.getElementById("hidden-panel2").style.display = "flex";
          document.getElementById("hidden-panel3").style.display = "flex";
        }
        
      });
      
      function validatePassword() {

			const password = document.getElementById("key").value;
			console.log(password);

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

</body>
</html>
