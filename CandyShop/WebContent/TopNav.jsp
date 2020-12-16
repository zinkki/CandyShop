<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
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
<div>
<ul id="header">
		<li><a class="menu" href="CandyList.jsp">Candy</a></li>
		<li><a class="menu" href="ChocoList.jsp">Chocolate</a></li>
		<li><a class="menu" href="JellyList.jsp">Jelly</a></li>
		<li><a class="menu" href="JellyBeanList.jsp">JellyBean</a></li>
		<li><a class="menu" href="MarshList.jsp">Marshmallow</a></li>
		<li><a class="menu" href="GumList.jsp">Gum</a></li>
</ul>
</div>
</body>
</html>