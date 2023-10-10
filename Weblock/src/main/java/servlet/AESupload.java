package servlet;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import Algorithms.AES_ECB;
import DAO.FileDAO;
import DTO.FileDTO;
import DTO.UserDTO;
import Services.FileNameExtractor;

/**
 * Servlet implementation class AESupload
 */
@WebServlet("/AESupload")
@MultipartConfig(maxFileSize = 16177215)
public class AESupload extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AESupload() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
//	   /var/lib/tomcat9/webapps/EncDec2.2/WEB-INF/Files/
	
	

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession s = request.getSession(true);
		Part file = request.getPart("file");
		
		
		
		if(file.getSize()<=0) {
			
			s.setAttribute("error", "Please upload the file Or File size must be greater than 0.");
			response.sendRedirect("AesUpload.jsp");
		}
		String mode = request.getParameter("Mode");
		if(mode.equalsIgnoreCase("dec")) {
			int Userotp = Integer.parseInt( request.getParameter("otp"));
			int otp =0;
			try {
			otp = (int) s.getAttribute("otp");
			}catch(Exception e) {
				s.setAttribute("error", "There is some error please try later..");
				RequestDispatcher dd=request.getRequestDispatcher("AesUpload.jsp");
				dd.forward(request, response);
			}
			
			if(otp != Userotp) {
				System.out.println("otp-"+otp);
				System.out.println("Userotp-"+Userotp);
				s.setAttribute("error", "Enter the correct OTP");
				response.sendRedirect("AesUpload.jsp");
			}
		}		
		UserDTO user = (UserDTO)request.getSession(true).getAttribute("login");
		String algo = request.getParameter("Algo");
		
		String key  = request.getParameter("key");
		
		String FileName = FileNameExtractor.setFileName(file.getSubmittedFileName());
		try {
			
//			String OutputPath = "C:\\Users\\asus\\eclipse-workspace\\EncDec2.2\\Files\\";
			String OutputPath = getServletContext().getRealPath("/WEB-INF/Files/");
			
//			System.out.println("filename"+FileName);
//			
//			File f1 = new File(OutputPath+FileName);
//			if(f1.createNewFile()) {
//				System.out.println("create "+f1.getName());
//				System.out.println("path"+f1.getAbsolutePath());
//			}
			
			FileOutputStream fos = new FileOutputStream(OutputPath+FileName);
			InputStream in = file.getInputStream();
			
			byte[] data = new byte[in.available()];
			in.read(data);
			fos.write(data);
			fos.close();
			in.close();
			
			

			AES_ECB aes = new AES_ECB();
			
			if(mode.equalsIgnoreCase("Enc")) {
				
				
				File plainFile = new File(OutputPath+FileName);
				File EncFile = new File(OutputPath+"Enc\\"+FileName);
//				
				aes.encryptFile(key, plainFile, EncFile);
						
			}else {
				File EncFile = new File(OutputPath+FileName);
				File DecFile = new File(OutputPath+"Dec\\"+FileName);
				
				aes.decryptFile(key, EncFile, DecFile);
				
				
			}
		
			FileDTO f = new FileDTO();
			f.setFilename(FileName);
			f.setAlgo("AES ("+algo+")");
			f.setKey(key);
			f.setMode(mode);
			f.setUserId(user.getId());
			
			FileDAO fileDao = new FileDAO();
			int i = fileDao.FileInfo(f);
			
		    System.out.println("id: "+i);
		
			// delete the input file
			File FileDelete = new File(OutputPath+FileName);
			FileDelete.delete();
			
			s.removeAttribute("otp");
			if(i>0) {
				s.setAttribute("FileId", i);	
				response.sendRedirect("DownloadFile.jsp?file="+FileName);
			}else {
				response.sendRedirect("AesUpload.jsp");
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
