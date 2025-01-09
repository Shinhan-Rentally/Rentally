<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Rentally</title>
<%@ include file="./common/headMeta.jsp"%>
<%@ include file="./common/headLinks.jsp"%>

<link rel="stylesheet" href="${path}/resources/css/theme.css">
<link href="${path}/resources/libs/slick-carousel/slick/slick.css" rel="stylesheet" />
<link href="${path}/resources/libs/slick-carousel/slick/slick-theme.css" rel="stylesheet" />
<link href="${path}/resources/libs/tiny-slider/dist/tiny-slider.css" rel="stylesheet" />
</head>
<style>
.category-slider .fixed-card {
	width: 200px; /* 카드의 고정된 너비 */
	height: 300px; /* 카드의 고정된 높이 */
	margin: auto; /* 중앙 정렬 */
}

.category-slider .image-container {
	width: 100%; /* 컨테이너 너비 */
	height: 150px; /* 컨테이너 높이 */
	display: flex;
	justify-content: center;
	align-items: center;
	overflow: hidden; /* 이미지를 잘라냄 */
}

.category-slider .product-img {
	max-width: 100%;
	max-height: 100%;
	object-fit: cover; /* 비율 유지하며 잘라냄 */
	display: block;
}
/* 이미지 컨테이너 */
.card-body {
	padding: 16px;
	text-align: center;
}

.card-body img {
	width: 100%;
	height: 150px; /* 이미지 고정 높이 */
	object-fit: cover; /* 비율 유지하며 크기 조정 */
	border-radius: 4px;
	margin-bottom: 10px;
}
p h3 {
  max-height: 4.5em; /* 3줄 기준 높이 설정 */
  overflow: hidden; /* 넘친 텍스트 숨김 */
  text-overflow: ellipsis; /* 텍스트 생략 처리 */
  display: -webkit-box;
  -webkit-line-clamp: 3; /* 최대 3줄 표시 */
  -webkit-box-orient: vertical;
}
</style>
<body>
	<!-- 헤더화면 임포트 -->
	<%@ include file="./common/header.jsp"%>

	<main>
		<section class="mt-8">
			<div class="container">
				<div class="hero-slider">
					<div
						style="background: url(https://rentally.s3.ap-northeast-2.amazonaws.com/logo/RENTALLY_LOGO-title_001.png) no-repeat center center; background-size: cover; border-radius: 0.5rem; width: 1200px; height: 628px; margin: 0 auto;">
					</div>
					<div
						style="background: url(https://rentally.s3.ap-northeast-2.amazonaws.com/logo/RENTALLY_LOGO-title_002.png) no-repeat center center; background-size: cover; border-radius: 0.5rem; width: 1200px; height: 628px; margin: 0 auto;">
					</div>
					<div
						style="background: url(https://rentally.s3.ap-northeast-2.amazonaws.com/logo/RENTALLY_LOGO-title_003.png) no-repeat center center; background-size: cover; border-radius: 0.5rem; width: 1200px; height: 628px; margin: 0 auto;">
					</div>
					<div
						style="background: url(https://rentally.s3.ap-northeast-2.amazonaws.com/logo/RENTALLY_LOGO-title_004.png) no-repeat center center; background-size: cover; border-radius: 0.5rem; width: 1200px; height: 628px; margin: 0 auto;">
					</div>
				</div>
			</div>
		</section>
		<section class="mb-lg-10 mt-lg-14 my-8">
			<div class="container">
				<div class="row">
					<div class="col-12 mb-6">
						<h3 class="mb-0">베스트상품</h3>
					</div>
				</div>
				<div class="category-slider">
					<c:forEach items="${bestProduct}" var="bestProduct">
						<div class="item">
							<a href="${path}/product/detail?product_seq=${bestProduct.product_seq}"
								class="text-decoration-none text-inherit">
								<div class="card card-product mb-lg-4">
									<div class="card-body text-center py-8">
										<img
											src="https://rentally.s3.ap-northeast-2.amazonaws.com/${bestProduct.category_seq}/
													${bestProduct.product_img}"
											alt="Grocery Ecommerce Template" class="mb-3 img-fluid" />
										<div class="text-truncate">${bestProduct.product_name}</div>
									</div>
								</div>
							</a>
						</div>
					</c:forEach>
				</div>
			</div>
		</section>
		<section class="my-lg-14 my-8">
			<div class="container">
				<div class="row">
				<div class="col-12 mb-6">
						<h3 class="mb-0">베스트리뷰</h3>
					</div>
					<c:forEach items="${bestReview}" var="bestReview"
						varStatus="status">
						<c:if test="${status.index < 4}">
							<div class="col-md-6 col-lg-3">
								<div class="border rounded p-3 mb-8 mb-xl-0">
									<div class="mb-6">
										<img src="${path}/resources/images/icons/package.svg" alt="" />
									</div>
									<h3 class="h5 mb-3 custName">${bestReview.cust_id}</h3>
									<h3 class="h5 mb-3">${bestReview.product_name}</h3>
									<p>${bestReview.review_content}</p>
								</div>
							</div>
						</c:if>
					</c:forEach>
				</div>
			</div>
		</section>
	</main>
	<!-- Footer -->
	<%@include file="./common/footer.jsp"%>
	<!-- kakao -->
	<%@ include file="./common/bottomKakao.jsp"%>

	<!-- Javascript-->
	<script src="${path}/resources/js/vendors/jquery.min.js"></script>
	<script src="${path}/resources/js/vendors/countdown.js"></script>
	<script src="${path}/resources/libs/slick-carousel/slick/slick.min.js"></script>
	<script src="${path}/resources/js/vendors/slick-slider.js"></script>
	<script src="${path}/resources/libs/tiny-slider/dist/min/tiny-slider.js"></script>
	<script src="${path}/resources/js/vendors/tns-slider.js"></script>
	<script src="${path}/resources/js/vendors/zoom.js"></script>
<!-- 베스트리뷰 java script -->	
<script>
    // 모든 이름 요소 선택
    const nameElements = document.querySelectorAll(".custName");

    // 각 이름 요소에 대해 마스킹 처리
    nameElements.forEach((nameElement) => {
        const name = nameElement.textContent.trim(); // 공백 제거
        let maskedName = name;

        if (name.length === 4) {
            maskedName = name.substring(0, 2) + "**";
        } else if (name.length > 1) {
            maskedName = name.charAt(0) + "**";
        }
        nameElement.textContent = maskedName;
    });
</script>

</body>
</html>