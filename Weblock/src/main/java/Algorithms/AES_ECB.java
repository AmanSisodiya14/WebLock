package Algorithms;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.KeySpec;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.PBEKeySpec;
import javax.crypto.spec.SecretKeySpec;

public class AES_ECB {

	public static SecretKey getKeyFromPassword(String password, String salt)
			throws NoSuchAlgorithmException, InvalidKeySpecException {

		SecretKeyFactory factory = SecretKeyFactory.getInstance("PBKDF2WithHmacSHA256");
		KeySpec spec = new PBEKeySpec(password.toCharArray(), salt.getBytes(), 65536, 256);
		
		SecretKey secret = new SecretKeySpec(factory.generateSecret(spec).getEncoded(), "AES");
		
		return secret;
	}

	public void encryptFile(String password, File inputFile, File outputFile) throws Exception {
		String algorithm = "AES/ECB/PKCS5Padding";

		String salt = "12345678";
		SecretKey key = getKeyFromPassword(password, salt);

		Cipher cipher = Cipher.getInstance(algorithm);
		cipher.init(Cipher.ENCRYPT_MODE, key);
		FileInputStream inputStream = new FileInputStream(inputFile);
		FileOutputStream outputStream = new FileOutputStream(outputFile);
		byte[] buffer = new byte[64];
		int bytesRead;
		while ((bytesRead = inputStream.read(buffer)) != -1) {
			byte[] output = cipher.update(buffer, 0, bytesRead);
			if (output != null) {
				outputStream.write(output);
			}
		}
		byte[] outputBytes = cipher.doFinal();
		if (outputBytes != null) {
			outputStream.write(outputBytes);
		}
		inputStream.close();
		outputStream.close();
	}

	public  void decryptFile(String password, File inputFile, File outputFile) throws Exception {
		String salt = "12345678";
		SecretKey key = getKeyFromPassword(password, salt);
		String algorithm = "AES/ECB/PKCS5Padding";

		Cipher cipher = Cipher.getInstance(algorithm);
		cipher.init(Cipher.DECRYPT_MODE, key);
		FileInputStream inputStream = new FileInputStream(inputFile);
		FileOutputStream outputStream = new FileOutputStream(outputFile);
		byte[] buffer = new byte[64];
		int bytesRead;
		while ((bytesRead = inputStream.read(buffer)) != -1) {
			byte[] output = cipher.update(buffer, 0, bytesRead);
			if (output != null) {
				outputStream.write(output);
			}
		}
//		    byte[] outputBytes = cipher.doFinal();
//		    if (outputBytes != null) {
//		        outputStream.write(outputBytes);
//		    }
		inputStream.close();
		outputStream.close();
	}

	public static void main(String[] args) throws Exception {

//		String plainText = "AES/ECB/PKCS5Padding";
		String password = "AMan";
		String salt = "1278";

		File file = new File("D:\\text2.txt");
		File encrypt = new File("D:\\AESencryptECB.txt");
		File decrypt = new File("D:\\AESECB.txt");
		int l = (int) file.length();
		System.out.println((l / 1024) / 1024);

//	    SecretKey key = getKeyFromPassword(password,salt);
//	     s

	}
}
