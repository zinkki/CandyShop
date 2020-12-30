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

String [] p_id = request.getParameterValues("p_id");
String p_name = request.getParameter("p_name");

String textp_id="";
for(int i=0;i<p_id.length;i++) {
	textp_id += p_id[i]+" ";
}

System.out.println(textp_id);
System.out.println(p_name);

%>
</body>
</html>