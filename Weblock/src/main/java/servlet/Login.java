package servlet;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.UserDAO;
import DTO.UserDTO;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email  = request.getParameter("email");
		String pass = request.getParameter("pass");
		
		String emailRegex = "^[a-zA-Z0-9_+&*-]+(?:\\." + "[a-zA-Z0-9_+&*-]+)*@" + "(?:[a-zA-Z0-9-]+\\.)+[a-z"
				+ "A-Z]{2,7}$";

		Pattern pat = Pattern.compile(emailRegex);
		
		 boolean isValid = pat.matcher(email).matches();
		 System.out.println(isValid);
		 if(!isValid) {
			 request.getSession().setAttribute("error", "Email in invalid");
			 response.sendRedirect("login.jsp");
		 }
		
//		 String fullPath = getServletContext().getRealPath("/WEB-INF/Files/");
//		 System.out.println(fullPath);
//		 File fos = new File(fullPath+"Aman.txt");
		 
		
		UserDAO log = new UserDAO();
		UserDTO user = log.LoginCheck(email,pass);
		System.out.println(user);
		HttpSession session = request.getSession();
		if(user!=null) {
			if(user.getStatus() == 1) {
				session.setAttribute("login", user);
				response.sendRedirect("index.jsp");
				
			}else {
				request.getSession().setAttribute("error", "User is blocked");
				response.sendRedirect("login.jsp");
			}
		}else {
			request.getSession().setAttribute("error", "Email in invalid");
			response.sendRedirect("login.jsp");
		}

		
		
//		HttpSession session = request.getSession();
//		
//		String fullPath = getServletContext().getRealPath("/WEB-INF/Files/");
//		System.out.println(fullPath);
//		System.out.println(fullPath+"text.txt");
//		
//		
//		session.setAttribute("path",fullPath);
//		
//		UserDTO user = new UserDTO();
//		user.setName("AMan");
//		
//		session.setAttribute("login", user);
//		response.sendRedirect("index.jsp");
	
		
		
	}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
