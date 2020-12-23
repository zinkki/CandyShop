package shop;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class CartDAO {
	
String driver="oracle.jdbc.driver.OracleDriver";
String url = "jdbc:oracle:thin:@localhost:1521:XE";
String user = "system";
String pw = "1234";

Connection con;
PreparedStatement pstmt;
ResultSet rs;
	
//jdbc연동
public void getCon() {
	try {
		Class.forName(driver);
		con = DriverManager.getConnection(url,user,pw);
	}catch(Exception e) {
		e.printStackTrace();
	}
}

//cart에 product(상품)담기
public void addCart(Bean bean) {
	getCon();
	try {
		String sql = "INSERT INTO shop_cart values(?,?,?,?)";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, bean.getM_id());
		pstmt.setInt(2, bean.getP_id());
		pstmt.setInt(3, bean.getCp_count());
		pstmt.setInt(4, bean.getCp_price());
		pstmt.executeUpdate();
		con.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
}
}
