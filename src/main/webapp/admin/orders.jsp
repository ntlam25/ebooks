<%@page import="com.DB.DBConnect"%>
<%@page import="com.entity.Book_Order"%>
<%@page import="java.util.List"%>
<%@page import="com.DAO.BookOrderImpl"%>
<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Tất cả sách</title>
<%@include file="allCss.jsp"%>
</head>
<body style="background-color: #f7f7f7">
	<%@include file="navbar.jsp"%>
	<h4 class="text-primary text-center">Tất cả đơn hàng</h4>
	<table class="table table-striped"
		style="max-width: 1100px; margin: 0 auto;">
		<thead style="background-color: #35f0ca">
			<tr>
				<th scope="col">Mã đơn hàng</th>
				<th scope="col">Tên khách hàng</th>
				<th scope="col">Địa chỉ</th>
				<th scope="col">Số điện thoại</th>
				<th scope="col">Tên sách</th>
				<th scope="col">Tên tác giả</th>
				<th scope="col">Giá</th>
			</tr>
		</thead>
		<tbody>
				<%
				User user = (User) session.getAttribute("userobj");
				BookOrderImpl dao = new BookOrderImpl(DBConnect.getConn());
				List<Book_Order> list = dao.getAllBook();
				for (Book_Order b : list) {
			%>
			<tr>
				<th scope="row"><%=b.getOrderId()%></th>
				<td><%=b.getUsername()%></td>
				<td><%=b.getAddress()%></td>
				<td><%=b.getPhone()%></td>
				<td><%=b.getBookname()%></td>
				<td><%=b.getAuthor()%></td>
				<td><%=b.getPrice()%></td>
			</tr>
			<%
				}
			%>
		</tbody>
	</table>
	<div style="margin-top: 140px">
		<%@include file="footer.jsp"%>
	</div>
</body>
</html>