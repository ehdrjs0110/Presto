
<%@page import="java.sql.PreparedStatement"%>
<%@page import="common.JDBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	String name = request.getParameter("name");
	String phone = request.getParameter("phone");
	String addr = request.getParameter("addr");
	
	
	try{
		JDBConnect jdbc = new JDBConnect();
		
		String sql = "UPDATE member SET member_pwd=?,member_name=?,member_phone=?,member_addr=? WHERE member_id = '" + id + "'";
		PreparedStatement psmt = jdbc.con.prepareStatement(sql);
		psmt.setString(1, pwd);
		psmt.setString(2, name);
		psmt.setString(3, phone);
		psmt.setString(4, addr);
		
		int inResult = psmt.executeUpdate();
		
		jdbc.close();
		
		if(inResult==1){	
%>
			<script type="text/javascript">
				alert("회원정보 수정이 완료되었습니다.");
				location.href="Costomer.jsp";
			</script>	
<%	
		}else{
%>
			<script type="text/javascript">
				alert("회원정보 수정에 실패하였습니다.");
				location.href="Costomer.jsp";
			</script>	
<%				
		}
		
	}catch(Exception e){
		out.print(e);
	}
%>