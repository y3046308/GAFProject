<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Sign-in: Personal Information</title>
</head>
<body>
	<%
		String msg = request.getParameter("msg");
		if (msg != null){
			%>
			<FONT color="red"><%=msg%></FONT><BR>
			<%
		}
	%>
	Please enter your personal information
	<FORM action= 6.CheckDuplicate.jsp METHOD=POST>
	ID: <INPUT TYPE=TEXT NAME=ID><BR>
	PW: <INPUT TYPE=PASSWORD NAME=PW><BR>
	<INPUT TYPE=SUBMIT VALUE="SUBMIT">
	</Form>
	<a href="1.Log-In.jsp">Return to Log-In Page</a><BR>
</body>
</html>