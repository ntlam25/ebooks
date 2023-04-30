<%@page import="com.entity.User"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.Book"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Trang chủ</title>
<%@include file="all_component/allCss.jsp"%>
<style>
.back-img {
	background: url("img/bookshelf.jpg");
	height: 60vh;
	width: 100%;
	background-size: 100%;
	background-repeat: no-repeat;
}

.card-hover:hover {
	background-color: #f2f2f0;
}

.card-body.text-center img {
	max-width: 100%;
}
</style>
</head>
<body style="background-color: #f7f7f7">
	
	<%
		User user = (User) session.getAttribute("userobj");
	%>
	
	<%-- Navbar --%>
	<%@include file="all_component/navbar.jsp"%>

	<div class="container-fluid back-img"
		style="display: flex; align-items: center; justify-content: center;">
		<h1 class="text-center" style="color: #00e5ff">KHO SÁCH ĐIỆN TỬ</h1>
	</div>

	<hr>
	<!-- Bắt đầu Sách mới -->
	<div class="container p-3">
		<h3 class="text-center">Sách mới</h3>
		<div class="row">

			<%
				BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
				List<Book> list = dao.getNewBooks();

				for (Book book : list) {
			%>
			<div class="col-md-3">
				<div class="card card-hover h-100">
					<div class="card-body text-center">
						<img alt="" src="img/book/<%=book.getPhotoName()%>"
							style="width: 170px; height: 245px">
						<p><%=book.getBookName()%></p>
						<p><%=book.getAuthor()%></p>
						<p>
							Giá:
							<%=book.getPrice()%>
							VNĐ
						</p>
						<p>
							Loại:
							<%=book.getCategory()%></p>
						<div class="row justify-content-center">
							
							<%
								if (user == null)
								{%>
									<a href="login.jsp" class="btn btn-danger btn-sm"><i
											class="fas fa-cart-plus"></i> Thêm vào giỏ</a> 
								<%}else{
								%>
									<a href="cart?bookid=<%=book.getBookId()%>&userid=<%=user.getId()%>" class="btn btn-danger btn-sm"><i
											class="fas fa-cart-plus"></i> Thêm vào giỏ</a> 
								<%}
							%>
							
							<a href="viewdetail.jsp?id=<%=book.getBookId()%>" class="btn btn-info btn-sm ml-2">Chi tiết</a>
						</div>
					</div>
				</div>
			</div>
			<%
				}
			%>
		</div>
	</div>
	<div class="text-center mt-2">
		<a href="newbooks.jsp" class="btn btn-danger btn-sm text-white">Xem tất cả</a>
	</div>

	<!-- Kết thúc sách mới -->
	<hr>
	<!-- Bắt đầu Sách cũ-->
	<div class="container p-3">
		<h3 class="text-center">Sách cũ</h3>
		<div class="row">
			<%
				BookDAOImpl dao1 = new BookDAOImpl(DBConnect.getConn());
				List<Book> list1 = dao1.getOldBooks();

				for (Book book : list1) {
			%>
			<div class="col-md-3">
				<div class="card card-hover h-100">
					<div class="card-body text-center">
						<img alt="" src="img/book/<%=book.getPhotoName()%>"
							style="width: 170px; height: 245px">
						<p><%=book.getBookName()%></p>
						<p><%=book.getAuthor()%></p>
						<p>
							Giá:
							<%=book.getPrice()%>
							VNĐ
						</p>
						<p>
							Loại:
							<%=book.getCategory()%></p>
						<div class="row justify-content-center">
							<%
								if (user == null)
								{%>
									<a href="login.jsp" class="btn btn-danger btn-sm"><i
											class="fas fa-cart-plus"></i> Thêm vào giỏ</a> 
								<%}else{
								%>
									<a href="cart?bookid=<%=book.getBookId()%>&userid=<%=user.getId()%>" class="btn btn-danger btn-sm"><i
											class="fas fa-cart-plus"></i> Thêm vào giỏ</a> 
								<%}
							%>
							<a href="viewdetail.jsp?id=<%=book.getBookId() %>"
								class="btn btn-info btn-sm ml-2">Chi tiết</a>
						</div>
					</div>
				</div>
			</div>
			<%
				}
			%>

		</div>
	</div>

	<div class="text-center mt-2">
		<a href="oldbooks.jsp" class="btn btn-danger btn-sm text-white">Xem tất cả</a>
	</div>
	<!-- Kết thúc Sách cũ -->

	<!-- Footer -->
	<div style="position: relative; top: 100px">
		<%@include file="all_component/footer.jsp"%>
	</div>
</body>
</html>