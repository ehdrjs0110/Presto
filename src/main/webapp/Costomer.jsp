<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="common.JDBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="Header.jsp"%> 


<%
	JDBConnect jdbc = new JDBConnect();
	
	String id = null;
	String pwd = null;
	String name = null;
	String phone = null;
	String addr = null;
	
	String user = (String)session.getAttribute("id");

	String sql = "SELECT * FROM member WHERE member_id='"+ user +"'";
	Statement stmt = jdbc.con.createStatement();
	
	ResultSet rs = stmt.executeQuery(sql);
	
	rs.next();
	if(rs!=null){
		 id = rs.getString(1);
		 pwd = rs.getString(2);
		 name = rs.getString(3);
		 phone = rs.getString(4);
		 addr = rs.getString(5);
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Member Information</title>
<style>
  body {
    font-family: Arial, sans-serif;
    background-color: #fff;
    margin: 0;
    padding: 0;
  }
  
  table {
    margin: -100px auto;
    border-collapse: collapse;
    width: 600px;
    background-color: #fff;
    border-radius: 5px;
  }
  
  table td {
    padding: 15px;
    border-bottom: 1px solid #ccc;
  }
  
  table td:first-child {
    font-weight: bold;
    width: 120px;
  }
  
  input[type="text"],
  input[type="password"] {
    width: 320px;
    padding: 7px;
    border: 1px solid #ccc;
    border-radius: 3px;
  }
  
  input[type="submit"] {
    padding: 10px;
    background-color: #000;
    color: #fff;
    border: none;
    border-radius: 3px;
    cursor: pointer;
  }
  
  h2 {
    text-align: center;
    margin-bottom: 30px;
    color: #000;
    font-size: 24px;
  }

.menu-container {
  width: 100px;
  margin-top: 50px;
  margin-left: 20px;
}

.menu-item {
  margin-bottom: 20px;
}

.menu-item a {
  display: block;
  padding: 10px;
  text-decoration: none;
  color: #000;
  font-size: 18px;
}

.menu-item a:hover {
  background-color: #f1f1f1;
  color: #666;
}

</style>
</head>
<body>
	<div class="menu-container">
		<div class="menu-item">
			<a href="Costomer.jsp">회원정보</a>
		</div>
		<div class="menu-item">
			<a href="CostomerPurchase.jsp">구매내역</a>
		</div>
	</div>
	<form action="CostomerCorrection.jsp" method="post">
	<table align="center" width="600">
		<tr>
			<td colspan="2"><h2>회원 정보</h2></td>
		</tr>
		<tr>
			<td>ID</td>
			<td><label><%=id %></label></td>
			<input type="hidden" name="id" value="<%=id %>">
		</tr>
		<tr>
			<td>PASSWORD</td>
			<td><label><%=pwd %></label></td>
			<input type="hidden" name="pwd" value="<%=pwd %>">
		</tr>
		<tr>
			<td>이름</td>
			<td><label><%=name %></label></td>
			<input type="hidden" name="name" value="<%=name %>">
		</tr>
		<tr>
			<td>PHONE</td>
			<td><label><%=phone %></label></td>
			<input type="hidden" name="phone" value="<%=phone %>">
		</tr>
		<tr>
			<td>주소</td>
			<td><label><%=addr %></label></td>
			<input type="hidden" name="addr" value="<%=addr %>">
		</tr>
		
		<tr>
			<td colspan="2" align="center"><input type="submit" value="수정"></td>
		</tr>
	</table>
	</form>
</body>
</html>
