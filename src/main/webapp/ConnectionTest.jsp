<%@page import="common.DBConnPool"%>
<%@ page import="common.JDBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>TEST1</h1>
	<%
		DBConnPool pool = new DBConnPool();
		pool.close();
	%>
	
	
</body>
</html>