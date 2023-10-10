package Services;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

public class FileNameExtractor {
    public static void main(String[] args) {
        String filePath = "C:\\Users\\ASUS\\Downloads\\2023-05-20_18-36-22_2023-05-20_18-36-04_text2";
        
        // Get the file name from the file path
        String fileName = getFileName(filePath);
        
        // Print the extracted file name
        System.out.println("File name: " + fileName);
    }
    
    public static String getFileName(String filename) {
        // Get the file object from the file path
        
        
        // Get the name of the file
        String fileName = filename;
        
        // Remove the date part from the file name
        int underscoreIndex = fileName.lastIndexOf("_");
        int lastIndex = fileName.length();
        if (underscoreIndex != -1) {
            fileName = fileName.substring( underscoreIndex+1	,lastIndex);
        }
        
        return fileName;
    }
    public static String setFileName(String filename){
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd_HH-mm-ss");
	    String currentTime = dateFormat.format(new Date());
		
		String fileName =filename;
		 // Remove the date part from the file name
        int underscoreIndex = fileName.lastIndexOf("_");
        int lastIndex = fileName.length();
        if (underscoreIndex != -1) {
            fileName = fileName.substring( underscoreIndex+1	,lastIndex);
        }
		
		
		return currentTime+"_"+fileName;
	}
}
