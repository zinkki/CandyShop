package shop;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MemberDAO {
	
	String id = "system";
	String pw = "1234";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	
	//db연동
	public void getCon() {
		
		try {
			Class.forName(id);
			con = DriverManager.getConnection(url, id, pw);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public void m_join(Bean	bean) {
		
		try {
			getCon();
			String sql ="INSERT INTO shop_member VALUES(?,?,?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getM_id());
			pstmt.setString(2, bean.getM_pass());
			pstmt.setString(3, bean.getM_name());
			pstmt.setString(4, bean.getM_email());	
			pstmt.setString(5, bean.getM_address());
			pstmt.setString(6, bean.getM_post());
			pstmt.setString(7, bean.getM_tel());
			pstmt.setString(8, bean.getM_joindate());
			pstmt.setString(9, bean.getM_birth());
			pstmt.setInt(10, bean.getM_drop());
			pstmt.executeUpdate();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	
	
	
	
	
	
	
}
