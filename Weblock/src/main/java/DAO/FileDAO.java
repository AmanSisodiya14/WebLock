package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import DB.getConnection;
import DTO.FileDTO;

public class FileDAO {

	public int FileInfo(FileDTO f) {
		int id = 0;
		try {
			Connection con = getConnection.getConnect();

			PreparedStatement ps = con
					.prepareStatement("insert into fileinfo(filename,mode,algo,passkey,userid) values(?,?,?,?,?)",Statement.RETURN_GENERATED_KEYS);
			ps.setString(1, f.getFilename());
			ps.setString(2, f.getMode());
			ps.setString(3, f.getAlgo());
			ps.setString(4, f.getKey());
			ps.setInt(5, f.getUserId());
			ps.executeUpdate();
			
			
			//  Retrieve the generated ID

			try (ResultSet rs = ps.getGeneratedKeys()) {
			    if (rs.next()) {
			        id =rs.getInt(1);
			    }
			    rs.close();
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return id;
	}

	public List<FileDTO> getFilesByUserId(int id) {

		List<FileDTO> files = new ArrayList<FileDTO>();

		try {
			Connection con = getConnection.getConnect();

			PreparedStatement ps = con.prepareStatement("select id,filename,mode,algo from fileinfo where userid=?");
			ps.setInt(1, id);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				FileDTO file = new FileDTO();
				file.setId(rs.getInt("id"));
				file.setFilename(rs.getString("filename"));
				file.setAlgo(rs.getString("algo"));
				file.setMode(rs.getString("mode"));

				files.add(file);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return files;
	}

	public static FileDTO getFileById(int id) {
		FileDTO file = new FileDTO();
		try {
			Connection con = getConnection.getConnect();

			PreparedStatement ps = con.prepareStatement("select * from fileinfo where id=?");
			ps.setInt(1, id);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				
				file.setId(rs.getInt("id"));
				file.setFilename(rs.getString("filename"));
				file.setAlgo(rs.getString("algo"));
				file.setMode(rs.getString("mode"));
			}

		} catch (Exception e) {

		}

		return file;
	}
	public static int deleteFileById(int id) {
		int i =0;
		
		try {
			Connection con = getConnection.getConnect();
			PreparedStatement ps = con.prepareStatement("delete from fileinfo where id =?");
			ps.setInt(1, id);
			
			i = ps.executeUpdate();
			System.out.println("delete id "+i);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return i;
	}
}
