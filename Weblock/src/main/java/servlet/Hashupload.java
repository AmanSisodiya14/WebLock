package servlet;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import Algorithms.Hash;
import Services.FileNameExtractor;

/**
 * Servlet implementation class Hashupload
 */
@WebServlet("/Hashupload")
@MultipartConfig
public class Hashupload extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Hashupload() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		
		
		String algo = request.getParameter("Algo");
		System.out.println(algo);
		Part file = request.getPart("file");
		String FileName = FileNameExtractor.getFileName(file.getSubmittedFileName());
		
		try {
			String OutputPath = getServletContext().getRealPath("/WEB-INF/Files/");
			FileOutputStream fos = new FileOutputStream(OutputPath+FileName);
			InputStream in = file.getInputStream();
			
			byte[] data = new byte[in.available()];
			in.read(data);
			fos.write(data);
			fos.close();
			in.close();
			
			Hash hash = new Hash();
			HttpSession s = request.getSession(true);
			File hashfile = new File(OutputPath+FileName);
			System.out.println("Before if loop");
			String GenerateHash=null;
			if(algo.equalsIgnoreCase("MD5")) {
				System.out.println("inside if md5");
				
				 GenerateHash = hash.HashFind(hashfile, "MD5");
				s.setAttribute("Result", GenerateHash);				
			}else if(algo.equalsIgnoreCase("SHA-256")) {

				 GenerateHash = hash.HashFind(hashfile, "SHA-256");
				s.setAttribute("Result", GenerateHash);				
				
			}else if(algo.equalsIgnoreCase("SHA-512")) {

				 GenerateHash = hash.HashFind(hashfile, "SHA-512");
				s.setAttribute("Result", GenerateHash);				
			}
			
			//Delete File
			File FileDelete = new File(OutputPath+FileName);
			FileDelete.delete();
			
			if(GenerateHash !=null) {
				response.sendRedirect("Result.jsp");
			}else {
			
			response.sendRedirect("Hash.jsp");
			}
		}catch(Exception e) {
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
