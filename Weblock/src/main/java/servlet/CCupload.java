package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Algorithms.Cipher;

/**
 * Servlet implementation class CCupload
 */
@WebServlet("/CCupload")
public class CCupload extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CCupload() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String CC = "CC";
		String MONO ="MONO";
		String POLY ="POLY";
		
			String algo = request.getParameter("Algo");
			String mode= request.getParameter("Mode");
			String key = request.getParameter("key");
			String msg = request.getParameter("msg");
		
		
		  HttpSession session = request.getSession(true); 
		  try {
			  if(algo.equals(CC)) {
				  int cckey = Integer.parseInt(key);
			  
					  if(mode.endsWith("Enc")) {
					  
						  String encrypted =Cipher.CaesarEncrypt(msg, cckey);
						  System.out.println(encrypted);
						  session.setAttribute("Result", encrypted); 
						  response.sendRedirect("Result.jsp");
					  
					  }else {
					  
						  String decrypted =Cipher.CaesardDecrypt(msg, cckey); 
						  session.setAttribute("Result", decrypted); 
						  response.sendRedirect("Result.jsp"); 
					  }
			  }else if(algo.equals(MONO)) {
				  if(mode.endsWith("Enc")) {
					  
					  String encrypted = Cipher.MonoEncrypt(msg, key);
					  System.out.println(encrypted);
					  session.setAttribute("Result", encrypted); 
					  response.sendRedirect("Result.jsp");
				  
				  }else {
				  
					  String decrypted =Cipher.MonoDecrypt(msg, key); 
					  session.setAttribute("Result", decrypted); 
					  response.sendRedirect("Result.jsp"); 
				  }  
			  }else if(algo.equals(POLY)) {
				  if(mode.endsWith("Enc")) {
					  
					  String encrypted = Cipher.PolyEncrypt(msg, key);
					  System.out.println(encrypted);
					  session.setAttribute("Result", encrypted); 
					  response.sendRedirect("Result.jsp");
				  
				  }else {
				  
					  String decrypted =Cipher.PolyDecrypt(msg, key); 
					  session.setAttribute("Result", decrypted); 
					  response.sendRedirect("Result.jsp"); 
				  }  
			  }
					  
		  
		  }
		  catch(Exception e) { 
			  e.printStackTrace(); 
		  }
		 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
