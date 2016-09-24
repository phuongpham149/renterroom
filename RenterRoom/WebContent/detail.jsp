<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="templates/public/inc/public/header.jsp" %>
<!--start main -->
<div class="main_bg">
<div class="wrap">
	<div class="main">
		<div class="details">
			<h2>Lorem ipsum dolor sit amet consectetur adipisicing</h2>
			<div class="det_pic">
				  <img style="width:46%;" src="<%=request.getContextPath()%>/templates/public/images/det_pic.jpg" alt="" />
				  <img style="width:46%; margin-left:72px;" src="<%=request.getContextPath()%>/templates/public/images/det_pic.jpg" alt="" />
			</div>
			<div class="det_text">
				<p class="para">Địa điểm: <span>54 Nguyễn Lương Bằng</span> </p>
				<p class="para">Rộng rãi, có chỗ để xe </p>
				<p class="para">Tiền phòng <span>600.000 VNĐ</span> </p>
				<p class="para">Thời gian cập nhật <span>20/09/2016 20:20:09</span></p>
				<div class="read_more">
					 <a href="details.html">Đặt phòng</a>
				</div>
			</div>
		</div>
	</div>
</div>
</div>	
<%@include file="templates/public/inc/public/footer.jsp" %>	