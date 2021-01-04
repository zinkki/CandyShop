package shop;

import java.util.ArrayList;

public class OrderDAO extends CartDAO{

//orderTable에담기!그리고 orderTable에담긴데이터는 cart_num=1로 바꿔주고 cartTabe에서빼기
public void addOrder(Bean bean) {
	getCon();
	try {
//		String sql = "INSERT INTO shop_order VALUES(o_seq.NEXTVAL,?,?,SYSDATE)";
//		pstmt = con.prepareStatement(sql);
//		pstmt.setString(1, bean.getM_id());
//		pstmt.setInt(2, bean.getP_id());
//		pstmt.executeUpdate();
		String sql2 = "UPDATE shop_cart SET cart_num=1 WHERE m_id=? and p_id=?";
		pstmt = con.prepareStatement(sql2);
		pstmt.setString(1, bean.getM_id());
		pstmt.setInt(2, bean.getP_id());
		pstmt.executeUpdate();
		con.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
}

//orderTable에 담긴 List보기
public ArrayList<Bean> orderList(String m_id) {
	ArrayList<Bean> list = new ArrayList<>();
	getCon();
	try {
		String sql = "SELECT p.p_img, p.p_name, c.cp_count, c.cp_price"+
				" FROM shop_cart c, shop_product p,"+
				 "shop_member m WHERE p.p_id=c.p_id and"+
				 " m.m_id=c.m_id and"+
				 " c.cart_num=1 and c.m_id=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, m_id);
		rs = pstmt.executeQuery();
		while(rs.next()) {
			Bean bean = new Bean();
			bean.setP_img(rs.getString(1));
			bean.setP_name(rs.getString(2));
			bean.setCp_count(rs.getInt(3));
			bean.setCp_price(rs.getInt(4));
			list.add(bean);
		}	con.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
	return list;
}






}
