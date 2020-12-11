package shop;

import java.sql.DriverManager;
import java.sql.SQLException;

public class JDBC_Connect {

	public static void main(String[] args) {
		
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:XE";
		String user = "system";
		String pw = "1234";
		
		try {
			Class.forName(driver);
			System.out.println("jdbc driver로딩성공");
			DriverManager.getConnection(url, user, pw);
			System.out.println("오라클연결 성공!");
		} catch (SQLException e) {
			System.out.println("jdbc로딩실패");
		} catch(Exception e) {
			System.out.println("오라클연결실패");
		}
		
	}

}
