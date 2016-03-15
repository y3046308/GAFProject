<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="DBAcc.Member, DBAcc.MyBatisDao"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		MyBatisDao dao = new MyBatisDao();
		String oPw = request.getParameter("oldPW"),
		       nPw1 = request.getParameter("newPW1"),
		       nPw2 = request.getParameter("newPW2"),
		       id = (String) session.getAttribute("curr_id"), msg;
		
		if (!nPw1.equals(nPw2)){
			msg = "Password entries must match...";
			response.sendRedirect("changePassword1.jsp?msg=" + msg);
		}
		else{
			if (dao.fullCheck(new Member(id, oPw)) != null){ // if there is the account with such id & pw
				dao.changePassword(new Member(id, nPw1));
				msg = "Password changed successfully<BR>";
				session.setAttribute("sign", 1);
				response.sendRedirect("../forum.jsp?pmsg=" + msg);
			}
			else{ // if your password don't exist, go back
				msg = "incorrect password; please try again...";
				response.sendRedirect("changePassword1.jsp?msg=" + msg);
			}
		}
	%>
</body>
</html>