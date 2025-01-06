<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<style>
.wishAdd.active i {
	color: red; /* 아이콘 색상을 흰색으로 설정 */
}
.fs-6 {
    display: block;             /* 블록 요소 */
    width: 100%;                /* 부모 요소에 맞춤 */
    max-width: 300px;           /* 최대 너비 조정 (300px으로 확장) */
    height: 1.5em;              /* 한 줄 높이 고정 */
    line-height: 1.5em;         /* 줄 간격 설정 */
    overflow: hidden;           /* 넘치는 텍스트 숨김 */
    white-space: nowrap;        /* 한 줄로 제한 */
    text-overflow: ellipsis;    /* 말줄임표 처리 */
}
.text-center.position-relative {
    display: flex;              /* 이미지 중앙 정렬 */
    justify-content: center;
    align-items: center;
    width: 100%;                /* 부모 요소 너비 */
    height: 200px;              /* 부모 요소 높이 고정 */
    overflow: hidden;           /* 넘치는 이미지 잘라냄 */
}

.img-fluid {
    width: auto;                /* 가로세로 비율 유지 */
    height: 100%;               /* 높이를 부모에 맞춤 */
}

</style>
<c:set var="path" value="${pageContext.servletContext.contextPath}"
	scope="application"></c:set>



<span class="text-white" id="categoryname" style="display: none;">${category_name}</span>


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
						<a
							href="${path}/product/detail?product_seq=${productlist.product_seq}">
							<!-- img --> <img
							src="https://rentally.s3.ap-northeast-2.amazonaws.com/${productlist.category_seq}/
													${productlist.product_img}"
							alt="Grocery Ecommerce Template" class="mb-3 img-fluid" />
						</a>

					</div>

					<h2 class="fs-6">
						<a
							href="${path}/product/detail?product_seq=${productlist.product_seq}"
							class="text-inherit text-decoration-none">${productlist.product_name}</a>
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
						<input type="hidden" class="product-seq"
							value="${productlist.product_seq}">
						<button class="btn btn-info btn-sm wishAdd">
							<i class="bi bi-heart"></i>
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
<!-- 페이지 네비게이션 -->

<c:set var="totalPages" value="${totalPages}" />

<nav>
    <ul class="pagination">
        <!-- Prev 버튼 -->
        <li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
            <a class="page-link mx-1" href="javascript:void(0);" aria-label="Previous" 
               data-page="${currentPage - 1}">
               <i class="feather-icon icon-chevron-left"></i>
            </a>
        </li>

        <!-- 페이지 번호 -->
        <c:forEach var="i" begin="${currentPage - 2 > 1 ? currentPage - 2 : 1}" 
                   end="${currentPage + 2 < totalPages ? currentPage + 2 : totalPages}">
            <li class="page-item ${currentPage == i ? 'active' : ''}">
                <a class="page-link mx-1" href="javascript:void(0);" data-page="${i}">${i}</a>
            </li>
        </c:forEach>

        <!-- '...' 표시 -->
        <li class="page-item ${currentPage + 2 < totalPages ? '' : 'd-none'}">
            <a class="page-link mx-1" href="#">...</a>
        </li>

        <!-- 마지막 페이지 -->
        <li class="page-item ${currentPage == totalPages ? 'disabled' : ''}">
            <a class="page-link mx-1" href="javascript:void(0);" aria-label="Next" 
               data-page="${currentPage + 1}">
               <i class="feather-icon icon-chevron-right"></i>
            </a>
        </li>
    </ul>
</nav>



</div>
</div>
        




<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script>
	    $(document).ready(function () {
	        $(document).on("click", ".wishAdd", function (event) {
	            event.preventDefault(); // 기본 동작 방지

	            
	            const icon = $(this).find("i"); // 버튼 안의 <i> 태그 선택

	            // 하트 아이콘 클래스 토글 (빈 하트 ↔ 채운 하트)
	            if (icon.hasClass("bi-heart")) {
	                icon.removeClass("bi-heart").addClass("bi-heart-fill"); // 채운 하트로 변경
	                icon.css("color", "red"); // 채운 하트 색상 빨간색
	            } else {
	                icon.removeClass("bi-heart-fill").addClass("bi-heart"); // 빈 하트로 변경
	                icon.css("color", ""); // 원래 색상
	            }
	            // 버튼 클릭 시 처리할 로직 추가 (예: 위시리스트 추가/제거)
	            const productSeq = $(this).siblings(".product-seq").val();
	            console.log("Clicked product_seq:", productSeq); // 디버깅용 출력

	            $.ajax({
	                url: "${path}/wishlist/add", // 요청 보낼 URL
	                type: "POST",
	                data: {
	                    product_seq: productSeq
	                },
	                success: function (response) {
	                    alert("위시리스트에 추가되었습니다!");
	                    // 갯수 업데이트
	                    updateCounts();
	                },
	                error: function (xhr, status, error) {
	                    console.error("Error:", error);
	                    alert("에러가 발생했습니다.");
	                }
	            });
	        });
	    });
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
		            alert("페이지 로드 중 오류가 발생했습니다.");
		        },
		    });
		});

		
		</script>
