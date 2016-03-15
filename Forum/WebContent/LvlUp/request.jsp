<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="DBAcc.Member, DBAcc.MyBatisDao"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
	<%
		String id = request.getParameter("id"), st;
		MyBatisDao dao = new MyBatisDao();
		Member tmp = dao.idCheck(id);
		
		if (tmp != null){
			int point = tmp.getPoint(), lvl = tmp.getLvl();
			if (point >= lvl && lvl != 4){
				dao.incrementLvl(new Member(id, "", point - lvl, lvl + 1));
				st = "LEVEL UP SUCCESSFUL";
			}
			else if (point < lvl){
				st = "You are not qualified for level up yet";
			}
			else{ // point == 4 lvl
				st = "You have reached the maximum level";
			}
			session.setAttribute("sign", 1);
		}
		else{
			throw new Exception("NO ID");
		}
	%>
	<META HTTP-EQUIV="REFRESH" CONTENT="0; URL=../forum.jsp?msg=<%=st%>">
</body>
</html>