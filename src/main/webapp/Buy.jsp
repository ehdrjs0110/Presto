<%@page import="java.sql.PreparedStatement"%>
<%@page import="common.JDBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	int price = Integer.parseInt(request.getParameter("price"));
	String color = request.getParameter("color");
	String option = request.getParameter("option");
	
	String user = (String)session.getAttribute("id");
	
	if(option.equals("full")){
		price += 200000000;
	}else if(option.equals("half")){
		price += 100000000;
	}
	
	try{
		JDBConnect jdbc = new JDBConnect();
		
		String sql = "INSERT INTO sell(sell_id, sell_car_id, sell_member_id, sell_price, sell_color, sell_option, sell_date) VALUES (emp_seq.NEXTVAL,?,?,?,?,?,SYSDATE)";
		PreparedStatement psmt = jdbc.con.prepareStatement(sql);
		psmt.setString(1, id);
		psmt.setString(2, user);
		psmt.setInt(3, price);
		psmt.setString(4, color);
		psmt.setString(5, option);
		
		int inResult = psmt.executeUpdate();
		
		jdbc.close();
		
		if(inResult==1){	
%>
			<script type="text/javascript">
				alert("구매가 성공적으로 완료되었습니다.");
				location.href="Main.jsp";
			</script>	
<%	
		}else{
%>
			<script type="text/javascript">
				alert("구매에 실패하였습니다.");
				location.href="Main.jsp";
			</script>	
<%				
		}
		
	}catch(Exception e){
		out.print(e);
	}

	
	
%>
    