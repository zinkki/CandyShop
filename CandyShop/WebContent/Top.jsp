<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.login {
position:absolute;
top : 50px;
right : 30px;
}
.logo {
margin-top: 60px;
text-align : center;
}
ul {
padding:15px;
margin:30px;
background-color: #CEE3F6;
text-align: center;
}
li {
display: inline-flex;
text-align: center;
width: 140px;
}
#header .menu {
margin: 0 auto;
color : black;
display: inline-block;
width: 150px;
text-decoration: none;
font-weight: bold;
background-color: #CEE3F6;
font-size: 18px;
}
</style>
</head>
<body>
<%
String m_id = (String)session.getAttribute("m_id");
if(m_id==null){
	m_id="GUEST";
}else if(m_id.equals("admin")){
	m_id="admin";
}else {
	m_id =(String)session.getAttribute("m_id");
}
%>
<div class="logo">
	<img alt="" src="img/logo2.png" height="80" width="400">
</div>
<div class="login">
	<h3>Welcome <%=m_id %> !!</h3>
	<button id="login" type="button" onclick="location.href='LoginForm.jsp'">LOGIN</button>
	<button id="join" type="button" onclick="location.href='JoinForm.jsp'">JOIN</button>
	<button id="logout" type="button" onclick="location.href='LogoutAction.jsp'">LOGOUT</button>
</div>
<div>
<ul id="header">
		<li><a class="menu" href="#">Candy</a></li>
		<li><a class="menu" href="#">Chocolate</a></li>
		<li><a class="menu" href="#">Jelly</a></li>
		<li><a class="menu" href="#">Caramel</a></li>
		<li><a class="menu" href="#">Marshmallow</a></li>
		<li><a class="menu" href="#">Gum</a></li>
</ul>
</div>
</body>
</html>