<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="./common/headMeta.jsp" %>
<title>Rentally</title>
<%@ include file="./common/headLinks.jsp" %>
<!-- Favicon icon-->
<link rel="shortcut icon" type="image/x-icon" href="${path}/resources/images/favicon/favicon.ico">
<!-- Theme CSS -->
<!-- build:css @@webRoot/assets/css/theme.min.css -->
<link rel="stylesheet" href="${path}/resources/css/theme.css">
<link href="${path}/resources/libs/slick-carousel/slick/slick.css" rel="stylesheet" />
		<link href="${path}/resources/libs/slick-carousel/slick/slick-theme.css" rel="stylesheet" />
		<link href="${path}/resources/libs/tiny-slider/dist/tiny-slider.css" rel="stylesheet" />
</head>
<body>
<!-- 헤더화면 임포트 -->
<%@ include file="./common/header.jsp" %>
	
		<main>
			<section class="mt-8">
				<div class="container">
					
						<div style="background: url(https://rentally.s3.ap-northeast-2.amazonaws.com/logo/RENTALLY_LOGO-title.png) no-repeat; 
						background-size: cover; border-radius: 0.5rem; background-position: center;
						width:1200px; height:628px;">
							<div class="ps-lg-12 py-lg-16 col-xxl-5 col-md-7 py-14 px-8 text-xs-center">
								
							</div>
						</div>
				
					
				</div>
			</section>
			<!-- Category Section Start-->
			<section class="mb-lg-10 mt-lg-14 my-8">
				<div class="container">
					<div class="row">
						<div class="col-12 mb-6">
							<h3 class="mb-0">Featured Categories</h3>
						</div>
					</div>
					<div class="category-slider">
					<c:forEach items="${bestProduct}" var="bestProduct">
						<div class="item">
							<a href="#" class="text-decoration-none text-inherit">
								<div class="card card-product mb-lg-4">
									<div class="card-body text-center py-8">
										<img src="https://rentally.s3.ap-northeast-2.amazonaws.com/${bestProduct.category_seq}/
													${bestProduct.product_img}" alt="Grocery Ecommerce Template" class="mb-3 img-fluid" />
										<div class="text-truncate">${bestProduct.product_name}</div>
									</div>
								</div>
							</a>
						</div>		
					</c:forEach>
					</div>
				</div>
			</section>
			<!-- Category Section End-->
			<section>
				<div class="container">
					<div class="row">
						<div class="col-12 col-md-6 mb-3 mb-lg-0">
							<div>
								<div class="py-10 px-8 rounded" style="background: url(resources/images/banner/grocery-banner.png) no-repeat; background-size: cover; background-position: center">
									<div>
										<h3 class="fw-bold mb-1">Fruits & Vegetables</h3>
										<p class="mb-4">
											Get Upto
											<span class="fw-bold">30%</span>
											Off
										</p>
										<a href="#!" class="btn btn-dark">Shop Now</a>
									</div>
								</div>
							</div>
						</div>
						<div class="col-12 col-md-6">
							<div>
								<div class="py-10 px-8 rounded" style="background: url(resources/images/banner/grocery-banner-2.jpg) no-repeat; background-size: cover; background-position: center">
									<div>
										<h3 class="fw-bold mb-1">Freshly Baked Buns</h3>
										<p class="mb-4">
											Get Upto
											<span class="fw-bold">25%</span>
											Off
										</p>
										<a href="#!" class="btn btn-dark">Shop Now</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
			<!-- Popular Products Start-->
			<section class="my-lg-14 my-8">
				<div class="container">
					<div class="row">
						<div class="col-12 mb-6">
							<h3 class="mb-0">Popular Products</h3>
						</div>
					</div>

					<div class="row g-4 row-cols-lg-5 row-cols-2 row-cols-md-3">
						<div class="col">
							<div class="card card-product">
								<div class="card-body">
									<div class="text-center position-relative">
										<div class="position-absolute top-0 start-0">
											<span class="badge bg-danger">Sale</span>
										</div>
										<a href="#!"><img src="resources/images/products/product-img-1.jpg" alt="Grocery Ecommerce Template" class="mb-3 img-fluid" /></a>

										<div class="card-product-action">
											<a href="#!" class="btn-action" data-bs-toggle="modal" data-bs-target="#quickViewModal">
												<i class="bi bi-eye" data-bs-toggle="tooltip" data-bs-html="true" title="Quick View"></i>
											</a>
											<a href="#!" class="btn-action" data-bs-toggle="tooltip" data-bs-html="true" title="Wishlist"><i class="bi bi-heart"></i></a>
											<a href="#!" class="btn-action" data-bs-toggle="tooltip" data-bs-html="true" title="Compare"><i class="bi bi-arrow-left-right"></i></a>
										</div>
									</div>
									<div class="text-small mb-1">
										<a href="#!" class="text-decoration-none text-muted"><small>Snack & Munchies</small></a>
									</div>
									<h2 class="fs-6"><a href="./pages/shop-single.html" class="text-inherit text-decoration-none">Haldiram's Sev Bhujia</a></h2>
									<div>
										<small class="text-warning">
											<i class="bi bi-star-fill"></i>
											<i class="bi bi-star-fill"></i>
											<i class="bi bi-star-fill"></i>
											<i class="bi bi-star-fill"></i>
											<i class="bi bi-star-half"></i>
										</small>
										<span class="text-muted small">4.5(149)</span>
									</div>
									<div class="d-flex justify-content-between align-items-center mt-3">
										<div>
											<span class="text-dark">$18</span>
											<span class="text-decoration-line-through text-muted">$24</span>
										</div>
										<div>
											<a href="#!" class="btn btn-primary btn-sm">
												<svg
													xmlns="http://www.w3.org/2000/svg"
													width="16"
													height="16"
													viewBox="0 0 24 24"
													fill="none"
													stroke="currentColor"
													stroke-width="2"
													stroke-linecap="round"
													stroke-linejoin="round"
													class="feather feather-plus"
												>
													<line x1="12" y1="5" x2="12" y2="19"></line>
													<line x1="5" y1="12" x2="19" y2="12"></line>
												</svg>
												Add
											</a>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col">
							<div class="card card-product">
								<div class="card-body">
									<div class="text-center position-relative">
										<div class="position-absolute top-0 start-0">
											<span class="badge bg-success">14%</span>
										</div>
										<a href="./pages/shop-single.html"><img src="resources/images/products/product-img-2.jpg" alt="Grocery Ecommerce Template" class="mb-3 img-fluid" /></a>
										<div class="card-product-action">
											<a href="#!" class="btn-action" data-bs-toggle="modal" data-bs-target="#quickViewModal">
												<i class="bi bi-eye" data-bs-toggle="tooltip" data-bs-html="true" title="Quick View"></i>
											</a>
											<a href="../pages/shop-wishlist.html" class="btn-action" data-bs-toggle="tooltip" data-bs-html="true" title="Wishlist"><i class="bi bi-heart"></i></a>
											<a href="#!" class="btn-action" data-bs-toggle="tooltip" data-bs-html="true" title="Compare"><i class="bi bi-arrow-left-right"></i></a>
										</div>
									</div>
									<div class="text-small mb-1">
										<a href="#!" class="text-decoration-none text-muted"><small>Bakery & Biscuits</small></a>
									</div>
									<h2 class="fs-6"><a href="./pages/shop-single.html" class="text-inherit text-decoration-none">NutriChoice Digestive</a></h2>
									<div class="text-warning">
										<small>
											<i class="bi bi-star-fill"></i>
											<i class="bi bi-star-fill"></i>
											<i class="bi bi-star-fill"></i>
											<i class="bi bi-star-fill"></i>
											<i class="bi bi-star-half"></i>
										</small>
										<span class="text-muted small">4.5 (25)</span>
									</div>
									<div class="d-flex justify-content-between align-items-center mt-3">
										<div><span class="text-dark">$24</span></div>
										<div>
											<a href="#!" class="btn btn-primary btn-sm">
												<svg
													xmlns="http://www.w3.org/2000/svg"
													width="16"
													height="16"
													viewBox="0 0 24 24"
													fill="none"
													stroke="currentColor"
													stroke-width="2"
													stroke-linecap="round"
													stroke-linejoin="round"
													class="feather feather-plus"
												>
													<line x1="12" y1="5" x2="12" y2="19"></line>
													<line x1="5" y1="12" x2="19" y2="12"></line>
												</svg>
												Add
											</a>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col">
							<div class="card card-product">
								<div class="card-body">
									<div class="text-center position-relative">
										<a href="./pages/shop-single.html"><img src="resources/images/products/product-img-3.jpg" alt="Grocery Ecommerce Template" class="mb-3 img-fluid" /></a>
										<div class="card-product-action">
											<a href="#!" class="btn-action" data-bs-toggle="modal" data-bs-target="#quickViewModal">
												<i class="bi bi-eye" data-bs-toggle="tooltip" data-bs-html="true" title="Quick View"></i>
											</a>
											<a href="../pages/shop-wishlist.html" class="btn-action" data-bs-toggle="tooltip" data-bs-html="true" title="Wishlist"><i class="bi bi-heart"></i></a>
											<a href="#!" class="btn-action" data-bs-toggle="tooltip" data-bs-html="true" title="Compare"><i class="bi bi-arrow-left-right"></i></a>
										</div>
									</div>
									<div class="text-small mb-1">
										<a href="#!" class="text-decoration-none text-muted"><small>Bakery & Biscuits</small></a>
									</div>
									<h2 class="fs-6"><a href="./pages/shop-single.html" class="text-inherit text-decoration-none">Cadbury 5 Star Chocolate</a></h2>
									<div class="text-warning">
										<small>
											<i class="bi bi-star-fill"></i>
											<i class="bi bi-star-fill"></i>
											<i class="bi bi-star-fill"></i>
											<i class="bi bi-star-fill"></i>
											<i class="bi bi-star-fill"></i>
										</small>
										<span class="text-muted small">5 (469)</span>
									</div>
									<div class="d-flex justify-content-between align-items-center mt-3">
										<div>
											<span class="text-dark">$32</span>
											<span class="text-decoration-line-through text-muted">$35</span>
										</div>
										<div>
											<a href="#!" class="btn btn-primary btn-sm">
												<svg
													xmlns="http://www.w3.org/2000/svg"
													width="16"
													height="16"
													viewBox="0 0 24 24"
													fill="none"
													stroke="currentColor"
													stroke-width="2"
													stroke-linecap="round"
													stroke-linejoin="round"
													class="feather feather-plus"
												>
													<line x1="12" y1="5" x2="12" y2="19"></line>
													<line x1="5" y1="12" x2="19" y2="12"></line>
												</svg>
												Add
											</a>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col">
							<div class="card card-product">
								<div class="card-body">
									<div class="text-center position-relative">
										<a href="./pages/shop-single.html"><img src="resources/images/products/product-img-4.jpg" alt="Grocery Ecommerce Template" class="mb-3 img-fluid" /></a>
										<div class="card-product-action">
											<a href="#!" class="btn-action" data-bs-toggle="modal" data-bs-target="#quickViewModal">
												<i class="bi bi-eye" data-bs-toggle="tooltip" data-bs-html="true" title="Quick View"></i>
											</a>
											<a href="../pages/shop-wishlist.html" class="btn-action" data-bs-toggle="tooltip" data-bs-html="true" title="Wishlist"><i class="bi bi-heart"></i></a>
											<a href="#!" class="btn-action" data-bs-toggle="tooltip" data-bs-html="true" title="Compare"><i class="bi bi-arrow-left-right"></i></a>
										</div>
										<div class="position-absolute top-0 start-0">
											<span class="badge bg-danger">Hot</span>
										</div>
									</div>
									<div class="text-small mb-1">
										<a href="#!" class="text-decoration-none text-muted"><small>Snack & Munchies</small></a>
									</div>
									<h2 class="fs-6"><a href="./pages/shop-single.html" class="text-inherit text-decoration-none">Onion Flavour Potato</a></h2>
									<div class="text-warning">
										<small>
											<i class="bi bi-star-fill"></i>
											<i class="bi bi-star-fill"></i>
											<i class="bi bi-star-fill"></i>
											<i class="bi bi-star-half"></i>
											<i class="bi bi-star"></i>
										</small>
										<span class="text-muted small">3.5 (456)</span>
									</div>
									<div class="d-flex justify-content-between align-items-center mt-3">
										<div>
											<span class="text-dark">$3</span>
											<span class="text-decoration-line-through text-muted">$5</span>
										</div>
										<div>
											<a href="#!" class="btn btn-primary btn-sm">
												<svg
													xmlns="http://www.w3.org/2000/svg"
													width="16"
													height="16"
													viewBox="0 0 24 24"
													fill="none"
													stroke="currentColor"
													stroke-width="2"
													stroke-linecap="round"
													stroke-linejoin="round"
													class="feather feather-plus"
												>
													<line x1="12" y1="5" x2="12" y2="19"></line>
													<line x1="5" y1="12" x2="19" y2="12"></line>
												</svg>
												Add
											</a>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col">
							<div class="card card-product">
								<div class="card-body">
									<div class="text-center position-relative">
										<a href="./pages/shop-single.html"><img src="resources/images/products/product-img-5.jpg" alt="Grocery Ecommerce Template" class="mb-3 img-fluid" /></a>
										<div class="card-product-action">
											<a href="#!" class="btn-action" data-bs-toggle="modal" data-bs-target="#quickViewModal">
												<i class="bi bi-eye" data-bs-toggle="tooltip" data-bs-html="true" title="Quick View"></i>
											</a>
											<a href="../pages/shop-wishlist.html" class="btn-action" data-bs-toggle="tooltip" data-bs-html="true" title="Wishlist"><i class="bi bi-heart"></i></a>
											<a href="#!" class="btn-action" data-bs-toggle="tooltip" data-bs-html="true" title="Compare"><i class="bi bi-arrow-left-right"></i></a>
										</div>
									</div>
									<div class="text-small mb-1">
										<a href="#!" class="text-decoration-none text-muted"><small>Instant Food</small></a>
									</div>
									<h2 class="fs-6"><a href="./pages/shop-single.html" class="text-inherit text-decoration-none">Salted Instant Popcorn</a></h2>
									<div class="text-warning">
										<small>
											<i class="bi bi-star-fill"></i>
											<i class="bi bi-star-fill"></i>
											<i class="bi bi-star-fill"></i>
											<i class="bi bi-star-fill"></i>
											<i class="bi bi-star-half"></i>
										</small>
										<span class="text-muted small">4.5 (39)</span>
									</div>
									<div class="d-flex justify-content-between mt-4">
										<div>
											<span class="text-dark">$13</span>
											<span class="text-decoration-line-through text-muted">$18</span>
										</div>
										<div>
											<a href="#!" class="btn btn-primary btn-sm">
												<svg
													xmlns="http://www.w3.org/2000/svg"
													width="16"
													height="16"
													viewBox="0 0 24 24"
													fill="none"
													stroke="currentColor"
													stroke-width="2"
													stroke-linecap="round"
													stroke-linejoin="round"
													class="feather feather-plus"
												>
													<line x1="12" y1="5" x2="12" y2="19"></line>
													<line x1="5" y1="12" x2="19" y2="12"></line>
												</svg>
												Add
											</a>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col">
							<div class="card card-product">
								<div class="card-body">
									<div class="text-center position-relative">
										<div class="position-absolute top-0 start-0">
											<span class="badge bg-danger">Sale</span>
										</div>
										<a href="#!"><img src="resources/images/products/product-img-6.jpg" alt="Grocery Ecommerce Template" class="mb-3 img-fluid" /></a>
										<div class="card-product-action">
											<a href="#!" class="btn-action" data-bs-toggle="modal" data-bs-target="#quickViewModal">
												<i class="bi bi-eye" data-bs-toggle="tooltip" data-bs-html="true" title="Quick View"></i>
											</a>
											<a href="../pages/shop-wishlist.html" class="btn-action" data-bs-toggle="tooltip" data-bs-html="true" title="Wishlist"><i class="bi bi-heart"></i></a>
											<a href="#!" class="btn-action" data-bs-toggle="tooltip" data-bs-html="true" title="Compare"><i class="bi bi-arrow-left-right"></i></a>
										</div>
									</div>
									<div class="text-small mb-1">
										<a href="#!" class="text-decoration-none text-muted"><small>Dairy, Bread & Eggs</small></a>
									</div>
									<h2 class="fs-6"><a href="./pages/shop-single.html" class="text-inherit text-decoration-none">Blueberry Greek Yogurt</a></h2>
									<div>
										<small class="text-warning">
											<i class="bi bi-star-fill"></i>
											<i class="bi bi-star-fill"></i>
											<i class="bi bi-star-fill"></i>
											<i class="bi bi-star-fill"></i>
											<i class="bi bi-star-half"></i>
										</small>
										<span class="text-muted small">4.5 (189)</span>
									</div>
									<div class="d-flex justify-content-between align-items-center mt-3">
										<div>
											<span class="text-dark">$18</span>
											<span class="text-decoration-line-through text-muted">$24</span>
										</div>
										<div>
											<a href="#!" class="btn btn-primary btn-sm">
												<svg
													xmlns="http://www.w3.org/2000/svg"
													width="16"
													height="16"
													viewBox="0 0 24 24"
													fill="none"
													stroke="currentColor"
													stroke-width="2"
													stroke-linecap="round"
													stroke-linejoin="round"
													class="feather feather-plus"
												>
													<line x1="12" y1="5" x2="12" y2="19"></line>
													<line x1="5" y1="12" x2="19" y2="12"></line>
												</svg>
												Add
											</a>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col">
							<div class="card card-product">
								<div class="card-body">
									<div class="text-center position-relative">
										<a href="./pages/shop-single.html"><img src="resources/images/products/product-img-7.jpg" alt="Grocery Ecommerce Template" class="mb-3 img-fluid" /></a>
										<div class="card-product-action">
											<a href="#!" class="btn-action" data-bs-toggle="modal" data-bs-target="#quickViewModal">
												<i class="bi bi-eye" data-bs-toggle="tooltip" data-bs-html="true" title="Quick View"></i>
											</a>
											<a href="../pages/shop-wishlist.html" class="btn-action" data-bs-toggle="tooltip" data-bs-html="true" title="Wishlist"><i class="bi bi-heart"></i></a>
											<a href="#!" class="btn-action" data-bs-toggle="tooltip" data-bs-html="true" title="Compare"><i class="bi bi-arrow-left-right"></i></a>
										</div>
									</div>
									<div class="text-small mb-1">
										<a href="#!" class="text-decoration-none text-muted"><small>Dairy, Bread & Eggs</small></a>
									</div>
									<h2 class="fs-6"><a href="./pages/shop-single.html" class="text-inherit text-decoration-none">Britannia Cheese Slices</a></h2>
									<div class="text-warning">
										<small>
											<i class="bi bi-star-fill"></i>
											<i class="bi bi-star-fill"></i>
											<i class="bi bi-star-fill"></i>
											<i class="bi bi-star-fill"></i>
											<i class="bi bi-star-fill"></i>
										</small>
										<span class="text-muted small">5 (345)</span>
									</div>
									<div class="d-flex justify-content-between align-items-center mt-3">
										<div><span class="text-dark">$24</span></div>
										<div>
											<a href="#!" class="btn btn-primary btn-sm">
												<svg
													xmlns="http://www.w3.org/2000/svg"
													width="16"
													height="16"
													viewBox="0 0 24 24"
													fill="none"
													stroke="currentColor"
													stroke-width="2"
													stroke-linecap="round"
													stroke-linejoin="round"
													class="feather feather-plus"
												>
													<line x1="12" y1="5" x2="12" y2="19"></line>
													<line x1="5" y1="12" x2="19" y2="12"></line>
												</svg>
												Add
											</a>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col">
							<div class="card card-product">
								<div class="card-body">
									<div class="text-center position-relative">
										<a href="./pages/shop-single.html"><img src="resources/images/products/product-img-8.jpg" alt="Grocery Ecommerce Template" class="mb-3 img-fluid" /></a>
										<div class="card-product-action">
											<a href="#!" class="btn-action" data-bs-toggle="modal" data-bs-target="#quickViewModal">
												<i class="bi bi-eye" data-bs-toggle="tooltip" data-bs-html="true" title="Quick View"></i>
											</a>
											<a href="../pages/shop-wishlist.html" class="btn-action" data-bs-toggle="tooltip" data-bs-html="true" title="Wishlist"><i class="bi bi-heart"></i></a>
											<a href="#!" class="btn-action" data-bs-toggle="tooltip" data-bs-html="true" title="Compare"><i class="bi bi-arrow-left-right"></i></a>
										</div>
									</div>
									<div class="text-small mb-1">
										<a href="#!" class="text-decoration-none text-muted"><small>Instant Food</small></a>
									</div>
									<h2 class="fs-6"><a href="./pages/shop-single.html" class="text-inherit text-decoration-none">Kellogg's Original Cereals</a></h2>
									<div class="text-warning">
										<small>
											<i class="bi bi-star-fill"></i>
											<i class="bi bi-star-fill"></i>
											<i class="bi bi-star-fill"></i>
											<i class="bi bi-star-fill"></i>
											<i class="bi bi-star-half"></i>
										</small>
										<span class="text-muted small">4 (90)</span>
									</div>
									<div class="d-flex justify-content-between align-items-center mt-3">
										<div>
											<span class="text-dark">$32</span>
											<span class="text-decoration-line-through text-muted">$35</span>
										</div>
										<div>
											<a href="#!" class="btn btn-primary btn-sm">
												<svg
													xmlns="http://www.w3.org/2000/svg"
													width="16"
													height="16"
													viewBox="0 0 24 24"
													fill="none"
													stroke="currentColor"
													stroke-width="2"
													stroke-linecap="round"
													stroke-linejoin="round"
													class="feather feather-plus"
												>
													<line x1="12" y1="5" x2="12" y2="19"></line>
													<line x1="5" y1="12" x2="19" y2="12"></line>
												</svg>
												Add
											</a>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col">
							<div class="card card-product">
								<div class="card-body">
									<div class="text-center position-relative">
										<a href="./pages/shop-single.html"><img src="resources/images/products/product-img-9.jpg" alt="Grocery Ecommerce Template" class="mb-3 img-fluid" /></a>
										<div class="card-product-action">
											<a href="#!" class="btn-action" data-bs-toggle="modal" data-bs-target="#quickViewModal">
												<i class="bi bi-eye" data-bs-toggle="tooltip" data-bs-html="true" title="Quick View"></i>
											</a>
											<a href="../pages/shop-wishlist.html" class="btn-action" data-bs-toggle="tooltip" data-bs-html="true" title="Wishlist"><i class="bi bi-heart"></i></a>
											<a href="#!" class="btn-action" data-bs-toggle="tooltip" data-bs-html="true" title="Compare"><i class="bi bi-arrow-left-right"></i></a>
										</div>
									</div>
									<div class="text-small mb-1">
										<a href="#!" class="text-decoration-none text-muted"><small>Snack & Munchies</small></a>
									</div>
									<h2 class="fs-6"><a href="./pages/shop-single.html" class="text-inherit text-decoration-none">Slurrp Millet Chocolate</a></h2>
									<div class="text-warning">
										<small>
											<i class="bi bi-star-fill"></i>
											<i class="bi bi-star-fill"></i>
											<i class="bi bi-star-fill"></i>
											<i class="bi bi-star-fill"></i>
											<i class="bi bi-star-half"></i>
										</small>
										<span class="text-muted small">4.5 (67)</span>
									</div>
									<div class="d-flex justify-content-between align-items-center mt-3">
										<div>
											<span class="text-dark">$3</span>
											<span class="text-decoration-line-through text-muted">$5</span>
										</div>
										<div>
											<a href="#!" class="btn btn-primary btn-sm">
												<svg
													xmlns="http://www.w3.org/2000/svg"
													width="16"
													height="16"
													viewBox="0 0 24 24"
													fill="none"
													stroke="currentColor"
													stroke-width="2"
													stroke-linecap="round"
													stroke-linejoin="round"
													class="feather feather-plus"
												>
													<line x1="12" y1="5" x2="12" y2="19"></line>
													<line x1="5" y1="12" x2="19" y2="12"></line>
												</svg>
												Add
											</a>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col">
							<div class="card card-product">
								<div class="card-body">
									<div class="text-center position-relative">
										<a href="./pages/shop-single.html"><img src="resources/images/products/product-img-10.jpg" alt="Grocery Ecommerce Template" class="mb-3 img-fluid" /></a>
										<div class="card-product-action">
											<a href="#!" class="btn-action" data-bs-toggle="modal" data-bs-target="#quickViewModal">
												<i class="bi bi-eye" data-bs-toggle="tooltip" data-bs-html="true" title="Quick View"></i>
											</a>
											<a href="../pages/shop-wishlist.html" class="btn-action" data-bs-toggle="tooltip" data-bs-html="true" title="Wishlist"><i class="bi bi-heart"></i></a>
											<a href="#!" class="btn-action" data-bs-toggle="tooltip" data-bs-html="true" title="Compare"><i class="bi bi-arrow-left-right"></i></a>
										</div>
									</div>
									<div class="text-small mb-1">
										<a href="#!" class="text-decoration-none text-muted"><small>Dairy, Bread & Eggs</small></a>
									</div>
									<h2 class="fs-6"><a href="./pages/shop-single.html" class="text-inherit text-decoration-none">Amul Butter - 500 g</a></h2>
									<div class="text-warning">
										<small>
											<i class="bi bi-star-fill"></i>
											<i class="bi bi-star-fill"></i>
											<i class="bi bi-star-fill"></i>
											<i class="bi bi-star-half"></i>
											<i class="bi bi-star"></i>
										</small>
										<span class="text-muted small">3.5 (89)</span>
									</div>
									<div class="d-flex justify-content-between mt-4">
										<div>
											<span class="text-dark">$13</span>
											<span class="text-decoration-line-through text-muted">$18</span>
										</div>
										<div>
											<a href="#!" class="btn btn-primary btn-sm">
												<svg
													xmlns="http://www.w3.org/2000/svg"
													width="16"
													height="16"
													viewBox="0 0 24 24"
													fill="none"
													stroke="currentColor"
													stroke-width="2"
													stroke-linecap="round"
													stroke-linejoin="round"
													class="feather feather-plus"
												>
													<line x1="12" y1="5" x2="12" y2="19"></line>
													<line x1="5" y1="12" x2="19" y2="12"></line>
												</svg>
												Add
											</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
			<!-- Popular Products End-->
			<section>
				<div class="container">
					<div class="row">
						<div class="col-md-12 mb-6">
							<h3 class="mb-0">Daily Best Sells</h3>
						</div>
					</div>
					<div class="table-responsive-lg pb-6">
						<div class="row row-cols-lg-4 row-cols-1 row-cols-md-2 g-4 flex-nowrap">
							<div class="col">
								<div class="pt-8 px-6 px-xl-8 rounded" style="background: url(resources/images/banner/banner-deal.jpg) no-repeat; background-size: cover; height: 470px">
									<div>
										<h3 class="fw-bold text-white">100% Organic Coffee Beans.</h3>
										<p class="text-white">Get the best deal before close.</p>
										<a href="#!" class="btn btn-primary">
											Shop Now
											<i class="feather-icon icon-arrow-right ms-1"></i>
										</a>
									</div>
								</div>
							</div>
							<div class="col">
								<div class="card card-product">
									<div class="card-body">
										<div class="text-center position-relative">
											<a href="./pages/shop-single.html"><img src="resources/images/products/product-img-11.jpg" alt="Grocery Ecommerce Template" class="mb-3 img-fluid" /></a>

											<div class="card-product-action">
												<a href="#!" class="btn-action" data-bs-toggle="modal" data-bs-target="#quickViewModal">
													<i class="bi bi-eye" data-bs-toggle="tooltip" data-bs-html="true" title="Quick View"></i>
												</a>
												<a href="#!" class="btn-action" data-bs-toggle="tooltip" data-bs-html="true" title="Wishlist"><i class="bi bi-heart"></i></a>
												<a href="#!" class="btn-action" data-bs-toggle="tooltip" data-bs-html="true" title="Compare"><i class="bi bi-arrow-left-right"></i></a>
											</div>
										</div>
										<div class="text-small mb-1">
											<a href="#!" class="text-decoration-none text-muted"><small>Tea, Coffee & Drinks</small></a>
										</div>
										<h2 class="fs-6"><a href="./pages/shop-single.html" class="text-inherit text-decoration-none">Roast Ground Coffee</a></h2>

										<div class="d-flex justify-content-between align-items-center mt-3">
											<div>
												<span class="text-dark">$13</span>
												<span class="text-decoration-line-through text-muted">$18</span>
											</div>
											<div>
												<small class="text-warning">
													<i class="bi bi-star-fill"></i>
													<i class="bi bi-star-fill"></i>
													<i class="bi bi-star-fill"></i>
													<i class="bi bi-star-fill"></i>
													<i class="bi bi-star-half"></i>
												</small>
												<span><small>4.5</small></span>
											</div>
										</div>
										<div class="d-grid mt-2">
											<a href="#!" class="btn btn-primary">
												<svg
													xmlns="http://www.w3.org/2000/svg"
													width="16"
													height="16"
													viewBox="0 0 24 24"
													fill="none"
													stroke="currentColor"
													stroke-width="2"
													stroke-linecap="round"
													stroke-linejoin="round"
													class="feather feather-plus"
												>
													<line x1="12" y1="5" x2="12" y2="19"></line>
													<line x1="5" y1="12" x2="19" y2="12"></line>
												</svg>
												Add to cart
											</a>
										</div>
										<div class="d-flex justify-content-start text-center mt-3">
											<div class="deals-countdown w-100" data-countdown="2028/10/10 00:00:00"></div>
										</div>
									</div>
								</div>
							</div>
							<div class="col">
								<div class="card card-product">
									<div class="card-body">
										<div class="text-center position-relative">
											<a href="./pages/shop-single.html"><img src="resources/images/products/product-img-12.jpg" alt="Grocery Ecommerce Template" class="mb-3 img-fluid" /></a>
											<div class="card-product-action">
												<a href="#!" class="btn-action" data-bs-toggle="modal" data-bs-target="#quickViewModal">
													<i class="bi bi-eye" data-bs-toggle="tooltip" data-bs-html="true" title="Quick View"></i>
												</a>
												<a href="#!" class="btn-action" data-bs-toggle="tooltip" data-bs-html="true" title="Wishlist"><i class="bi bi-heart"></i></a>
												<a href="#!" class="btn-action" data-bs-toggle="tooltip" data-bs-html="true" title="Compare"><i class="bi bi-arrow-left-right"></i></a>
											</div>
										</div>
										<div class="text-small mb-1">
											<a href="#!" class="text-decoration-none text-muted"><small>Fruits & Vegetables</small></a>
										</div>
										<h2 class="fs-6"><a href="./pages/shop-single.html" class="text-inherit text-decoration-none">Crushed Tomatoes</a></h2>
										<div class="d-flex justify-content-between align-items-center mt-3">
											<div>
												<span class="text-dark">$13</span>
												<span class="text-decoration-line-through text-muted">$18</span>
											</div>
											<div>
												<small class="text-warning">
													<i class="bi bi-star-fill"></i>
													<i class="bi bi-star-fill"></i>
													<i class="bi bi-star-fill"></i>
													<i class="bi bi-star-fill"></i>
													<i class="bi bi-star-half"></i>
												</small>
												<span><small>4.5</small></span>
											</div>
										</div>
										<div class="d-grid mt-2">
											<a href="#!" class="btn btn-primary">
												<svg
													xmlns="http://www.w3.org/2000/svg"
													width="16"
													height="16"
													viewBox="0 0 24 24"
													fill="none"
													stroke="currentColor"
													stroke-width="2"
													stroke-linecap="round"
													stroke-linejoin="round"
													class="feather feather-plus"
												>
													<line x1="12" y1="5" x2="12" y2="19"></line>
													<line x1="5" y1="12" x2="19" y2="12"></line>
												</svg>
												Add to cart
											</a>
										</div>
										<div class="d-flex justify-content-start text-center mt-3 w-100">
											<div class="deals-countdown w-100" data-countdown="2028/12/9 00:00:00"></div>
										</div>
									</div>
								</div>
							</div>
							<div class="col">
								<div class="card card-product">
									<div class="card-body">
										<div class="text-center position-relative">
											<a href="./pages/shop-single.html"><img src="resources/images/products/product-img-13.jpg" alt="Grocery Ecommerce Template" class="mb-3 img-fluid" /></a>
											<div class="card-product-action">
												<a href="#!" class="btn-action" data-bs-toggle="modal" data-bs-target="#quickViewModal">
													<i class="bi bi-eye" data-bs-toggle="tooltip" data-bs-html="true" title="Quick View"></i>
												</a>
												<a href="#!" class="btn-action" data-bs-toggle="tooltip" data-bs-html="true" title="Wishlist"><i class="bi bi-heart"></i></a>
												<a href="#!" class="btn-action" data-bs-toggle="tooltip" data-bs-html="true" title="Compare"><i class="bi bi-arrow-left-right"></i></a>
											</div>
										</div>
										<div class="text-small mb-1">
											<a href="#!" class="text-decoration-none text-muted"><small>Fruits & Vegetables</small></a>
										</div>
										<h2 class="fs-6"><a href="./pages/shop-single.html" class="text-inherit text-decoration-none">Golden Pineapple</a></h2>
										<div class="d-flex justify-content-between align-items-center mt-3">
											<div>
												<span class="text-dark">$13</span>
												<span class="text-decoration-line-through text-muted">$18</span>
											</div>
											<div>
												<small class="text-warning">
													<i class="bi bi-star-fill"></i>
													<i class="bi bi-star-fill"></i>
													<i class="bi bi-star-fill"></i>
													<i class="bi bi-star-fill"></i>
													<i class="bi bi-star-half"></i>
												</small>
												<span><small>4.5</small></span>
											</div>
										</div>
										<div class="d-grid mt-2">
											<a href="#!" class="btn btn-primary">
												<svg
													xmlns="http://www.w3.org/2000/svg"
													width="16"
													height="16"
													viewBox="0 0 24 24"
													fill="none"
													stroke="currentColor"
													stroke-width="2"
													stroke-linecap="round"
													stroke-linejoin="round"
													class="feather feather-plus"
												>
													<line x1="12" y1="5" x2="12" y2="19"></line>
													<line x1="5" y1="12" x2="19" y2="12"></line>
												</svg>
												Add to cart
											</a>
										</div>
										<div class="d-flex justify-content-start text-center mt-3">
											<div class="deals-countdown w-100" data-countdown="2028/11/11 00:00:00"></div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
			<section class="my-lg-14 my-8">
				<div class="container">
					<c:forEach items="${bestReview}" var="bestReview">
					<div class="row">
						<div class="col-md-6 col-lg-3">
							<div class="mb-8 mb-xl-0">
								<div class="mb-6"><img src="https://rentally.s3.ap-northeast-2.amazonaws.com/${bestReview.product_seq}/
													${bestReview.product_img}" alt="" /></div>
								<h3 class="h5 mb-3">${bestReview.product_name}</h3>
								<p>${bestReview.review_content}</p>
							</div>
						</div>
				
						</div>
						</c:forEach>
				</div>
			</section>
		</main>
