<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	<div class="text-small mb-1">
		<a href="#!" class="text-decoration-none text-muted"><small>Snack
				& Munchies</small></a>
		<!-- 헤더부분 include -->
		<%@ include file="../common/header.jsp"%>
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
									<li class="breadcrumb-item active" aria-current="page">Snacks
										& Munchies</li>
								</ol>
							</nav>
						</div>
					</div>
				</div>
			</div>
			<!-- section -->
			<div class="mt-8 mb-lg-14 mb-8">
				<!-- container -->
				<div class="container">
					<!-- row -->
					<div class="row gx-10">
						<!-- 필터 섹션 -->
						<!-- 필터 섹션 -->
						<aside class="col-lg-3 col-md-4 mb-6 mb-md-0">
							<div class="offcanvas offcanvas-start offcanvas-collapse w-md-50"
								tabindex="-1" id="offcanvasCategory"
								aria-labelledby="offcanvasCategoryLabel">
								<div class="offcanvas-header d-lg-none">
									<h5 class="offcanvas-title" id="offcanvasCategoryLabel">Filter</h5>
									<button type="button" class="btn-close"
										data-bs-dismiss="offcanvas" aria-label="Close"></button>
								</div>
								<div class="offcanvas-body ps-lg-2 pt-lg-0">

									<!-- 브랜드 필터 -->
									<div class="mb-8">
										<h5 class="mb-3">Brand</h5>
										<div class="form-check form-switch">
											<input class="form-check-input" type="checkbox"
												id="brandFilterEnable" /> <label class="form-check-label"
												for="brandFilterEnable">삼성</label> <label
												class="form-check-label" for="brandFilterEnable">LG</label>
										</div>
									</div>

									<!-- 가격대 필터 -->
									<div class="mb-8">
										<h5 class="mb-3">Price Range</h5>
										<div id="priceRangeToggle" class="btn-group" role="group">
											<button type="button" class="btn btn-outline-primary"
												data-value="below10k">0 ~ 10,000</button>
											<button type="button" class="btn btn-outline-primary"
												data-value="10kTo20k">10,001 ~ 20,000</button>
											<button type="button" class="btn btn-outline-primary"
												data-value="20kTo30k">20,001 ~ 30,000</button>
											<button type="button" class="btn btn-outline-primary"
												data-value="30kTo40k">30,001 ~ 40,000</button>
											<button type="button" class="btn btn-outline-primary"
												data-value="40kTo50k">40,001 ~ 50,000</button>
											<button type="button" class="btn btn-outline-primary"
												data-value="50kTo70k">50,001 ~ 70,000</button>
											<button type="button" class="btn btn-outline-primary"
												data-value="80kTo100k">80,001 ~ 100,000</button>
											<button type="button" class="btn btn-outline-primary"
												data-value="above100k">100,000+</button>
										</div>
										<input type="hidden" id="selectedPriceRange" name="priceRange"
											value="">
									</div>


									<!-- 인기 상품 필터 -->
									<div class="mb-8">
										<h5 class="mb-3">Popularity</h5>
										<div class="form-check">
											<input class="form-check-input" type="checkbox"
												value="popular" id="popularFilter" /> <label
												class="form-check-label" for="popularFilter"> Show
												only popular items </label>
										</div>
									</div>

									<!-- 필터 적용 버튼 -->
									<div>
										<button class="btn btn-primary w-100" onclick="applyFilters()">Apply
											Filters</button>
									</div>
								</div>
							</div>
						</aside>

						<section class="col-lg-9 col-md-12">
							<!-- card -->
							<div class="card mb-4 bg-light border-0">
								<!-- card body -->
								<div class="card-body p-9">
									<h2 class="mb-0 fs-1">Snacks & Munchies</h2>
								</div>
							</div>
							<!-- list icon -->
							<div class="d-lg-flex justify-content-between align-items-center">
								<div class="mb-3 mb-lg-0">
									<p class="mb-0">
										<span class="text-dark">24</span> Products found
									</p>
								</div>

								<!-- icon -->
								<div
									class="d-md-flex justify-content-between align-items-center">


									<div class="d-flex mt-2 mt-lg-0">
										<div>
											<!-- select option -->
											<select class="form-select">
												<option selected>Sort by: Featured</option>
												<option value="Low to High">Price: Low to High</option>
												<option value="High to Low">Price: High to Low</option>
												<option value="Release Date">Release Date</option>
												<option value="Avg. Rating">Avg. Rating</option>
											</select>
										</div>
									</div>
								</div>
							</div>
							<!-- row -->
							<c:forEach items="${productlist}" var="productlist">
							<div
								class="row g-4 row-cols-xl-4 row-cols-lg-3 row-cols-2 row-cols-md-2 mt-2">
								<!-- col -->
								<div class="col">
									<!-- card -->
									<div class="card card-product">
										<div class="card-body">
											<!-- badge -->
											<div class="text-center position-relative">
												<div class="position-absolute top-0 start-0">
													<span class="badge bg-danger">Sale</span>
												</div>
												<a href="#"> <!-- img --> <img
													src="${path}/resources/images/products/product-img-1.jpg"
													alt="Grocery Ecommerce Template" class="mb-3 img-fluid" />
												</a>
												<!-- action btn -->
												<div class="card-product-action">
													<a href="#!" class="btn-action" data-bs-toggle="modal"
														data-bs-target="#quickViewModal"> <i class="bi bi-eye"
														data-bs-toggle="tooltip" data-bs-html="true"
														title="Quick View"></i>
													</a> <a href="shop-wishlist.html" class="btn-action"
														data-bs-toggle="tooltip" data-bs-html="true"
														title="Wishlist"><i class="bi bi-heart"></i></a> <a
														href="#!" class="btn-action" data-bs-toggle="tooltip"
														data-bs-html="true" title="Compare"><i
														class="bi bi-arrow-left-right"></i></a>
												</div>
											</div>
											<h2 class="fs-6">
												<a href="#"
													class="text-inherit text-decoration-none">${productlist.product_name}</a>
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
													<span class="text-dark">$18</span>

												</div>
												<!-- btn -->
												<div>
													<a href="#!" class="btn btn-primary btn-sm"> <svg
															xmlns="http://www.w3.org/2000/svg" width="16" height="16"
															viewBox="0 0 24 24" fill="none" stroke="currentColor"
															stroke-width="2" stroke-linecap="round"
															stroke-linejoin="round" class="feather feather-plus">
                                             <line x1="12" y1="5"
																x2="12" y2="19"></line>
                                             <line x1="5" y1="12"
																x2="19" y2="12"></line>
                                          </svg> Add
													</a>
												</div>
											</div>
										</div>
									</div>
								</div>


							</div>
							</c:forEach>
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
		<!--   include file="../common/footer.jsp" %>  -->
		<!-- 필터 스크립트 -->
		<script>
