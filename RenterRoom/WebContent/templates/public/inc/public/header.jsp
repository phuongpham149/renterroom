<%@page import="bean.Users"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<title>The Paradise-Hotel Website Template | Hotel :: w3layouts</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,700' rel='stylesheet' type='text/css'>
<link href="<%=request.getContextPath()%>/templates/public/css/styles.css" rel="stylesheet" type="text/css" media="all" />
<script src="<%=request.getContextPath()%>/templates/public/js/jquery.min.js"></script>
<!--start slider -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/templates/public/css/fwslider.css" media="all">
<script src="<%=request.getContextPath()%>/templates/public/js/jquery-ui.min.js"></script>
<script src="<%=request.getContextPath()%>/templates/public/js/css3-mediaqueries.js"></script>
<script src="<%=request.getContextPath()%>/templates/public/js/fwslider.js"></script>
<!--end slider -->
<!---strat-date-piker---->
<link rel="stylesheet" href="<%=request.getContextPath()%>/templates/public/css/jquery-ui.css" />
<script src="<%=request.getContextPath()%>/templates/public/js/jquery-ui.js"></script>
		  <script>
				  $(function() {
				    $( "#datepicker,#datepicker1" ).datepicker();
				  });
		  </script>
<!---/End-date-piker---->
<%-- <link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/templates/public/css/JFGrid.css" /> --%>
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/templates/public/css/JFFormStyle-1.css" />
		<script type="text/javascript" src="<%=request.getContextPath()%>/templates/public/js/JFCore.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/templates/public/js/JFForms.js"></script>
		<!-- Set here the key for your domain in order to hide the watermark on the web server -->
		<script type="text/javascript">
			(function() {
				JC.init({
					domainKey: ''
				});
				})();
		</script>
<!--nav-->
<script>
		$(function() {
			var pull 		= $('#pull');
				menu 		= $('nav ul');
				menuHeight	= menu.height();

			$(pull).on('click', function(e) {
				e.preventDefault();
				menu.slideToggle();
			});

			$(window).resize(function(){
        		var w = $(window).width();
        		if(w > 320 && menu.is(':hidden')) {
        			menu.removeAttr('style');
        		}
    		});
		});
</script>
</head>
<body>
<!-- start header -->
<div class="header_bg">
<div class="wrap">
	<div class="header">
		<div class="logo">
			<a href="index.html"><img src="<%=request.getContextPath()%>/templates/public/images/logo5.png" alt=""></a>
		</div>
		<div class="h_right">
			<!--start menu -->
			<ul class="menu">
				<li class="active"><a href="<%= request.getContextPath()%>/Public_RoomListAction">trang chủ</a></li> |
				<li><a href="<%=request.getContextPath()%>/Public_ContactListAction">liên hệ</a></li> |
				<%
				Users user = (Users)session.getAttribute("user");
				if (user != null ){
					if(user.getRole() == 2){%>
						<li><a href="reservation.html">Xin chào <%=user.getUsername() %></a></li>
				        <li><a href="<%=request.getContextPath()%>/LogoutAction">đăng xuất</a></li>
					<% }else{%>
						<li><a href="<%=request.getContextPath()%>/LoginAction">đăng nhập</a></li> |	
					<%}}
				else{
					%>
					<li><a href="<%=request.getContextPath()%>/LoginAction">đăng nhập</a></li> |	
					<%}%>
				<!-- 
				<li><a href="reservation.html">Xin chào</a></li>
				<li><a href="rooms.html">đăng xuất</a></li>
				 -->
				<div class="clear"></div>
			</ul>
		</div>
		<div class="clear"></div>
		<div class="top-nav">
		</div>
	</div>
</div>
</div>