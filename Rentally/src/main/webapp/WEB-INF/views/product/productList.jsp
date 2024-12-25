<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta content="Codescandy" name="author">
<%@ include file="../common/headLinks.jsp"%>

<!-- endbuild -->

<title>카테고리 상품</title>
<%@ include file="../common/headMeta.jsp"%>
</head>
<body>
	<!-- heading -->

	<!-- 헤더부분 include -->
	<%@ include file="../common/header.jsp"%>
	<main>
		<c:if test="${not empty productlist}">
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
									<li class="breadcrumb-item active" aria-current="page">${productlist[0].category_name}</li>
								</ol>
							</nav>
						</div>
					</div>
				</div>
			</div>
		</c:if>
		<!-- section -->
		<div class="mt-8 mb-lg-14 mb-8">
			<!-- container -->
			<div class="container">
				<!-- row -->
				<div class="row gx-10">
					<!-- 필터 섹션 -->
<aside class="col-lg-3 col-md-4 mb-6 mb-md-0">
    <div class="offcanvas offcanvas-start offcanvas-collapse w-md-50" tabindex="-1" id="offcanvasCategory" aria-labelledby="offcanvasCategoryLabel">
        <div class="offcanvas-header d-lg-none">
            <h5 class="offcanvas-title" id="offcanvasCategoryLabel">Filter</h5>
            <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
        </div>
        <div class="offcanvas-body ps-lg-2 pt-lg-0">
            <!-- 브랜드 필터 -->
            <div class="mb-8">
                <h5 class="mb-3">브랜드</h5>
                <div class="btn-group" role="group" aria-label="Brand Filter">
                    <!-- 삼성 버튼 -->
                    <button type="button" class="btn btn-outline-primary" id="filterSamsung" onclick="toggleBrandFilter(this)">삼성</button>
                    <!-- LG 버튼 -->
                    <button type="button" class="btn btn-outline-primary" id="filterLG" onclick="toggleBrandFilter(this)">LG</button>
                </div>
            </div>

            <!-- 가격대 필터 -->
            <div class="mb-8">
                <h5 class="mb-3">가격대</h5>
                <div id="priceRangeToggle" class="btn-group-vertical w-100" role="group">
                    <button type="button" class="btn btn-outline-primary" data-value="below10k" onclick="togglePriceRangeFilter(this)">0 ~ 10,000</button>
                    <button type="button" class="btn btn-outline-primary" data-value="10kTo20k" onclick="togglePriceRangeFilter(this)">10,001 ~ 20,000</button>
                    <button type="button" class="btn btn-outline-primary" data-value="20kTo30k" onclick="togglePriceRangeFilter(this)">20,001 ~ 30,000</button>
                    <button type="button" class="btn btn-outline-primary" data-value="30kTo40k" onclick="togglePriceRangeFilter(this)">30,001 ~ 40,000</button>
                    <button type="button" class="btn btn-outline-primary" data-value="40kTo50k" onclick="togglePriceRangeFilter(this)">40,001 ~ 50,000</button>
                    <button type="button" class="btn btn-outline-primary" data-value="50kTo70k" onclick="togglePriceRangeFilter(this)">50,001 ~ 70,000</button>
                    <button type="button" class="btn btn-outline-primary" data-value="80kTo100k" onclick="togglePriceRangeFilter(this)">80,001 ~ 100,000</button>
                    <button type="button" class="btn btn-outline-primary" data-value="above100k" onclick="togglePriceRangeFilter(this)">100,000+</button>
                </div>
                <input type="hidden" id="selectedPriceRange" name="priceRange" value="">
            </div>
        </div>
    </div>