document.addEventListener("DOMContentLoaded", function () {
	   const toggleButtons = document.querySelectorAll("#priceRangeToggle .btn");
	   const hiddenInput = document.getElementById("selectedPriceRange");

	   toggleButtons.forEach(button => {
	      button.addEventListener("click", function () {
	         // 이전 선택 버튼 초기화
	         toggleButtons.forEach(btn => btn.classList.remove("active"));
	         
	         // 현재 버튼 활성화
	         this.classList.add("active");
	         
	         // 선택한 값 저장
	         hiddenInput.value = this.dataset.value;
	      });
	   });
	});

</script>

		<!-- Javascript-->
		<script src="${path}/resources/libs/nouislider/dist/nouislider.min.js"></script>
		<script src="${path}/resources/libs/wnumb/wNumb.min.js"></script>
		<script src="${path}/resources/libs/tiny-slider/dist/min/tiny-slider.js"></script>
		<script src="${path}/resources/js/vendors/tns-slider.js"></script>
		<script src="${path}/resources/js/vendors/zoom.js"></script>
		<!-- Libs JS -->
		<script src="${path}/resources/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
		<script src="${path}/resources/libs/simplebar/dist/simplebar.min.js"></script>
		<!-- Theme JS -->

		<script src="${path}/resources/js/main.js"></script>
		<!-- endbuild -->
</body>
</html>