<%@ page import="shop.OrderDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.product {
width:200px;
height:200px;
}
</style>
</head>
<body>
<jsp:useBean id="bean" class="shop.Bean">
	<jsp:setProperty name="bean" property="*"/>
</jsp:useBean>
<!-- Top -->
<jsp:include page="Top.jsp"/>
<!-- TopNav -->
<jsp:include page="TopNav.jsp"/>
<%
OrderDAO odao = new OrderDAO();
String m_id = (String)session.getAttribute("m_id");
int p_id = Integer.parseInt(request.getParameter("p_id"));
int cp_count = Integer.parseInt(request.getParameter("cp_count"));
int p_price = Integer.parseInt(request.getParameter("p_price"));
int o_payment = p_price*cp_count;
String p_img = request.getParameter("p_img");
String p_name = request.getParameter("p_name");

if(m_id==null) {
	PrintWriter p = response.getWriter();
	p.println("<script>");
	p.println("alert('You need login')");
	p.println("history.go(-1)");
	p.println("</script>");
}else {
	bean.setM_id(m_id);
	bean.setCp_count(cp_count);
	bean.setP_price(p_price);
	bean.setP_id(p_id);
	bean.setO_payment(o_payment);
	bean.setP_img(p_img);
	bean.setP_name(p_name);
	odao.buyNow(bean);
	odao.buyNowOrder(m_id);
	response.sendRedirect("Order.jsp");
}
%>
<!-- Bottom -->
<jsp:include page="Bottom.jsp"/>
</body>
</html>