</aside>
					

					<section class="col-lg-9 col-md-12">
						<!-- card -->
						<div class="card mb-4 bg-light border-0">
							<c:if test="${not empty productlist}">
								<!-- card body -->
								<div class="card-body p-9">
									<h2 class="mb-0 fs-1">${productlist[0].category_name}</h2>
								</div>
							</c:if>
						</div>

						<!-- list icon -->
						<div class="d-lg-flex justify-content-between align-items-center">

							<div class="mb-3 mb-lg-0">
								<p class="mb-0">
									<span class="text-dark">전체</span> ${fn:length(productlist)}
								</p>
							</div>
							<!-- 리스트의 크기를 출력 -->

							<!-- icon -->
							<div class="d-md-flex justify-content-between align-items-center">
			<div class="d-flex mt-2 mt-lg-0">
									<div>
										<!-- select option -->
										<select class="form-select">
											<option selected>정렬기준</option>
											<option value="Low to High">낮은 가격순</option>
											<option value="High to Low">높은 가격순</option>
											<option value="Release Date">출시일</option>
											<option value="Avg. Rating">인기상품</option>
										</select>
									</div>
								</div>
							</div>
						</div>
						<!-- row -->

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
													src="${path}/resources/images/products/product-img-1.jpg"
													alt="Grocery Ecommerce Template" class="mb-3 img-fluid" />
												</a>
												
											</div>
											<h2 class="fs-6">
												<a href="#" class="text-inherit text-decoration-none">${productlist.product_name}</a>
											</h2>
											<div>
												<!-- rating -->
												<small class="text-warning"> <i
													class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
													<i class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
													<i class="bi bi-star-half"></i>
												</small> <span class="text-muted small">4.5(149)</span>
											</div>
											<!-- price -->
											<div
												class="d-flex justify-content-between align-items-center mt-3">

												<div>
													월<span class="text-dark">${productlist.product_pay}원</span>

												</div>
												<!-- btn -->
												<div>
													<a href="#!" class="btn btn-primary btn-sm"> 구독 </a>
												</div>
											</div>
										</div>
									</div>
								</div>

							</c:forEach>
						</div>

						<div class="row mt-8">
							<div class="col">
								<!-- nav -->
								<nav>
									<ul class="pagination">
										<li class="page-item disabled"><a class="page-link mx-1"
											href="#" aria-label="Previous"> <i
												class="feather-icon icon-chevron-left"></i>
										</a></li>
										<li class="page-item"><a class="page-link mx-1 active"
											href="#">1</a></li>
										<li class="page-item"><a class="page-link mx-1" href="#">2</a></li>

										<li class="page-item"><a class="page-link mx-1" href="#">...</a></li>
										<li class="page-item"><a class="page-link mx-1" href="#">12</a></li>
										<li class="page-item"><a class="page-link mx-1" href="#"
											aria-label="Next"> <i
												class="feather-icon icon-chevron-right"></i>
										</a></li>
									</ul>
								</nav>
							</div>
						</div>
					</section>
				</div>
			</div>
		</div>
	</main>

	<!-- 상품 호버시 나오는 modal -->
	<!--       @@include("../partials/modal-product.html") -->

	<!-- Footer -->
	  <%@include file="../common/footer.jsp" %> 
	



	<!-- Javascript-->
	<script src="${path}/resources/libs/nouislider/dist/nouislider.min.js"></script>
	<script src="${path}/resources/libs/wnumb/wNumb.min.js"></script>
	<script
		src="${path}/resources/libs/tiny-slider/dist/min/tiny-slider.js"></script>
	<script src="${path}/resources/js/vendors/tns-slider.js"></script>
	<script src="${path}/resources/js/vendors/zoom.js"></script>
	<!-- Libs JS -->
	<script
		src="${path}/resources/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
	<script src="${path}/resources/libs/simplebar/dist/simplebar.min.js"></script>
	<!-- Theme JS -->

	<script src="${path}/resources/js/main.js"></script>
	<script>
	// 브랜드 필터 토글 (하나만 선택 가능)
	function toggleBrandFilter(button) {
	    // 모든 브랜드 버튼을 비활성화하고 선택된 버튼만 활성화
	    var buttons = document.querySelectorAll('.btn-group button');
	    buttons.forEach(function(btn) {
	        btn.classList.remove('btn-primary');
	        btn.classList.add('btn-outline-primary');
	    });

	    // 클릭된 버튼만 활성화
	    button.classList.remove('btn-outline-primary');
	    button.classList.add('btn-primary');
	    
	    let selectedBrand = button.textContent.trim();  // 선택된 브랜드 이름
	    applyFilters(selectedBrand);  // 필터 적용 함수 호출
	}

	// 가격대 필터 다중 선택 가능
	function togglePriceRangeFilter(button) {
	    // 선택된 버튼 스타일 토글
	    button.classList.toggle('btn-primary');
	    button.classList.toggle('btn-outline-primary');

	    // 선택된 가격대 값들을 배열로 저장
	    let selectedRanges = [];
	    document.querySelectorAll('#priceRangeToggle button.btn-primary').forEach(function(btn) {
	        selectedRanges.push(btn.getAttribute('data-value'));
	    });

	    applyFilters(null, selectedRanges);  // 필터 적용 함수 호출
	}

	// 필터와 정렬을 적용하는 함수
	function applyFilters(selectedBrand = null, selectedPriceRanges = []) {
	    let sortBy = document.querySelector('select.form-select').value;  // 정렬 기준

	    // Ajax로 필터 및 정렬된 결과 요청
	    $.ajax({
	        url: '/rentally/product/list',  // 필터를 적용한 상품 리스트를 가져오는 URL
	        method: 'GET',
	        data: {
	            category_seq: categorySeq,  // URL에서 가져온 카테고리 정보
	            filter_brand: selectedBrand ? [selectedBrand] : [],  // 선택된 브랜드 필터
	            filter_ftval: selectedPriceRanges,  // 선택된 가격대 필터
	            sort: sortBy,  // 정렬 기준
	            sortodr: 'ASC'  // 정렬 순서 (기본값: 오름차순)
	        },
	        success: function(response) {
	            // 상품 리스트를 업데이트
	            $('#productListContainer').html(response);
	        },
	        error: function(error) {
	            console.error('필터 적용 실패:', error);
	        }
	    });
	}

	// 정렬 기준 선택 시 적용
	$('select.form-select').on('change', function() {
	    let sortBy = $(this).val();
	    let selectedBrand = document.querySelector('.btn-group .btn-primary')?.textContent.trim();
	    let selectedRanges = [];
	    document.querySelectorAll('#priceRangeToggle button.btn-primary').forEach(function(btn) {
	        selectedRanges.push(btn.getAttribute('data-value'));
	    });
	    applyFilters(selectedBrand, selectedRanges);
	});

	</script>
	<!-- endbuild -->
</body>
</html>