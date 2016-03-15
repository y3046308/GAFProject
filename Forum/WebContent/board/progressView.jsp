<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="DBAcc.MyBatisDao"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	MyBatisDao dao = new MyBatisDao();
	int num = Integer.parseInt(request.getParameter("num"));
	String curr_id = (String)session.getAttribute("curr_id"),
			aut_id = dao.findPost(num).getId();
	int curr_id_level = dao.idCheck(curr_id).getLvl(), 
	        aut_level = dao.idCheck(aut_id).getLvl();
	if (curr_id_level >= aut_level || aut_level == 5){
		if (!curr_id.equals(aut_id)){
			dao.incrementViews(num);
		}
		session.setAttribute("forum", dao.findPost(num));
		response.sendRedirect("content.jsp");
	}
	else{
		session.setAttribute("sign", 1);
		%>
		<script type="text/javascript">
			alert("You must reach level <%=aut_level%> to access this content.")
		</script>
		<META HTTP-EQUIV="REFRESH" CONTENT="0; URL=javascript:history.go(-1)">   
		<%
	}
%>
</body>
</html>