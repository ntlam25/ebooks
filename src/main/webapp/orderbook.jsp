<%@page import="com.entity.User"%>
<%@page import="com.entity.Book_Order"%>
<%@page import="com.DAO.BookOrderImpl"%>
<%@page import="com.DAO.CartDAOImpl"%>
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
<title>Đơn hàng</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f7f7f7;">
	<%@include file="all_component/navbar.jsp"%>

	<c:if test="${empty userobj }">
		<c:redirect url="./login.jsp"></c:redirect>
	</c:if>

	<h4 class="text-primary text-center">Đơn hàng</h4>
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
		style="max-width: 1100px; margin: 0 auto; min-height: 74vh;">
		<thead class="bg-success" style="background-color: #35f0ca">
			<tr>
				<th scope="col">Mã đơn hàng</th>
				<th scope="col">Tên người đặt</th>
				<th scope="col">Tên sách</th>
				<th scope="col">Tác giả</th>
				<th scope="col">Giá</th>
			</tr>
		</thead>
		<tbody>
			<%
				User user = (User) session.getAttribute("userobj");
				BookOrderImpl dao = new BookOrderImpl(DBConnect.getConn());
				List<Book_Order> list = dao.getBook(user.getEmail());
				for (Book_Order b : list) {
			%>
			<tr>
				<th scope="row"><%=b.getOrderId()%></th>
				<td><%=b.getUsername()%></td>
				<td><%=b.getBookname()%></td>
				<td><%=b.getAuthor()%></td>
				<td><%=b.getPrice()%></td>
			</tr>
			<%
				}
			%>

		</tbody>
	</table>

	<div style="position: relative; top: 100px">
		<%@include file="all_component/footer.jsp"%>
	</div>
</body>
</html>