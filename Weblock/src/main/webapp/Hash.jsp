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
				<div class="form-group" style="text-align: center;"
					data-aos="fade-up" data-aos-delay="150">
					<div class=" ">
						<h1>
							Hash function<span>.</span>
						</h1>

					</div>
				</div>

				<form action="Hashupload" method="POST"
					enctype="multipart/form-data">


					<div class="form-group">
						<label for="dropdown">Algorithms:</label> <select id="Algo"
							name="Algo">

							<option value="MD5">MD5</option>
							<option value="SHA-256">SHA-256</option>
							<option value="SHA-512">SHA-512</option>



						</select>
					</div>
					<div class="form-group">
						<label for="file">Upload File:</label> <input type="file"
							id="file" name="file">
					</div>
					<button type="submit">Convert</button>
				</form>
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
<script src="assets/js/ScriptForm.js"></script>
</body>
</html>
