<%@page import="bean.Rooms"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="templates/public/inc/public/header.jsp"%>
<!----start-images-slider---->
<div class="images-slider">
	<!-- start slider -->
	<div id="fwslider">
		<div class="slider_container">
			<div class="slide">
				<!-- Slide image -->
				<img
					src="<%=request.getContextPath()%>/templates/public/images/slider-bg.jpg"
					alt="" />
				<!-- /Slide image -->
				<!-- Texts container -->
				<div class="slide_content">
					<div class="slide_content_wrap">
						<!-- Text title -->
						<h4 class="title">
							<i class="bg"></i>Lorem Ipsum is simply <span class="hide">dummy
								text</span>
						</h4>
						<h5 class="title1">
							<i class="bg"></i>Morbi justo <span class="hide">condimentum
								accumsan</span>
						</h5>
						<!-- /Text title -->
					</div>
				</div>
				<!-- /Texts container -->
			</div>
			<!-- /Duplicate to create more slides -->
			<div class="slide">
				<img
					src="<%=request.getContextPath()%>/templates/public/images/slider-bg.jpg"
					alt="" />
				<div class="slide_content">
					<div class="slide_content_wrap">
						<!-- Text title -->
						<h4 class="title">
							<i class="bg"></i>Morbi justo <span class="hide">
								condimentum </span>text
						</h4>
						<h5 class="title1">
							<i class="bg"></i>Lorem Ipsum is <span class="hide">simply
								dummy text</span>
						</h5>
						<!-- /Text title -->
					</div>
				</div>
			</div>
			<!--/slide -->
		</div>
		<div class="timers"></div>
		<div class="slidePrev">
			<span> </span>
		</div>
		<div class="slideNext">
			<span> </span>
		</div>
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
					<%
						String country = request.getParameter("location");
						String money = request.getParameter("cost");
						String type = request.getParameter("type");
					%>
				</div>
				<div class="reservation">
					<form action="#" method="post">
						<ul>
							<li class="span1_of_1">
								<h5>Khu vực</h5> <!----------start section_room----------->
								<div class="section_room">
									<select id="location" onchange="change_country(this.value)"
										class="frm-field required" name="location">
										<option value="">--Chọn một khu vực--</option>
										<option value="Lien Chieu"  <%if(country != null && country.equals("Lien Chieu")){%>selected = "selected"<%} %> >Liên Chiểu</option>
										<option value="Thanh Khe"  <%if(country != null && country.equals("Thanh Khe")){%>selected = "selected"<%} %> >Thanh Khuê</option>
										<option value="Hai Chau" <%if(country != null && country.equals("Hai Chau")){%>selected = "selected"<%} %> >Hải Châu</option>
										<option value="Son Tra" <%if(country != null && country.equals("Son Tra")){%>selected = "selected"<%} %> >Sơn Trà</option>
										<option value="Ngu Hanh Son" <%if(country != null && country.equals("Ngu Hanh Son")){%>selected = "selected"<%} %> >Ngũ Hành Sơn</option>
										<option value="Hoa Vang" <%if(country != null && country.equals("Hoa Vang")){%>selected = "selected"<%} %> >Hòa Vang</option>
										<option value="Cam Le" <%if(country != null && country.equals("Cam Le")){%>selected = "selected"<%} %> >Cẩm Lệ</option>
									</select>
								</div>
							</li>
							<li class="span1_of_1 left">
								<h5>Giá tiền</h5> <!----------start section_room----------->
								<div class="section_room">
									<select id="cost" onchange="change_country(this.value)"
										class="frm-field required" name="cost">
										<option value="">--Chọn một giá tiền--</option>
										<option value="500" <%if(money != null && money.equals("500")){%>selected = "selected"<%} %> >Dưới 500.000 VND</option>
										<option value="700" <%if(money != null && money.equals("700")){%>selected = "selected"<%} %>>500.000 VND - 700.000 VND</option>
										<option value="1000" <%if(money != null && money.equals("1000")){%>selected = "selected"<%} %>>700.000 VND - 1 000 000 VND</option>
										<option value="1001" <%if(money != null && money.equals("1001")){%>selected = "selected"<%} %>>Trên 1 000 000 VND</option>
									</select>
								</div>
							</li>
							<li class="span1_of_1 left">
								<h5>Loại trọ:</h5>
								<div class="section_room">
									<select id="type" onchange="change_country(this.value)"
										class="frm-field required" name="type">
										<option value="">--Chọn một loại trọ--</option>
										<option value="phong" <%if(type != null && type.equals("phong")){%>selected = "selected"<%} %>>Phòng trọ</option>
										<option value="nguyen can " <%if(type != null && type.equals("nguyen can")){%>selected = "selected"<%} %>>Nhà nguyên căn</option>
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
		<%
			if ("0".equals(request.getParameter("msg"))) {
		%>
		<p
			style="color: red; font-weight: bold; font-size: 25px; text-align: center;">Không
			có kết quả tìm kiếm nào</p>
		<%
			}
		%>
		<div class="grids_of_3">
			<%
				ArrayList<Rooms> alRooms=(ArrayList<Rooms>)request.getAttribute("alRooms");
						if(alRooms!=null){
							for(Rooms itemRoom: alRooms){
			%>
			<div class="grid1_of_3">
				<div class="grid1_of_3_img">
					<a href="<%=request.getContextPath()%>/Public_ContactDetailAction?idRoom=<%=itemRoom.getIdRoom()%>"> <img
						src="<%=request.getContextPath()%>/templates/public/images/pic2.jpg"
						alt="" /> <span class="next"> </span>
					</a>
				</div>
				<h4>
					<a href="<%=request.getContextPath()%>/Public_ContactDetailAction?idRoom=<%=itemRoom.getIdRoom()%>"><%=itemRoom.getNameRoom()%><span><%=itemRoom.getCost()%></span></a>
				</h4>
				<p><%=itemRoom.getDescription()%></p>
			</div>
			<%
				}}
			%>
			<div class="clear"></div>
		</div>

		<div class="clear"></div>
	</div>
</div>
<%@include file="templates/public/inc/public/footer.jsp"%>