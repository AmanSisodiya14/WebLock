package Algorithms;

import java.util.HashMap;
import java.util.Scanner;

public class Cipher {
	public static void main(String[] args) {
		String msg = "aman";
		int key = 11;
		
		String encrypted =Cipher.CaesarEncrypt(msg, key);
		  String decrypted =Cipher.CaesardDecrypt(encrypted, key);
		  System.out.println(encrypted);
		  System.out.println(decrypted);
		  
		  
		
	}
    public static String CaesarEncrypt(String message, int shift) {
        StringBuilder result = new StringBuilder();
        for (int i = 0; i < message.length(); i++) {
            char ch = message.charAt(i);
            if (Character.isLetter(ch)) {
                char shiftedCh = (char) (((ch - 'a' + shift) % 26) + 'a');
                result.append(shiftedCh);
            } else {
                result.append(ch);
            }
        }
        return result.toString();
    }
    
    public static String CaesardDecrypt(String message, int shift) {
        StringBuilder result = new StringBuilder();
        for (int i = 0; i < message.length(); i++) {
            char ch = message.charAt(i);
            if (Character.isLetter(ch)) {
                char shiftedCh = (char) (((ch - 'a' - shift + 26) % 26) + 'a');
                result.append(shiftedCh);
            } else {
                result.append(ch);
            }
        }
        return result.toString();
    }
    
    private static final String ALPHABET = "abcdefghijklmnopqrstuvwxyz";
//    private static final String KEY = "phqgiumeaylnofdxjkrcvstzwb";


    public static String MonoEncrypt(String message , String KEY) {
    	
        StringBuilder ciphertext = new StringBuilder();
        HashMap<Character, Character> map = new HashMap<>();
        for (int i = 0; i < ALPHABET.length(); i++) {
            map.put(ALPHABET.charAt(i), KEY.charAt(i));
        }
        for (int i = 0; i < message.length(); i++) {
            char c = message.charAt(i);
            if (Character.isLetter(c)) {
                c = Character.toLowerCase(c);
                ciphertext.append(map.get(c));
            } else {
                ciphertext.append(c);
            }
        }
        return ciphertext.toString();
    }

    public static String MonoDecrypt(String ciphertext,String KEY) {
    	
        StringBuilder message = new StringBuilder();
        HashMap<Character, Character> map = new HashMap<>();
        for (int i = 0; i < KEY.length(); i++) {
            map.put(KEY.charAt(i), ALPHABET.charAt(i));
        }
        for (int i = 0; i < ciphertext.length(); i++) {
            char c = ciphertext.charAt(i);
            if (Character.isLetter(c)) {
                c = Character.toLowerCase(c);
                message.append(map.get(c));
            } else {
                message.append(c);
            }
        }
        return message.toString();
    }
    
    
    public static String PolyEncrypt(String message, String key) {
        StringBuilder sb = new StringBuilder();
        int keyIndex = 0;

        for (int i = 0; i < message.length(); i++) {
            char c = message.charAt(i);
            char k = key.charAt(keyIndex);

            // Encrypt the character using the current key character
            char encrypted = (char) ((c + k) % 256);
            sb.append(encrypted);

            // Move to the next key character
            keyIndex = (keyIndex + 1) % key.length();
        }

        return sb.toString();
    }

    // Decrypt a string using a polyalphabetic cipher with the given key
    public static String PolyDecrypt(String message, String key) {
        StringBuilder sb = new StringBuilder();
        int keyIndex = 0;

        for (int i = 0; i < message.length(); i++) {
            char c = message.charAt(i);
            char k = key.charAt(keyIndex);

            // Decrypt the character using the current key character
            char decrypted = (char) ((c - k + 256) % 256);
            sb.append(decrypted);

            // Move to the next key character
            keyIndex = (keyIndex + 1) % key.length();
        }

        return sb.toString();
    }

    
    
    
    
}
