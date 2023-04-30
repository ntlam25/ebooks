<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Đăng ký tài khoản</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2">
	<%@include file="all_component/navbar.jsp"%>
	<div class="container p-3" style="min-height: 74vh;">
		<div class="row">
			<div class="col-md-4" style="margin: 0 auto;">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center">Đăng ký tài khoản</h4>
						<!--Thông báo  -->
						<c:if test="${not empty failedMsg }">
							<p class="text-danger">${failedMsg}</p>
							<c:remove var="failedMsg" scope="session" />
						</c:if>

						<c:if test="${not empty succMsg }">
							<p class="text-success">${succMsg}</p>
							<c:remove var="succMsg" scope="session" />
						</c:if>
						<!--Hết thông báo  -->
						<form action="register" method="post">
							<div class="form-group">
								<label for="exampleInputUserName1">Tên đăng nhập*</label> <input
									type="text" class="form-control" id="exampleInputUserName1"
									placeholder="Nhập tên đăng nhập" required="required"
									name="username">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Mật khẩu*</label> <input
									type="password" class="form-control" id="exampleInputPassword1"
									placeholder="Nhập mật khẩu" required="required" name="password">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Email*</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Nhập email"
									required="required" name="email">
							</div>
							<div class="form-group">
								<label for="exampleInputPhoneNumber1">Số điện thoại</label> <input
									type="text" class="form-control"
									id="exampleInputPhoneNumber1" placeholder="Nhập số điện thoại"
									name="phoneNumber">
							</div>
							<div class="form-check">
								<input type="checkbox" class="form-check-input" name="check"
									id="exampleCheck1"> <label class="form-check-label"
									for="exampleCheck1">Đồng ý với điều khoản và điều kiện</label>
							</div>
							<button type="submit" class="btn btn-primary p-1">Đăng
								ký</button>
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