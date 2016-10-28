<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="templates/public/inc/public/header.jsp"%>
<script>
$( document ).ready(function() {
	$("#form-register").validate({
		rules: {
				phonenumber: {
					minlength:10,
					maxlength:11,
					number: true
				},
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
				phonenumber: {
					minlength:'Số điện thoại có ít nhất 10 chữ số',
					maxlength:'Số điện thoại nhiều nhất 11 chữ số',
					number: 'số điện thoại chỉ chứa chữ số'
				},
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
						<h3 style="text-align: center;">ĐĂNG KÝ</h3>
						<%
						if("0".equals(request.getParameter("msg"))){
					  		  out.print("<p style='color:red; font=weight: bold '>   Username không được chứa kí tự đặc biệt. </p>");
					  	  	}
				    	if("1".equals(request.getParameter("msg"))){
					  		  out.print("<p style='color:red; font=weight: bold '>   Username của bạn đã trùng với tài khoản khác. </p>");
					  	  	}
		           		if("2".equals(request.getParameter("msg"))){
					  		  out.print("<p style='color:green; font=weight: bold '> Đăng ký thành công</p>");
					  	  	}
					  	
		           		if("3".equals(request.getParameter("msg"))){
					  		  out.print("<p style='color:red; font=weight: bold '> Đăng ký thất bại</p>");
					  	  	}
				  		%>
						<form method="post" id="form-register" action="<%=request.getContextPath()%>/RegisterAction"  onsubmit = "return checkSpecialCharacter()">
							<div>
							<div style="float: left; width: 50%;">
								<span><label>TÊN ĐĂNG NHẬP</label></span> <span>
								<input	name="username" id="username" type="text" class="textbox" required></span>
							</div>
							<div style="float: right; width: 45%; margin-left: 10px">
								<span><label>MẬT KHẨU</label></span> <span><input
									name="password" id="password" type="password" class="textbox" required></span>
							</div>
							</div>
							<div style="margin-top:80px">
								<div style="float: left; width: 50%;">
								<span><label>E-MAIL</label></span> <span><input
									name="email" id="email" type="email" class="textbox" required></span>
							</div>
							<div style="float: right; width: 45%;">
								<span><label>SỐ ĐIỆN THOẠI</label></span> <span><input
									name="phonenumber" id="phonenumber" type="text" class="textbox" required></span>

							</div>
							</div>
							<div style="float: left; width: 102%;">
								<span><label>BẠN LÀ : </label></span>
								 <select
									class="form-control form-effect" name="role"
									style="padding-top: 10px;" id="role">
									<option value="1">Chủ trọ</option>
									<option value="2">Người thuê trọ</option>
								</select>
							</div>
							<div style="margin-top:80px;">
							<div style="float: left; width: 50%;">
								<span><label>ĐƯỜNG</label></span> <span><input
									name="street" type="text" class="textbox" id="street" required></span>
							</div>
							<div style="float: left; width: 22%; margin-left: 39px">
								<span><label>QUẬN</label></span> <select
									class="form-control form-effect" name="district"
									style="padding-top: 10px;" id="district">
									<option value="Thanh Khuê">Thanh Khuê</option>
									<option value="Liên Chiểu">Liên Chiểu</option>
									<option value="Hải Châu">Hải Châu</option>
									<option value="Hòa Vang">Hòa Vang</option>
									<option value="Ngũ Hành Sơn">Ngũ Hành Sơn</option>
									<option value="Sơn Trà">Sơn Trà</option>
								</select>
							</div>
							<div style="float: right; width: 22%;">
								<span><label>THÀNH PHỐ</label></span> <span><input
									name="city" type="text" class="textbox" value="Đà Nẵng"
									readonly></span>
							</div>
							</div>
							
							<div>
								<span><input type="reset" value="Nhập lại"
									style="margin-top: 15px;"></span> <span><input
									type="submit" value="Đăng ký" name="submit"
									style="margin-right: 30px; margin-top: 15px;"></span>

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

<%@include file="templates/public/inc/public/footer.jsp"%>