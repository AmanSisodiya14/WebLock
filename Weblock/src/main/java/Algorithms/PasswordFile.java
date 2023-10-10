package Algorithms;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfReader;
import com.itextpdf.text.pdf.PdfStamper;
import com.itextpdf.text.pdf.PdfWriter;

public class PasswordFile {
	public static void main(String[] args) throws IOException {
		String uploadPath = "D:\\sem.pdf";
		String outputPath = "D:\\aman000.pdf";
		String key="aman";
		String msg = "Aman sisodiya";
		PasswordFile pf = new PasswordFile();
		pf.ApplyPassPdf(uploadPath,outputPath, key);
		System.out.println("aman");
	}
	
	public  void ApplyPassPdf(String uploadPath, String OutputPath, String key) throws FileNotFoundException, IOException {
		try {
			InputStream inputFileStream = new FileInputStream(uploadPath);
			OutputStream protectedFileStream = new FileOutputStream(OutputPath);
		
			PdfReader pdfReader = new PdfReader(inputFileStream);
			PdfStamper pdfStamper = new PdfStamper(pdfReader, protectedFileStream);
			pdfStamper.setEncryption(key.getBytes(), key.getBytes(), PdfWriter.ALLOW_PRINTING,
					PdfWriter.ENCRYPTION_AES_128);
			pdfStamper.close();
		} catch (DocumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public  void CreatePdf(String OutputPath , String key,String msg) throws FileNotFoundException {
		try {
			Document document = new Document();
			PdfWriter writer = PdfWriter.getInstance(document, new FileOutputStream(OutputPath));
			writer.setEncryption(key.getBytes(), key.getBytes(), PdfWriter.ALLOW_PRINTING,
					PdfWriter.ENCRYPTION_AES_128);

			document.open();

			// Add content to the PDF

			document.add(new Paragraph(msg));
			document.close();
		} catch (DocumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
