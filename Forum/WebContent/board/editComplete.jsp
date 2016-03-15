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
	String title = request.getParameter("title"), content = request.getParameter("content");
	Forum curr = (Forum)session.getAttribute("forum");
	int num = curr.getNum();
	MyBatisDao dao = new MyBatisDao();
	Forum newForum = new Forum(num, title, content, curr.getId(), curr.getIdate(), curr.getViews()); 
	dao.updatePost(newForum);
	session.setAttribute("forum", newForum);
	session.setAttribute("sign", 1);
	//response.sendRedirect("content.jsp");
%>
<script>
	window.location.href = 'content.jsp';
</script>
</body>
</html>