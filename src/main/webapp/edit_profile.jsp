<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Sửa hồ sơ</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2">
	<%@include file="all_component/navbar.jsp"%>
	<%
		User user = (User) session.getAttribute("userobj");
	%>
	
	<c:if test="${empty userobj }">
		<c:redirect url="./login.jsp"></c:redirect>
	</c:if>
	<div class="container p-3" style="min-height: 74vh;">
		<div class="row">
			<div class="col-md-4" style="margin: 0 auto;">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center">Cập nhật hồ sơ</h4>
						<!--Thông báo  -->
						<c:if test="${not empty failedMsg }">
							<p class="text-danger text-center">${failedMsg}</p>
							<c:remove var="failedMsg" scope="session" />
						</c:if>
						<c:if test="${not empty succMsg }">
							<p class="text-success text-center">${succMsg}</p>
							<c:remove var="succMsg" scope="session" />
						</c:if>
						<!--Kết thúc thông báo -->
						<form action="edit_profile" method="post">
							<div class="form-group">
								<input type="hidden" value="${userobj.id}" name="id"> <label
									for="exampleInputPassword">Mật khẩu</label> <input
									type="password" class="form-control" id="exampleInputPassword"
									placeholder="Nhập mật khẩu cũ" required="required"
									name="password">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Mật khẩu mới</label> <input
									type="password" class="form-control" id="exampleInputPassword1"
									placeholder="Nhập mật khẩu mới" name="password1">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword2">Nhập lại mật khẩu</label> <input
									type="password" class="form-control" id="exampleInputPassword2"
									placeholder="Nhập lại mật khẩu" name="password2">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Email</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Nhập email"
									required="required" name="email" value="${userobj.email}">
							</div>
							<div class="form-group">
								<label for="exampleInputPhoneNumber1">Số điện thoại</label> <input
									type="text" class="form-control" id="exampleInputPhoneNumber1"
									placeholder="Nhập số điện thoại" name="phoneNumber"
									value="${userobj.phoneNumber}">
							</div>
							<div class="form-group">
								<label for="exampleInputAddress1">Địa chỉ</label> <input
									type="text" class="form-control" id="exampleInputAddress1"
									placeholder="Nhập địa chỉ" name="address">
							</div>
							<div class="text-center">
								<button type="submit" class="btn btn-primary col-md-12">Cập
									nhật</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div style="position: relative; top: 100px">
		<%@include file="all_component/footer.jsp"%>
	</div>
</body>
</html>