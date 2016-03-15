<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="DBAcc.Member,
				DBAcc.Record,
				DBAcc.Forum,  
				DBAcc.MyBatisDao,
				java.io.*,
				java.util.*,
				org.apache.ibatis.io.Resources, 
				org.apache.ibatis.session.* "%>			
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	MyBatisDao dao = new MyBatisDao();
	//out.println("uri=" + request.getRequestURI() + "<BR>");
	//out.println("url=" + request.getRequestURL() + "<BR>");
	//StringBuffer url = request.getRequestURI ();  
	String url = request.getRequestURI();
  if (request.getQueryString() != null) {  
  url.concat ('?' + request.getQueryString ());  
  //url.append (request.getQueryString ());  
  }
  out.println (url);  
%> 
<a href="test2.jsp">test2</a>

<BR><BR>
</body>
</html>