package shop;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class ShopDAO {
	String id = "system";
	String pw = "1234";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	
	//jdbc연동
	public void getCon() {
		
		try {
			Class.forName(id);
			con = DriverManager.getConnection(url, id, pw);
		} catch(Exception e) {
			e.printStackTrace();
		}
	
	}
}
