<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="DBAcc.Member, DBAcc.MyBatisDao, DBAcc.Forum, java.util.*"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String msg = request.getParameter("msg"), id = (String)session.getAttribute("curr_id"),
		   ele = (String)session.getAttribute("element"), searching = (String)session.getAttribute("searching"),
		   searchText = null, searchOption = null, pageTmp = request.getParameter("pageIndex"),
		   pmsg = request.getParameter("pmsg");
	String[] arr = {"ID", "Title", "Content", "Title+Content"};
	
	int point = 0, lvl = 0, index=0, num, sign = (Integer)session.getAttribute("sign"), pageIndex = 0;
	if (pageTmp != null){
		pageIndex= Integer.parseInt(pageTmp);
	}
	if (ele == null){
		ele = "num";
	}

	StringBuffer url = request.getRequestURL();
	if (request.getQueryString() != null) {  
		url.append ('?' + request.getQueryString ());
	}
	session.setAttribute("prevAddr",url);
	MyBatisDao dao = new MyBatisDao();
	Member tmp = dao.idCheck(id);
	
	List<Forum> lst ;
	if (searching == null || searching.equals("f")){
		Map<String, String> eles = new HashMap<String, String>();
		eles.put("value", ele);
		eles.put("order", ((sign == 1) ? "desc" : "asc"));
		lst = dao.listByNum(eles);
	}
	else{
		searchText = (String)session.getAttribute("searchText");
	    searchOption = (String)session.getAttribute("searchOption");
		lst = (List<Forum>)session.getAttribute("searchList");
	}
	int size = (int)(Math.ceil(lst.size() / 5.0));
	point = tmp.getPoint();
	lvl = tmp.getLvl();
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Forum</title>
</head>
<script language="JavaScript">
	function checkAll(source) {
		  checkboxes = document.getElementsByName('account');
		  for(var i=0, n=checkboxes.length;i<n;i++) {
		    checkboxes[i].checked = source.checked;
		  }
	}
</script>
<body>
	<H3>FORUM</H3>
	Hello~ <%= id %> <BR>
	You are in Level <b><%= lvl %></b> 
	<% if (!id.equals("admin")){ %>
		and have <b><%= point %> point(s). </b><br><BR><%
	}%><BR>
	<a href="password/changePassword1.jsp">Change Password</a>
	<% if (pmsg != null){ %>
		<FONT color="red">&nbsp;&nbsp;&nbsp;<%=pmsg%><%} %><BR>
	<a href="logIn/1.Log-In.jsp">Log Out</a><BR>
	<a href="LvlUp/Attendance.jsp">Attendance Check</a><BR>
	<% if (!id.equals("admin")){ %>
		<a href="LvlUp/request.jsp?id=<%=id%>">Request for Level Up</a>
		<% if (msg != null){%>
			<FONT color="red">&nbsp;&nbsp;&nbsp;<%=msg%><%
		}%></FONT><BR><BR><BR><%
	}
	else{
		out.println("<BR>");
	}
	%>
	<% if (id.equals("admin")){%>
		<a href="admin/admin.jsp">Administrator Pages</a><BR><BR>
		<form style="display:inline" action = "board/deleteMultiplePost.jsp" METHOD=POST><%
	}%>
		<table style="background-color:#ffffcc;">
			<thead><tr>
				<% if (id.equals("admin")){ %>
				<th style="text-align:center;"><input type="checkbox" onClick="checkAll(this)"/></th><%
				}%>
				<th width="30" style="text-align:center;">
					<a href="board/orderChange.jsp?element=num">#</a></th>
				<th width="150" style="text-align:center;">
					<a href="board/orderChange.jsp?element=title">Title</a></th>
				<th width="10" style="text-align:center;"></th>
				<th width="40" style="text-align:center;">
					<a href="board/orderChange.jsp?element=id">ID</a></th>
				<th width="120" style="text-align:center;">
					<a href="board/orderChange.jsp?element=idate">Date</a></th>
				<th width="30" style="text-align:center;">
					<a href="board/orderChange.jsp?element=views">Views</a></th>
			</tr></thead>
			<% if (lst.isEmpty()){ 
				num = 1; %>
			<tr><td align="center" colspan="5"> No posts</td></tr>
			<%} else{
				num = lst.get(0).getNum() + 1; 
			    for (int k = pageIndex * 5 ; k < pageIndex * 5 + 5 && k < lst.size(); k++){
			    	Forum i = lst.get(k);%><TR><%
				if (id.equals("admin")){%>
				<TD style="text-align:center;">
					<input type="checkbox" name="account" value=<%=i.getNum()%>>
				</TD><% } %>
				<TD style="text-align:center;"><%=i.getNum() %></TD>
				<TD style="text-align:center;"><a href="board/progressView.jsp?num=<%=i.getNum()%>"><%=i.getTitle()%></a></TD>
				<TD style="text-align:center;">
					<%
						Member tmpMember = dao.idCheck(i.getId());
						int tmpLvl = tmpMember.getLvl();%>
					<img src="pic/<%=tmpLvl%>.jpg" alt="rank" width="16" height="16"></TD>
				<TD style="text-align:center;"><%=i.getId() %></TD>
				<TD style="text-align:center;"><%=i.getIdate() %></TD>
				<TD style="text-align:center;"><%=i.getViews() %></TD></TR>	<%}} %>
		</table><div style="position:absolute; left:220px">
		<%
			for (int i = 0 ; i < size ; i++){%>
				<a href="forum.jsp?pageIndex=<%=i%>"><%=i+1%></a><%} %></div><BR>
		<% if (id.equals("admin")){%>
			<input type="submit" value="Delete"></form><%
		}
		 session.setAttribute("num", num); %>
		<form style="display:inline" action = "board/writeForm.html" METHOD=POST>
		<input type="submit" value="write"></form>
		
		<form action = "board/search.jsp" METHOD=POST>
		<select name="type">
			<% for (String i : arr){
				if (searchText != null && i.equals(searchOption)){%>
					<option value=<%=i%> selected><%=i%></option>
				<%}
				else{%>
						<option value=<%=i%>><%=i%></option>
				<%}}%>
		</select>
		<input type="text" name="text" value=<%
			out.println((searchText == null) ? "" : searchText);%>>
		<input type="submit" value="Search"></form>
</body>
</html>