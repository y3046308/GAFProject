<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="DBAcc.MyBatisDao, DBAcc.Record, DBAcc.Forum"%>       
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String content = request.getParameter("content"),
				  id = (String)session.getAttribute("curr_id");	  
		int num = ((Forum)session.getAttribute("forum")).getNum();
		long jTime = (new java.util.Date()).getTime();
		java.sql.Timestamp sqlTimeStamp = new java.sql.Timestamp(jTime);
		
		MyBatisDao dao = new MyBatisDao();
		Record tmp = new Record(num, sqlTimeStamp, id, content);
		dao.insertForumComment(tmp);
		response.sendRedirect("content.jsp");
	%>
	
</body>
</html>