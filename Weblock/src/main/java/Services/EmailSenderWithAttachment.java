package Services;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.*;
import javax.mail.internet.*;

import java.io.File;
import java.util.Properties;

public class EmailSenderWithAttachment {
	static String username = "weblockservice@gmail.com";
	static String password = "dpgprlgojrrgbkyt";
	
	public static void main(String[] args) {
		final String username = "weblockservice@gmail.com";
		final String password = "dpgprlgojrrgbkyt";
		final String recipientEmail = "sisodiya.aman07@gmail.com";
		final String attachmentPath = "D:\\text.txt";
		final String UserName ="Aman";
		
		
	}
	
	public static int SendMail(String attachmentPath,String UserName,String recipientEmail) {
		int i=0;
		  Properties props = new Properties();
	        props.put("mail.smtp.auth", "true");
	        props.put("mail.smtp.starttls.enable", "true");
	        props.put("mail.smtp.host", "smtp.gmail.com");
	        props.put("mail.smtp.port", "587");

	        Session session = Session.getInstance(props, new Authenticator() {
	            protected PasswordAuthentication getPasswordAuthentication() {
	                return new PasswordAuthentication(username, password);
	            }
	        });

	        try {
	            Message message = new MimeMessage(session);
	            message.setFrom(new InternetAddress(username));
	            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipientEmail));
	            message.setSubject("Web Lock Service");

	            // Create a multipart message
	            Multipart multipart = new MimeMultipart();

	            // Add the text part of the email
	            BodyPart messageBodyPart = new MimeBodyPart();
	            messageBodyPart.setText("This email send by "+UserName+" From WebLock.");
	            
	            multipart.addBodyPart(messageBodyPart);

	            // Add the attachment
	            messageBodyPart = new MimeBodyPart();
	            DataSource source = new FileDataSource(attachmentPath);
	            messageBodyPart.setDataHandler(new DataHandler(source));
	            
	            File file = new File(attachmentPath);
	            String FileName = FileNameExtractor.setFileName(file.getName());
	            messageBodyPart.setFileName(FileName); // Set the filename of the attachment
	            multipart.addBodyPart(messageBodyPart);

	            // Set the content of the email to the multipart message
	            message.setContent(multipart); // This line should not be inside the previous if statement

	            // Send the email
	            Transport.send(message);
	            
	            System.out.println("Email with attachment sent successfully.");
	            i=1;
	        } catch (MessagingException e) {
	            e.printStackTrace();
	        	i=0;
	        }
	        return i;
	}
}
