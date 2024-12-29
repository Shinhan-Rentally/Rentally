<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="../common/headMeta.jsp"%>
<meta charset="UTF-8">
<title>My Cart - Rentally</title>
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
								<li class="breadcrumb-item"><a href="${path}/main">Home</a></li>
								<li class="breadcrumb-item"><a href="#!">Shop</a></li>
								<li class="breadcrumb-item active" aria-current="page">My Cart</li>
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
							<p class="cart-count">${cartList.size()}개의 상품이 장바구니에 담겨있습니다.</p>
						</div>
						<div>
							<!-- table -->
							<div class="table-responsive">
								<table class="table text-nowrap table-with-checkbox">
									<thead class="table-light">
										<tr>
											<th>이미지</th>
											<th>상품명</th>
											<th>월 구독료</th>										
											<th>구독</th>
											<th>제거</th>
										</tr>
									</thead>
									<tbody>
										
										<c:forEach items="${cartList}" var="cart" varStatus="status">
										<tr>
											<td class="align-middle">
												<a href="#">
													<img
													src="https://rentally.s3.ap-northeast-2.amazonaws.com/${cart.category_seq}/${cart.product_img}" alt="${cart.product_name}"
													class="icon-shape icon-xxl" alt="${cart.product_name}" />
												</a>
											</td>
											<td class="align-middle">
												<div>
													<h5 class="fs-6 mb-0">
														<a href="#" class="text-inherit">${cart.product_name}</a>
													</h5>
													<span>
														<small>
															<c:if test="${cart.cart_option >=12}">
																<fmt:formatNumber value="${cart.cart_option / 12}" type="number"/>년
															</c:if>
															<c:if test="${cart.cart_option < 12}">${cart.cart_option }개월</c:if>
														</small>
													</span>
												</div>
											</td>
											<td class="align-middle">
												월 <fmt:formatNumber value="${cart.product_pay}" type="number" pattern="#,###"/> 원
											</td>
											
											<td class="align-middle">
												<form action="${path}/payment" method="post" name="subForm">
													<input type="hidden" name="sub_seq" value="${cart.product_seq}">
													<input type="hidden" name="sub_name" value="${cart.product_name}">
													<input type="hidden" name="sub_period" value="${cart.cart_option}">
													<button class="btn btn-primary btn-sm" id="subscribe">Subscribe</button>
												</form>
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
	<script src="${path}/resources/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
	<script src="${path}/resources/libs/simplebar/dist/simplebar.min.js"></script>
	<script src="${path}/resources/js/main.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

	<!-- Footer -->
	<%@include file="../common/footer.jsp"%>
</body>
</html>