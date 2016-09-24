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
				  	<h3>Đăng Nhập</h3>
					    <form method="post" action="contact-post.html">
					    	<div>
						    	<span><label>TÊN ĐĂNG NHẬP</label></span>
						    	<span><input name="userName" type="text" class="textbox"></span>
						    </div>
						    <div>
						    	<span><label>MẬT KHẨU</label></span>
						    	<span><input name="userEmail" type="password" class="textbox"></span>
						    </div>
						    <div>
						   		<span><input type="reset" value="Hủy" style="margin-left: 26px;"></span>
						  </div>
						   <div>
						   		<span><input type="submit" value="Đăng nhập" ></span>
						  </div>
						  <div>
						    	<span><label>BẠN CHƯA CÓ TÀI KHOẢN. ĐĂNG KÝ <a href="#" alt="Đăng ký tài khoản">TẠI ĐÂY</a></label></span>
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