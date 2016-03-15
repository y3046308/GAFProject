<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="DBAcc.Member, DBAcc.MyBatisDao, java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	MyBatisDao dao = new MyBatisDao();
	List<Member> curr = dao.listByLvl();
	%>
	<form action="level2.jsp">
		<table style="background-color:#ffffcc;">
		
		<thead><TR>
			<Th style="text-align:center;"><b>ID</b></Th>
			<Th style="text-align:center;"><b>Password</b></Th>
			<Th style="text-align:center;"><b>Point</b></Th>
			<Th style="text-align:center;"><b>Lvl</b></Th>
		</TR></thead>		
	<%
	for (Member i : curr){
		%>
		<TR>
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
				<TD style="text-align:center;">
					<%
						int tmp = i.getLvl();
						if (!i.getId().equals("admin")){%>
							<select name=acc><%
							for (int j = 1 ; j < 5 ; j++){
								String temp = i.getId() + j;
								if (j != tmp){
									%>
									<option label=<%=j%> value=<%=temp%> />
									<%
								}
								else{
									%>
									<option label=<%=j%> value=<%=temp%> selected />
									<%
								}
							}%>
							</select><%
						}
						else{%>
							<%= tmp %><%	
						}
					%></TD>
		</TR>
		<%
	}
	%>
		</table>
		<input type="submit" value="Submit">
		<input type="reset" value="Reset" />			
	</form><BR>
	<a href="admin.jsp"><font color="blue">Back to Admin</font></a><BR>		
</body>
</html>