<%@ page import="shop.Bean" %>
<%@ page import="shop.OrderDAO" %>
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
width: 130px;
height: 110px;
}
</style>
</head>
<body>
<!-- Top -->
<jsp:include page="Top.jsp"/>
<!-- TopNav -->
<jsp:include page="TopNav.jsp"/>
<h2 align="center"><b>Order Success!</b></h2>


<!-- Bottom -->
<jsp:include page="Bottom.jsp"/>

</body>
</html>