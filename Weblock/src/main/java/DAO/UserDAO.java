package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import DB.getConnection;
import DTO.UserDTO;

public class UserDAO {
	public int UserRegister(UserDTO user) {
		int i=0;
		try {
			Connection con = getConnection.getConnect();
			PreparedStatement ps = con.prepareStatement("insert into user(name,email,password) values(?,?,?)");
			
			ps.setString(1, user.getName());
			ps.setString(2, user.getEmail());
			ps.setString(3, user.getPassword());
			
			i = ps.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}	
		return i;
	}
	public UserDTO LoginCheck(String email,String password) {
		UserDTO user = new UserDTO();

		try {
			Connection con = getConnection.getConnect();
			PreparedStatement ps = con.prepareStatement("select * from user where email=? and password=?");
			ps.setString(1, email);
			ps.setString(2, password);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				user.setId(rs.getInt("id"));
				user.setName(rs.getString("name"));
				user.setEmail(email);
				user.setPassword(password);
				user.setStatus(rs.getInt("status"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return user;
	}

}