<!-- Footer -->
	
	<%@include file="./common/footer.jsp"%>

		<!-- Javascript-->

		
		<script src="resources/js/vendors/jquery.min.js"></script>
		<script src="resources/js/vendors/countdown.js"></script>
		 <script src="resources/libs/slick-carousel/slick/slick.min.js"></script>
		<script src="resources/js/vendors/slick-slider.js"></script>
	 	<script src="resources/libs/tiny-slider/dist/min/tiny-slider.js"></script>
		<script src="resources/js/vendors/tns-slider.js"></script>
		<script src="resources/js/vendors/zoom.js"></script>
<script>
//검색기능
// Enter 키 처리 함수
function handleEnter(event) {
    if (event.key === "Enter") {
        event.preventDefault(); // 기본 폼 제출 동작 방지
        const query = event.target.value.trim(); // 입력값에서 공백 제거
        console.log('Search query:', query); // 디버깅용 로그
        if (query) {
            f_search(query); // 검색 함수 호출
        } else {
            console.warn('검색어를 입력해주세요.');
        }
    }
}

// 검색 처리 함수
function f_search(query) {
    if (query.trim() === "") {
        alert("검색어를 입력해주세요.");
        return;
    }

    // AJAX 요청을 통해 검색
    performAjaxSearch(query);
}

// AJAX로 검색 수행
function performAjaxSearch() {
    const query = $('#searchInput').val().trim();

    if (query === "") {
        alert("검색어를 입력해주세요.");
        return;
    }

    // contextPath 가져오기
    const path = '${pageContext.request.contextPath}';

    $.ajax({
        url: `${path}/product/search`,  // 검색 처리할 URL
        method: 'GET',
        data: { query: query },  // 검색어 전달
        success: function(response) {
            // 검색 결과를 DOM에 표시
            $('#productListContainer').html(response);  // 반환된 결과로 DOM 업데이트
        },
        error: function(error) {
            console.error('검색 요청 실패:', error);
        }
    });
}
	</script>

</body>
</html>