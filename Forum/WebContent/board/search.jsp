<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="DBAcc.Member, DBAcc.MyBatisDao, DBAcc.Forum, java.util.*"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String type = request.getParameter("type"),
		   text = request.getParameter("text"), searching ="f";
	List<Forum> lst = new ArrayList<Forum>();
	MyBatisDao dao = new MyBatisDao();
	Map<String, String> ele = new HashMap<String, String>();
	if (text == ""){
		ele.put("value", "num");
		ele.put("order", "desc");
		lst = dao.listByNum(ele);
	}
	else{
		if (type.equals("ID")){
			lst = dao.searchForumWId(text);
		}
		else if(type.equals("Title") || type.equals("Content")){
			ele.put("text", "%" + text + "%");
			ele.put("value",(type.equals("Title") ? "title" : "content"));
			lst = dao.searchForum(ele);
		}
		else{ // type == "tc"
			ele.put("text", "%" + text + "%");
			ele.put("value1","title");
			ele.put("value2","content");
			lst = dao.searchForum2(ele);				
			// select * from forum where title like '%#{text}%' or
			//                           content like '%#{text}%' 
		}
		searching = "t";
	}
	session.setAttribute("sign", 1);
	session.setAttribute("searchList", lst);
	session.setAttribute("searching", searching);
	session.setAttribute("searchOption", type);
	session.setAttribute("searchText", text);
	response.sendRedirect("../forum.jsp");
%>
</body>
</html>