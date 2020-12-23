<%@ page import="shop.CartDAO" %>
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
<jsp:useBean id="cbean" class="shop.Bean">
	<jsp:setProperty name="cbean" property="*"/>
</jsp:useBean>
<!-- Top -->
<jsp:include page="Top.jsp"/>
<!-- TopNav -->
<jsp:include page="TopNav.jsp"/>
<%
CartDAO cdao = new CartDAO();
String m_id = (String)session.getAttribute("m_id");
int cp_count = Integer.parseInt(request.getParameter("cp_count"));
int p_price = Integer.parseInt(request.getParameter("p_price"));
int p_id = Integer.parseInt(request.getParameter("p_id"));
int cp_price = p_price*cp_count;

if(m_id!=null){
	cbean.setM_id(m_id);
	cbean.setCp_count(cp_count);
	cbean.setP_price(p_price);
	cbean.setP_id(p_id);
	cbean.setCp_price(cp_price);
	cdao.addCart(cbean);
}else {
	PrintWriter p = response.getWriter();
	p.println("<script>");
	p.println("alert('You need Login!')");
	p.println("history.go(-1)");
	p.println("</script>");
}

%>
<h2 align="center">Cart</h2>
<table align="center">

</table>
<!-- Bottom -->
<jsp:include page="Bottom.jsp"/>
</body>
</html>