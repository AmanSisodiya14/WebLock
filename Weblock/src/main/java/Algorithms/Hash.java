package Algorithms;

import java.io.*;
import java.security.*;
//
public class Hash {
    public  String HashFind(File file ,String algorithm) throws Exception {
        
        
        byte[] fileBytes = readBytesFromFile(file);


        MessageDigest md = MessageDigest.getInstance(algorithm);
        byte[] digest = md.digest(fileBytes);

        
        return bytesToHex(digest);
    }

    private static byte[] readBytesFromFile(File filename) throws IOException {
        FileInputStream fileInputStream = new FileInputStream(filename);
        byte[] bytes = new byte[fileInputStream.available()];
        fileInputStream.read(bytes);
        fileInputStream.close();
        return bytes;
    }

    private static String bytesToHex(byte[] bytes) {
        StringBuilder sb = new StringBuilder();
        for (byte b : bytes) {
            sb.append(String.format("%02x", b));
        }
        return sb.toString();
    }
}
