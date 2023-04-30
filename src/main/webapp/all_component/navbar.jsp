<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ include file="allCss.jsp"%>
<link rel="stylesheet" href="style.css">
<div class="container-fluid p-3 bg-light header-wrap">
	<div class="row">
		<div class="col-md-3">
			<a href="index.jsp" class="text-info logo"> <i
				class="fas fa-book"></i>EBooks
			</a>
		</div>
		<div class="col-md-6">
			<form class="form-inline my-2 my-lg-0" action="search.jsp" method="post">
				<input class="form-control mr-lg-2 col-9 col-lg-6 form-search-input"
					type="search" name="search" placeholder="Tìm kiếm" aria-label="Search">
				<button class="btn btn-success my-2 my-sm-0 col-3 col-lg-2"
					type="submit">Tìm kiếm</button>
			</form>
		</div>
		<div class="col-md-3 login-register">
			<c:if test="${not empty userobj }">	
				<a href="cart.jsp" style="vertical-align: middle"><i
					class="fas fa-cart-plus fa-2x"></i></a>

				<a href="edit_profile.jsp" class="btn btn-success"><i
					class="fas fa-user"></i> ${ userobj.getUserName() }</a>
				<a data-toggle="modal" data-target="#exampleModalCenter"
					class=" btn btn-primary text-white"><i
					class="fas fa-sign-out-alt"></i> Đăng xuất</a>
			</c:if>
			<c:if test="${empty userobj }">
				<a href="./login.jsp" class="btn btn-success"><i
					class="fas fa-sign-in-alt"></i> Đăng nhập</a>
				<a href="./register.jsp" class="btn btn-primary"><i
					class="fas fa-user-plus"></i> Đăng kí</a>
			</c:if>
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
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy</button>
				<a href="./logout" type="button" class="btn btn-primary text-white">Đồng ý</a>
			</div>
		</div>
	</div>
</div>
<!-- kết thúc logout modal -->

<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
	<a class="navbar-brand ml-2" href="${context}/"><i
		class="fas fa-home"></i> </a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="index.jsp">Trang
					chủ <span class="sr-only">(current)</span>
			</a></li>
			<li class="nav-item active"><a class="nav-link"
				href="allbook.jsp"><i class="fas fa-book-open"></i> Tất Cả Sách</a></li>
			<li class="nav-item active"><a class="nav-link"
				href="newbooks.jsp"><i class="fas fa-book-open"></i> Sách Mới</a></li>
			<li class="nav-item active"><a class="nav-link"
				href="oldbooks.jsp"><i class="fas fa-book-open"></i> Sách Cũ</a></li>
		</ul>
		<form class="form-inline my-2 my-lg-0 pr-5">
			<a href="setting.jsp" class="btn btn-light my-2 my-sm-0" type="submit">
				<i class="fas fa-cog"></i> Cài đặt
			</a>
		</form>
	</div>
</nav>

