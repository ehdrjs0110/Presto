<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="common.JDBConnect" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="Header.jsp" %>

<%
	String model = "";
	int price = 0;
	String color = "";
	String img = "";
	String id = request.getParameter("car_id");

	JDBConnect jdbc = new JDBConnect();
	
	String sql = "SELECT car_model, car_price, car_color, car_img FROM car WHERE car_id='"+ id +"'";
	Statement stmt = jdbc.con.createStatement();
	
	ResultSet rs = stmt.executeQuery(sql);
	
	rs.next();
	if(rs!=null){
		 model = rs.getString(1);
		 price = rs.getInt(2);
		 color = rs.getString(3);
		 img = rs.getString(4);
	}
	
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>페라리 스트라달레</title>
<style type="text/css">
	.content {
		position: relative;
		min-width: 980px;
		margin: 3% 10%;
	}
	
	.inblock {
		display: flex; /* Flexbox 레이아웃을 사용하여 이미지와 정보를 나란히 배치 */
		align-items: center; /* 수직 중앙 정렬 */
	}
	
	.img {
		flex: 1; /* 이미지 영역이 남은 공간을 모두 차지하도록 설정 */
		max-width: 550px; /* 이미지가 너무 커지지 않도록 최대 너비 제한 */
	}
	
	.info {
		flex: 1; /* 정보 영역이 남은 공간을 모두 차지하도록 설정 */
		padding-left: 250px; /* 이미지와의 간격을 조절하기 위해 왼쪽 여백 추가 */
		margin-bottom: 50px; /* 옵션과 버튼 사이의 여백 조정 */
	}
	
	.list {
		list-style-type: none;
		font-size: 27px; /* 폰트 크기를 20px로 조정 */
		padding: 0; /* 기본 패딩 제거 */
		margin-bottom: 100px;
	}

	.list > li {
		margin-bottom: 10px; /* 각 리스트 항목 사이에 여백 추가 */
	}

	.list > li:not(:last-child)::after {
		content: "";
		position: absolute;
		bottom: -10px;
		left: 0;
		width: 100%;
		height: 1px;
		background-color: #000;
	}
	
	.buyBtn {
		background-color: black;
		color: silver;
		border: none;
		padding: 10px 20px;
		border-radius: 4px;
		font-size: 20px;
		cursor: pointer;
		padding: 10px 20px; /* 버튼의 패딩을 늘려 크기를 조정 */
		margin-top: -80px; /* 버튼과 옵션 사이의 간격 조정 */
		align-self: flex-start; /* 구매 버튼을 왼쪽 상단으로 정렬 */
	}	
	
	.info_plus {
		margin-top: 30px; /* 위쪽 여백 추가 */
		border-top: 1px solid #000; /* 윗부분에 선 추가 */
		padding-top: 20px; /* 윗부분 패딩 추가 */
	}

	/* 반응형 디자인을 위한 미디어 쿼리 */
	@media screen and (max-width: 768px) {
		.content {
			margin: 3% 5%; /* 모바일 화면에서 좀 더 좁은 여백 적용 */
		}
		
		.inblock {
			flex-direction: column; /* 모바일 화면에서 세로 방향으로 배치 */
		}
		
		.img {
			max-width: 100%; /* 이미지를 모바일 화면에 맞게 조절 */
			margin-bottom: 20px; /* 이미지 아래에 여백 추가 */
		}
		
		.info {
			padding-left: 0; /* 모바일 화면에서 왼쪽 여백 제거 */
		}
		
		.list {
			font-size: 18px; /* 모바일 화면에서 폰트 크기 조절 */
		}
	}
</style>
</head>
<body>
	<br /><br />
	<div class="content">
		<div class="inblock">
			<div class="img">	
				<img class="img" src="./img/<%=img %>" alt="CAR img">
			</div>
			<form action="Buy.jsp" method="post">
			<div class="info">
				<ul class="list">
					<li><strong><%=model %></strong></li>
					<li><%=price %> KRW</li>
					<li>Color: <%=color %></li>
					<li>
						<select name="option">
							<option value="default">OPTION</option>
							<option value="default">DEFAULT</option>
							<option value="half">HALF</option>
							<option value="full">FULL</option>
						</select>
						</li>
				</ul>
				<input type="hidden" name="id" value="<%=id %>">
				<input type="hidden" name="price" value="<%=price %>">
				<input type="hidden" name="color" value="<%=color %>">
								
				<input type="submit" class="buyBtn" value="BUY">
			</div>
			</form>
		</div>
	</div>
	<div class="info_plus">
		
	</div>
</body>
</html>
