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
							Cipher Enc. & Dec. <span>.</span>
						</h1>
					</div>
				</div>

				<form onsubmit="return verifyKey()" action="CCupload" method="POST">
					<div class="form-group">
						<label for="dropdown">Algorithms:</label> <select class="Algo"
							id="Algo" name="Algo">
							<option value="CC">Caesar Cipher</option>
							<option value="MONO">Monoalphabetic Cipher</option>
							<option value="POLY">PolyAlphabetic Cipher</option>
						</select>
					</div>
					<div class="form-group">
						<label for="dropdown">Modes:</label> <select id="Mode" name="Mode">
							<option value="Enc">Encryption</option>
							<option value="Dec">Decryption</option>
						</select>
					</div>
					<div class="form-group">
						<label for="name" id="field">Enter the shift key:</label> <input
							type="number" id="key" name="key" required/>
					</div>
					<label id="error"> **Max to key Shit is 10</label>
					<div class="form-group">
						<label for="file">Enter the Message:</label>
						<textarea style="width: 500px; height: 100px;" type="text"
							id="msg" name="msg"></textarea>
					</div>
					<button type="submit">Submit</button>
				</form>
			</div>
		</div>
	</section>
	<!-- End Hero -->

	<script>
     Algo = document.querySelector(".Algo");
    
     Algo.addEventListener('change', (event) => {
      const result = document.getElementById('error');
      var inputfield = document.getElementById("key");
      var inputElement = document.getElementById("field"); // Get the input element by its ID

      output = Algo.value;
      if (output === "CC") { // Check if the selected radio button has a value of "CC"
       inputElement.innerHTML="Enter the shift key:" // Set the input type to "TEXT"
    	   inputfield.value= "";
       inputfield.type="number";
       result.innerHTML = "**Max to key Shit is 10";
     } else if (output === "MONO") { // Check if the selected radio button has a value of "MONO"
       inputElement.innerHTML="Key:" // Set the input type to "Text"
    	   inputfield.type="text";
       inputfield.value= "phqgiumeaylnofdxjkrcvstzwb";
       result.innerHTML = "**Key length must be 26 characters";
       
     }else if (output === "POLY") { // Check if the selected radio button has a value of "POLY"
         inputElement.innerHTML="Key:" // Set the input type to "TEXT"
        	 inputfield.type="text";
             inputfield.value= "polyalphabetic";
             result.innerHTML = "";
    }        
      });
     
function verifyKey(){
	const selectElement = document.getElementById("Algo");
	const selectValue = selectElement.value;
	console.log(selectValue);
	if(selectValue == "MONO"){
		const key = document.getElementById("key").value;
		
		if(key.length == 26){
			return true;
		}
	 	document.getElementById('error').style.color='red';
		return false;
	}
	if(selectValue == "CC"){
		const key = document.getElementById("key").value;
		
		if(key.length <11){
			return true;
		}
	 	document.getElementById('error').style.color='red';
		return false;
	}
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
