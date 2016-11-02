<%@page import="bean.Rooms"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="templates/public/inc/public/header.jsp" %>
<!--start main -->
<div class="main_bg">
<div class="wrap">
	<div class="main">
		<div class="contact">		
				<div class="contact_right">
			    <%
		        if("1".equals(request.getParameter("msg"))){
		  		  out.print("<p style='color:green; font=weight: bold '>   Thực hiện thành công </p>");
		  	  	}
	            if("0".equals(request.getParameter("msg"))){
	  	  		  out.print("<p style='color:red; font=weight: bold '>   Thực hiện thất bại </p>");
	  	  	  	}
		        %>
				  <div class="contact-form">
				  <% 
				  Rooms room = (Rooms)request.getAttribute("rooms");
				  if(room != null){
				  %>
				  	<h3>Đặt phòng</h3>
					    <form method="post" action="<%=request.getContextPath()%>/Public_BookingRoom">
					    	<div>
						    	<span><label>Tên phòng</label></span>
						    	<span><input name="userName" type="text" class="textbox" value="<%=room.getNameRoom()%>" disabled="disabled"></span>
						    </div>
						    <div>
						    	<span><label>Địa chỉ</label></span>
						    	<span><input name="userEmail" type="text" class="textbox" value="<%=room.getStreet()%>,<%=room.getDistrict()%>" disabled="disabled" ></span>
						    </div>
						    <div>
						     	<span><label>Giá</label></span>
						    	<span><input name="userPhone" type="text" class="textbox" value="<%=room.getCost()%>" disabled="disabled"></span>
						    </div>
						    <div>
						    	<span><label>Ghi chú</label></span>
						    	<span><textarea name="note"> </textarea></span>
						    </div>
						   <div>
						   		<span><input type="submit" value="Đặt phòng" name = "submit"></span>
						  </div>
					    </form>
					    <%} %>
				    </div>
  				</div>		
  				<div class="clear"></div>		
		  </div>
	</div>
</div>
</div>		
<!--start main -->

<%@include file="templates/public/inc/public/footer.jsp" %>