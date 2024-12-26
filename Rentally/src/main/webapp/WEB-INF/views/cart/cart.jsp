<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="../common/headMeta.jsp"%>
<meta charset="UTF-8">
<title>Shop Wishlist eCommerce HTML Template - FreshCart</title>
<%@include file="../common/headLinks.jsp"%>

</head>
<body>
	<%@include file="../common/header.jsp"%>
	<main>
		<!-- section-->
		<div class="mt-4">
			<div class="container">
				<!-- row -->
				<div class="row">
					<!-- col -->
					<div class="col-12">
						<!-- breadcrumb -->
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb mb-0">
								<li class="breadcrumb-item"><a href="#!">Home</a></li>
								<li class="breadcrumb-item"><a href="#!">Shop</a></li>
								<li class="breadcrumb-item active" aria-current="page">MyCart</li>
							</ol>
						</nav>
					</div>
				</div>
			</div>
		</div>
		<!-- section -->
		<section class="mt-8 mb-14">
			<div class="container">
				<!-- row -->
				<div class="row">
					<div class="col-lg-12">
						<div class="mb-8">
							<!-- heading -->
							<h1 class="mb-1">My Cart</h1>
							<!-- 숫자 카운팅 -->
							<p>There are 5 products in this cart.</p>
						</div>
						<div>
							<!-- table -->
							<div class="table-responsive">
								<table class="table text-nowrap table-with-checkbox">
									<thead class="table-light">
										<tr>
											<th>img</th>
											<th>Product</th>
											<th>Amount</th>										
											<th>Actions</th>
											<th>Remove</th>
										</tr>
									</thead>
									<tbody>
										
										<c:forEach items="${cartList }" var="cart" varStatus="status">
										<tr>
											<td class="align-middle">
												<a href="#">
													<img
													src="${cart.product_img}"
													class="icon-shape icon-xxl" alt="상품이미지" />
												</a>
											</td>
											<td class="align-middle">
												<div>
													<h5 class="fs-6 mb-0">
														<a href="#" class="text-inherit">${cart.product_name }</a>
													</h5>
													<small>${cart.cart_option }개월</small>
												</div>
											</td>
											<td class="align-middle">${cart.product_pay }</td>
											
											<td class="align-middle">
												<div class="btn btn-primary btn-sm">Subscribe</div>
											</td>
											<td class="align-middle">
												<a href="#" class="text-muted"
												data-bs-toggle="tooltip" data-bs-placement="top"
												title="Delete">
												<i class="feather-icon icon-trash-2"></i>
												</a>
											</td>
										</tr>
										</c:forEach>
										<c:if test="${empty cartList}">
   											 <p>장바구니에 항목이 없습니다.</p>
										</c:if>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</main>

	<!-- Footer -->
	<%@include file="../common/footer.jsp"%>
	<!-- Javascript-->
	<%--@include file="../partials/scripts.html"--%>
</body>
</html>