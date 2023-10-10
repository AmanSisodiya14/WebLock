<!DOCTYPE html>
<html lang="en">

<%
String Result = (String)session.getAttribute("Result");
session.removeAttribute("Result");

%>
<head>
<jsp:include page="ExtraFiles/head.jsp"></jsp:include>
<!-- Template Main CSS File -->
<link href="assets/css/Algorithm2.css" rel="stylesheet">>


<!-- =======================================================
  * Template Name: Gp
  * Updated: Jul 27 2023 with Bootstrap v5.3.1
  * Template URL: https://bootstrapmade.com/gp-free-multipurpose-html-bootstrap-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
<style>
.form-group {
	margin-bottom: 26px;
	text-align: center;
}

.form-group label {
	flex-basis: 25%; /* Adjust as needed */
	text-align: right;
	padding-right: 10px;
}

button[type="submit"] {
	display: block;
	margin: 20px auto 0;
	padding: 10px 20px;
	background-color: #007bff;
	color: white;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}
</style>
</head>

<body>
	<!-- ======= Header ======= -->
	<jsp:include page="ExtraFiles/header2.jsp"></jsp:include>
	<!-- End Header -->

	<!-- ======= Hero Section ======= -->
	<section id="hero" class="">
		<div class="container" data-aos="fade-up"
			style="border: 5px solid; position: absolute; top: 53%; left: 50%; transform: translate(-50%, -50%); padding: 10px; width: 50%; background-color: rgb(4 2 2/ 83%);">

			<div
				style="color: aliceblue; border: 2px solid black; padding: 20px 40px; border-radius: 10px; box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);"
				data-aos="fade-up" data-aos-delay="150">

				<div class="form-group" style="text-align: center"
					data-aos="fade-up" data-aos-delay="150">
					<div>
						<h1>
							Convert Cipher Text<span>.</span>
						</h1>
					</div>
				</div>
				<div>
				
					<textarea rows="7" cols="70" id="result"><%=Result %></textarea>
					<button onclick="myFunction()">Copy result</button>
				</div>
			</div>
		</div>
	</section>
	<!-- End Hero -->
<script>
function myFunction() {
	  // Get the text field
	  var copyText = document.getElementById("result");

	  // Select the text field
	  copyText.select();
	  copyText.setSelectionRange(0, 99999); // For mobile devices

	  // Copy the text inside the text field
	  navigator.clipboard.writeText(copyText.value);
	  
	  // Alert the copied text
	  alert("Copied the text: " + copyText.value);
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
<script src="assets/js/ScriptForm.js"></script>
</body>
</html>
