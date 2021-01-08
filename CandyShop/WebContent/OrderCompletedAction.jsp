<%@ page import="shop.OrderDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="obean" class="shop.Bean">
	<jsp:setProperty name="obean" property="*"/>
</jsp:useBean>
<%
OrderDAO odao = new OrderDAO();
String m_id=(String)session.getAttribute("m_id");
String [] pid = request.getParameterValues("p_id");
if(m_id==null) {
	PrintWriter p = response.getWriter();
	p.println("<script>");
	p.println("alert('You need Login!')");
	p.println("hitory.go(-1)");
	p.println("</script>");
}else {
	obean.setM_id(m_id);
	odao.insertOrder(obean);
	odao.pay_deleteCart(m_id);
	response.sendRedirect("OrderCompleted.jsp");
}
%>
</body>
</html>