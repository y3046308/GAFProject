<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="DBAcc.Member, DBAcc.MyBatisDao,	java.util.List"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	MyBatisDao dao = new MyBatisDao();
	List<Member> lst = dao.listByLvl();
	%>
	<form action="banMem2.jsp" method=post>
	<table style="background-color:#ffffcc;">
	
	<Thead><TR>
		<Th style="text-align:center;"></Th>
		<Th style="text-align:center;"><b>ID</b></Th>
		<Th style="text-align:center;"><b>Password</b></Th>
		<Th style="text-align:center;"><b>Point</b></Th>
		<Th style="text-align:center;"><b>Lvl</b></Th>
	</TR></Thead>
	<%
	for (Member i : lst){
		%>
		<TR>
			<TD style="text-align:center;">
			<%
				if (!i.getId().equals("admin")){
				%>
					<input type="checkbox" name="account" value=<%=i.getId()%>>
				<%
				}
				else{
					%>
					<input type="checkbox" disabled name="account" value=<%=i.getId()%>>
					<%
				}
			%>
			</TD>
			<TD style="text-align:center;"><%=i.getId()%></TD>
			<TD style="text-align:center;"><%
				if (i.getId().equals("admin")){
					out.println("");
				}
				else{
					out.println(i.getpassword());
				}
				%></TD>
			<TD style="text-align:center;"><%
				int num = i.getPoint();
				if (i.getId().equals("admin")){
					out.println("");
				}
				else{
					out.println(num);
				}
				%></TD>
			<TD style="text-align:center;"><%=i.getLvl()%></TD>
		</TR>
		<%
	}
	%>
		</table>
		<input type="submit" value="Submit">
	</form><BR>
	<a href="admin.jsp"><font color="blue">Back to Admin</font></a><BR>
</body>
</html>