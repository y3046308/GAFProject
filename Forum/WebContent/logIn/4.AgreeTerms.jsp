<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String agree = request.getParameter("AGREE");
	if (agree.equals("YES")){
		response.sendRedirect("5.Sign-in.jsp");
	}
	else{
		response.sendRedirect("3.Agree.jsp?msg=You must agree on our terms of contract");
	}
%>
</body>
</html>