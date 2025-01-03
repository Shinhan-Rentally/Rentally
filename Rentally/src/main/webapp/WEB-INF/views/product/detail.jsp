<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="../common/headMeta.jsp"%>
<title>${detail.product_name} - Rentally</title>
<link href="${path}/resources/libs/tiny-slider/dist/tiny-slider.css"
	rel="stylesheet" />
<%@ include file="../common/headLinks.jsp"%>
<style>
.btn-selected {
	background-color: #0046ff;
	color: white;
	border-color: #0046ff;
}
#modal{
	display: none;
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0,0,0,0.6);
	z-index:3;
}
.modal-content{
	position: absolute;
	width: 300px;
	height: 180px;
	z-index: 4;
	top: 33%;
	left: 33%;
	padding: 20px;
	background: #ffffff;
	border-radius: 20px;
}
.modal-body p{
	padding:15px;
	text-align: center;
	font-size: 16px;
}
#closeModal{
	margin-right: 5px;
}
.modal-footer{
	margin-bottom: 5px;
}
</style>
</head>
<body>
	<%@include file="../common/header.jsp"%>
	<main>
		<div class="mt-4">
			<div class="container">
				<div class="row">
					<div class="col-12">
						<!-- 상단 내역 -->
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb mb-0">
								<li class="breadcrumb-item"><a href="${path}/main">Home</a></li>
								<li class="breadcrumb-item"><a
									href="${path}/product/list?category_seq=${detail.category_seq}">${detail.category_name}</a></li>
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
						<!-- 줌 이미지 -->
						<div class="product" id="product">
							<div class="zoom" onmousemove="zoom(event)"
								style="background-image: url(https://rentally.s3.ap-northeast-2.amazonaws.com/${detail.category_seq}/${detail.product_img})">

								<!-- 댜표 이미지 -->
								<img
									src="https://rentally.s3.ap-northeast-2.amazonaws.com/${detail.category_seq}/${detail.product_img}"
									alt="상품이미지" />
							</div>
						</div>

					</div>
					<div class="col-md-7 col-xl-6">
						<div class="ps-lg-10 mt-6 mt-md-0">
							<!-- 상품 브랜드 -->
							<a href="#!" class="mb-4 d-block">${detail.product_brand}</a>
							<!-- 상품명 -->
							<h1 class="mb-1">${detail.product_name}</h1>

							<div class="mb-4">

								<!-- 상품 별점 평점, 리뷰개수 -->
								<small class="text-warning">
									<c:forEach var="i" begin="1" end="5">
										<c:choose>
											<c:when test="${i <= (reviewList[0].review_avg)}">
												<i class="bi bi-star-fill"></i>
											</c:when>
											<c:when test="${i - 0.5 <= reviewList[0].review_avg}">
												<i class="bi bi-star-half"></i>
											</c:when>
											<c:otherwise>
												<i class="bi bi-star"></i>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</small> <span class="text-muted small"> <fmt:formatNumber
										value="${reviewList[0].review_avg}" type="number"
										maxFractionDigits="2" /> (${fn:length(reviewList)})
								</span>
							</div>

							<!-- hr -->
							<hr class="my-6" />
							<h6>구독 기간 선택</h6>
							<form action="${path}/payment" method="post" id="periodForm">
								<input type="hidden" name="product_seq"
									value="${detail.product_seq}"> <input type="hidden"
									name="product_period" id="productPeriod" value="">
							</form>
							<div id="period" class="mb-5">
								<button type="button" class="btn btn-outline-secondary"
									value="6">6개월</button>
								<!-- btn -->
								<button type="button" class="btn btn-outline-secondary"
									value="12">1년</button>
								<!-- btn -->
								<button type="button" class="btn btn-outline-secondary"
									value="24">2년</button>
							</div>
							<!-- hr -->
							<hr class="my-6" />
							<div class="fs-4">
								<!-- price -->
								<span class="fw-bold text-dark"> 월 <fmt:formatNumber
										value="${detail.product_pay}" type="number" pattern="#,###" />
									원
								</span>
							</div>
							<!-- hr -->
							<hr class="my-6" />
							<div
								class="mt-3 row justify-content-start g-2 align-items-center">
								<div class="col-xxl-4 col-lg-4 col-md-5 col-5 d-grid">
									<!-- button -->
									<!-- btn -->
									<button id="subscribeButton" type="submit" class="btn btn-info">구독하기</button>
								</div>
								<div class="col-md-4 col-4">
									<!-- btn -->
									<a id="cartcart" class="btn btn-light" href="#" data-bs-toggle="tooltip"
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
									<img class="rounded mx-auto d-block"
										src="https://rentally.s3.ap-northeast-2.amazonaws.com/${detail.category_seq}/${detail.product_detail}"
										alt="상품상세설명이미지" />
								</div>
							</div>
							<!-- tab pane -->
							<div class="tab-pane fade" id="details-tab-pane" role="tabpanel"
								aria-labelledby="details-tab" tabindex="0">
								<div class="my-8">
									<div class="row justify-content-center">
										<div class="col-12">
											<h4 class="mb-4">세부정보</h4>
										</div>
										<div class="col-12 col-lg-6">
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
													
												</tbody>
											</table>
										</div>
										<div class="col-12 col-lg-6">
											<table class="table table-striped">
												<!-- table -->
												<tbody>
													
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
														<select id="reviewSortFilter" class="form-select">
															<option selected>Top Reviews</option>
															<option value="Most Recent">Most Recent</option>
														</select>
													</div>
												</div>
												<c:if test="${empty reviewList[0]}">현재 상품에 대한 리뷰가 없습니다.</c:if>
												<div class="d-flex border-bottom pb-6 mb-6">
													<div id="reviewList" class="col-12">
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
			</div>
		</section>

	</main>
	<!-- 장바구니 추가 확인 모달 -->

		<div id="modal" class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="reviewModalLabel">장바구니 담기</h5>
				</div>
				<div class="modal-body">
				
						<p for="cartText" class="form-label">장바구니에 상품이<br>성공적으로 담겼습니다.</p>
				
				</div>
				<div class="modal-footer">
					<button id="closeModal" type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">쇼핑 계속하기</button>
					<button id="moveCart" type="button" class="btn btn-info">
							장바구니 이동</button>
				</div>
			</div>
		</div>

	<!-- Footer -->
	<%@include file="../common/footer.jsp"%>


	<!-- Javascript-->
	<script src="${path}/resources/libs/rater-js/index.js"></script>
	<script src="${path}/resources/js/vendors/jquery.min.js"></script>
	<script
		src="${path}/resources/libs/tiny-slider/dist/min/tiny-slider.js"></script>
	<script src="${path}/resources/js/vendors/tns-slider.js"></script>
	<script src="${path}/resources/js/vendors/zoom.js"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<script>
		//구독기간
		let selectPeriod = null;
		$('#period button').click(function(){
			$('#period button').removeClass('btn-info').addClass('btn-outline-secondary');
			$(this).removeClass('btn-outline-secondary').addClass('btn-info');
			$(this).click(function(){
				$(this).removeClass('btn-info').addClass('btn-outline-secondary');
			});
			selectPeriod = $(this).val();
		});
		
		
		//구독하기 버튼 클릭
		$('#subscribeButton').click(function(){
			if(!selectPeriod){
				alert("기간을 선택해주세요.");
			}else{
				$('#productPeriod').val(selectPeriod);
				setTimeout(function(){
					$('#periodForm').submit();				
				}, 1500);
			}
		});
		
				
		//탭전환
		$('#myTab button').on('click', function(){
			var tabId = $(this).attr('data-bs-target');
			$('.nav-link').removeClass('active');
			$(this).addClass('active');
			$('.tab-pane').removeClass('show active');
			$(tabId).addClass('show active');
		});
		
		//기본탭설정
		$('#product-tab').trigger('click');
		
		//기본리뷰설정
		$(document).ready(function() {
		    loadReviews('Top Reviews');
		});
		
		//리뷰최신순 정렬
		$('#reviewSortFilter').change(function(){
			var sortValue = $(this).val();
			loadReviews(sortValue);
		});
		
		//리뷰조회 ajax 함수
		function loadReviews(sortValue){
		$.ajax({
    		url: '${path}/review/ratehigh',
    		method: 'GET',
    		data: {
        		product_seq: ${detail.product_seq}
    			},
    		success: function(reviews) {
    			if (sortValue === 'Most Recent') {
                    // 최신순 정렬
                    reviews.sort(function(a, b) {
                        return new Date(b.review_date) - new Date(a.review_date);
                    });
                } else {
                    // 기본적으로 별점순 정렬
                    reviews.sort(function(a, b) {
                        return b.review_rate - a.review_rate;
                    });
                }
        		var reviewHtml = '';
        		
        		$.each(reviews, function(index, review) {
        			const date = new Date(review.review_date);
        		    const formattedDate = date.toLocaleDateString('ko-KR', {
        		        year: 'numeric',
        		        month: '2-digit',
        		        day: '2-digit'
        		    });

        		    let stars = '';
        		    for (let i = 1; i <= 5; i++) {
        		        if (i <= review.review_rate) {
        		            stars += '<i class="bi bi-star-fill"></i>'; // 꽉 찬 별
        		        } else {
        		            stars += '<i class="bi bi-star"></i>'; // 빈 별
        		        }
        		    }
           			reviewHtml += `
                			<div class="ms-10">
                    			<h6> \${review.cust_id} </p>
                    			<p class="small">
                    				<span class="text-muted">
                    					\${formattedDate}
                    				</span>
                    			</p>
                    			<div class="mb-2 text-warning">
                    				\${stars}
                    			</div>
                    			<p>\${review.review_content}</p>
                			</div>
                			<hr class="my-6" />
            				`;
        		});

        		$('#reviewList').html(reviewHtml);
        		
    		},
    		error: function(xhr, status, error) {
        		console.error("Error fetching reviews: ", error);
    		}
		
		});
		}
		
		//장바구니모달
		$('#cartcart').on('click',function(){
			if(!selectPeriod){
				alert("기간을 선택해주세요.");
			}else{
				$('#modal').show();
				$.ajax({
					url: "${path}/cart/product/add",
					type: "post",
					data: {
						product_seq: ${detail.product_seq},
						cart_option: selectPeriod
					},
					success: function(response){
					
							window.location.href = "${path}/cart/list";
						
					},
					error: function(){
						alert("오류발생~ 여기는 장바구니~ 장바구니~");
					}
					
				});
			}
		});
		$('#closeModal').click(function(){
			$('#modal').hide();
		});
	
		$('#moveCart').click(function(){
			window.location.href = "${path}/cart/list";
		});
	</script>
</body>
</html>