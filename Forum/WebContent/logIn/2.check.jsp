<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="DBAcc.Member, DBAcc.MyBatisDao"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> ... </title>
</head>
<body>
<%
	String id = request.getParameter("IDt");
	String pw = request.getParameter("PWt");
	MyBatisDao dao = new MyBatisDao();
	Member tmp = dao.idCheck(id);
	String msg = "";
	if (tmp != null){ // there is id
		if (id.equals("admin")){
			tmp = dao.adminFullCheck(id);
		}
		else{
			tmp = dao.fullCheck(new Member(id, pw));
		}
		if (tmp != null){
			msg = "Log In Successful";
			session.setAttribute("curr_id", id);
			response.sendRedirect("timer.jsp?msg="+ msg);
		}
		else{
			msg = "Invalid password: Please Try Again";
			response.sendRedirect("1.Log-In.jsp?msg=" + msg);
		}
		
	}
	else{
		msg = "Log-In Failed: Please Try Again";
		response.sendRedirect("1.Log-In.jsp?msg=" + msg);
	}
	%>
</body>
</html>