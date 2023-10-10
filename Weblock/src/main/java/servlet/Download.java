package servlet;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.FileDAO;
import DTO.FileDTO;

/**
 * Servlet implementation class download
 */
@WebServlet("/Download")
public class Download extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Download() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    private static String getFileName(String filename){
//		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd_HH-mm-ss");
//	    String currentTime = dateFormat.format(new Date());
		
		String fileName =filename;
		 // Remove the date part from the file name
        int underscoreIndex = fileName.lastIndexOf("_");
        int lastIndex = fileName.length();
        if (underscoreIndex != -1) {
            fileName = fileName.substring( underscoreIndex+1	,lastIndex);
        }
		
		
		return fileName;
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		HttpSession s = request.getSession(true);
		s.removeAttribute("FileId");
		
		int	FileId = Integer.parseInt(request.getParameter("FileId"));
		
		// get the file by id
		FileDTO  file = FileDAO.getFileById(FileId);
		System.out.println(file);
		
		String OutputPath = getServletContext().getRealPath("/WEB-INF/Files/"+file.getMode()+"/");
		String filePath=OutputPath+file.getFilename();
		
		
		
		File downloadFile = new File(filePath);
		String DownloadFileName = getFileName(downloadFile.getName());
		
		try {
		FileInputStream inStream = new FileInputStream(downloadFile);
		
		
//		String relativePath = getServletContext().getRealPath("");
//		System.out.println("relative path "+relativePath);
//		
//		ServletContext context = getServletContext();
//		String mimeType = context.getMimeType(filePath);
//		
//		if(mimeType == null) {
//			mimeType = "application/octet-stream";
//		}
//		System.out.println("MIME "+mimeType);
		
		
//		response.setContentType(mimeType);
//		response.setContentLength((int)downloadFile.length());
		
//		String headerKey="content.Disposition";
//		String headerValue =String.format("attachment; filename = "+downloadFile.getName());
//		
//		response.setContentType("text/plain");
		response.setContentType("application/octet-stream");
		response.setHeader("Content-disposition", "attachment; filename="+DownloadFileName);

		
//	        response.setHeader(headerKey, headerValue);
		OutputStream outStream = response.getOutputStream();
		
		
		byte[] buffer = new byte[4096];
		int bytesRead =-1;
		
		while((bytesRead = inStream.read(buffer)) != -1) {
			outStream.write(buffer,0,bytesRead);
		}
		inStream.close();
		outStream.close();
		}catch(Exception e) {
			
			response.sendRedirect("index.jsp");
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
