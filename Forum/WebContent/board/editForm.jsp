<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="DBAcc.Forum"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	Forum curr = (Forum)session.getAttribute("forum");
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action ="editComplete.jsp">
		<table border="1">
				<colgroup>
					<col width="100" />
					<col width="500" />
				</colgroup>
				<tbody>
					<tr>
						<th align="center">Title</th>
						<td><input type="text" name="title" value="<%=curr.getTitle()%>"></td>
					</tr>
					<tr>
						<th align="center">Author</th>
						<td><%= curr.getId() %></td>
					</tr>
					<tr>
						<th align="center">Views</th>
						<td><%=curr.getViews()%></td>
					</tr>					
					<tr>
						<td colspan="2">
							<textarea name="content" rows="" cols="100" >
						    <% String con = curr.getContent();
					   		out.println((con != null) ? con : "");%></textarea>
						</td>
					</tr>
				</tbody>
			</table>
		<p>
			<input type="button" value="Cancel" onClick="history.go(-1);return true;">
			<input type="submit" value="Submit">
		</p>
	</form>
</body>
</html>