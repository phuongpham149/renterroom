<%@page import="bean.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bo.CatBo"%>
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
			<form class="form-horizontal" role="form" action="<%=request.getContextPath()%>/Host_RoomAddAction?type=submit" method="post" enctype="multipart/form-data">
				 <div class="form-group">
					<label class="col-lg-2 control-label">Loại phòng</label>
					<div class="col-lg-8">

				    <select class="form-control form-effect" name="idCategory">
					<%	
					  CatBo catBo = new CatBo();

					  ArrayList<Category> alCat =(ArrayList<Category>) catBo.getListCat();
					  for( Category objCat : alCat){
					%>
                        <option value="<%=objCat.getIdCategory()%>" ><%=objCat.getNameCategory()%></option>
                    <%} %>
                        </select>
                
					</div>
				</div>
				<div class="form-group">
					<label class="col-lg-2 control-label">Tên phòng</label>
					<div class="col-lg-8">
						<input class="form-control input-medium" type="text" name="nameRoom" value="" required>
					</div>
				</div>
				<div class="form-group">
					<label class="col-lg-2 control-label">Giá</label>
					<div class="col-lg-8">
						<input class="form-control input-medium" type="number" name="cost" value="" required>
					</div>
				</div>
				<div class="form-group">
					<label class="col-lg-2 control-label">Mô tả</label>
					<div class="col-lg-8">
						<textarea  id="editor1" rows="10" cols="30" type="text" name = "description" class="form-control form-effect">
			                
			            </textarea>
					</div>
				</div>
				<div class="form-group">
					<label class="col-lg-2 control-label">Hình ảnh</label>
					<div class="col-lg-8">
						<input  type="file" name="image" value="" required>
					</div>
				</div>
				<div class="form-group">
					<label class="col-lg-2 control-label">Số đường</label>
					<div class="col-lg-8">
						<input class="form-control input-medium" type="text" name="street" value="" required>
					</div>
				</div>
				<div class="form-group">
					<label class="col-lg-2 control-label">Quận</label>
					<div class="col-lg-8">
						<select class="form-control form-effect" name="district">
                        	<option value="Liên chiểu" >Liên Chiểu</option>
                        	<option value="Cẩm lệ " >Cẩm lệ</option>
                        	<option value="Thanh Khê" >Thanh khê</option>
                        	<option value="Sơn Trà " >Sơn Trà</option>
                        </select>
					</div>
				</div>
				<div class="form-group">
		            <label class="col-lg-2 control-label"></label>
		            <div class="col-md-8">
		             	<input type="submit" class="btn btn-primary" value="Thêm" name = "submit">
					    <span></span>
					    <a href="" class="btn btn-default">Hủy</a>
		            </div>
	           </div>  
		    </form>		
		</div>	
	</div>
</body>
</html>
