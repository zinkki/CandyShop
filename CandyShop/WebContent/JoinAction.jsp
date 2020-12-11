<%@ page import="java.io.PrintWriter" %>
<%@ page import="shop.Bean" %>
<%@ page import="shop.MemberDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="bean" class="shop.Bean">
	<jsp:setProperty name="bean" property="*"/>
</jsp:useBean>

<%
	String m_id = null;
	if(session.getAttribute("m_id") != null) {
		m_id = (String)session.getAttribute("m_id");
	}
	if(m_id != null) {
		PrintWriter script= response.getWriter();
		script.println("<script>");
		script.println("alert('You Already login')");
		script.println("location.href='Main.jsp'");
		script.println("</script>");
	}
	MemberDAO mdao = new MemberDAO();
	
	//입력안된사항이 있을때
	if(bean.getM_id()==null | bean.getM_pass()==null | bean.getM_pass2()==null | bean.getM_name()==null | 
			bean.getM_email()==null | bean.getM_address()==null | bean.getM_post()==null |
			bean.getM_tel()==null | bean.getM_birth()==null ) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('There is an empty spot!')");
		script.println("history.go(-1)");
		script.println("</script>");
	//비밀번호,비밀번호확인 다를때	
	}else if(!bean.getM_pass().equals(bean.getM_pass2())){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('Password is not corrected!')");
		script.println("history.go(-1)");
		script.println("</script>");
	//회원가입 성공
	}else {
		PrintWriter script = response.getWriter();
		mdao.m_join(bean);
		script.println("<script>");
		script.println("alert('JOIN Success!'");
		script.println("location.href='Main.jsp");
		script.println("</script>");
		
		session.setAttribute("m_id", bean.getM_id());
		session.setAttribute("m_pass", bean.getM_pass());
		session.setMaxInactiveInterval(60*3);
		response.sendRedirect("Main.jsp");
	}
%>
</body>
</html>