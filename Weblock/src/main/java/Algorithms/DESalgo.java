package Algorithms;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.security.spec.InvalidKeySpecException;
import javax.crypto.Cipher;
import javax.crypto.CipherInputStream;
import javax.crypto.CipherOutputStream;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.DESKeySpec;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

public class DESalgo {

	private static void write(InputStream in ,OutputStream out) throws IOException{
		byte[] buffer = new byte[64];
		int numOfBytesRead;
		while((numOfBytesRead =in.read(buffer)) != -1) {
			out.write(buffer,0,numOfBytesRead);
			
		}
		out.close();
		in.close();
	}
public  void TripleDES(String key,int cipherMode,File in ,File out) throws InvalidKeyException, NoSuchAlgorithmException, InvalidKeySpecException, NoSuchPaddingException, InvalidAlgorithmParameterException, IOException {
		
		FileInputStream fis = new FileInputStream(in);
		FileOutputStream fos = new FileOutputStream(out);

		SecretKeySpec secretKeySpec = new SecretKeySpec(key.getBytes(), "TripleDES");

		
		Cipher cipher =  Cipher.getInstance("TripleDES/CBC/PKCS5Padding");
		byte[] ivByte =new byte[8];
		IvParameterSpec iv = new IvParameterSpec(ivByte); 
		
		if(cipherMode == Cipher.ENCRYPT_MODE) {
			cipher.init(Cipher.ENCRYPT_MODE,secretKeySpec, iv);
			CipherInputStream cis = new CipherInputStream(fis, cipher);
			write(cis,fos);
		}else if(cipherMode == Cipher.DECRYPT_MODE) {
			cipher.init(Cipher.DECRYPT_MODE,secretKeySpec,iv  );
			CipherOutputStream cos = new CipherOutputStream(fos, cipher);
			write(fis,cos);
		}
		
	
}

public  void DES(String key,int cipherMode,File in ,File out) throws InvalidKeyException, NoSuchAlgorithmException, InvalidKeySpecException, NoSuchPaddingException, InvalidAlgorithmParameterException, IOException {
	
	FileInputStream fis = new FileInputStream(in);
	FileOutputStream fos = new FileOutputStream(out);
	
	DESKeySpec desKeySpec = new DESKeySpec(key.getBytes());
	
	SecretKeyFactory skf = SecretKeyFactory.getInstance("DES");
	SecretKey secretKey = skf.generateSecret(desKeySpec);
	
	Cipher cipher =  Cipher.getInstance("DES/CBC/PKCS5Padding");
	byte[] ivByte =new byte[8];
	IvParameterSpec iv = new IvParameterSpec(ivByte); 
	
	if(cipherMode == Cipher.ENCRYPT_MODE) {
		cipher.init(Cipher.ENCRYPT_MODE,secretKey, iv,SecureRandom.getInstance("SHA1PRNG") );
		CipherInputStream cis = new CipherInputStream(fis, cipher);
		write(cis,fos);
	}else if(cipherMode == Cipher.DECRYPT_MODE) {
		cipher.init(Cipher.DECRYPT_MODE,secretKey,iv ,SecureRandom.getInstance("SHA1PRNG") );
		CipherOutputStream cos = new CipherOutputStream(fos, cipher);
		write(fis,cos);
	}	
  }
	


}
