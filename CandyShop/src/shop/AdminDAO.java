package shop;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class AdminDAO {
	
String driver="oracle.jdbc.driver.OracleDriver";
String url = "jdbc:oracle:thin:@localhost:1521:XE";
String user = "system";
String pw = "1234";

Connection con;
PreparedStatement pstmt;
ResultSet rs;

//db연동
public void getCon() {
	try {
		Class.forName(driver);
		con = DriverManager.getConnection(url,user,pw);
	}catch(Exception e) {
		e.printStackTrace();
	}
}

//회원리스트뽑기
public ArrayList<Bean> memberList() {
	ArrayList<Bean> list = new ArrayList<>();
	getCon();
	try {
		String sql = "SELECT * FROM shop_member ORDER BY m_joindate asc";
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while(rs.next()) {
			Bean bean = new Bean();
			bean.setM_id(rs.getString(1));
			bean.setM_name(rs.getString(3));
			bean.setM_email(rs.getString(4));
			bean.setM_joindate(rs.getString(8).toString());
			list.add(bean);
		}
	}catch (Exception e) {
		e.printStackTrace();
	}
	return list;
}

//회원리스트에서 선택한id의 정보보기
public Bean memberInfo(String m_id) {
	Bean bean = new Bean();
	getCon();
	try {
		String sql = "SELECT * FROM shop_member WHERE m_id=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, m_id);
		rs = pstmt.executeQuery();
		while(rs.next()) {
			bean.setM_id(rs.getString(1));
			bean.setM_pass(rs.getString(2));
			bean.setM_name(rs.getString(3));
			bean.setM_email(rs.getString(4));
			bean.setM_address(rs.getString(5));
			bean.setM_post(rs.getString(6));
			bean.setM_tel(rs.getString(7));
			bean.setM_joindate(rs.getString(8).toString());
			bean.setM_birth(rs.getString(9));
			bean.setM_buy(rs.getString(10));
			bean.setM_drop(rs.getInt(11));
			bean.setM_jibunAddress(rs.getString(12));
		} con.close();
	}catch(Exception e) {
		e.printStackTrace();
	}
	return bean;
}

}
