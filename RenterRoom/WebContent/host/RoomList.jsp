<%@page import="bean.Rooms"%>
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
						<a href="#">Phòng Trọ</a>
					</li>
				</ol>
				</div>
			</div>
			</div>
			
			
			<div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Danh sách phòng trọ</h1>
            </div>
            <!-- /.col-lg-12  -->
        	</div>
			 <div class="row">
        	<div class="col-lg-12">
        		<table class="table table-striped table-bordered table-hover" id="dataTables-dsSinhVien">
        			<thead>
        				<tr>
        					<td>Mã phòng</td>
        					<td>Giá tiền</td>
        					<td>Mô tả</td>
        					<td>Trống</td>
        					<td>Loại trọ</td>
        					<td></td>
        				</tr>
        			</thead>
        			<tbody id="tbl-body">
        		<%
				  ArrayList<Rooms> list = (ArrayList<Rooms>)request.getAttribute("listRoom");
				  for(Rooms  obj : list){
				%>
        				<tr>
        					<td><%=obj.getIdRoom()%></td>
        					<td><%=obj.getCost()%></td>
        					<td><%=obj.getDescription()%></td>
        					<td>
        					<% if (obj.getIsEmpty()==0){ %>
        						<input type="checkbox" name="isEmpty" value="<%=obj.getIsEmpty()%>" > 
        						<%} if (obj.getIsEmpty()==1) {%>
        						<input type="checkbox" name="isEmpty" value="<%=obj.getIsEmpty()%>"  checked="true"> 
        					<%} %>
        					</td>
        					<td><%=obj.getNameCategory()%></td>
        					<td>
        						<button value="<%= obj.getIdRoom() %>" class="btn btn-default btn-update" id="btn-update<%= obj.getIdRoom() %>" data-toggle="modal" data-target="#myModalUpdate"><i class="fa fa-edit"></i> 
        						<button type="button" id="btn-xoa" class="btn btn-danger" data-toggle="modal" data-target="#myModal"><i class="fa fa-remove"></i></button>
        					</td>
        				</tr>
        			<%} %>	
        			</tbody>
        		</table>
        	<div id="myModalUpdate" class="modal fade" role="dialog">

			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<form id="form-xoa" action="<%=request.getContextPath()%>/RoomUpdateAction" method="post">
						<input id="modal-hidden-idRoom" type="hidden" value="" name="idRoom" />
						<div class="modal-header">
							<a href="#" data-dismiss="modal" aria-hidden="true" class="close">×</a>
							<h3>Xóa</h3>
						</div>
						<div class="modal-body">
							<p>Bạn có chắc chắn muốn cập nhật tình trạng phòng không?</p>
						</div>
						<div class="modal-footer">
							<button type="submit" id="btnYes" class="btn btn-danger">Có</button>
							<button type="button" data-dismiss="modal" aria-hidden="true" class="btn btn-secondary">Không</button>
						</div>
					</form>
				</div>
			</div>
	<script type="text/javascript">
		$(".btn-update").click(function () {
			var idRoom = $(this).attr("value");
			console.log(idRoom);
			$('#modal-hidden-idRoom').val(idRoom);
		});
		</script>
			</div>
        	<div id="myModal" class="modal fade" role="dialog">

			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<form id="form-xoa" action="" method="post">
						<input id="modal-hidden-idRoom" type="hidden" value="" name="idRoom" />
						<div class="modal-header">
							<a href="#" data-dismiss="modal" aria-hidden="true" class="close">×</a>
							<h3>Xóa</h3>
						</div>
						<div class="modal-body">
							<p>Bạn có chắc chắn muốn xóa thông tin này?</p>
						</div>
						<div class="modal-footer">
							<button type="submit" id="btnYes" class="btn btn-danger">Có</button>
							<button type="button" data-dismiss="modal" aria-hidden="true" class="btn btn-secondary">Không</button>
						</div>
					</form>
				</div>
				
			</div>
			
		<script src="<%=request.getContextPath() %>/templates/admin/datatable/js/jquery.dataTables.min.js"></script>

		<script src="<%=request.getContextPath() %>/templates/admin/datatable-bootstrap/js/dataTables.bootstrap.min.js"></script>
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
		<!--lay ma de xoa -->		
		<!--End Content-->
	</div>
	</div>

<!--End Container-->
<!-- datatable -->
<script src="<%=request.getContextPath() %>/templates/admin/datatable/js/jquery.dataTables.min.js"></script>
<script src="<%=request.getContextPath() %>/templates/admin/datatable-bootstrap/js/dataTables.bootstrap.min.js"></script>
<!-- /datatable -->


</body>
</html>
