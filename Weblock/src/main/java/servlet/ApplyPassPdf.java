package servlet;

import java.io.File;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;


import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import Algorithms.PasswordFile;
import DAO.FileDAO;
import DTO.FileDTO;
import DTO.UserDTO;
import Services.FileNameExtractor;

/**
 * Servlet implementation class ApplyPassPdf
 */
@WebServlet("/ApplyPassPdf")
@MultipartConfig
public class ApplyPassPdf extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ApplyPassPdf() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession(false);
		UserDTO user = (UserDTO)session.getAttribute("login");
		// TODO Auto-generated method stub
		String mode = request.getParameter("mode");
		String key = request.getParameter("key");
		String FileName="";
		PasswordFile pf = new PasswordFile();

		HttpSession s = request.getSession(true);
		String uploadPath = getServletContext().getRealPath("/WEB-INF/Files/");
		if (mode.equalsIgnoreCase("AP")) {

			Part file = request.getPart("file");

			 FileName = FileNameExtractor.setFileName(file.getSubmittedFileName());

			

			FileOutputStream fos = new FileOutputStream(uploadPath + FileName);
			InputStream in = file.getInputStream();

			byte[] data = new byte[in.available()];
			in.read(data);
			fos.write(data);
			fos.close();
			in.close();

			String OutputPath = getServletContext().getRealPath("/WEB-INF/Files/AP/");

			
			
			pf.ApplyPassPdf(uploadPath+FileName, OutputPath+FileName, key);


//			s.setAttribute("FilePath", "AP\\" + FileName);

			File Deletefile = new File(uploadPath + FileName);
			Deletefile.delete();

//			response.sendRedirect("DownloadFile.jsp?file=" + FileName);

		} else {
			 FileName = FileNameExtractor.setFileName(request.getParameter("FileName"))+".pdf";
			String msg = request.getParameter("Message");

			String OutputPath = uploadPath+"PP\\";
			FileOutputStream fos = new FileOutputStream(OutputPath + FileName);
			

			pf.CreatePdf(OutputPath+FileName, key, msg);

//			s.setAttribute("FilePath", "PP\\" + FileName);

//			response.sendRedirect("DownloadFile.jsp?file=" + filename+".pdf");

		}
		
		FileDTO f = new FileDTO();
		f.setFilename(FileName);
		f.setAlgo("-");
		f.setKey(key);
		f.setMode(mode);
		f.setUserId(user.getId());
		
		FileDAO fileDao = new FileDAO();
		int i = fileDao.FileInfo(f);
		
		if(i>0) {
			s.setAttribute("FileId", i);
			
			response.sendRedirect("DownloadFile.jsp?file="+FileName);
		}else {
			response.sendRedirect("404.jsp");
		}
		
		

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
