<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="../common/headMeta.jsp"%>
<meta charset="UTF-8">
<title>장바구니 - Rentally</title>
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
								<li class="breadcrumb-item active" aria-current="page">장바구니</li>
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
							<h1 class="mb-1">장바구니</h1>
							<!-- 숫자 카운팅 -->
							<p class="cart-count">${cartList.size()}개의 상품이 장바구니에 담겨있습니다.</p>
						</div>
						<div>
							<!-- table -->
							<div class="table-responsive">
								<table class="table text-nowrap table-with-checkbox">
									<thead class="table-light"> 
										<tr>
											<th></th>
											<th>상품명</th>
											<th>구독료</th>										
											<th>구독</th>
											<th>제거</th>
										</tr>
									</thead>
									<tbody>
										
										<c:forEach items="${cartList}" var="cart" varStatus="status">
										<tr>
											<td class="align-middle">
												<a href="${path}/product/detail?product_seq=${cart.product_seq}">
													<img
													src="https://rentally.s3.ap-northeast-2.amazonaws.com/${cart.category_seq}/${cart.product_img}" alt="${cart.product_name}"
													class="icon-shape icon-xxl" alt="${cart.product_name}" />
												</a>
											</td>
											<td class="align-middle">
												<div>
													<h5 class="fs-6 mb-0">
														<a href="${path}/product/detail?product_seq=${cart.product_seq}" class="text-inherit">${cart.product_name}</a>
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
													<input type="hidden" name="product_seq" value="${cart.product_seq}">
													<input type="hidden" name="product_name" value="${cart.product_name}">
													<input type="hidden" name="cart_option" value="${cart.cart_option}">
													<input type="hidden" name="isCart" value="true">
													<button class="btn btn-info btn-sm" id="subscribe">구독</button>
												</form>
											</td>
											<td class="align-middle">
												<a href="#" class="text-muted delete"
												data-bs-toggle="tooltip" data-bs-placement="top">
												<i class="feather-icon icon-trash-2"></i>
												</a>
											</td>
										</tr>
										</c:forEach>
										
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
	<script>
		$('.delete').click(function(){
			var item = $(this).closest("tr").find("input[name='product_seq']").val();
			$.ajax({
				url: "${path}/cart/product/delete",
				type: "post",
				data: {
					product_seq: item
					},
				success: function(response){
					$("tr").has("input[value='" + item + "']").remove();
					alert("장바구니에서 상품이 삭제되었습니다.");
				},
				error: function(){
					alert("장바구니 삭제 실패");
				}
			});
		});
	</script>
	<!-- Footer -->
	<%@include file="../common/footer.jsp"%>
	<%@ include file="../common/bottomKakao.jsp" %>
</body>
</html>