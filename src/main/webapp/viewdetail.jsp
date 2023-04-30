<%@page import="com.entity.User"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.entity.Book"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%
	int id = Integer.parseInt(request.getParameter("id"));
	BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
	Book book = dao.getBookById(id);
%>
<%@include file="all_component/allCss.jsp"%>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title><%=book.getBookName()%></title>
</head>
<body>
	<%@include file="all_component/navbar.jsp"%>
	
	<%
		User user = (User) session.getAttribute("userobj");
	%>
	
	<div class="container" style="min-height: 74vh;">
		<div class="card">
			<div class="card-body">
				<div class="row">

					<div class="col-lg-5 col-md-5 col-sm-6">
						<div>
							<a href="index.jsp" class="text-muted">Ebooks/</a>
							<%
								if (book.getCategory().equalsIgnoreCase("Mới")) {
							%>
							<a href="newbooks.jsp" class="text-muted">Sách Mới/</a>
							<%
								} else {
							%>
							<a href="oldbooks.jsp" class="text-muted">Sách Cũ/</a>
							<%
								}
							%>
							<a href=viewdetail.jsp?id=<%=book.getBookId()%> class="text-muted"><%=book.getBookName()%></a>
						</div>
						<div class="white-box text-center mt-3">
							<img src="img/book/<%=book.getPhotoName()%>"
								class="img-responsive"
								style="max-width: 100%; width: 250px; height: 400px">
						</div>
					</div>
					<div class="col-lg-7 col-md-7 col-sm-6 mt-5">
						<h3 class="card-title"><%=book.getBookName()%></h3>
						<h2 class="mt-5">
							<%=book.getPrice()%><small> VNĐ</small>
						</h2>
							<%
								if (user == null)
								{%>
									<a href="login.jsp" class="btn btn-danger btn-sm"><i
											class="fas fa-cart-plus"></i> Mua ngay</a> 
								<%}else{
								%>
									<a href="cart?bookid=<%=book.getBookId() %>&userid=<%=user.getId()%>" class="btn btn-danger btn-sm"><i
											class="fas fa-cart-plus"></i> Mua ngay</a> 
								<%}
							%>
					</div>
					<div class="col-lg-12 col-md-12 col-sm-12">
						<h3 class="box-title mt-5">Thông tin sản phẩm</h3>
						<div class="table-responsive">
							<table class="table table-striped table-product">
								<tbody>
									<tr>
										<td width="390">Tên sách</td>
										<td><%=book.getBookName()%></td>
									</tr>
									<tr>
										<td>Tác giả</td>
										<td><%=book.getAuthor()%></td>
									</tr>
									<tr>
										<td>Loại</td>
										<td><%=book.getCategory()%></td>
									</tr>

								</tbody>
							</table>
						</div>
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