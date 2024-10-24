<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="common.JDBConnect" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%	
	String id = request.getParameter("id");	
	String pwd = request.getParameter("pwd");
	
	JDBConnect jdbc = new JDBConnect();

	String sql = "SELECT member_id, member_pwd FROM member WHERE member_id='"+id+"'";
	Statement stmt = jdbc.con.createStatement();
	
	ResultSet rs = stmt.executeQuery(sql);
	rs.next();
	if(rs!=null){
		String id_db = rs.getString(1);
		String pwd_db = rs.getString(2);
		
		if(id.equals(id_db)){
			if(pwd.equals(pwd_db)){
				session.setAttribute("id", id);
%>
				<script type="text/javascript">
					alert("로그인 성공했습니다.");
					location.href="Main.jsp";
				</script>	
<%						
			}else{
%>
				<script type="text/javascript">
					alert("아이디/비밀번호가 틀렸습니다.");
					location.href="Login.jsp";
				</script>	
<%
			}
		}
	}
	
	
%>    