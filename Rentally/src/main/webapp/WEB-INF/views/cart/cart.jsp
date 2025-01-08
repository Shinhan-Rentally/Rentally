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
<c:set var="page" value="cart" />
</head>
<body>
	<%@include file="../common/header.jsp"%>
	<main>
		<!-- section -->
		<section class="mt-8 mb-14">
			<div class="container">
				<!-- row -->
				<div class="row">
					<%@include file="../common/myPageNavbar.jsp"%>
					<div class="col-lg-8">
						<div class="mb-8">
							<!-- heading -->
							<h1 class="mb-1">장바구니</h1>
							<!-- 숫자 카운팅 -->
							<p class="cart-count"><span>${cartList.size()}</span>개의 상품이 장바구니에 담겨있습니다.</p>
						</div>
						<div>
							<!-- table -->
							<div class="table-responsive">
								<table class="table text-nowrap table-with-checkbox">
									<thead class="table-light"> 
										<tr>
											<th></th>
											<th>상품명</th>
											<th class="text-center">구독료</th>								
											<th>구독</th>
											<th>삭제</th>
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
												<a href="#" class="text-muted delete" title="Delete"
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
		<!-- 장바구니 삭제 알림 modal -->
		<div class="modal fade" id="alertModal" tabindex="-1" aria-labelledby="alertModalLabel" aria-hidden="true">
		    <div class="modal-dialog">
		        <div class="modal-content">
		            <div class="modal-header">
		                <h5 class="modal-title" id="alertModalLabel">알림</h5>
		                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		            </div>
		            <div class="modal-body" id="alertModalMessage"></div>
		            <div class="modal-footer">
		                <button type="button" class="btn btn-info" data-bs-dismiss="modal">확인</button>
		            </div>
		        </div>
		    </div>
		</div>
		
	</main>
	<script src="${path}/resources/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
	<script src="${path}/resources/libs/simplebar/dist/simplebar.min.js"></script>
	<script src="${path}/resources/js/main.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<script>
		//장바구니 삭제 버튼 호버
		$('.delete').on("hover", function(){
			$(this).addClass()
		})
		//장바구니 삭제 메세지
		function showModalMessage(message){
			$('#alertModalMessage').text(message);
			$('#alertModal').modal('show');
		}
		$('.delete').click(function(){
			var item = $(this).closest("tr").find("input[name='product_seq']").val();
			var currentCount = parseInt($(".cart-count span").text(), 10);
			$.ajax({
				url: "${path}/cart/product/delete",
				type: "post",
				data: {
					product_seq: item
					},
				success: function(response){
					$("tr").has("input[value='" + item + "']").remove();
					$(".cart-count span").text(currentCount - 1);
					showModalMessage('장바구니에서 상품이 삭제되었습니다.');
					// 갯수 업데이트
                    updateCounts();
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