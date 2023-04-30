<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<title>Thêm sách</title>
<%@include file="allCss.jsp"%>
</head>
<body style="background-color: #f7f7f7;">
	<%@include file="navbar.jsp"%>
	
	<c:if test="${empty userobj }">
		<c:redirect url="../login.jsp"></c:redirect>
	</c:if>
	
	<div class="container p-3">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center">Thêm sách</h4>
						<!--Thông báo  -->
						<c:if test="${not empty succMsg }" />
							<p class="text-center text-success">${succMsg}</p>
							<c:remove var="succMsg" scope="session" />
						<c:if test="${not empty failedMsg }" />
							<p class="text-center text-danger">${failedMsg}</p>
							<c:remove var="failedMsg" scope="session" />
						<!--Hết thông báo  -->
						<form action="../add_books" method="post"
							enctype="multipart/form-data" accept-charset="UTF-8">
							<div class="form-group">
								<label for="exampleInputBookName1">Tên sách</label> <input
									type="text" class="form-control" id="exampleInputBookName1"
									placeholder="Nhập tên sách" name="bookname">
							</div>
							<div class="form-group">
								<label for="exampleInputAuthorName1">Tên tác giả</label> <input
									type="text" class="form-control" id="exampleInputAuthorName1"
									placeholder="Nhập tên tác giả" name="author">
							</div>
							<div class="form-group">
								<label for="exampleInputPrice1">Giá</label> <input type="number"
									class="form-control" id="exampleInputPrice1"
									placeholder="Nhập giá" name="price">
							</div>
							<div class="form-group">
								<label for="inputState">Loại sách</label> <select
									class="form-control" id="inputState" name="categories">
									<option selected>--chọn--</option>
									<option value="Mới">Mới</option>
									<option value="Cũ">Cũ</option>
								</select>
							</div>
							<div class="form-group">
								<label for="exampleFormControlFile1">Tải ảnh lên</label> <input
									type="file" class="form-control-file"
									id="exampleFormControlFile1" name="bookimg">
							</div>
							<div class="text-center">
								<button type="submit" class="btn btn-primary col-md-12">Thêm</button>							
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Footer -->
	<div style="position: relative; top: 100px">
		<%@include file="footer.jsp"%>
	</div>
</body>
</html>