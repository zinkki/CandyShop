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

String [] pid = request.getParameterValues("p_id");
int [] p_id = new int[pid.length];
for(int i=0;i<pid.length;i++) {
	System.out.println(pid[i]);
	odoa.addOrder(obean);
	//여기다 order테이블에추가하는거 메소드만들면되겠다!!(p_id,m_id로가져오게해서)
	//그리고 cart테이블cart_num=1로 업데이트해주기!!
}
%>
</body>
</html>