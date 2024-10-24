<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="Header.jsp" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8" />
  <title>PRESTO</title>
  <style>
    body {
      background-color: #f1f1f1;
    }
    
    .container {
      max-width: 400px;
      margin: 0 auto;
      padding: 40px;
      background-color: #fff;
      border-radius: 5px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
    h2 {
      text-align: center;
      margin-top: 30px;
      margin-bottom: 50px;
      color: #000;
    }
    label {
      display: block;
      margin-bottom: 10px;
      color: #000;
    }
    input[type="text"],
    input[type="password"] {
      width: 100%;
      padding: 10px;
      border-radius: 3px;
      border: 1px solid #ccc;
      margin-bottom: 20px;
    }
    button {
      width: 100%;
      padding: 10px;
      background-color: #000;
      color: #fff;
      border: none;
      border-radius: 3px;
      cursor: pointer;
    }
    button:hover {
      background-color: #333;
    }
  </style>
   
</head>

<body>
<br /><br />
  <div class="container">
    <h2>PRESTO Login</h2>
    <form action="Login_Ck.jsp" method="post"> <!-- 로그인 처리를 담당하는 서블릿 또는 JSP 페이지로 연결 -->
      <label for="username">ID</label>
      <input type="text" id="id" name="id" placeholder="ID" required>
      
      <label for="password">Password</label>
      <input type="password" id="pwd" name="pwd" placeholder="Password" required>
      
      <button type="submit">login</button>	<br /><br />
      <button type="button" onClick="location.href='Signup.html'">Create your Account</button>
    </form>
  </div>
  
  
</body>
</html>
