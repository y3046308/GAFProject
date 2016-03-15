<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="DBAcc.MyBatisDao, DBAcc.Forum"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String title = request.getParameter("title"), content = request.getParameter("content"),
				  id = (String)session.getAttribute("curr_id");	  
		int num = (Integer)(session.getAttribute("num"));
		long jTime = (new java.util.Date()).getTime();
		java.sql.Date sqlDate = new java.sql.Date(jTime); //YYYY-MM-DD
		Forum forum = new Forum(num, title, content, id, sqlDate, 0);
		//out.println("FORUM:" + forum );
		MyBatisDao dao = new MyBatisDao();
		dao.insertForum(forum);
		session.setAttribute("sign", 1);
		response.sendRedirect("../forum.jsp");
	%>
</body>
</html>