<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	session.setAttribute("sign", 1);
	session.setAttribute("loggedIn", "t");
	Calendar cal = Calendar.getInstance();
	int initTime = cal.get(Calendar.HOUR_OF_DAY) * 3600 + // hours in second
		   	   cal.get(Calendar.MINUTE) * 60 + 		  // minutes in second
		   	   cal.get(Calendar.SECOND);
	
	if (session.getAttribute("initTime") == null){
		session.setAttribute("initTime", initTime);
	}
	out.println(request.getParameter("msg") + "<BR>");
%>
	Redirecting to Forum in seconds
	<META HTTP-EQUIV="REFRESH" CONTENT="2; URL=../forum.jsp?element=num">
</body>
</html>