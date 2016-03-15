<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="DBAcc.MyBatisDao, DBAcc.Record, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
	<%  
		String[] arr = request.getParameterValues("account");
		int v[] = new int[arr.length];
		for (int i = 0 ; i < arr.length ; i++){
			v[i] = Integer.parseInt(arr[i]);
		}
		
		MyBatisDao dao = new MyBatisDao();
		for (int str : v){
			dao.deleteComment(str);
		}
		List<Record> lst = dao.listByIdate();
		int size = lst.size(), min = v[v.length - 1];
		if (size > 0){
			for (int i = size ; i >= min ; i--){
				Record tmp = lst.get(size - i);
				tmp.setNum(i);
				dao.changeIndex(tmp);
			}
		}
		response.sendRedirect("Attendance.jsp");
	%>
</body>
</html>