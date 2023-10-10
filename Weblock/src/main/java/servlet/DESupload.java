package servlet;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.crypto.Cipher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import Algorithms.DESalgo;
import DAO.FileDAO;
import DTO.FileDTO;
import DTO.UserDTO;
import Services.FileNameExtractor;

/**
 * Servlet implementation class DESupload
 */
@WebServlet("/DESupload")
@MultipartConfig
public class DESupload extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DESupload() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession s = request.getSession(true);
		Part file = request.getPart("file");
		
		if(file.getSize()<=0) {
			
			s.setAttribute("error", "Please upload the file Or File size must be greater than 0.");
			response.sendRedirect("AesUpload.jsp");
		}

		UserDTO user = (UserDTO) request.getSession(true).getAttribute("login");
		String algo = request.getParameter("Algo");
		String mode = request.getParameter("Mode");
		String key = request.getParameter("key");
		
		String FileName = FileNameExtractor.getFileName(file.getSubmittedFileName());
		try {
			String OutputPath = getServletContext().getRealPath("/WEB-INF/Files/");
			FileOutputStream fos = new FileOutputStream(OutputPath + FileName);
			InputStream in = file.getInputStream();

			byte[] data = new byte[in.available()];
			in.read(data);
			fos.write(data);
			fos.close();
			in.close();

			DESalgo des = new DESalgo();
			

			if (algo.equalsIgnoreCase("DES")) {
				if (mode.equalsIgnoreCase("Enc")) {

					File plainFile = new File(OutputPath + FileName);
					File EncFile = new File(OutputPath + "Enc\\" + FileName);

					des.DES("*4#^Hez#94"+key, Cipher.ENCRYPT_MODE, plainFile, EncFile);
					
				} else {
					File EncFile = new File(OutputPath + FileName);
					File DecFile = new File(OutputPath + "Dec\\" + FileName);

					des.DES("*4#^Hez#94"+key, Cipher.DECRYPT_MODE, EncFile, DecFile);
					

				}

			} else {
				if (mode.equalsIgnoreCase("Enc")) {

					File plainFile = new File(OutputPath + FileName);
					File EncFile = new File(OutputPath + "Enc\\" + FileName);

					des.TripleDES("9mng65v8jf4lxn93"+key, Cipher.ENCRYPT_MODE, plainFile, EncFile);
					
				} else {
					File EncFile = new File(OutputPath + FileName);
					File DecFile = new File(OutputPath + "Dec\\" + FileName);

					des.TripleDES("9mng65v8jf4lxn93"+key, Cipher.DECRYPT_MODE, EncFile, DecFile);
					

				}

			}

			FileDTO f = new FileDTO();
			f.setFilename(FileName);
			f.setAlgo(algo);
			f.setKey(key);
			f.setMode(mode);
			f.setUserId(user.getId());

			FileDAO fileDao = new FileDAO();
			int i = fileDao.FileInfo(f);

			// delete the input file
			File FileDelete = new File(OutputPath);
			FileDelete.delete();

			if (i > 0) {
				s.setAttribute("FileId", i);
				response.sendRedirect("DownloadFile.jsp?file=" + FileName);
			} else {
				response.sendRedirect("AesUpload.jsp");
			}
		} catch (Exception e) {
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
