<%@ page import="shop.Bean" %>
<%@ page import="shop.AdminDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.product {
width: 300px;
height: 300px;
}
</style>
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
<table align="center">
<tr height="300">
<td width="380" align="center"><img class="product" src="img/<%=bean.getP_img() %>"></td>
<td width="200" align="center">
<h4 align="left">Name: <%=bean.getP_name() %></h4>
<h4 align="left">Price: <%=bean.getP_price() %></h4>
<h4 align="left">Stock: <%=bean.getP_stock() %></h4>
<h4 align="left">num: &nbsp;&nbsp;
	<select name="cp_count">
	<option value="1">1</option>
	<option value="2">2</option>
	<option value="3">3</option>
	<option value="4">4</option>
	<option value="5">5</option>
	</select>
</h4>
</td>
</tr>
<tr height="300">
<td colspan="2"><img src="img/<%=bean.getP_img2() %>"></td>
</tr>
<tr height="300">
<td colspan="2"><img src="img/<%=bean.getP_img3() %>"></td>
</tr>
<tr height="300">
<td colspan="2"><img src="img/<%=bean.getP_img3() %>"></td>
</tr>
<tr height="300">
<td colspan="2"><img src="img/<%=bean.getP_img4() %>"></td>
</tr>
</table>
<!-- Bottom -->
<jsp:include page="Bottom.jsp"/>
</body>
</html>