<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="DBAcc.Forum, DBAcc.Member, DBAcc.Record, DBAcc.MyBatisDao, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<%
	Forum curr = (Forum)session.getAttribute("forum");
	String id = (String)session.getAttribute("curr_id");
	String forum_id = curr.getId(); 
	int forum_num = curr.getNum();

	MyBatisDao dao = new MyBatisDao();
	int forum_lvl = (dao.idCheck(forum_id)).getLvl();
	int lvl = (dao.idCheck(id)).getLvl();
	session.setAttribute("sign", 1);
	List<Record> lst = dao.listByIdateComment(forum_num);
%>
<script>
	function delete_confirm(curr_num, curr_id){
		var r=confirm("Delete the post?");
		if (r==true)
	    {
			window.location.href = 'deletePost.jsp?num=' + curr_num + '&id=' + curr_id;
		}
	}
</script>
<body>
	<table border="1">
			<colgroup>
				<col width="100" />
				<col width="500" />
			</colgroup>
			<tbody>
				<tr>
					<th align="center">Title</th>
					<td><%=curr.getTitle() %></td>
				</tr>
				<tr>
					<th align="center">Author</th>
					<td>
					<img src="../pic/<%=forum_lvl%>.jpg" alt="rank" width="14" height="14">
					<%= forum_id %></td>
				</tr>
				<tr>
					<th align="center">Views</th>
					<td><%=curr.getViews()%></td>
				</tr>
				<tr>
					<th align="center">Date</th>
					<td><%=curr.getIdate()%></td>
				</tr>				
				<tr>
					<td colspan="2">
					<% String con = curr.getContent();
					   out.println((con != null) ? con : "");
					%></td>
				</tr>
			</tbody>
		</table>
		<table border="1" style="position:absolute; left:25px">
			<thead><TR>
				<Th width="100" style="text-align:center;"><b>ID</b></Th>
				<Th width="200" style="text-align:center;"><b>Date</b></Th>
				<Th width="250" style="text-align:center;"><b>Comment</b></Th>
			</TR></thead>
			<tbody>
				<% 
				if (lst != null){
					for (Record i: lst){
						String tmp_id = i.getId();
						int tmp_lvl = dao.idCheck(tmp_id).getLvl();%>
							<tr><td style="text-align:center;"><img src="../pic/<%=tmp_lvl%>.jpg" alt="rank" width="14" height="14"><%=tmp_id%></td>
							<td style="text-align:center;"><%= i.getIdate() %></td>
							<td style="text-align:center;"><%= i.getIcomment() %></td></tr><%}} %>
				<tr><td><img src="../pic/<%=lvl%>.jpg" alt="rank" width="14" height="14"><%=id%></td>
				<td colspan="2">
					<form action="insertComment.jsp">
					<textarea name="content" rows="" cols="55" ></textarea>
					<input type="submit" value="Submit"></form>
				</td></tr>
				<tr>
				<td><input align="bottom" type="button" value="Go Back" onClick="window.location.href='<%=session.getAttribute("prevAddr")%>'"></td>
				<% if (id.equals(forum_id) || id.equals("admin")){ %>
				<td><input align="bottom" type="button" value="Edit" onClick="window.location.href='editForm.jsp'"></td>
				<td><input type="button" value="Delete" onClick="delete_confirm('<%=forum_num%>','<%=forum_id%>')"></td><%} %>
				</tr>
			</tbody>
		</table>
</body>
</html>