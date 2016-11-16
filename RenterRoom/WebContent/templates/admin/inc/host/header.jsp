<%@page import="bean.Users"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<title>Tìm kiếm phòng trọ</title>
		<meta name="description" templates="description">
		<meta name="author" templates="DevOOPS">
		<meta name="viewport" templates="width=device-width, initial-scale=1">
		<link href="<%=request.getContextPath() %>/templates/admin/plugins/bootstrap/bootstrap.css" rel="stylesheet">
		<link href="<%=request.getContextPath() %>/templates/admin/plugins/jquery-ui/jquery-ui.min.css" rel="stylesheet">
		<link href="<%=request.getContextPath() %>/templates/admin/font-awesome/css/font-awesome.min.css" rel="stylesheet">
		<link href='<%=request.getContextPath() %>/templates/admin/css/familyRighteous.css' rel='stylesheet' type='text/css'>
		<link href="<%=request.getContextPath() %>/templates/admin/plugins/fancybox/jquery.fancybox.css" rel="stylesheet">
		<link href="<%=request.getContextPath() %>/templates/admin/plugins/fullcalendar/fullcalendar.css" rel="stylesheet">
		<link href="<%=request.getContextPath() %>/templates/admin/plugins/xcharts/xcharts.min.css" rel="stylesheet">
		<link href="<%=request.getContextPath() %>/templates/admin/plugins/select2/select2.css" rel="stylesheet">
		<link href="<%=request.getContextPath() %>/templates/admin/plugins/justified-gallery/justifiedGallery.css" rel="stylesheet">
		<link href="<%=request.getContextPath() %>/templates/admin/css/style_v1.css" rel="stylesheet">
		<link href="<%=request.getContextPath() %>/templates/admin/css/customer.css" rel="stylesheet">
		<link href="<%=request.getContextPath() %>/templates/admin/plugins/chartist/chartist.min.css" rel="stylesheet">
		
		<!-- JavaScript For DataTables -->
		<link href="<%=request.getContextPath() %>/templates/datatable-bootstrap/css/dataTables.bootstrap.css" rel="stylesheet" />
		
		<!-- DataTables Responsive CSS -->
		<link href="<%=request.getContextPath() %>/templates/datatable-responsive/css/dataTables.responsive.css" rel="stylesheet" />
		
		<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
		<!--<script src="http://code.jquery.com/jquery.js"></script>-->
		<script src="<%=request.getContextPath() %>/templates/admin/plugins/jquery/jquery.min.js"></script>
		<script src="<%=request.getContextPath() %>/templates/admin/plugins/jquery-ui/jquery-ui.min.js"></script>
		
		<!-- Include all compiled plugins (below), or include individual files as needed -->
		<script src="<%=request.getContextPath() %>/templates/admin/plugins/bootstrap/bootstrap.min.js"></script>
		
		 <script src="<%=request.getContextPath() %>/templates/admin/js/devoops.js"></script>
	</head>
<body>
<!--Start Header-->
<div id="screensaver">
	<canvas id="canvas"></canvas>
	<i class="fa fa-lock" id="screen_unlock"></i>
</div>
<div id="modalbox">
	<div class="devoops-modal">
		<div class="devoops-modal-header">
			<div class="modal-header-name">
				<span>Basic table</span>
			</div>
			<div class="box-icons">
				<a class="close-link">
					<i class="fa fa-times"></i>
				</a>
			</div>
		</div>
		<div class="devoops-modal-inner">
		</div>
		<div class="devoops-modal-bottom">
		</div>
	</div>
</div>
<header class="navbar">
	<div class="container-fluid expanded-panel">
			<div class="row">
				<div id="logo" class="col-xs-12 col-sm-2">
					<a href="index_v1.html">Chủ trọ</a>
				</div>
				<div id="top-panel" class="col-xs-12 col-sm-10">
					<div class="row">
						<div class="col-xs-4 col-md-12 top-panel-right">
							<ul class="nav navbar-nav pull-right panel-menu">
								<li class="dropdown welcome-admin">
									<a href="#" class="dropdown-toggle account" data-toggle="dropdown">
										<div class="avatar">
											<img src="<%=request.getContextPath()%>/templates/admin/img/user.png" class="img-circle" alt="avatar" />
										</div>
										<i id="dropUser" class="fa fa-angle-down pull-right"></i>
										<div class="user-mini pull-right">
										<%
											Users user = (Users) session.getAttribute("user");
										%>
											<span class="welcome">Xin chào,<br/><%=user.getUsername() %></span>
										</div>
									</a>
								<ul class="dropdown-menu">
									<li>
										<a href="#">
											<i class="fa fa-user"></i>
											<span>Profile</span>
										</a>
									</li>
									<li>
										<a href="#">
											<i class="fa fa-cog"></i>
											<span>Settings</span>
										</a>
									</li>
									<li>
										<a href="<%=request.getContextPath()%>/LogoutAction">
											<i class="fa fa-power-off"></i>
											<span>Logout</span>
										</a>
									</li>
								</ul>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</header>
<!--End Header-->
<!--Start Container-->
<div id="main" class="container-fluid">
	<div class="row">
		<div id="sidebar-left" class="col-xs-2 col-sm-2">
			<ul class="nav main-menu">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle">
						<i class="fa fa-bar-chart-o"></i>
						<span class="hidden-xs">Phòng trọ</span>
					</a>
					<ul class="dropdown-menu" style="display: none;">
						<li><a href="<%=request.getContextPath()%>/Host_RoomListAction">Danh sách</a></li>
						<li><a href="<%=request.getContextPath()%>/Host_RoomAddAction?type=load">Thêm</a></li>
					</ul>
				</li>
				<li class="dropdown">
					<a href="#" class="dropdown-toggle">
						<i class="fa fa-table"></i>
						 <span class="hidden-xs">Đặt phòng</span>
					</a>
					<ul class="dropdown-menu">
						<li><a href="<%=request.getContextPath()%>/Host_BookingListAction"">Danh sách</a></li>
					</ul>
				</li>
			</ul>
		</div>