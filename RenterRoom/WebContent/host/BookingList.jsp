<%@page import="bean.Booking"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../templates/admin/inc/host/header.jsp" %>
<!-- Start Content-->
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
						<a href="#">Đặt phòng</a>
					</li>
				</ol>
				</div>
			</div>
			</div>
			
			
			<div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Danh sách đặt phòng</h1>
            </div>
            <!-- /.col-lg-12  -->
        	</div>
			 <div class="row">
        	<div class="col-lg-12">
        		<%
		        if("1".equals(request.getParameter("msg"))){
		  		  out.print("<p style='color:green; font=weight: bold '>   Thực hiện thành công </p>");
		  	  	}
	            if("0".equals(request.getParameter("msg"))){
	  	  		  out.print("<p style='color:red; font=weight: bold '>   Thực hiện thất bại </p>");
	  	  	  	}
		        %>
        		<table class="table table-striped table-bordered table-hover" id="dataTables-dsSinhVien">
        			<thead>
        				<tr>
        					<td>Họ tên</td>
        					<td>Số điện thoại</td>
        					<td>Địa chỉ</td>
        					<td>Ghi chú</td>
        					<td>Thời gian</td>
        					<td>Duyệt</td>
        				    <td>Liên hệ</td>
        				</tr>
        			</thead>
        			<tbody id="tbl-body">
        			<% 
        				ArrayList<Booking> list = (ArrayList<Booking>)request.getAttribute("listBooking");
				        for(Booking obj : list){
				    %>
        				<tr>
        					<td><%=obj.getName()%></td>
        					<td><%=obj.getPhoneNumber() %></td>
        					<td><%=obj.getAddress() %></td>
        					<td><%=obj.getNote() %></td>
        					<td><%=obj.getTimeCreated() %></td>
        					<td>
        					<%
        					if(obj.getIdStatus() ==2 ){%>
        						<input type="checkbox" name="idStatus" value="<%=obj.getIdStatus()%>" disabled = "disabled" > 
        					<%}
        					if(obj.getIdStatus() == 1){%>
        					    <input type="checkbox" name="idStatus" value="<%=obj.getIdStatus()%>"  checked="true" disabled = "disabled" > 
        				    <%}%>
        					</td>
        					<td>
        					<a class="btn btn-default" href="<%= request.getContextPath()%>/Host_BookingContactAction?idBooking=<%=obj.getIdBooking()%>" title = "Liên hệ"><i class="fa fa-envelope-o" aria-hidden="true"></i></a>
        	                <%if (obj.getIdStatus()==2 ){%>
        						
        						<button value="<%= obj.getIdBooking()%>" class="btn btn-default btn-approval" id="btn-approval<%= obj.getIdBooking() %>" data-toggle="modal" data-target="#myModalApproval" title = "Duyệt"><i class="fa fa-edit"></i> 
        						
        						<%} %>  
        						      						
        					</td>
        				</tr>
        		    <%} %>
        			</tbody>
        		</table>
         	<div id="myModalApproval" class="modal fade" role="dialog">

			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<form id="form-xoa" action="<%=request.getContextPath()%>/Host_BookingApprovalAction" method="post">
						<input id="modal-hidden-idBooking" type="hidden" value="" name="idBooking" />
						<div class="modal-header">
							<a href="#" data-dismiss="modal" aria-hidden="true" class="close">×</a>
							<h3>Xóa</h3>
						</div>
						<div class="modal-body">
							<p>Bạn có chắc chắn muốn duyệt bài đăng này không?</p>
						</div>
						<div class="modal-footer">
							<button type="submit" id="btnYes" class="btn btn-danger">Có</button>
							<button type="button" data-dismiss="modal" aria-hidden="true" class="btn btn-secondary">Không</button>
						</div>
					</form>
				</div>
			</div>
				<script type="text/javascript">
					$(".btn-approval").click(function() {
						var idBooking = $(this).attr("value");
						console.log(idBooking);
						$('#modal-hidden-idBooking').val(idBooking);
					});
				</script>
				<script
					src="<%=request.getContextPath()%>/templates/admin/datatable/js/jquery.dataTables.min.js"></script>
				<script
					src="<%=request.getContextPath()%>/templates/admin/datatable-bootstrap/js/dataTables.bootstrap.min.js"></script>
				<script>
			$(document).ready( function() {
				$('#dataTables-dsSinhVien').DataTable({
						responsive : true,
						language : {
							"sProcessing" : "Đang xử lý...",
							"sLengthMenu" : "Xem _MENU_ mục",
							"sZeroRecords" : "Không tìm thấy dòng nào phù hợp",
							"sInfo" : "Đang xem _START_ đến _END_ trong tổng số _TOTAL_ mục",
							"sInfoEmpty" : "Đang xem 0 đến 0 trong tổng số 0 mục",
							"sInfoFiltered" : "(được lọc từ _MAX_ mục)",
							"sInfoPostFix" : "",
							"sSearch" : "Tìm:",
							"sUrl" : "",
							"oPaginate" : {
								"sFirst" : "Đầu",
								"sPrevious" : "Trước",
								"sNext" : "Tiếp",
								"sLast" : "Cuối"
							}
						}
					});
				});
		</script>
			</div>
	</div>

		<!--End Container-->
		<!-- datatable -->
		<script
			src="<%=request.getContextPath()%>/templates/admin/datatable/js/jquery.dataTables.min.js"></script>
		<script
			src="<%=request.getContextPath()%>/templates/admin/datatable-bootstrap/js/dataTables.bootstrap.min.js"></script>
		<!-- /datatable -->


		</body>
</html>
