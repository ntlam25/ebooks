<%@page import="com.entity.Cart"%>
<%@page import="com.DAO.CartDAOImpl"%>
<%@page import="com.entity.User"%>
<%@page import="java.util.List"%>
<%@page import="com.DAO.CartDAOImpl"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Giỏ hàng</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f7f7f7">
	<%-- Navbar --%>
	<%@include file="all_component/navbar.jsp"%>

	<%
		User user = (User) session.getAttribute("userobj");
	%>
	<c:if test="${not empty failedMsg }">
		<h3 class="text-danger text-center">${failedMsg}</h3>
		<c:remove var="failedMsg" scope="session" />
	</c:if>
	<div class="container-fluid" style="min-height: 74vh;">
		<div class="row">
			<div class="col-md-7">
				<div class="card mt-2">
					<div class="card-body">
						<h3 class="text-center" style="color: black">Giỏ hàng của bạn</h3>
						<table class="table table-striped">
							<thead>
								<tr>
									<th scope="col">STT</th>
									<th scope="col">Tên sách</th>
									<th scope="col">Tên tác giả</th>
									<th scope="col">Giá</th>
									<th scope="col">Thao tác</th>
								</tr>
							</thead>
							<tbody>
								<%
									CartDAOImpl dao = new CartDAOImpl(DBConnect.getConn());
									List<Cart> list = dao.getBookByUser(user.getId());
									int i = 1;
									Double totalPrice = 0.0;
									for (Cart cart : list) {
										totalPrice = cart.getTotalPrice();
								%>
								<tr>
									<th><%=i++%></th>
									<td><%=cart.getBookName()%></td>
									<td><%=cart.getAuthor()%></td>
									<td><%=cart.getPrice()%></td>
									<td><a
										href="remove_book?bookid=<%=cart.getBookid()%>&&userid=<%=cart.getUserid()%>"
										class="btn btn-sm btn-danger"><i class="fas fa-trash-alt"></i>
											Xoá</a></td>
								</tr>
								<%
									}
								%>
								<tr>
									<td>Tổng giá tiền</td>
									<td></td>
									<td></td>
									<td></td>
									<td><%=totalPrice%></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>

			<div class="col-md-5">
				<div class="card mt-2">
					<div class="card-body">
						<h3 class="text-center" style="color: black">Chi tiết đơn
							hàng của bạn</h3>
						<form action="order" method="post">
							<input type="hidden" value="${userobj.id}" name="id">
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="name">Tên</label> <input type="text"
										class="form-control" placeholder="Nhập tên của bạn" id="name"
										name="name" required="required">
								</div>
								<div class="form-group col-md-6">
									<label for="name">Email</label> <input type="text"
										class="form-control" placeholder="Nhập email" id="email"
										value="${userobj.email}" name="email" required="required">
								</div>
							</div>

							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="phoneNumber">Số điện thoại</label> <input
										type="text" class="form-control"
										placeholder="Nhập số điện thoại" id="phoneNumber"
										value="${userobj.phoneNumber}" name="phone"
										required="required">
								</div>
								<div class="form-group col-md-6">
									<label for="address">Địa chỉ</label> <input type="text"
										class="form-control" placeholder="Nhập địa chỉ của bạn"
										id="address" value="${userobj.address }" name="address"
										required="required">
								</div>
							</div>
							<div class="text-center">
								<button class="btn btn-danger mt-4" type="submit">Đặt
									hàng</button>
								<a href="allbook.jsp" class="btn btn-success mt-4">Mua hàng
									tiếp</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Footer -->
	<div style="position: relative; top: 100px">
		<%@include file="all_component/footer.jsp"%>
	</div>
</body>
</html>