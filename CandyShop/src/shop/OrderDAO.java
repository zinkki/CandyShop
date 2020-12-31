package shop;

public class OrderDAO extends CartDAO{
	
public void addOrder(Bean bean) {
	getCon();
	try {
		String sql = "INSERT INTO shop_order VALUES(o_seq.NEXTVAL,?,?,SYSDATE)";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, bean.getM_id());
		pstmt.setInt(2, bean.getP_id());
		pstmt.executeQuery();
		con.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
}
}
