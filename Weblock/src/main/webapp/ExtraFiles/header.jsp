<%@page import="DTO.UserDTO"%>
<header id="header" class="fixed-top ">
    <div class="container d-flex align-items-center justify-content-lg-between">

      <h1 class="logo me-auto me-lg-0"><a href="index.jsp">Web<span>Lock.</span></a></h1>
      <!-- Uncomment below if you prefer to use an image logo -->
      <!-- <a href="index.html" class="logo me-auto me-lg-0"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->

      <nav id="navbar" class="navbar order-last order-lg-0">
        <ul>
          <li><a class="nav-link scrollto active" href="#hero">Home</a></li>
          <li><a class="nav-link scrollto" href="#about">About</a></li>
          <li><a class="nav-link scrollto" href="#services">Services</a></li>
          
          <li><a class="nav-link scrollto" href="#team">Team</a></li>
          
          <li><a class="nav-link scrollto" href="#contact">Contact</a></li>
        </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav>

<%-- <% UserDTO user = (UserDTO)request.getSession(true).getAttribute("login"); %>

<%if(user!=null){%>
      <a href="#" class="get-started-btn scrollto"><%=user.getName() %></a>
       <a href="Logout" class="get-started-btn scrollto">LogOut</a>
      
<%}else{ %>
      <a href="login.jsp" class="get-started-btn scrollto">Get Started</a>
<%} %> --%>
<!-- profile section -->

	 <div class="profile">
	 <% UserDTO user = (UserDTO)request.getSession().getAttribute("login"); %>

<%if(user!=null){%>
         

          <img class="profile-img" src="assets/img/profile/user.png" />
        
        </div>
      </div>
	<div class="popup">
		<div class="nameplate">
			<p
				style="margin: 0; position: absolute; top: 50%; transform: translate(-50%, -50%); left: 50%;">
				
				<%=user.getName()
				%>
				
				</p>
		</div>

		<div class="popup-option">
			<img width="30px" src="assets/img/profile/user2.png" /> Profile
		</div>
		<div class="popup-option">
			<img width="30px" src="assets/img/profile/mail.png" /> Email Settings
		</div>
		<div class="popup-option">
			<img width="30px" src="assets/img/profile/key.png" /> Change password
		</div>
		<div class="popup-option">
			<img width="30px" src="assets/img/profile/setting.png" /> Setting
		</div>
		<hr />
		<div class="popup-option">
			<img width="30px" src="assets/img/profile/close.png" /> <a href="Logout">Logout</a>
		</div>
		<hr />
		<div class="popup-option">Privacy . Terms of service</div>
		 <%}else{ 
        	  
          %>
      <a href="login.jsp" class="get-started-btn scrollto">Get Started</a>
<%} %>
	</div>

    
  </header>