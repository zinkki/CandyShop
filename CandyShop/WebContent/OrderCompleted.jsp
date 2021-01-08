<%@ page import="shop.Bean" %>
<%@ page import="shop.OrderDAO" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.product {
width: 100px;
height: 100px;
}
</style>
</head>
<body>

<%
OrderDAO odao = new OrderDAO();
Bean bean = new Bean();
Date date = new Date();
SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy-MM-dd");
String strdate = simpleDate.format(date);
String m_id = (String)session.getAttribute("m_id");
ArrayList<Bean> list = odao.payment(m_id);
%>

<h2 align="center"><b>Order List</b></h2>
<form action="Main.jsp" method="post">
<table align="center" border="1">
<tr height="40">
<td width="100" align="center">Date</td>
<td width="200" align="center">Product Information</td>
<td width="200" align="center">Delivery Status</td>
<td width="100" align="center">Cancel</td>
</tr>
<tr height="100">
<%
int num=0;
for(int i=0;i<list.size();i++){
	num= i+1;
}
%>
<td rowspan="<%=num%>" align="center"><%=strdate %></td>
<%
for(int i=0;i<list.size();i++){
	bean = list.get(i);
%>
<td width="200" align="center"><img align="left" class="product" src="img/<%=bean.getP_img() %>">
<br><%=bean.getP_name() %>(*<%=bean.getCp_count() %>)
<h3 align="right">\<%=bean.getCp_price() %></h3>
</td>
<td width="200" align="center">Preparing for Delivery.</td>
<td width="100" align="center"><input type="button" value="CANCEL" onclick=""></td>
</tr>
<%
} 
%>
<tr height="50">
<td colspan="4" align="center"><input type="submit" value="Continue_Shopping">
</table>
</form>
</body>
</html>