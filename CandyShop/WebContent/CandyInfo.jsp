<%@ page import="shop.Bean" %>
<%@ page import="shop.AdminDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="mbean" class="shop.Bean">
	<jsp:setProperty name="mbean" property="*"/>
</jsp:useBean>
<!-- Top -->
<jsp:include page="Top.jsp"/>
<!-- TopNav -->
<jsp:include page="TopNav.jsp"/>
<%
AdminDAO adao = new AdminDAO();
Bean bean = adao.candyInfo(mbean.getP_id());
%>
<h2 align="center">Candy Info</h2>
<table align="center" border="1">
<tr height="40">
<td width="120" align="center">Product ID</td>
<td width="380" align="center"><%=bean.getP_id() %>
</table>
<!-- Bottom -->
<jsp:include page="Bottom.jsp"/>
</body>
</html>