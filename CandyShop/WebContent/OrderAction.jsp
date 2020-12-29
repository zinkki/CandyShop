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
OrderDAO odoa= new OrderDAO();
String m_id = (String)session.getAttribute("m_id");
String p_img = request.getParameter("p_img");
String p_name= request.getParameter("p_name");
int cp_count = Integer.parseInt(request.getParameter("cp_count"));
int cp_price = Integer.parseInt(request.getParameter("cp_price"));
int p_id = Integer.parseInt(request.getParameter("p_id"));

System.out.println(p_id);
%>
</body>
</html>