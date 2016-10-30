<%@page import="bean.Booking"%>
<%@page import="bean.Contact"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../templates/admin/inc/host/header.jsp" %>
<!--Start Content-->
		<div id="content" class="col-xs-12 col-sm-10">
			<div id="ajax-content">
				<div class="row">
					<div id="breadcrumb" class="col-xs-12">
						<a class="show-sidebar" href="#">
							<i class="fa fa-bars"></i>
						</a>
						<ol class="breadcrumb pull-left">
							<li>
								<a href="index.html">Trang chủ</a>
							</li>
							<li>
								<a href="#">Liên hệ </a>
							</li>
						</ol>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<h2 class="page-header">Liên hệ </h2>
				</div>
				<!-- /.col-lg-12  -->
			    <%
					Booking booking = (Booking)request.getAttribute("booking");
				%>
			</div>
			<div class="col-md-9 personal-info">
			<form class="form-horizontal" role="form" action="" method="post">
				<div class="form-group">
					<label class="col-lg-2 control-label">Đến</label>
					<div class="col-lg-8">
						<input class="form-control input-medium" type="text" name="nameContact" value="<%=booking.getName()%>" readonly required>
						<input class="form-control input-medium" type="hidden" name="email" value="<%=booking.getEmail()%>" required>
					</div>
				</div>
				<div class="form-group">
					<label class="col-lg-2 control-label">Chủ đề</label>
					<div class="col-lg-8">
						<input class="form-control input-medium" type="text" name="subject" value="" required>
					</div>
				</div>
				<div class="form-group">
					<label class="col-lg-2 control-label">Nội dung</label>
					<div class="col-lg-8">
						<textarea required rows="10" cols="30" name = "content" class="form-control form-effect">
			                
			            </textarea>
					</div>
				</div>
				<div class="form-group">
		            <label class="col-lg-2 control-label"></label>
		            <div class="col-md-8">
		              <input type="submit" class="btn btn-primary" value="Gởi" name="submit">
					  <span></span>
					  <a href="" class="btn btn-default">Hủy</a>
		            </div>
	          </div>  
		</form>
			
		</div>
		
		<!--End Content-->
		</div>
	</div>

<!--End Container-->

</body>
</html>
