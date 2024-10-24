<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="common.JDBConnect"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="Header.jsp" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>PRESTO - 자동차 사이트</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
  /* 추가적인 스타일링 및 수정은 이곳에서 진행하세요 */

  /* body, content, carousel, pagination, car-container 등의 스타일 유지 */

  /* 새로 추가한 스타일 */
  .categories {
    font-size: 20px;
    text-align: center;
    color: #000000; /* 카테고리의 색상을 블랙으로 지정 */
  }

  /* 링크 스타일 재정의 */
  .categories a {
    color: #000000; /* 링크 색상을 블랙으로 지정 */
  }

  /* 기존 스타일 유지 */
  .car-item {
    width: calc(33.33% - 20px);
    margin: 10px;
    padding: 10px;
    text-align: center;
    float: left;
  }

  .car-item img {
    width: 100%;
    height: 370px; /* 세로 크기를 약간 늘려줍니다 */
    object-fit: cover;
  }

  .car-item .car-model {
    font-size: 17px;
    font-weight: bold; /* 폰트를 굵게 설정 */
  }

  .car-item .car-price {
    font-size: 17px;
    font-weight: bold; /* 폰트를 굵게 설정 */
  }
</style>

</head>
<body>
	<br /><br /><br />
  <div class="categories" style="font-size: 25px; text-align: center;">
    <a href="Main.jsp?type=sports">Sports</a> |
    <a href="Main.jsp?type=suv">SUV</a> |
    <a href="Main.jsp?type=motorcycle">Motorcycle</a>
  </div>

  <div id="carCarousel" class="carousel slide" data-ride="carousel">
    <div class="carousel-inner">
      <% 
        String type = request.getParameter("type");

        if(type==null){
          type = "sports";
        }

        try {
          JDBConnect jdbc = new JDBConnect();

          String sql = "SELECT car_id, car_model, car_price, car_img FROM car WHERE car_type='"+type+"'";
          Statement stmt = jdbc.con.createStatement();

          ResultSet rs = stmt.executeQuery(sql);
          int count = 0;
          int slideCount = 0;
          int totalSlides = 0;
          boolean active = true;

          if (type != null) {
            while(rs.next()) {
              String img = rs.getString("car_img");
              String model = rs.getString("car_model");
              int price = rs.getInt("car_price");
              String id = rs.getString("car_id");

              if (count == 0) {
                if (slideCount == 0) {
      %>
                  <div class="carousel-item <%= active ? "active" : "" %>">
      <%
                } else {
      %>
                  <div class="carousel-item">
      <%
                }
      %>
      <%
                slideCount++;
                active = false;
              }
      %>
                  <div class="car-item">
                    <a href="Product.jsp?car_id=<%=id %>">
                      <img src="./img/<%=img %>" alt="<%=model %>">
                    </a>
                    <p class="car-model"><%=model %></p>
                    <p class="car-price"><%=price %></p>
                  </div>
      <%
              count++;

              if (count == 3) {
                out.print("</div>");
                count = 0;
                slideCount++;
                totalSlides++;
              }
            }

            if (count != 0) {
              out.print("</div>");
              totalSlides++;
            }

            if (totalSlides > 1) {
              out.print("<a class=\"carousel-control-prev\" href=\"#carCarousel\" role=\"button\" data-slide=\"prev\">");
              out.print("<span class=\"carousel-control-prev-icon\" aria-hidden=\"true\"></span>");
              out.print("<span class=\"sr-only\">Previous</span>");
              out.print("</a>");
              out.print("<a class=\"carousel-control-next\" href=\"#carCarousel\" role=\"button\" data-slide=\"next\">");
              out.print("<span class=\"carousel-control-next-icon\" aria-hidden=\"true\"></span>");
              out.print("<span class=\"sr-only\">Next</span>");
              out.print("</a>");
            }

          }

        } catch (SQLException e) {
          out.print("오류 : " + e);
        }
      %>
    </div>

  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
