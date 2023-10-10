package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

import DAO.FileDAO;
import DTO.FileDTO;
import DTO.UserDTO;
import Services.EmailSenderWithAttachment;

/**
 * Servlet implementation class ShareFile
 */
@WebServlet("/ShareFile")
public class ShareFile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShareFile() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();

		JSONObject jsonResponse = new JSONObject();

		int id = Integer.parseInt(request.getParameter("id"));
		String email = request.getParameter("email");

		FileDTO fileDTO = FileDAO.getFileById(id);

		HttpSession session = request.getSession(false);
		UserDTO user = (UserDTO) session.getAttribute("login");
		try {
			String FilePath = getServletContext().getRealPath("/WEB-INF/Files/" + fileDTO.getMode()+"/"+fileDTO.getFilename());
			System.out.println(FilePath);
			int i = EmailSenderWithAttachment.SendMail(FilePath, user.getName(), email);
			if (i > 0) {

				jsonResponse.put("success", true);

			} else {
				
				jsonResponse.put("success", false);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		out.print(jsonResponse);
		out.flush();

	}

}
