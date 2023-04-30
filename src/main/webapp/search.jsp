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
<title>Kết quả tìm kiếm</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f7f7f7">
	<%-- Navbar --%>
	<%@include file="all_component/navbar.jsp"%>

	<%
		User user = (User) session.getAttribute("userobj");
	%>

	<!-- Bắt đầu Sách cũ-->
	<div class="container p-3" style="min-height: 74vh;">
		<div class="row">
			<%
				String search = request.getParameter("search");
				BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
				List<Book> list = dao.getBookBySearch(search);

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
	<!-- Kết thúc Sách cũ -->

	<!-- Footer -->
	<div style="position: relative; top: 100px">
		<%@include file="all_component/footer.jsp"%>
	</div>
</body>
</html>