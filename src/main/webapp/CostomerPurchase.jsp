<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="common.JDBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	JDBConnect jdbc = new JDBConnect();
	
	String user = (String)session.getAttribute("id");
	
	String sell_id = null;
	String car_id = null;
	String user_id = user;
	int price = 0;
	String color = null;
	String option = null;
	String date = null;
	
	
	
	String sql = "SELECT * FROM sell WHERE sell_member_id='"+ user +"'";
	Statement stmt = jdbc.con.createStatement();
	
	ResultSet rs = stmt.executeQuery(sql);
	

%>

<!DOCTYPE html>
<html>
<header><%@include file="Header.jsp" %>
<meta charset="UTF-8">
<title>구매내역</title>
<style>
  body {
    font-family: Arial, sans-serif;
    background-color: #fff;
    margin: 0;
    padding: 0;
  }
  
  table {
    margin: 50px auto;
    border-collapse: collapse;
    width: 600px;
    background-color: #fff;
    border-radius: 5px;
  }
  
  table th,
  table td {
    padding: 15px;
    border-bottom: 1px solid #ccc;
  }
  
  table th:first-child,
  table td:first-child {
    font-weight: bold;
    width: 120px;
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

  <table align="center" width="600">
    <tr>
      <th>NO</th>
      <th>Car</th>
      <th>ID</th>
      <th>Price</th>
      <th>Color</th>
      <th>Option</th>
      <th>Date</th>
    </tr>
<%
	if(rs!=null){
		while(rs.next()){
			sell_id = rs.getString("sell_id");
			 car_id = rs.getString("sell_car_id");
			 price = rs.getInt("sell_price");
			 color = rs.getString("sell_color");
			 option = rs.getString("sell_option");
			 date = rs.getString("sell_date");
			 
%>

      <tr>
        <td><%= sell_id %></td>
        <td><%= car_id %></td>
        <td><%= user_id %></td>        
        <td><%= price %></td>
        <td><%= color %></td>
        <td><%= option %></td>
        <td><%= date %></td>
      </tr>
<%
		}
		 
	}
%>
  </table>
</body>
</html>
