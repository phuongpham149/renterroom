<%@page import="bean.Rooms"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="templates/public/inc/public/header.jsp" %>   
<!----start-images-slider---->
		<div class="images-slider">
			<!-- start slider -->
		    <div id="fwslider">
		        <div class="slider_container">
		            <div class="slide"> 
		                <!-- Slide image -->
		                    <img src="<%=request.getContextPath()%>/templates/public/images/slider-bg.jpg" alt=""/>
		                <!-- /Slide image -->
		                <!-- Texts container -->
		                <div class="slide_content">
		                    <div class="slide_content_wrap">
		                        <!-- Text title -->
		                        <h4 class="title"><i class="bg"></i>Lorem Ipsum is simply <span class="hide">dummy text</span></h4>
		                        <h5 class="title1"><i class="bg"></i>Morbi justo <span class="hide" >condimentum accumsan</span></h5>
		                        <!-- /Text title -->
		                    </div>
		                </div>
		                 <!-- /Texts container -->
		            </div>
		            <!-- /Duplicate to create more slides -->
		            <div class="slide">
		                <img src="<%=request.getContextPath()%>/templates/public/images/slider-bg.jpg" alt=""/>
		                <div class="slide_content">
		                     <div class="slide_content_wrap">
		                        <!-- Text title -->
		                        <h4 class="title"><i class="bg"></i>Morbi justo <span class="hide"> condimentum </span>text</h4>
		                        <h5 class="title1"><i class="bg"></i>Lorem Ipsum is <span class="hide">simply dummy text</span> </h5>
		                        <!-- /Text title -->
		                    </div>
		                </div>
		            </div>
		            <!--/slide -->
		        </div>
		        <div class="timers"> </div>
		        <div class="slidePrev"><span> </span></div>
		        <div class="slideNext"><span> </span></div>
		    </div>
		    <!--/slider -->
		</div>
<!--start main -->
<div class="main_bg">
<div class="wrap">
	<div class="online_reservation">
	<div class="b_room">
		<div class="booking_room">
			<h4>Thuê phòng trọ</h4>
		</div>
		<div class="reservation">
		<form action="#" method="post">
			<ul>
				<li class="span1_of_1">
					<h5>Khu vực</h5>
					<!----------start section_room----------->
					<div class="section_room" >
						<select id="location" onchange="change_country(this.value)" class="frm-field required" name="location">
							<option value="">--Chọn một khu vực--</option>
				            <option value="Lien Chieu">Liên Chiểu</option>         
				            <option value="Thanh Khe">Thanh Khuê</option>
							<option value="Hai Chau">Hải Châu</option>
							<option value="Son Tra">Sơn Trà</option>         
				            <option value="Ngu Hanh Son">Ngũ Hành Sơn</option>
							<option value="Hoa Vang">Hòa Vang</option>
							<option value="Cam Le">Cẩm Lệ</option>
		        		</select>
					</div>	
				</li>
				<li  class="span1_of_1 left">
					<h5>Giá tiền</h5>
					<!----------start section_room----------->
					<div class="section_room">
						<select id="cost" onchange="change_country(this.value)" class="frm-field required" name="cost">
							<option value="">--Chọn một giá tiền--</option>
				            <option value="500">Dưới 500.000 VND</option>         
				            <option value="700">500.000 VND - 700.000 VND</option>
							<option value="1000">700.000 VND - 1 000 000 VND</option>
							<option value="1001">Trên 1 000 000 VND</option>
		        		</select>
					</div>					
				</li>
				<li  class="span1_of_1 left">
					<h5>Loại trọ:</h5>
					<div class="section_room">
						<select id="type" onchange="change_country(this.value)" class="frm-field required" name="type">
							<option value="">--Chọn một loại trọ--</option>
				            <option value="phong">Phòng trọ</option>         
				            <option value="nguyen can">Nhà nguyên căn</option>
		        		</select>
					</div>		
				</li>
				
				<li class="span1_of_3">
				<div class="date_btn">
				<input type="submit" value="Search"  name="search"/>
				</div>
				</li>
				<div class="clear"></div>
				</ul>
			</form>
		</div>
		<div class="clear"></div>
		</div>
	</div>
	
	
	<!--start grids_of_3 -->
	
	<div class="grids_of_3">
	<%
		ArrayList<Rooms> roomList=(ArrayList<Rooms>)request.getAttribute("roomList");
			if(roomList!=null){
				for(Rooms itemRoom: roomList){
				String pathFile = request.getContextPath() + "/files/" + itemRoom.getImage();
	%>
		<div class="grid1_of_3">
			<div class="grid1_of_3_img">
				<a href="<%=request.getContextPath()%>/Public_ContactDetailAction?idRoom=<%=itemRoom.getIdRoom()%>">
					<img src="<%=pathFile%>" alt="" />
					<span class="next"> </span>
				</a>	
			</div>
			<h4><a href="<%=request.getContextPath()%>/Public_ContactDetailAction?idRoom=<%=itemRoom.getIdRoom()%>"><%=itemRoom.getNameRoom() %><span><%=itemRoom.getCost()%>.000VNĐ</span></a></h4>
			<p><%=itemRoom.getDescription() %></p>
		</div>
		<%}} %>
		<div class="clear"></div>
	</div>	
	
	<div class="clear"></div>
</div>
</div>	
<%@include file="templates/public/inc/public/footer.jsp" %>