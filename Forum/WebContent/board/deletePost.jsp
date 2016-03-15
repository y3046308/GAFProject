<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="DBAcc.MyBatisDao, DBAcc.Forum, java.util.*"%>      
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		int num = Integer.parseInt(request.getParameter("num"));
		String id = request.getParameter("id");
		String curr_id = (String)session.getAttribute("curr_id");
		MyBatisDao dao = new MyBatisDao();
		dao.deletePost(num);
		
		Map<String, String> ele = new HashMap<String, String>();
		ele.put("value", "num");
		ele.put("order", "desc");
		List<Forum> lst = dao.listByNum(ele);
		Map<String, Integer> tmp = new HashMap<String, Integer>();
		for (int i = lst.size() - num ; i >=0 ; i--){
			tmp.put("num", lst.get(i).getNum());
			tmp.put("value", lst.get(i).getNum() - 1);
			dao.changePostIndex(tmp);
		}
		session.setAttribute("sign", 1);
		response.sendRedirect("../forum.jsp");
	%>
</body>
</html>