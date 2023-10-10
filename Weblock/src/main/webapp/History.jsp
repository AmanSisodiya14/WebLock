
<!DOCTYPE html>
<%@page import="Services.FileNameExtractor"%>
<%@page import="DTO.FileDTO"%>
<%@page import="java.util.List"%>
<%@page import="DAO.FileDAO"%>
<%@page import="DTO.UserDTO"%>
<html lang="en">
<%
HttpSession s = request.getSession(false);
UserDTO user = (UserDTO) s.getAttribute("login");

if (user != null) {

	int userId = user.getId();

	FileDAO fileDao = new FileDAO();
	List<FileDTO> files = fileDao.getFilesByUserId(userId);
%>

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
	<!--  model for how passkey -->
	<div class="modal fade" id="showkeyModal" tabindex="-1"
		aria-labelledby="editModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="editModalLabel">Show PassKey</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="modal-body">
						<div>
							<input type="hidden" name="snoEdit" id="snoEdit">
							<div class="mb-3">
								<label for="title" class="form-label">"Unlock the secret
									code sent to your inbox and embark on a digital adventure!"
									the one-time OTP awaits!" </label> <input type="text"
									class="form-control" name="otp" id="otp"
									aria-describedby="emailHelp">
							</div>
							<input type="hidden" id="id">
							<button type="submit" name="submit" onclick="checkPassword()"
								class="btn btn-primary my-3">Submit</button>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>

	<!-- Model for download file -->
	<div class="modal fade" id="showDownloadModal" tabindex="-1"
		aria-labelledby="editModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="editModalLabel">Download File</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="modal-body">
						<form action="Download" method="post">
							<div>
								<input type="hidden" name="snoEdit" id="snoEdit">
								<div class="mb-3">
									<label for="title" class="form-label">Are you sure want
										to download this File.</label>
								</div>
								<input type="hidden" id="FileId" name="FileId">
								<button type="submit" name="submit" class="btn btn-primary my-3">Download</button>
							</div>
						</form>
					</div>
				</div>

			</div>
		</div>
	</div>

	<!-- model for share file -->
	<div class="modal fade" id="shareModal" tabindex="-1"
		aria-labelledby="editModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="editModalLabel">Share file</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="modal-body">
						<div>

							<input type="hidden" name="snoEdit" id="snoEdit">
							<div class="mb-3">
								<label for="title" class="form-label">Enter the email
									where you want to share it.</label> <input type="email"
									class="form-control" name="email" id="email"
									aria-describedby="emailHelp">
							</div>
							<input type="hidden" id="id">
							<button type="submit" name="submit" onclick="sharefile()"
								class="btn btn-primary my-3">Submit</button>

						</div>
					</div>
				</div>

			</div>
		</div>
	</div>



	<!-- ======= Hero Section ======= -->
	<section id="hero" class="">

		<div class="box"
			style="width: 80%; margin: 0 auto; padding-top: 130px;">
			<div class="box2"
				style="background-color: rgba(255, 255, 255, 0.8); border: 2px solid black; padding: 20px 40px; border-radius: 10px; box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2)">
				<div class="form-group" style="text-align: center;"
					data-aos="fade-up" data-aos-delay="150">
					<div class=" ">
						<h1 style="color: black">
							Files History<span>.</span>
						</h1>

					</div>
				</div>





				<div class="container"
					style="width: 100%; border-collapse: collapse; border: solid 2px black; border-radius: 15px; padding: 33px">


					<table class="table table-dark table-striped" id="table">
						<thead>
							<tr>
								<th scope="col">S no.</th>
								<th scope="col">File Name</th>
								<th scope="col">Algorithm</th>
								<th scope="col">Mode</th>
								<th scope="col">password</th>


								<th scope="col">Action</th>
							</tr>
						</thead>
						<tbody>
							<%
							if (!files.isEmpty()) {
								int i = 1;
								for (FileDTO f : files) {
							%>
							<tr>
								<th scope="row"><%=i++%></th>
								<td><%=FileNameExtractor.getFileName(f.getFilename())%></td>
								<td><%=f.getAlgo()%></td>
								
								<td><%=f.getMode()%></td>
								
								<td id="passkey<%=f.getId()%>">****</td>
								<td>
									<button class="btn btn-sm btn-primary"
										onclick="showkeymodel('<%=f.getId()%>')">Show key</button>

									<button class="delete btn btn-sm btn-primary"
										onclick="downloadmodel('<%=f.getId()%>')">Download</button>

									<button class="delete btn btn-sm btn-primary"
										onclick="DeleteFile('<%=f.getId()%>')">Delete</button>


									<button class="btn btn-sm btn-primary"
										onclick="sharemodel('<%=f.getId()%>')">Share</button>

								</td>

							</tr>
							<%
							}
							}
							%>

						</tbody>
					</table>
				</div>
				<hr>
			</div>
		</div>
	</section>

	<script>
		$(document).ready(function() {
			$('#table').DataTable();
		});
	</script>
	<script>
		function downloadmodel(id) {

			document.getElementById('FileId').value = id;

			$('#showDownloadModal').modal('toggle');
		}
		function sharemodel(id) {
			document.getElementById('email').value = '';
			document.getElementById('id').value = id;

			$('#shareModal').modal('toggle');
		}
		function sharefile() {
			var email = document.getElementById('email').value;
			var id = document.getElementById('id').value;
			console.log(id + "id,email" + email);

			const xhr = new XMLHttpRequest();
			xhr.open('POST', 'ShareFile', true);
			xhr.setRequestHeader('Content-type',
					'application/x-www-form-urlencoded');
			xhr.onreadystatechange = function() {
				if (xhr.readyState === 4 && xhr.status === 200) {
					const response = JSON.parse(xhr.responseText);
					if (response.success) {

						$('#shareModal').modal('toggle');
						 alert('file send'); 
				        


					} else {
						$('#shareModal').modal('toggle');
						alert('Incorrect file. Please try again.'+xhr.status);
						alert("Error calling servlet. Status code:", xhr.status);
			        	
				        // You can access exception details from the response
				        var errorResponse = xhr.responseText;
				        alert("Exception Details:", errorResponse);
						

					}
				}
			};
			xhr.send('id=' + id + '&email=' + email);

		}

		function showkeymodel(id) {

			document.getElementById('otp').value = '';
			document.getElementById('id').value = id;

			$('#showkeyModal').modal('toggle');

			const xhr = new XMLHttpRequest();
			xhr.open('POST', 'SendOTP', true);
			xhr.setRequestHeader('Content-type',
					'application/x-www-form-urlencoded');
			xhr.onreadystatechange = function() {
				if (xhr.readyState === 4 && xhr.status === 200) {
					const response = JSON.parse(xhr.responseText);
					if (response.success) {
						

					} else {
						$('#showkeyModal').modal('toggle');
						alert('Please try again.');
					}
				}
			};
			xhr.send('Userotp=');
		}

		function closeModal() {
			$('#showkeyModal').modal('toggle');
		}

		function checkPassword() {

			var otp = document.getElementById('otp').value;
			var id = document.getElementById('id').value;
			console.log(id + "id");
			// Make an AJAX call to a servlet to check the password and reveal if correct
			const xhr = new XMLHttpRequest();
			xhr.open('POST', 'CheckPasswordServlet', true);
			xhr.setRequestHeader('Content-type',
					'application/x-www-form-urlencoded');
			xhr.onreadystatechange = function() {
				if (xhr.readyState === 4 && xhr.status === 200) {
					const response = JSON.parse(xhr.responseText);
					if (response.success) {

						const passwordElement = document
								.getElementById('passkey' + id);
						passwordElement.innerHTML = response.password;
						closeModal();
					} else {
						
						alert('Incorrect password. Please try again.');
						closeModal();
						
					}
				}
			};
			xhr.send('id=' + id + '&otp=' +otp );
		}
		function DeleteFile(id) {

			console.log(id + "id");
			// Make an AJAX call to a servlet to check the password and reveal if correct
			const xhr = new XMLHttpRequest();
			xhr.open('POST', 'DeleteFile', true);
			xhr.setRequestHeader('Content-type',
					'application/x-www-form-urlencoded');
			xhr.onreadystatechange = function() {
				if (xhr.readyState === 4 && xhr.status === 200) {
					const response = JSON.parse(xhr.responseText);
					if (response.success) {

						location.reload();
					} else {
						alert('There is some error in backend .');

					}
				}
			};
			xhr.send('FileId=' + id);
		}
	</script>

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
<%
} else {

response.sendRedirect("index.jsp");
}
%>

