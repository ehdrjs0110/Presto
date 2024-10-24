<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="common.JDBConnect" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
</head>

<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd1");
	String name = request.getParameter("name");
	String phone = request.getParameter("phone");
	String addr = request.getParameter("addr");

	try{
		JDBConnect jdbc = new JDBConnect();
		
		String sql = "INSERT INTO member VALUES (?,?,?,?,?,1)";
		PreparedStatement psmt = jdbc.con.prepareStatement(sql);
		psmt.setString(1, id);
		psmt.setString(2, pwd);
		psmt.setString(3, name);
		psmt.setString(4, phone);
		psmt.setString(5, addr);
		
		int inResult = psmt.executeUpdate();
		
		jdbc.close();
		
		if(inResult==1){	
%>
			<script type="text/javascript">
				alert("회원가입이 성공적으로 완료되었습니다.");
				location.href="Login.jsp";
			</script>	
<%	
		}else{
%>
			<script type="text/javascript">
				alert("회원가입에 실패하였습니다.");
				location.href="Login.jsp";
			</script>	
<%				
		}
		
	}catch(Exception e){
		out.print(e);
	}
	
	
%>


