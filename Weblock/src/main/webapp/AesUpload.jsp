<!DOCTYPE html>
<html lang="en">

<head>
<jsp:include page="ExtraFiles/head.jsp"></jsp:include>

<!--  Main CSS File -->
<link href="assets/css/Algorithm2.css" rel="stylesheet">

</head>

<body>

	<!-- ======= Header ======= -->
	<jsp:include page="ExtraFiles/header2.jsp"></jsp:include>
	<!-- End Header -->

	<!-- ======= Hero Section ======= -->
	<section id="hero" class="">
		<div class="container" data-aos="fade-up" id="formcontainer">


			<div id="formcontainer2" data-aos="fade-up" data-aos-delay="150">
				<%
				String i = (String) session.getAttribute("error");
				if (i != null) {
				%>

				<div class="alert alert-danger alert-dismissible fade show"
					role="alert">
					<strong>Error.</strong>
					<%=i%>.
					<button type="button" class="btn-close" data-bs-dismiss="alert"
						aria-label="Close"></button>


				</div>
				<%
				session.removeAttribute("error");
				}
				%>


				<div class="form-group" style="text-align: center;"
					data-aos="fade-up" data-aos-delay="150">
					<div class=" ">
						<h1>
							AES Encryption & Decryption<span>.</span>
						</h1>

					</div>
				</div>


				<form onsubmit=" return validatePassword();" action="AESupload"
					method="POST" enctype="multipart/form-data">


					<div class="form-group">
						<label for="dropdown">Algorithms:</label> <select id="dropdown"
							name="Algo">
							<option value="ECB">ECB</option>


						</select>
					</div>
					<div class="form-group">
						<label for="dropdown">Modes:</label> <select id="Mode" name="Mode">
							<option value="Enc">Encryption</option>
							<option value="Dec">Decryption</option>
						</select>
					</div>
					<div class="form-group">
						<label for="name">Password:</label> <input type="text" id="key"
							onkeyup="validatePassword();" name="key" required> <span
							id="msg"></span>
					</div>
					<div class="form-group" id="hidden-otp" name="hidden-otp">
						<label for="name">One Time OTP:</label> <input type="number"
							id="otp" name="otp">

						<div style="text-align: end; margin: 11px 5px;">
							<span onclick="SendOTP()"
								style="cursor: pointer; border: solid white 1px; padding: 3px; border-radius: 11px;">Get
								OTP</span>
						</div>

					</div>

					<div class="form-group">
						<label for="file">Upload File:</label> <input type="file"
							id="file" name="file">
					</div>
					<button type="submit">Submit</button>
				</form>
			</div>


		</div>
	</section>

	<section id="hero" class="">
		<div class="container" data-aos="fade-up" id="instruction">


			<div id="discription" data-aos="fade-up" data-aos-delay="150">
				<h1>
					<br>AES Encryption and Decryption Guide
				</h1>

				<p>
					Unlock the Magic of Digital Security!<br> Welcome to our AES
					Encryption and Decryption tool - your digital sorcerer's apprentice
					for safeguarding precious data. <br> Ready to dive in? Let's
					enchant your files...
				</p>

				<!-- 	<p>Welcome to the AES Encryption and Decryption tool! AES
					(Advanced Encryption Standard) is a widely-used encryption
					algorithm that helps secure your data. This guide will help you
					understand how to use our encryption and decryption features
					effectively.</p> -->


				<h2>Encryption Magic</h2>
				<ol>
					<li>Input Data: Your treasure goes here - upload or paste your
						file.</li>
					<li>Encryption Mode: Choose your protective spell.</li>
					<li>Key: Craft a strong, unique key - your data's guardian.
					<li>Click "Submit": Let the enchantment begin!</li>
					<li>Result: Voila! Your treasure is now a secure secret.</li>
				</ol>

				<h2>Decryption Spell</h2>
				<ol>
					<li>Input Data: Reveal the encrypted text.</li>
					<li>Key: Whisper the secret passphrase.</li>
					<li>Encryption Algorithm: Choose your magic words.</li>
					<li>Click "Decrypt": Unlock the enchantment.</li>
					<li>Result: Your treasure is back, just as you remember.</li>
				</ol>

				<h2>Important Notes</h2>
				<ul>
					<li>Keep your encryption key secure. Losing the key will
						result in data loss.</li>
					<li>Use a strong, unique key for each piece of data you
						encrypt.</li>
					<li>AES is a symmetric encryption algorithm, meaning the same
						key is used for both encryption and decryption.</li>
					<li>Double-check your input and key to avoid errors during
						encryption and decryption.</li>
				</ul>

				<h2>Security Reminder</h2>
				<p>While AES encryption is a powerful tool for securing your
					data, it's essential to follow best practices in key management and
					data protection to ensure the highest level of security.</p>

				<p>Enjoy using our AES Encryption and Decryption tool, and keep
					your data safe and secure!</p>
			</div>
		</div>
	</section>
	<!-- End Hero -->


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
	<script>
	function SendOTP() {
	
		console.log("id,email");

		const xhr = new XMLHttpRequest();
		xhr.open('POST', 'SendOTP', true);
		xhr.setRequestHeader('Content-type',
				'application/x-www-form-urlencoded');
		xhr.onreadystatechange = function() {
			if (xhr.readyState === 4 && xhr.status === 200) {
				const response = JSON.parse(xhr.responseText);
				if (response.success) {
					alert('OTP Send');
				} else {
					alert('Please try again.');
				}
			}
		};
		xhr.send('id=&email=' );
	}
	
    Mode = document.querySelector("#Mode");

    Mode.addEventListener("change", (event) => {
    	console.log("inside");
      
		const mode = Mode.value;
		
		
		if(mode == "Dec"){
			
			console.log("dec");
			document.getElementById("hidden-otp").style.display = "flex";
	          
			
		}else if(mode == "Enc"){
			console.log("enc");
			document.getElementById("hidden-otp").style.display = "none";
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
</body>
</html>
