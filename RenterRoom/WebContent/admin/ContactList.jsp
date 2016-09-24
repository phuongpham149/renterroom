<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../templates/admin/inc/admin/header.jsp" %>
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
						<a href="#">Liên hệ</a>
					</li>
				</ol>
				</div>
			</div>
			</div>
			
			
			<div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Danh sách liên hệ</h1>
            </div>
            <!-- /.col-lg-12  -->
        	</div>
			 <div class="row">
        	<div class="col-lg-12">
        		<table class="table table-striped table-bordered table-hover" id="dataTables-dsSinhVien">
        			<thead>
        				<tr>
        					<td>Họ tên</td>
        					<td>Email</td>
        					<td>Số điện thoại</td>
        					<td>Nội dung</td>
        					<td></td>
        				</tr>
        			</thead>
        			<tbody id="tbl-body">
        				<tr>
        					<td>Phạm Thị Phương</td>
        					<td>phamthiphuong.cntt@gmail.com</td>
        					<td>0166 858 3242</td>
        					<td>abc xyz</td>
        					<td>
        					<input type="hidden" id="hidden-idRoom" value="" />
        						<a class="btn btn-default" href=""><i class="fa fa-edit"></i></a>
        						<button type="button" id="btn-xoa" class="btn btn-danger" data-toggle="modal" data-target="#myModal"><i class="fa fa-remove"></i></button>
        					</td>
        				</tr>
        				
        			</tbody>
        		</table>
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
		<script type="text/javascript">
			$(document).ready(function() {
				// lay ma dot dang ky	
				$('#tbl-body' ).on('click', 'button#btn-xoa', function() {
					// lay ma dot dang ky
					var idRoom = $(this).siblings('input#hidden-idRoom').val();  
					// set ma vao modal
					$('#modal-hidden-idRoom').val(idRoom);
				});
			});
		</script>
		
        
		
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
