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
		String[] arr = request.getParameterValues("account");
		int v[] = new int[arr.length];
		for (int i = 0 ; i < arr.length ; i++){
			v[i] = Integer.parseInt(arr[i]);
		}
		
		MyBatisDao dao = new MyBatisDao();
		for (int str : v){
			dao.deletePost(str);
		}
		Map<String, String> ele = new HashMap<String, String>();
		ele.put("value", "num");
		ele.put("order", "desc");
		List<Forum> lst = dao.listByNum(ele);
		int size = lst.size(), min = v[v.length - 1];
		
		if (size > 0 || min <= size){
			for (int i = min ; i <= size ; i++){
				Map<String, Integer> tmp = new HashMap<String, Integer>();
				tmp.put("num", lst.get(size - i).getNum());
				tmp.put("value",i);
				dao.changePostIndex(tmp);
			}
		}
		session.setAttribute("sign", 1);
		response.sendRedirect("../forum.jsp");
	%>
</body>
</html>