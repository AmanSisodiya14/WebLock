<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
    />
    <link
      href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;1,100;1,200;1,300;1,400&family=Roboto:wght@100&display=swap"
      rel="stylesheet"
    />
    <link rel="stylesheet" href="assets/css/PassChangeStyle.css" />
    <title>Login Form</title>
  </head>
  <body>
    <div class="content">
      <div class="text">Password change</div>
      <form action="">
        <div class="field">
          <span class="fa fa-lock"></span>
          <input type="text" required placeholder="Old Password" />
          <!-- <label>Email</label> -->
        </div>

        <hr>
        
        <div class="field">
            <span class="fa fa-lock"></span>
            <input type="text" required placeholder="New password" />
            <!-- <label>Email</label> -->
          </div>    
        <div class="field">
          <span class="fa fa-lock"></span>
          <input type="password" required placeholder="Re-new password" />
          <!-- <label>Password</label> -->
        </div>
        <div class="forget-pass"><a href="#">Forget Password?</a></div>
        <button>Submit</button>
       
      </form>
    </div>
  </body>
</html>
