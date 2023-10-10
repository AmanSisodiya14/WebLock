<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Hash Techie Official</title>
<link rel="stylesheet" href="assets/css/login.css">
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css'
	rel='stylesheet'>
</head>
<body>

	<!-- LOGIN FORM CREATION -->
	<div class="background"></div>
	<div class="container">
		<div class="item">
			<h2 class="logo">
				<i class='bx bxl-xing'></i>Web Lock
			</h2>
			<div class="text-item">
				<h2>
					Welcome! <br>
					<span> To Our Web application </span>
				</h2>
				<p>Secure File Sharing and Encryption Web Application.</p>
				<div class="social-icon">
					<a href="#"><i class='bx bxl-facebook'></i></a> <a href="#"><i
						class='bx bxl-twitter'></i></a> <a href="#"><i
						class='bx bxl-youtube'></i></a> <a href="#"><i
						class='bx bxl-instagram'></i></a> <a href="#"><i
						class='bx bxl-linkedin'></i></a>
				</div>
			</div>
		</div>
		<div class="login-section">
			<div class="form-box login">
				<form action="Login" method="post">
					<h2>Sign In</h2>
					<div class="input-box">
						<span class="icon"><i class='bx bxs-envelope'></i></span> <input
							type="email" name="email" required> <label>Email</label>
					</div>
					<div class="input-box">
						<span class="icon"><i class='bx bxs-lock-alt'></i></span> <input
							type="password" name="pass" required> <label>Password</label>
					</div>
					<div class="remember-password">
						<label for=""><input type="checkbox">Remember Me</label> <a
							href="#">Forget Password</a>
					</div>
					<button type="submit" class="btn">Login In</button>


					<div class="create-account">
						<p>
							Create A New Account? <a href="#" class="register-link">Sign
								Up</a>
						</p>
					</div>
					<%
					String error = (String) session.getAttribute("error");
					session.removeAttribute("error");
					if(error!=null){%>

					<div class="create-account">
						<p style="background: #8a2424;"><%=error%></p>
					</div>
					<%} %>

				</form>
			</div>
			<div class="form-box register">
				<form action="Register" method="POST">

					<h2>Sign Up</h2>

					<div class="input-box">
						<span class="icon"><i class='bx bxs-user'></i></span> <input
							type="text" name="name" required> <label>Username</label>
					</div>
					<div class="input-box">
						<span class="icon"><i class='bx bxs-envelope'></i></span> <input
							type="email" name="email" required> <label>Email</label>
					</div>
					<div class="input-box">
						<span class="icon"><i class='bx bxs-lock-alt'></i></span> <input
							type="password" name="pass" required> <label>Password</label>
					</div>
					<div class="input-box">
						<span class="icon"><i class='bx bxs-lock-alt'></i></span> <input
							type="password" name="cpass" required> <label>Confirm
							Password</label>
					</div>
					<div class="remember-password">
						<label for=""><input type="checkbox">I agree with
							this statment</label>
					</div>
					<button type="submit" class="btn">Login In</button>
					<div class="create-account">
						<p>
							Already Have An Account? <a href="#" class="login-link">Sign
								In</a>
						</p>
					</div>
				</form>
			</div>


		</div>
	</div>

	<!-- SIGN UP FORM CREATION -->

	<script src="assets/js/login.js"></script>
</body>

</html>