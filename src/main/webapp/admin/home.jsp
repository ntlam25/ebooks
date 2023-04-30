<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin: home</title>
<%@include file="allCss.jsp"%>
<style type="text/css">
.name-func {
	text-decoration: none;
	color: black;
	font-size: 20px;
	font-weight: 40px;
}

.name-func:hover {
	text-decoration: none;
	color: #0dd4ad;
}
</style>
</head>
<body style="background-color: #f7f7f7;">
	<%@include file="navbar.jsp"%>
	
	<c:if test="${empty userobj }">
		<c:redirect url="../login.jsp"></c:redirect>
	</c:if>
	
	<div class="container">
		<div class="row" style="min-height: 380px">
			<div class="col-md-3 p-3">
				<div class="card">
					<div class="card-body text-center">
						<a href="add_books.jsp" class="name-func"><i
							class="fas fa-plus-square fa-3x text-primary"></i><br>Thêm
							sách</a>
					</div>
				</div>
			</div>

			<div class="col-md-3 p-3">

				<div class="card">
					<div class="card-body text-center">
						<a href="all_book.jsp" class="name-func"><i
							class="fas fa-book-open fa-3x text-danger"></i><br>Tất cả
							sách</a>
					</div>
				</div>
			</div>

			<div class="col-md-3 p-3">
				<div class="card">
					<div class="card-body text-center">
						<a href="orders.jsp" class="name-func"><i
							class="fas fa-box-open fa-3x text-warning"></i><br>Đơn hàng</a>
					</div>
				</div>
			</div>

			<div class="col-md-3 p-3">
				<div class="card">
					<div class="card-body text-center">
						<a href="../logout" class="name-func" data-toggle="modal"
							data-target="#exampleModalCenter"><i
							class="fas fa-sign-out-alt fa-3x text-success"></i><br>Đăng
							xuất</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Modal -->
	<div class="modal fade" id="exampleModalCenter" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalCenterTitle"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle"></h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<h4 class="text-center">Bạn có muốn đăng xuất</h4>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Hủy</button>
					<a href="../logout" type="button"
						class="btn btn-primary text-white">Đồng ý</a>
				</div>
			</div>
		</div>
	</div>
	
	<div style="position: relative; top: 100px">
		<%@include file="footer.jsp"%>
	</div>
</body>
</html>