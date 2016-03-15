<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="DBAcc.Member, DBAcc.MyBatisDao"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Check duplicate</title>
</head>
<body>
	<%
		String id = request.getParameter("ID");
		String pw = request.getParameter("PW");
		MyBatisDao dao = new MyBatisDao();
		if (dao.idCheck(id) != null){ // there is id
			response.sendRedirect("5.Sign-in.jsp?msg=Please enter different ID");
		}
		session.setAttribute("curr_id", id);
		session.setAttribute("pw", pw);
		response.sendRedirect("7.AccountCreate.jsp");
	%>
</body>
</html>