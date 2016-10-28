<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="templates/public/inc/public/header.jsp" %>
<script>
$( document ).ready(function() {
	$("#form-login").validate({
		rules: {
				username: {
					maxlength: 50,
					minlength: 6
				},
				password: {
					maxlength: 50,
					minlength: 6
				}
			},
			messages: {
				username: {
					maxlength: 'username không quá 50 kí tự',
					minlength: 'username có ít nhất 6 kí tự'
				},
				password: {
					maxlength: 'mật khẩu không quá 50 kí tự',
					minlength: 'mật khẩu có ít nhất 6 kí tự'
				}
			},
			submitHandler: function(form) {
			      form.submit();
			    }
	});
	});
</script>
<!--start main -->
<div class="main_bg">
<div class="wrap">
	<div class="main">
		<div class="contact">		
				<div class="contact_right">
				  <div class="contact-form">
				  	<h3>Đăng Nhập</h3>
				  	<%
		            if("0".equals(request.getParameter("msg"))){
			  	  		  out.print("<p style='color:red; font=weight: bold '>   Tài khoản của bạn không chính xác. </p>");
			  	  	  	}
				  	if("1".equals(request.getParameter("msg"))){
			  	  		  out.print("<p style='color:red; font=weight: bold '>   Tài khoản của bạn đã bị khóa </p>");
			  	  	  	}
				  	if("2".equals(request.getParameter("msg"))){
			  	  		  out.print("<p style='color:red; font=weight: bold '>   Username không được chứa kí tự đặc biệt </p>");
			  	  	  	}
		        	%>
					    <form method="post" id="form-login" action="<%=request.getContextPath()%>/LoginAction">
					    	<div>
						    	<span><label>TÊN ĐĂNG NHẬP</label></span>
						    	<span><input name="username" type="text" class="textbox" required pattern="^[a-zA-Z0-9]*$"></span>
						    </div>
						    <div>
						    	<span><label>MẬT KHẨU</label></span>
						    	<span><input name="password" type="password" class="textbox" required></span>
						    </div>
						    <div>
						   		<span><input type="reset" value="Hủy" style="margin-left: 26px;"></span>
						  </div>
						   <div>
						   		<span><input type="submit" value="Đăng nhập" name="submit"></span>
						  </div>
						  <div>
						    	<span><label>BẠN CHƯA CÓ TÀI KHOẢN. ĐĂNG KÝ <a href="<%=request.getContextPath()%>/RegisterAction" alt="Đăng ký tài khoản">TẠI ĐÂY</a></label></span>
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