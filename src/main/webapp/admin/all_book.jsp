<%@page import="com.entity.Book"%>
<%@page import="java.util.List"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="com.DB.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Tất cả sách</title>
<%@include file="allCss.jsp"%>
</head>
<body style="background-color: #f7f7f7;">
	<%@include file="navbar.jsp"%>
	
	<c:if test="${empty userobj }">
		<c:redirect url="../login.jsp"></c:redirect>
	</c:if>
	
	<h4 class="text-primary text-center">Tất cả sách</h4>
	<!--Thông báo  -->
	<c:if test="${not empty succMsg }">
		<h4 class="text-center text-success">${succMsg}</h4>
		<c:remove var="succMsg" scope="session" />
	</c:if>
	<c:if test="${not empty failedMsg }">
		<h4 class="text-center text-danger">${failedMsg}</h4>
		<c:remove var="failedMsg" scope="session" />
	</c:if>
	<!--Hết thông báo  -->
	<table class="table table-striped"
		style="max-width: 1100px; margin: 0 auto; min-height: 450px">
		<thead style="background-color: #35f0ca">
			<tr>
				<th scope="col">Mã</th>
				<th scope="col">Tên sách</th>
				<th scope="col">Tên tác giả</th>
				<th scope="col">Giá</th>
				<th scope="col">Loại sách</th>
				<th scope="col">Ảnh</th>
				<th scope="col">Thao tác</th>
			</tr>
		</thead>
		<tbody>
			<%
				BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
				List<Book> list = dao.getAllBooks();
				for (Book b : list) {
			%>
			<tr>
				<th><%=b.getBookId()%></th>
				<td><%=b.getBookName()%></td>
				<td><%=b.getAuthor()%></td>
				<td><%=b.getPrice()%></td>
				<td><%=b.getCategory()%></td>
				<td><img alt="photoName"
					src="../img/book/<%=b.getPhotoName()%>"
					style="width: 50px; height: 50px;"></td>
				<td><a href="edit_book.jsp?id=<%=b.getBookId()%>"
					class="btn btn-sm btn-primary"><i class="fas fa-edit"></i> Sửa</a>
					<a href="../delete_book?id=<%=b.getBookId()%>"
					class="btn btn-sm btn-danger"><i class="fas fa-trash-alt"></i> Xóa</a></td>
			</tr>
			<%
				}
			%>

		</tbody>
	</table>
	
	<div style="position: relative; top: 100px">
		<%@include file="footer.jsp"%>
	</div>
</body>
</html>