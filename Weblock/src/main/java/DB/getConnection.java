package DB;

import java.sql.Connection;
import java.sql.DriverManager;

public class getConnection implements getConfig {
	public static Connection getConnect() {
	
		Connection con =null;
		try {
			Class.forName(DRIVER);
			con = DriverManager.getConnection(URL,USER,PASS);
			
			if(con!=null) {
				System.out.println("Connect");
			}else {
				System.out.println("not Connect");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return con;
		
	}

	
}
