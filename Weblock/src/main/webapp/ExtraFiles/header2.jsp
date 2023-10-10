<%@page import="DTO.UserDTO"%>
<header id="header" class="fixed-top ">
    <div class="container d-flex align-items-center justify-content-lg-between">

      <h1 class="logo me-auto me-lg-0"><a href="index.jsp">Web<span>Lock.</span></a></h1>
      <!-- Uncomment below if you prefer to use an image logo -->
      <!-- <a href="index.html" class="logo me-auto me-lg-0"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->

      <nav id="navbar" class="navbar order-last order-lg-0">
        <ul>
          <li><a class="nav-link scrollto active" href="index.jsp">Home</a></li>
     
          <li class="dropdown"><a href="#"><span>Algorithms</span> <i class="bi bi-chevron-down"></i></a>
            <ul>
              <li><a href="DesUpload.jsp">DES Algo.</a></li>
              <li><a href="CCUpload.jsp">CC</a></li>
              <li><a href="AesUpload.jsp">AES</a></li>
              <li><a href="Hash.jsp">Hash</a></li>
            </ul>
          </li>
          <li class="dropdown"><a href="#"><span>Hash</span> <i class="bi bi-chevron-down"></i></a>
            <ul>
              <li><a href="Hash.jsp">Hash Funtion</a></li>
              <li><a href="HashCheck.jsp">Check Integrity</a></li>
        
            </ul>
          </li>

          <li><a class="nav-link scrollto" href="PdfPassword.jsp">Password Protected</a></li>
          
          <li><a class="nav-link scrollto" href="History.jsp">History</a></li>
          <li><a class="nav-link scrollto" href="#contact">Contact</a></li>
        </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav><!-- .navbar -->

     <% UserDTO user = (UserDTO)request.getSession(true).getAttribute("login"); %>

<%if(user!=null){%>
      <a href="#" class="get-started-btn scrollto"><%=user.getName() %></a>
      
<%}else{ %>
      <a href="login.jsp" class="get-started-btn scrollto">Get Started</a>
<%} %>

    </div>
  </header>