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

//CartTable에서 cart_num=1인것보기(cart.jsp에서 선택한제품을 Order시 OrderList)
public ArrayList<Bean> orderList(String m_id) {
	ArrayList<Bean> list = new ArrayList<>();
	getCon();
	try {
		String sql = "SELECT p.p_id, p.p_img, p.p_name, c.cp_count, c.cp_price"+
				" FROM shop_cart c, shop_product p,"+
				 "shop_member m WHERE p.p_id=c.p_id and"+
				 " m.m_id=c.m_id and"+
				 " c.cart_num=1 and c.m_id=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, m_id);
		rs = pstmt.executeQuery();
		while(rs.next()) {
			Bean bean = new Bean();
			bean.setP_id(rs.getInt(1));
			bean.setP_img(rs.getString(2));
			bean.setP_name(rs.getString(3));
			bean.setCp_count(rs.getInt(4));
			bean.setCp_price(rs.getInt(5));
			list.add(bean);
		}	con.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
	return list;
}

public void OrderCancel(Bean bean) {
	getCon();
	try {
		String sql = "UPDATE shop_cart SET cart_num=0 WHERE m_id=? and p_id=? ";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, bean.getM_id());
		pstmt.setInt(2, bean.getP_id());
		pstmt.executeUpdate();
		con.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
}

public void addBuy(Bean bean) {
	getCon();
	try {
		String sql = "UPDATE shop_cart SET cart_num=-1 WHERE m_id=? and p_id=? ";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, bean.getM_id());
		pstmt.setInt(2, bean.getP_id());
		pstmt.executeUpdate();
		con.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
}
public ArrayList<Bean> buyList(String m_id) {
	ArrayList<Bean> list = new ArrayList<>();
	getCon();
	try {
		String sql = "SELECT p.p_id, p.p_img, p.p_name, c.cp_count, c.cp_price, p.p_price"+
				" FROM shop_cart c, shop_product p,"+
				 "shop_member m WHERE p.p_id=c.p_id and"+
				 " m.m_id=c.m_id and"+
				 " c.cart_num=-1 and c.m_id=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, m_id);
		rs = pstmt.executeQuery();
		while(rs.next()) {
			Bean bean = new Bean();
			bean.setP_id(rs.getInt(1));
			bean.setP_img(rs.getString(2));
			bean.setP_name(rs.getString(3));
			bean.setCp_count(rs.getInt(4));
			bean.setCp_price(rs.getInt(5));
			bean.setP_price(rs.getInt(6));
			list.add(bean);
		}	con.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
	return list;
}

public void buyNow(Bean bean) {
	getCon();
	try {
		String sql = "INSERT INTO shop_order VALUES(o_seq.NEXTVAL,?,?,SYSDATE,?)";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, bean.getM_id());
		pstmt.setInt(2, bean.getP_id());
		pstmt.setInt(3, bean.getO_payment());
		pstmt.executeUpdate();
		con.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
}
public Bean buyNowOrder(String m_id) {
	getCon();
	Bean bean = new Bean();
	try {
		String sql = "SELECT DISTINCT p.p_img, p.p_name, c.cp_count, o.o_payment, p.p_id, "
				+ "FROM shop_product p , shop_member m, shop_cart c,"
				+ " shop_order o WHERE p.p_id=o.p_id and m.m_id=o.m_id and "
				+ "c.cp_price=o.o_payment and o.m_id=? ";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, m_id);
		rs = pstmt.executeQuery();
		while(rs.next()) {
			bean.setP_img(rs.getString(1));
			bean.setP_name(rs.getString(2));
			bean.setCp_count(rs.getInt(3));
			bean.setO_payment(rs.getInt(4));
			bean.setP_id(rs.getInt(5));
		}	con.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
	return bean;
}
}
