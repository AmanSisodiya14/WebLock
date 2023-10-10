package servlet;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;
import java.util.Random;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.json.JSONObject;

import DTO.UserDTO;

/**
 * Servlet implementation class SendOTP
 */
@WebServlet("/SendOTP")
public class SendOTP extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SendOTP() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json");
		JSONObject jsonResponse = new JSONObject();
		PrintWriter out = response.getWriter();

		HttpSession session = request.getSession(true);
		UserDTO user = (UserDTO) session.getAttribute("login");

		if(user ==  null) {
			response.sendRedirect("index.jsp");
		}
		
		int random = new Random().nextInt(100000 - 10000)+10000;
		session.setAttribute("otp", random);
		String message = "Dear " + user.getName() + ",\r\n" + "\r\n"
				+ "Excitement is in the air, and we can't wait to share something truly spectacular with you! 🎉\r\n"
				+ "\r\n"
				+ "We hope you've been enjoying your journey on our website, but there's an extra layer of magic we want to unveil – a treasure chest of exclusive content, locked away just for you.\r\n"
				+ "\r\n"
				+ "To open this digital treasure chest and access the hidden gems, we need your special key - an OTP (One-Time Password) tailored just for you. 🔐\r\n"
				+ "\r\n" + "🔒 Your Unique OTP: [" + random + "] 🔒\r\n" + "\r\n"
				+ "To decrypt the files and reveal the wonders within, simply enter this OTP on our website, and voilà! You'll be granted access to a world of extraordinary content that we've prepared with you in mind.\r\n"
				+ "\r\n"
				+ "Don't wait too long! This key won't last forever. Grab your chance now to embark on this thrilling adventure and discover what awaits behind the locked door.\r\n"
				+ "\r\n"
				+ "Thank you for being a part of our community and for choosing us to be your digital companion.\r\n"
				+ "\r\n" + "Unlock the magic, and let the adventure begin!\r\n" + "\r\n" + "Warm regards,\r\n" + "\r\n"
				+ "Riya Rathor\r\n" + "General Secretary of  WebLock\r\n" + "URL\r\n";

		String subject = "🌟 Your Exclusive Key to Unlock Our Hidden Treasure! 🌟";

		String to = user.getEmail();
		String from = "weblockservice@gmail.com";

		int i = sendEmail(message, subject, to, from);
		try {
		if(i>0) {
			jsonResponse.put("success", true);
		}
		else {
			jsonResponse.put("success", false);
		}
		}catch(Exception e) {
			e.printStackTrace();
			
		}
		out.print(jsonResponse);
		out.flush();

	}

	private static int sendEmail(String message, String subject, String to, String from) {
int i=0;
		String host = "smtp.gmail.com";

		Properties pro = System.getProperties();

		pro.put("mail.smtp.host", host);
		pro.put("mail.smtp.port", "587");
		pro.put("mail.smtp.auth", "true");
		pro.put("mail.smtp.starttls.enable", "true");

		Session session = Session.getInstance(pro, new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				// TODO Auto-generated method stub
				return new PasswordAuthentication("weblockservice@gmail.com", "dpgprlgojrrgbkyt");
			}
		});

		MimeMessage msg = new MimeMessage(session);

		try {

			msg.setFrom(from);
			msg.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
			msg.setSubject(subject);
			msg.setText(message);

			Transport.send(msg);
			
			i=1;
		} catch (Exception e) {
			i=2;
			e.printStackTrace();
		}
		return i;

	}

}
