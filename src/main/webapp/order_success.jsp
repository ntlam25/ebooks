<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đặt hàng thành công</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f7f7f7">
	<%-- Navbar --%>
	<%@include file="all_component/navbar.jsp"%>
	
	<div class="container text-center mt-3" style="min-height: 74vh;">
		<i class="fas fa-check-circle fa-5x text-success"></i>
		<h1>Cảm ơn bạn!</h1>
		<h2>Đặt hàng thành công!</h2>
		<a href="index.jsp" class="btn btn-primary mt-3">Trang chủ</a>
		<a href="orderbook.jsp" class="btn btn-danger mt-3">Xem đơn hàng</a>
	</div>
	<%@include file="all_component/footer.jsp"%>
</body>
</html>