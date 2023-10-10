package servlet;

/**
 * Servlet implementation class CheckPasswordServlet
 */
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONException;
import org.json.JSONObject;

import DTO.UserDTO;

@WebServlet("/CheckPasswordServlet")
public class CheckPasswordServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = -878661552201972994L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		JSONObject jsonResponse = new JSONObject();

		int id = Integer.parseInt(request.getParameter("id"));
		int Userotp = Integer.parseInt(request.getParameter("otp"));
		
		HttpSession session = request.getSession(false);
		

		// Database connection information
		String dbUrl = "jdbc:mysql://localhost:3306/weblock";
		String dbUsername = "root";
		String dbPassword = "root";
		int otp =0;
		try {
		otp = (int) session.getAttribute("otp");
		}catch(Exception e) {
			
			session.setAttribute("error", "There is some error please try later..");
			RequestDispatcher dd=request.getRequestDispatcher("AesUpload.jsp");
			dd.forward(request, response);
			
		}

		try {
	
			if (Userotp !=otp) {
				jsonResponse.put("success", false);
			} else {
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection connection = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);

				// Replace 'your_table' with your actual table name
				String query = "SELECT passkey FROM fileinfo WHERE id=?";
				PreparedStatement preparedStatement = connection.prepareStatement(query);
				preparedStatement.setInt(1, id);

				ResultSet resultSet = preparedStatement.executeQuery();

				if (resultSet.next()) {
					String actualPassword = resultSet.getString("passkey");

						jsonResponse.put("success", true);
						jsonResponse.put("password", actualPassword);
					
				} else {
					jsonResponse.put("success", false);
				}

				resultSet.close();
				preparedStatement.close();
				connection.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
			try {
				jsonResponse.put("success", false);
			} catch (JSONException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}

		out.print(jsonResponse);
		out.flush();
	}
}
