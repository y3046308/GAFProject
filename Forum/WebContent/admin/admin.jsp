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
		session.setAttribute("sign", 1);
		String id = (String)session.getAttribute("curr_id"), msg = request.getParameter("msg");
		if (!id.equals("admin")){
			out.println("You do not have a clearance to this page.<BR>");
			out.println("Redirecting you to the forum in seconds.");%>
			<META HTTP-EQUIV="REFRESH" CONTENT="3; URL=../forum.jsp">
			<%
		}
		else{%>
			<a href="../forum.jsp"><font color="blue">Back to Forum</font></a><BR><BR>
			<%
				if (msg != null){
					%>
					<FONT color="Brown"><%=msg%></FONT><BR>
					<%
				}
			%>
			<a href="displayAllMember.jsp"><font color="blue">Show all the members</font></a><BR>
			<a href="level1.jsp"><font color="blue">Adjust Clearance</font></a><BR>
			<a href="banMem1.jsp"><font color="blue">Ban members</font></a><BR>
		<%
		}
	%>
</body>
</html>