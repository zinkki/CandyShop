<%@ page import="java.util.ArrayList" %>
<%@ page import="shop.AdminDAO" %>
<%@ page import="shop.Bean" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.parent {
display:flex;
}
.child {
width:250px;
height:300px;
}
.img img {
width: 250px;
height: 250px;
}
</style>
</head>
<body>
<!-- Top -->
<jsp:include page="Top.jsp"/>
<!-- TopNav -->
<jsp:include page="TopNav.jsp"/>
<%
AdminDAO adao = new AdminDAO();
ArrayList<Bean> list = adao.jellyList();
%>
<h2 align="center">Jelly List</h2>
<div class="parent">
<%
for(int i=0;i<list.size();i++) {
	Bean bean = list.get(i);
%>
<div class="child">
<div class="img">
<a href="JellyInfo.jsp?p_id=<%=bean.getP_id() %>">
<img src="img/<%=bean.getP_img() %>">
</a>
</div>
<div align="center"><%=bean.getP_name()%></div>
<div align="center"><%=bean.getP_price() %>&nbsp;\</div>
</div>
<%
}
%>
</div>
<!-- Bottom -->
<jsp:include page="Bottom.jsp"/>
</body>
</html>