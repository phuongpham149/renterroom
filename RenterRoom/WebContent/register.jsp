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
				  	<h3 style="text-align:center;">ĐĂNG KÝ</h3>
					    <form method="post" action="contact-post.html">
					    	<div style="float: left;width: 50%;">
						    	<span><label>TÊN ĐĂNG NHẬP</label></span>
						    	<span><input name="userName" type="text" class="textbox"></span>
						    </div>
						    <div style="float: right;width: 45%;margin-left:10px">
						    	<span><label>MẬT KHẨU</label></span>
						    	<span><input name="userName" type="text" class="textbox"></span>
						    </div>
						    <div style="float: left;width: 50%;" >
						    	<span><label>E-MAIL</label></span>
						    	<span><input name="userEmail" type="text" class="textbox"></span>
						    </div>
						    <div style="float: right;width: 45%;">
						     	<span><label>SỐ ĐIỆN THOẠI</label></span>
						    	<span><input name="userPhone" type="text" class="textbox"></span>
						    </div>
						    <div style="float: left;width: 50%;">
						    	<span><label>ĐƯỜNG</label></span>
						    	<span><input name="userPhone" type="text" class="textbox"></span>
						    </div>
						    <div style="float: left;width: 22%; margin-left:39px">
						    	<span><label>QUẬN</label></span>
						    	<select class="form-control form-effect" name="category" style="padding-top:10px;">
                        		<option value="" >adc</option>
                        		<option value="" >adcd</option>
                        		</select>
						    </div>
						    <div style="float: right;width: 22%;">
						    	<span><label>THÀNH PHỐ</label></span>
						    	<span><input name="userPhone" type="text" class="textbox" value="Đà Nẵng" read-only></span>
						    </div>
						   <div>
						   		<span><input type="reset" value="Nhập lại" style="margin-top:15px;"></span>
						   		
						   		<span><input type="submit" value="Đăng ký" style="margin-right: 30px; margin-top:15px;"></span>
						   		
						   	
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