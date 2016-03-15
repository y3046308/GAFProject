<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> Terms of agreement</title>
</head>
<body>
	<%
		String msg = request.getParameter("msg");
		if (msg != null){
			%>
			<FONT color="red"><%=msg%></FONT>
			<%
		}
	%>
	<H3> Agreement </H3>
	-----------------------------------------<BR>
	1. ....<BR>
	2. ....<BR>
	-----------------------------------------<BR>
	<FORM ACTION= 4.AgreeTerms.jsp METHOD=POST>
		Do you agree?
		<INPUT TYPE=RADIO NAME=AGREE VALUE=YES>I agree
		<INPUT TYPE=RADIO NAME=AGREE VALUE=NO>I disagree<BR>
		<INPUT TYPE=SUBMIT VALUE="SUBMIT">
	</FORM>
	<a href="1.Log-In.jsp">Return to Log-In Page</a><BR>
</body>
</html>