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
								<a href="#">Thêm phòng</a>
							</li>
						</ol>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<h2 class="page-header">Thêm phòng</h2>
				</div>
				<!-- /.col-lg-12  -->
			</div>
			<div class="col-md-9 personal-info">
			<form class="form-horizontal" role="form" action="" method="post">
				<div class="form-group">
					<label class="col-lg-2 control-label">Tên phòng</label>
					<div class="col-lg-8">
						<input class="form-control input-medium" type="text" name="nameCat" value="" required>
					</div>
				</div>
				<div class="form-group">
					<label class="col-lg-2 control-label">Giá</label>
					<div class="col-lg-8">
						<input class="form-control input-medium" type="text" name="nameCat" value="" required>
					</div>
				</div>
				<div class="form-group">
					<label class="col-lg-2 control-label">Mô tả</label>
					<div class="col-lg-8">
						<textarea  id="editor1" rows="10" cols="30" type="text" name = "education" class="form-control form-effect">
			                
			            </textarea>
					</div>
				</div>
				<div class="form-group">
					<label class="col-lg-2 control-label">Hình ảnh</label>
					<div class="col-lg-8">
						<input  type="file" name="nameCat" value="" required>
					</div>
				</div>
				<div class="form-group">
					<label class="col-lg-2 control-label">Số đường</label>
					<div class="col-lg-8">
						<input class="form-control input-medium" type="text" name="nameCat" value="" required>
					</div>
				</div>
				<div class="form-group">
					<label class="col-lg-2 control-label">Quận</label>
					<div class="col-lg-8">
						<select class="form-control form-effect" name="category">
                        		<option value="" >adc</option>
                        		<option value="" >adcd</option>
                        </select>
					</div>
				</div>
				<div class="form-group">
		            <label class="col-lg-2 control-label"></label>
		            <div class="col-md-8">
		              <input type="submit" class="btn btn-primary" value="Thêm">
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
