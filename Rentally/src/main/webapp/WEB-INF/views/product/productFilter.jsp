<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<style>
.wishAdd.active i {
	color: red; /* 아이콘 색상을 흰색으로 설정 */
}
.fs-6 {
	display: block; /* 블록 요소 */
	width: 100%; /* 부모 요소에 맞춤 */
	max-width: 300px; /* 최대 너비 조정 (300px으로 확장) */
	height: 1.5em; /* 한 줄 높이 고정 */
	line-height: 1.5em; /* 줄 간격 설정 */
	overflow: hidden; /* 넘치는 텍스트 숨김 */
	white-space: nowrap; /* 한 줄로 제한 */
	text-overflow: ellipsis; /* 말줄임표 처리 */
}
.text-center.position-relative {
	display: flex; /* 이미지 중앙 정렬 */
	justify-content: center;
	align-items: center;
	width: 100%; /* 부모 요소 너비 */
	height: 200px; /* 부모 요소 높이 고정 */
	overflow: hidden; /* 넘치는 이미지 잘라냄 */
}
.img-fluid {
	width: auto; /* 가로세로 비율 유지 */
	height: 100%; /* 높이를 부모에 맞춤 */
}
</style>

<span class="text-white" id="categoryname" style="display: none;">${category_name}</span>
<div class="mb-3 mb-lg-0">
	<span class="text-white" id="size" style="display: none;">${productcount}</span>
</div>
<div class="row g-4 row-cols-xl-4 row-cols-lg-3 row-cols-2 row-cols-md-2 mt-2">
	<c:forEach items="${productlist}" var="product">
		<div class="col">
			<div class="card card-product">
				<div class="card-body">
					<div class="text-center position-relative">
						<a href="${path}/product/detail?product_seq=${product.product_seq}"> <img src="https://d14b80fsv1tvpk.cloudfront.net/${product.category_seq}/
						${product.product_img}?w=160&h=160&f=webp&q=80" alt="${product.product_name}" class="mb-3 img-fluid" width="160" height="160"/>
						</a>
					</div>
					<h2 class="fs-6">
						<a href="${path}/product/detail?product_seq=${product.product_seq}" class="text-inherit text-decoration-none">${product.product_name}</a>
					</h2>
					<div>
						<small class="text-warning"> <c:forEach var="cnt" begin="1" end="5">
								<c:choose>
									<c:when test="${product.review_avg != null and (cnt - 0.5 <= product.review_avg) and (cnt > product.review_avg)}">
										<span class="bi bi-star-half"></span>
									</c:when>

									<c:when test="${product.review_avg != null and cnt <= product.review_avg}">
										<span class="bi bi-star-fill"></span>
									</c:when>
									<c:otherwise>
										<span class="bi bi-star"></span>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</small> <span class="text-muted small"><fmt:formatNumber value="${product.review_avg}" type="number" maxFractionDigits="2" />(${product.review_count})</span>
					</div>
					<div class="d-flex justify-content-between align-items-center mt-3">
						<div>
							<span class="text-dark">월 <fmt:formatNumber value="${product.product_pay}" type="number" pattern="#,###" />원
							</span>
						</div>
					</div>
					<div>
						<input type="hidden" class="product-seq" value="${product.product_seq}">
						<button class="btn btn-info btn-sm wishAdd position-absolute" 
								data-bs-toggle="tooltip" data-bs-placement="bottom" title="위시리스트"
								style="right: 10px; bottom: 10px;">
							<c:if test="${fn:contains(wishlist, product.product_seq)}">
								<i class="bi bi-heart-fill"></i>
							</c:if>
							<c:if test="${not fn:contains(wishlist, product.product_seq)}">
								<i class="bi bi-heart"></i>
							</c:if>
						</button>
					</div>
					<div>
						<button id="compareButton" class="btn btn-info btn-sm position-absolute" data-product-seq="${product.product_seq}" data-path="${path}"
								 data-bs-toggle="tooltip" data-bs-placement="bottom" title="비교하기"
								 style="right: 50px; bottom: 10px;">
							<i class="bi bi-arrow-left-right"></i>
						</button>
					</div>
				</div>
			</div>
		</div>
	</c:forEach>
</div>

<div class="row mt-8">
	<div class="col">
		<c:set var="currentPage" value="${empty param.page ? 1 : param.page}" />
		<c:set var="totalPages" value="${totalPages}" />
		<nav>
			<ul class="pagination">
				<!-- Prev 버튼 -->
				<li class="page-item ${currentPage == 1 ? 'disabled' : ''}"><a class="page-link mx-1" href="javascript:void(0);" aria-label="Previous" data-page="${currentPage > 1 ? currentPage - 1 : 1}"> <i class="feather-icon icon-chevron-left"></i>
				</a></li>

				<!-- 페이지 번호 -->
				<c:forEach var="i" begin="${currentPage - 2 > 1 ? currentPage - 2 : 1}" end="${currentPage + 2 < totalPages ? currentPage + 2 : totalPages}">
					<li class="page-item ${currentPage == i ? 'active' : ''}"><a class="page-link mx-1" href="javascript:void(0);" data-page="${i}">${i}</a></li>
				</c:forEach>

				<!-- '...' 표시 -->
				<li class="page-item ${currentPage + 2 < totalPages ? '' : 'd-none'}"><a class="page-link mx-1" href="#">...</a></li>

				<!-- 마지막 페이지 -->
				<li class="page-item ${currentPage == totalPages ? 'disabled' : ''}"><a class="page-link mx-1" href="javascript:void(0);" aria-label="Next" data-page="${currentPage < totalPages ? currentPage + 1 : totalPages}"> <i class="feather-icon icon-chevron-right"></i>
				</a></li>
			</ul>
		</nav>
	</div>
</div>




<script>

//모달 띄우는 함수
function listModal(message) {
    $("#listModalMessage").text(message);
    $("#listModal").modal("show"); // 모달 표시
}
</script>

<script>
		$(document).on("click", ".page-link", function (event) {
		    event.preventDefault(); // 기본 새로고침 방지
		    const page = $(this).data("page");
		    const categorySeq = $("#categoryname").text(); // 선택된 카테고리 정보 가져오기

		    $.ajax({
		        url: `${path}/product/list`,
		        type: "GET",
		        data: { category_seq: categorySeq, page: page },
		        success: function (response) {
		            $("#product-container").html(response); // 상품 목록 업데이트
		
		        },
		        error: function () {
		        	listModal("페이지 로드 중 오류가 발생했습니다.");
		        },
		    });
		});
	</script>
<script>
		$(document).on("click", ".page-link", function (event) {
		    event.preventDefault(); // 기본 새로고침 방지
		    const page = $(this).data("page");
		    var query = "${param.query != null ? fn:escapeXml(param.query) : ''}".trim();

		    $.ajax({
		        url: `${path}/product/searchResult`,
		        type: "GET",
		        data: { query: query, page: page },
		        success: function (response) {
		            $("#product-container").html(response); // 상품 목록 업데이트
	
		        },
		        error: function () {
		        	listModal("페이지 로드 중 오류가 발생했습니다.");
		        },
		    });
		});
</script>

<script>
// Tooltip 적용
$(document).ready(function () {
	$('[data-bs-toggle="tooltip"]').tooltip();
});
</script>