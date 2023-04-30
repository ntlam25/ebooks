<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cài đặt</title>
<%@include file="all_component/allCss.jsp"%>

</head>
<body style="background-color: #f7f7f7;">
	<%@include file="all_component/navbar.jsp"%>

	<div class="container" style="min-height: 74vh;">
		<div class="row">
			<div class="col-md-6 p-3">
				<div class="card">
					<div class="card-body text-center">
						<a href="edit_profile.jsp" class="name-func"><i
							class="fas fa-edit fa-3x text-success"></i><br>Sửa hồ sơ</a>
					</div>
				</div>
			</div>
			<div class="col-md-6 p-3">
				<div class="card">
					<div class="card-body text-center">
						<a href="orderbook.jsp" class="name-func"><i
							class="fas fa-box-open fa-3x text-danger"></i><br>Đơn hàng</a>
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