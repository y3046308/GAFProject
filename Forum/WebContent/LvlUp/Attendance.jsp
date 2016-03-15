<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="DBAcc.Member, DBAcc.MyBatisDao,	DBAcc.Record, java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% String id = (String)session.getAttribute("curr_id");
   MyBatisDao dao = new MyBatisDao();
   Member member = dao.idCheck(id);
   session.setAttribute("sign", 1);
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
	ID: <%= id %>	Level: <%= member.getLvl() %>	Point: <%= member.getPoint() %><BR><BR><BR>
	<form action="Attendance.jsp" method="post">
	출석체크: <br/>
		<textarea rows="2" cols="50" name="des"  onFocus="this.value=''">오늘의 한마디... (50자 내로 적어주십쇼)</textarea>
		<input type="submit" value="submit" />
	</form>
	<BR>
	<% if (id.equals("admin")){%>
	<form action="deleteComment.jsp" method=post><%
	}%>
	<table style="background-color:#ffffcc;">
		<thead><TR>
			<% if (id.equals("admin")){ %>
			<Th style="text-align:center;"><input type="checkbox" onClick="checkAll(this)"/></Th><%
			}%>
			<Th width="50" style="text-align:center;"><b>Number</b></Th>
			<Th width="200" style="text-align:center;"><b>Date</b></Th>
			<Th width="100"style="text-align:center;"><b>ID</b></Th>
			<Th width="500" style="text-align:center;"><b>Comment</b></Th>
		</TR></thead>
		<%
			String des = request.getParameter("des"), tmpIndex = request.getParameter("pageIndex");
			int num, pageIndex = 0;
			if (tmpIndex != null){
				pageIndex = Integer.parseInt(tmpIndex);
			}
			List<Record> rlst = dao.listByIdate(), rlstTmp = dao.checkAttendance(id);
			int size = (int)(Math.ceil(rlst.size() / 7.0));
			if (des != null){
				if (rlstTmp.isEmpty()){				
					long jTime = (new java.util.Date()).getTime();
					// java.sql.Date sqlDate = new java.sql.Date(jTime); //YYYY-MM-DD
					// java.sql.Time sqlTime = new java.sql.Time(jTime); //HH-MM-SS
					 java.sql.Timestamp sqlTimeStamp = new java.sql.Timestamp(jTime);
					// YYYY-MM-DD HH-MM-SS
	
					if (rlst.isEmpty()){ // if icomment is empty
						num = 1;
					}
					else{
						num = rlst.get(0).getNum() + 1 ;
					}
					
					dao.insertIdate(new Record(num, sqlTimeStamp, id, des));
					
					if (!id.equals("admin")){
						dao.incrementPoint(id);
					}
					rlst = dao.listByIdate();
				}
				else{
					%>
					<script>
						alert("Attendance check may be done only once a day");
						window.location.href = 'Attendance.jsp';
					</script>
					<%
				}
			}
			for (int k = pageIndex * 7 ; k < pageIndex * 7 + 7 && k < rlst.size(); k++){
		    	Record i = rlst.get(k);%>
				<TR>
					<% if (id.equals("admin")){ %>
					<TD style="text-align:center;">
						<input type="checkbox" name="account" value=<%=i.getNum()%>>
					</TD><%
					}%>	
					<TD style="text-align:center;"><%= i.getNum() %></TD>
					<TD style="text-align:center;"><%= i.getIdate() %></TD>
					<TD style="text-align:center;"><%= i.getId() %></TD>
					<TD style="text-align:center;"><%= i.getIcomment() %></TD></TR><%
			}
			if (des != null && rlstTmp.isEmpty()){
				response.sendRedirect("Attendance.jsp");
			}
		%>
	</table><div style="position:absolute; left:400px"><%
	for (int i = 0 ; i < size ; i++){%>
				<a href="Attendance.jsp?pageIndex=<%=i%>"><%=i+1%></a><%} %></div><BR>
	<% if (id.equals("admin")){ %>
		<input type="submit" value="Delete">
		<input type="reset" value="Reset">
		</form><%
	}%>
	
	<BR><a href="../forum.jsp"><font color="blue">Back to Forum</font></a>
</body>
</html>