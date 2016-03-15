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
	String[] arr = request.getParameterValues("acc");
	MyBatisDao dao = new MyBatisDao();
	for (String str : arr){
		int len = str.length();
		String id = str.substring(0, len - 1);
		int lvl = Integer.parseInt(str.substring(len-1));
		Member tmp = dao.idCheck(id);
		dao.adjustLvl(new Member(id, tmp.getpassword(), tmp.getPoint(), lvl));
	}
	response.sendRedirect("admin.jsp?msg=LvL Update SUCCESFUL");	
%>
</body>
</html>