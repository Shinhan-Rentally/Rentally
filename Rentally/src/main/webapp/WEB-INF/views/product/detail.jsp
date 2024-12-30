<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="../common/headMeta.jsp"%>
<title>Product Detail - Rentally</title>
<link href="@@webRoot/node_modules/dropzone/dist/min/dropzone.min.css"
	rel="stylesheet" />
<link href="@@webRoot/node_modules/tiny-slider/dist/tiny-slider.css"
	rel="stylesheet" />

<%@include file="../common/headLinks.jsp"%>
</head>

<body>
	<%@include file="../common/header.jsp"%>
	<main>
		<div class="mt-4">
			<div class="container">
				<!-- row -->
				<div class="row">
					<!-- col -->
					<div class="col-12">
						<!-- breadcrumb -->
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb mb-0">
								<li class="breadcrumb-item"><a href="#">Home</a></li>
								<li class="breadcrumb-item"><a href="#">${detail.category_name}</a></li>

								<li class="breadcrumb-item active" aria-current="page">${detail.product_name}</li>
							</ol>
						</nav>
					</div>
				</div>
			</div>
		</div>
		<section class="mt-8">
			<div class="container">
				<div class="row">
					<div class="col-md-5 col-xl-6">
						<!-- img slide -->
						<div class="product" id="product">
							<div class="zoom" onmousemove="zoom(event)"
								style="background-image: url(https://rentally.s3.ap-northeast-2.amazonaws.com/${detail.category_seq}/${detail.product_img})">
								<!-- img -->
								<img
									src="https://rentally.s3.ap-northeast-2.amazonaws.com/${detail.category_seq}/${detail.product_img}"
									alt="상품이미지" />
							</div>
						</div>

					</div>
					<div class="col-md-7 col-xl-6">
						<div class="ps-lg-10 mt-6 mt-md-0">
							<!-- content -->
							<a href="#!" class="mb-4 d-block">${detail.product_brand}</a>
							<!-- heading -->
							<h1 class="mb-1">${detail.product_name }</h1>
							<div class="mb-4">
								<!-- rating -->
								<!-- rating -->
								<small class="text-warning">
									<c:forEach var="i" begin="1" end="5">
										<c:choose>
											<c:when test="${i <= (detail.review_avg)}">
												<i class="bi bi-star-fill"></i>
											</c:when>
											<c:when test="${i - 0.5 <= detail.review_avg}">
												<i class="bi bi-star-half"></i>
											</c:when>
											<c:otherwise>
												<i class="bi bi-star"></i>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</small>
								<span class="text-muted small">
									<fmt:formatNumber
										value="${detail.review_avg}" type="number"
										maxFractionDigits="2" />
									(${detail.review_count})
								</span>
							</div>
							
							<!-- hr -->
							<hr class="my-6" />
							<div class="mb-5">
								<button type="button" class="btn btn-outline-secondary" value="6">6개월</button>
								<!-- btn -->
								<button type="button" class="btn btn-outline-secondary" value="12">1년</button>
								<!-- btn -->
								<button type="button" class="btn btn-outline-secondary" value="24">2년</button>
							</div>
							<!-- hr -->
							<hr class="my-6" />
							<div class="fs-4">
								<!-- price -->
								<span class="fw-bold text-dark">
									월 <fmt:formatNumber value="${detail.product_pay}" type="number" pattern="#,###"/> 원
								</span>
							</div>
							<!-- hr -->
							<hr class="my-6" />
							<div
								class="mt-3 row justify-content-start g-2 align-items-center">
								<div class="col-xxl-4 col-lg-4 col-md-5 col-5 d-grid">
									<!-- button -->
									<!-- btn -->
									<button type="button" class="btn btn-primary">구독하기</button>
								</div>
								<div class="col-md-4 col-4">
									<!-- btn -->
									<a class="btn btn-light" href="#" data-bs-toggle="tooltip"
										data-bs-html="true" aria-label="Compare"> <i
										class="feather-icon icon-shopping-bag me-2"></i>
									</a> <a class="btn btn-light" href="shop-wishlist.html"
										data-bs-toggle="tooltip" data-bs-html="true"
										aria-label="Wishlist"> <i class="feather-icon icon-heart"></i>
									</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<section class="mt-lg-14 mt-8">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<ul class="nav nav-pills nav-lb-tab" id="myTab" role="tablist">
							<!-- nav item -->
							<li class="nav-item" role="presentation">
								<!-- btn -->
								<button class="nav-link active" id="product-tab"
									data-bs-toggle="tab" data-bs-target="#product-tab-pane"
									type="button" role="tab" aria-controls="product-tab-pane"
									aria-selected="true">상품 상세설명</button>
							</li>
							<!-- nav item -->
							<li class="nav-item" role="presentation">
								<!-- btn -->
								<button class="nav-link" id="details-tab" data-bs-toggle="tab"
									data-bs-target="#details-tab-pane" type="button" role="tab"
									aria-controls="details-tab-pane" aria-selected="false">
									상품 정보</button>
							</li>
							<!-- nav item -->
							<li class="nav-item" role="presentation">
								<!-- btn -->
								<button class="nav-link" id="reviews-tab" data-bs-toggle="tab"
									data-bs-target="#reviews-tab-pane" type="button" role="tab"
									aria-controls="reviews-tab-pane" aria-selected="false">
									상품 후기</button>
							</li>

						</ul>
						<!-- tab content -->
						<div class="tab-content" id="myTabContent">
							<!-- tab pane -->
							<div class="tab-pane fade show active" id="product-tab-pane"
								role="tabpanel" aria-labelledby="product-tab" tabindex="0">
								<div class="my-8">
									<!-- 상품 디테일 이미지 불러오기 ~~~~ -->
									<img
									src="https://rentally.s3.ap-northeast-2.amazonaws.com/${detail.category_seq}/${detail.product_detail}"
									alt="상품상세설명이미지" />
								</div>
							</div>
							<!-- tab pane -->
							<div class="tab-pane fade" id="details-tab-pane" role="tabpanel"
								aria-labelledby="details-tab" tabindex="0">
								<div class="my-8">
									<div class="row">
										<div class="col-12">
											<h4 class="mb-4">세부정보</h4>
										</div>
										<div class="col-12 col-lg-12">
											<table class="table table-striped">
												<!-- table -->
												<tbody>
													<tr>
														<th>브랜드</th>
														<td>${detail.product_brand }</td>
													</tr>
													<tr>
														<th>출시날짜</th>
														<td>${detail.product_date }</td>
													</tr>
													<tr>
														<th>크기</th>
														<td>${detail.product_height }</td>
													</tr>
													<tr>
														<th>무게</th>
														<td>${detail.product_weight }</td>
													</tr>
													<tr>
														<th>소비전력</th>
														<td>${detail.product_wh }</td>
													</tr>
													<tr>
														<th>색상</th>
														<td>${detail.product_color }</td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
							<!-- tab pane -->
							<div class="tab-pane fade" id="reviews-tab-pane" role="tabpanel"
								aria-labelledby="reviews-tab" tabindex="0">
								<div class="my-8">
									<!-- row -->
									<div class="row">
										
										<!-- col -->
										<div class="col-md-12">
											<div class="mb-10">
												<div
													class="d-flex justify-content-between align-items-center mb-12">
													<div>
														<!-- heading -->
														<h4>Reviews</h4>
													</div>
													<div>
														<select class="form-select">
															<option selected>Top Reviews</option>
															<option value="Most Recent">Most Recent</option>
														</select>
													</div>
												</div>
												<div class="d-flex border-bottom pb-6 mb-6">

													<div class="ms-5">
														<h6 class="mb-1">Shankar Subbaraman</h6>
														<!-- select option -->
														<!-- content -->
														<p class="small">
															<!-- 리뷰DTO가져와야함 -->
															<span class="text-muted"> ${review_date} </span>
														</p>
														<!-- rating -->
														<div class="mb-2">
															<i class="bi bi-star-fill text-warning"></i> <i
																class="bi bi-star-fill text-warning"></i> <i
																class="bi bi-star-fill text-warning"></i> <i
																class="bi bi-star-fill text-warning"></i> <i
																class="bi bi-star-fill text-warning"></i> 
														</div>
														<!-- text-->
														<p>${review_content }</p>
														
														<!-- icon -->
														<div class="d-flex justify-content-end mt-4">
															<a href="#" class="text-muted"> <i
																class="feather-icon icon-thumbs-up me-1"></i> Helpful
															</a> <a href="#" class="text-muted ms-4"> <i
																class="feather-icon icon-flag me-2"></i> Report abuse
															</a>
														</div>
													</div>
												</div>


												<!-- 페이징으로 바꿔야함 -->
												<div>
													<a href="#" class="btn btn-outline-gray-400 text-muted">Read
														More Reviews</a>
												</div>
											</div>
										</div>
									</div>
								</div>
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
	<script src="${path}/resources/libs/rater-js/index.js"></script>
	<script src="${path}/resources/libs/dropzone/dist/min/dropzone.min.js"></script>
	<script src="${path}/resources/js/vendors/jquery.min.js"></script>
	<script src="${path}/resources/libs/tiny-slider/dist/min/tiny-slider.js"></script>
	<script src="${path}/resources/js/vendors/tns-slider.js"></script>
	<script src="${path}/resources/js/vendors/zoom.js"></script>
	<script src="${path}/resources/js/vendors/dropzone.js"></script>
</body>
</html>