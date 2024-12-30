<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div class="mb-3 mb-lg-0">
    <span class="text-white" id="size" style="display: none;">${productlistsize}</span>

</div>
<div
	class="row g-4 row-cols-xl-4 row-cols-lg-3 row-cols-2 row-cols-md-2 mt-2">
	<c:forEach items="${productlist}" var="productlist">
		<!-- col -->
		<div class="col">
			<!-- card -->
			<div class="card card-product">
				<div class="card-body">
					<!-- badge -->
					<div class="text-center position-relative">

						<a href="#"> <!-- img --> <img
							src="https://rentally.s3.ap-northeast-2.amazonaws.com/${productlist.category_seq}/
													${productlist.product_img}"
							alt="Grocery Ecommerce Template" class="mb-3 img-fluid" />
						</a>

					</div>
					<h2 class="fs-6">
						<a href="#" class="text-inherit text-decoration-none">${productlist.product_name}</a>
					</h2>
					<div>
						<!-- rating -->
						<small class="text-warning"> <c:forEach var="i" begin="1"
								end="5">
								<c:choose>
									<c:when test="${i <= (productlist.review_avg)}">
										<i class="bi bi-star-fill"></i>
									</c:when>
									<c:when test="${i - 0.5 <= productlist.review_avg}">
										<i class="bi bi-star-half"></i>
									</c:when>
									<c:otherwise>
										<i class="bi bi-star"></i>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</small> <span class="text-muted small"><fmt:formatNumber
								value="${productlist.review_avg}" type="number"
								maxFractionDigits="2" />(${productlist.review_count})</span>
					</div>
					<!-- price -->
					<div class="d-flex justify-content-between align-items-center mt-3">

						<div>
							<!-- price -->
							<span class="text-dark">월 <fmt:formatNumber
									value="${productlist.product_pay}" type="number"
									pattern="#,###" />원
							</span>
						</div>



					</div>
					<!-- btn -->
					<div>
						<a href="#!" class="btn btn-info btn-sm"> 구독 </a>
					</div>
				</div>
			</div>
		</div>
	</c:forEach>
</div>








