<%@page import="FileUtils.DateUtils"%>
<%@page import="bean.Rooms"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="templates/public/inc/public/header.jsp" %>
<!--start main -->
<div class="main_bg">
<div class="wrap">
	<div class="main">
		<div class="details">
		<%
			Rooms alRooms=(Rooms)request.getAttribute("alRooms");
				
		%>
			<h2><%=alRooms.getNameRoom() %></h2>
			<div class="det_pic">
				  <img style="width:46%;" src="<%=request.getContextPath()%>/templates/public/images/det_pic.jpg" alt="" />
				  <img style="width:46%; margin-left:72px;" src="<%=request.getContextPath()%>/templates/public/images/det_pic.jpg" alt="" />
			</div>
			<div class="det_text">
				<p class="para">Địa điểm: <span><%=alRooms.getStreet() %>g</span> </p>
				<p class="para"><%=alRooms.getDescription() %> </p>
				<p class="para">Tiền phòng: <span><%=alRooms.getCost() %> VNĐ</span> </p>
				<p class="para">Thời gian cập nhật: <span><%=DateUtils.formatDate(alRooms.getTimeCreated())%></span></p>
				<div class="read_more">
					 <a href="<%=request.getContextPath()%>/Public_BookingRoom?idRoom=<%=alRooms.getIdRoom()%>" name="submit">Đặt phòng</a>
				</div>
			</div>
		</div>
	</div>
</div>
</div>	
<%@include file="templates/public/inc/public/footer.jsp" %>	