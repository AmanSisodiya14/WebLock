<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Password Reveal Table</title>
    <link rel="stylesheet" type="text/css" href="styles.css"> <!-- You can style the page with CSS -->
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="//cdn.datatables.net/1.11.3/css/jquery.dataTables.min.css">
    
</head>
<body>
<div class="modal fade" id="editModal" tabindex="-1"
		aria-labelledby="editModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="editModalLabel">Modal title</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div>
						<input type="hidden" name="snoEdit" id="snoEdit">
						<div class="mb-3">
							<label for="title" class="form-label">Enter the User password For showing the file passowrd </label> <input
								type="text" class="form-control" name="userpass" id="userpass"
								aria-describedby="emailHelp">

						</div>
						<input type="hidden" id="id">
            			<input type="hidden" id="pass">
						
						<button type="submit" name="submit" onclick="checkPassword()" class="btn btn-primary my-3">Submit</button>
						
					</div>
				</div>

			</div>
		</div>
	</div>
    <div id="center-container">
        <table border="1">
            <tr>
                <th>Name</th>
                <th>Email</th>
                <th>Password</th>
                <th>Action</th>
            </tr>
            <%
                // Java code to fetch data from the database and populate the table
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    String dbUrl = "jdbc:mysql://localhost:3306/weblock";
                    String dbUsername = "root";
                    String dbPassword = "root";
                    Connection connection = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);

                    Statement statement = connection.createStatement();
                    String query = "SELECT * FROM user";
                    ResultSet resultSet = statement.executeQuery(query);

                    while (resultSet.next()) {
                    	int id = resultSet.getInt("id");
                        String name = resultSet.getString("name");
                        String email = resultSet.getString("email");
                        String password = resultSet.getString("password");
            %>
            <tr>
                <td><%= name %></td>
                <td><%= email %></td>
                <td><span class="password" id="password<%= id%>">********</span></td>
                <td><button onclick="showPassword('<%= id %>','<%= password %>')">Reveal Password</button></td>
            <td><button class="btn btn-sm btn-primary" onclick="show('<%= id %>','<%= password %>')">View</button></td>
            </tr>
            <%
                    }
                    resultSet.close();
                    statement.close();
                    connection.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            %>
        </table>
    </div>

   <!--  <div id="passwordModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeModal()">&times;</span>
            <h2>Enter Password</h2>
            <input type="password" id="passwordInput">
            <button onclick="checkPassword()">Submit</button>
            <input type="hidden" id="id">
            <input type="hidden" id="pass123">
        </div>
    </div> -->

    <script>
        function showPassword(id,password) {
            document.getElementById('passwordInput').value = '';
            document.getElementById('id').value = id;
            document.getElementById('pass').value = password;
            document.getElementById('passwordModal').style.display = 'block';
        }

        function closeModal() {
            document.getElementById('passwordModal').style.display = 'none';
        }

        function checkPassword() {
            const id = document.getElementById('id').value;
            const pass = document.getElementById('pass').value;
            const enteredPassword = document.getElementById('userpass').value;
		
            // Replace 'your_password_from_database' with the actual password fetched from the database
            const correctPassword = 'aman';

            if (enteredPassword === correctPassword) {
                const passwordElement = document.getElementById('password' + id);
                passwordElement.innerHTML = pass;
                $('#editModal').modal('toggle');
            } else {
                alert('Incorrect password. Please try again.');
            }
        }
    </script>
    <script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>

	<!-- Option 2: Separate Popper and Bootstrap JS -->
	<!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
    -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"
		integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
		crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.js"
		integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
		crossorigin="anonymous"></script>
	<script src="//cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
	<script>
    $(document).ready(function () {
      $('#table').DataTable();
    });
    </script>
	<script>
    edits = document.getElementsByClassName('edit');
    Array.from(edits).forEach((element)=>{
      element.addEventListener("click",(e)=>{
        console.log("edit", );
        tr = e.target.parentNode.parentNode;
        title = tr.getElementsByTagName("td")[0].innerText;
        description = tr.getElementsByTagName("td")[1].innerText;
        console.log(title,description);
        titleEdit.value = title;
        descEdit.value = description;
        snoEdit.value = e.target.id;
        console.log(e.target.id);
        $('#editModal').modal('toggle');

      })
    })
    function show(id,pass){
    	console.log(id);
    	console.log(pass);
    	document.getElementById('userpass').value = '';
    	document.getElementById('id').value = id;
        document.getElementById('pass').value = pass;
    	
    	$('#editModal').modal('toggle');
    	
    }

   
    </script>
</body>
</html>
