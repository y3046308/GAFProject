<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<H3>Log In Page</H3><BR>
	<%
		session.invalidate();
		session = request.getSession(true);
		session.setAttribute("loggedIn", "f");
		
		String msg = request.getParameter("msg");
		if (msg != null){
			%>
			<FONT color="red"><%=msg%></FONT>
			<%
		}
	%>
	<FORM action= 2.check.jsp METHOD=POST>
	ID: <INPUT TYPE=TEXT NAME=IDt><BR>
	PW: <INPUT TYPE=PASSWORD NAME=PWt><BR>
	<INPUT TYPE=SUBMIT VALUE="SUBMIT">
	</Form><BR>
	<a href="3.Agree.jsp">Create an account@@@</a><BR>
</body>
</html>