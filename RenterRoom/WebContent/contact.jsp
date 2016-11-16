<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="templates/public/inc/public/header.jsp" %>
<!--start main -->
<div class="main_bg">
<div class="wrap">
	<div class="main">
		<div class="contact">		
				<div class="contact_right">
				  <div class="contact-form">
				  	<h3>Liên Hệ</h3>
				  	<%
			        if("1".equals(request.getParameter("msg"))){
			  		  out.print("<p style='color:green; font=weight: bold '>   Thực hiện thành công </p>");
			  	  	}
		            if("0".equals(request.getParameter("msg"))){
		  	  		  out.print("<p style='color:red; font=weight: bold '>   Thực hiện thất bại </p>");
		  	  	  	}
			        %>
					    <form method="post" action="<%=request.getContextPath()%>/Public_ContactListAction">
					    	<div>
						    	<span><label>HỌ TÊN</label></span>
						    	<span><input name="userName" type="text" class="textbox" required></span>
						    </div>
						    <div>
						    	<span><label>E-MAIL</label></span>
						    	<span><input name="userEmail" type="text" class="textbox" required></span>
						    </div>
						    <div>
						     	<span><label>SỐ ĐIỆN THOẠI</label></span>
						    	<span><input name="userPhone" type="text" class="textbox" required></span>
						    </div>
						    <div>
						    	<span><label>NỘI DUNG</label></span>
						    	<span><textarea name="userMsg" required> </textarea></span>
						    </div>
						   <div>
						   		<span><input type="submit" value="Gởi" name="submit"></span>
						  </div>
					    </form>
				    </div>
  				</div>		
  				<div class="clear"></div>		
		  </div>
	</div>
</div>
</div>		
<!--start main -->

<%@include file="templates/public/inc/public/footer.jsp" %>