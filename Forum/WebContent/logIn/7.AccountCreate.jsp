<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="DBAcc.Member, DBAcc.MyBatisDao"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login Page</title>
</head>
<body>
	<%
		String id = (String)session.getAttribute("curr_id"), 
		       pw = (String)session.getAttribute("pw"),
		       msg = "Account Creation SUCCESFUL";;
		MyBatisDao dao = new MyBatisDao();
		dao.createAccount(new Member(id, pw));
		response.sendRedirect("timer.jsp?msg=" + msg);
	%>		
</body>
</html>