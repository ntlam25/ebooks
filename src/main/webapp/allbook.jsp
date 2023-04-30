<%@page import="com.entity.User"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.Book"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
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
#toast {
	max-width: 300px;
	position: fixed;
	bottom: 30px;
	left:33%;
	right: 33%;
	font-weight: 600;
	background: limegreen;
	padding: 10px;
	color: white;
	text-align: center;
	z-index: 1;
	font-size: 18px;
	visibility: hidden;
	box-shadow: 0 0 50px #000;
}

#toast.display {
	margin: 0 auto;
	visibility: visible;
	animation: fadeIn 0.75, fadeOut 0.75s 2.5s;
}

@keyframe fadeIn {
	from {
		bottom: 0;
		opacity: 0;
	}
	to {
		bottom: 30px;
		opacity: 1;
	}	
}

@keyframe fadeOut {
	from {
		bottom: 30px;
		opacity: 1;
	}
	to {
		bottom: 0;
		opacity: 0;
	}	
}
</style>
</head>
<body style="background-color: #f7f7f7">

	<c:if test="${not empty addCart }">

		<div id="toast">${addCart}</div>
		<script type="text/javascript">
		showToast();
		function showToast(content)
		{
			$('#toast').addClass("display");
			$('#toast').html(content);
			setTimeout(()=>{
				$('#toast').removeClass("display");
			},2000)
		}
	</script>
	<c:remove var="addCart" scope="session"/>
	</c:if>

	<%-- Navbar --%>
	<%@include file="all_component/navbar.jsp"%>
	<%
		User user = (User) session.getAttribute("userobj");
	%>
	<!-- Bắt đầu Sách mới -->
	<div class="container" style="min-height: 74vh;">
		<h3 class="text-center">Sách mới</h3>
		<div class="row">

			<%
				BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
				List<Book> list = dao.getAllNewBooks();

				for (Book book : list) {
			%>
			<div class="col-md-3">
				<div class="card card-hover">
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
								if (user == null) {
							%>
							<a href="login.jsp" class="btn btn-danger btn-sm"><i
								class="fas fa-cart-plus"></i> Thêm vào giỏ</a>
							<%
								} else {
							%>
							<a
								href="cart?bookid=<%=book.getBookId()%>&userid=<%=user.getId()%>"
								class="btn btn-danger btn-sm"><i class="fas fa-cart-plus"></i>
								Thêm vào giỏ</a>
							<%
								}
							%>
							<a href="viewdetail.jsp?id=<%=book.getBookId()%>"
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
	<!-- Kết thúc sách mới -->
	<hr>
	<!-- Bắt đầu Sách cũ-->
	<div class="container">
		<h3 class="text-center">Sách cũ</h3>
		<div class="row">
			<%
				BookDAOImpl dao1 = new BookDAOImpl(DBConnect.getConn());
				List<Book> list1 = dao1.getAllOldBooks();

				for (Book book : list1) {
			%>
			<div class="col-md-3">
				<div class="card card-hover">
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
								if (user == null) {
							%>
							<a href="login.jsp" class="btn btn-danger btn-sm"><i
								class="fas fa-cart-plus"></i> Thêm vào giỏ</a>
							<%
								} else {
							%>
							<a
								href="cart?bookid=<%=book.getBookId()%>&userid=<%=user.getId()%>"
								class="btn btn-danger btn-sm"><i class="fas fa-cart-plus"></i>
								Thêm vào giỏ</a>
							<%
								}
							%>
								<a href="viewdetail.jsp?id=<%=book.getBookId()%>"
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
	<!-- Kết thúc Sách cũ -->

	<!-- Footer -->
	<div style="position: relative; top: 100px">
		<%@include file="all_component/footer.jsp"%>
	</div>
</body>
</html>