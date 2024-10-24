<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="Header.jsp"%>

<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	String name = request.getParameter("name");
	String phone = request.getParameter("phone");
	String addr = request.getParameter("addr");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Member Information</title>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
  <script type="text/javascript">
    $(function(){
    	$("#alert-tr").hide();
        $("#alert-success").hide();
        $("#alert-danger").hide();
        $("input").keyup(function(){
            var pwd1=$("#pwd1").val();
            var pwd2=$("#pwd2").val();
            if(pwd1 != "" || pwd2 != ""){
                if(pwd1 == pwd2){
                	$("#alert-tr").show();
                    $("#alert-success").show();
                    $("#alert-danger").hide();
                    $("#submit").removeAttr("disabled");
                }else{
                	$("#alert-tr").show();
                    $("#alert-success").hide();
                    $("#alert-danger").show();
                    $("#submit").attr("disabled", true);
                }    
            }else if(pwd1 == "" || pwd2 == ""){
            	$("#alert-tr").hide();
            }
        });
    });
</script>
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
  
  .alert{
   	  width: 100%;
      padding: 8px;
      margin-bottom: 20px;
      border-radius: 3px;
      font-weight: bold;
    }
    
    .alert-success{
    	background-color: lightgreen;
    }
    
    .alert-danger{
    	background-color: pink;
    }
</style>
</head>
<body>
  <div class="menu-container">
    <div class="menu-item">
      <a href="회원정보페이지주소">회원정보</a>
    </div>
    <div class="menu-item">
      <a href="구매내역페이지주소">구매내역</a>
    </div>
  </div>

  <form id="memberForm" action="CostomerApply.jsp" method="post">
    <table align="center" width="600">
      <tr>
        <td colspan="2"><h2>회원정보</h2></td>
      </tr>
      <tr>
        <td>ID</td>
        <td><input type="text" name="id" id="id" value="<%=id %>" readonly="readonly"></td>
      </tr>
      <tr>
        <td>PASSWORD</td>
        <td><input type="text" name="pwd" id="pwd1" value="" required></td>
      </tr>
      <tr>
        <td>PASSWORD <br>확인</td>
        <td><input type="text" name="pwd2" id="pwd2" value="" ></td>
      </tr>
      <tr id="alert-tr">
      	  <td colspan="2" align="center">
      	  	<div class="alert alert-success" id="alert-success">비밀번호가 일치합니다.</div>
      	  	<div class="alert alert-danger" id="alert-danger">비밀번호가 일치하지 않습니다.</div>
      	  </td>
		  
      <tr>
        <td>이름</td>
        <td><input type="text" name="name" id="name" value="<%=name %>" required></td>
      </tr>
      <tr>
        <td>PHONE</td>
        <td><input type="text" name="phone" id="phone" value="<%=phone %>" required></td>
      </tr>
      <tr>
        <td>주소</td>
        <td><input type="text" name="addr" id="addr" value="<%=addr %>" required></td>
      </tr>
      <tr>
        <td colspan="2" align="center"><input type="submit" id="submit" value="수정"></td>
      </tr>
    </table>
  </form>
</body>
</html>
