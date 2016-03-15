<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>Password Change</h3>
	<%
		session.setAttribute("sign", 1);
		String msg = request.getParameter("msg");
		if (msg != null){
			%>
			<FONT color="red"><%=msg%></FONT>
			<%
		}
	%>
	<FORM action= changePassword2.jsp METHOD=POST>
		Original Password: <INPUT TYPE=password NAME=oldPW><BR>
		New Password: <INPUT TYPE=PASSWORD NAME=newPW1><BR>
		Retype Password: <INPUT TYPE=PASSWORD NAME=newPW2><BR>
		<INPUT TYPE=SUBMIT VALUE="SUBMIT">
	</Form>
	<a href="../forum.jsp"><font color="blue">Back to Forum</font></a><BR><BR><BR>
</body>
</html>