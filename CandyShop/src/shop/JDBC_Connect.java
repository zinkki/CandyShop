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
			System.out.println("jdbc driver�ε�����");
			DriverManager.getConnection(url, user, pw);
			System.out.println("����Ŭ���� ����!");
		} catch (SQLException e) {
			System.out.println("jdbc�ε�����");
		} catch(Exception e) {
			System.out.println("����Ŭ�������");
		}
		
	}

}
