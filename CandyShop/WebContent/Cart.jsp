<%@ page import="shop.CartDAO" %>
<%@ page import="shop.Bean" %>
<%@ page import="java.io.PrintWriter" %>
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
String p_img = request.getParameter("p_img");
String p_name = request.getParameter("p_name");

if(m_id==null){
	PrintWriter p = response.getWriter();
	p.println("<script>");
	p.println("alert('You need Login!')");
	p.println("history.go(-1)");
	p.println("</script>");
}else {
	cbean.setM_id(m_id);
	cbean.setCp_count(cp_count);
	cbean.setP_price(p_price);
	cbean.setP_id(p_id);
	cbean.setCp_price(cp_price);
	cbean.setP_img(p_img);
	cbean.setP_name(p_name);
	//db삽입
	cdao.addCart(cbean);
	//list목록
	ArrayList<Bean> list = cdao.cartList(request.getParameter("m_id"));

%>
<h2 align="center">Cart</h2>
<form action="OrderAction.jsp" method="post">
<table align="center" border="1">
<tr height="40">
<td width="200" align="center">product img</td>
<td align="center" width="100">Product Name</td>
<td align="center" width="100">amount</td>
<td align="center" width="100">Price</td>
</tr>
<%
for(int i=0; i<list.size();i++){
	Bean bean = list.get(i);
%>

<tr height="100">
<td width="200"><img class="product" src="img/<%=bean.getP_img() %>"></td>
<td align="center"><%=bean.getP_name() %></td>
<td align="center"><%=bean.getCp_count() %></td>
<td align="center">\<%=bean.getCp_price() %></td>
</tr>
<% 
	}
}
%>
<tr height="40">
<td colspan="4" align="center"><input type="submit" value="Order"></td>
</tr>
</table>
</form>
<!-- Bottom -->
<jsp:include page="Bottom.jsp"/>
</body>
</html>