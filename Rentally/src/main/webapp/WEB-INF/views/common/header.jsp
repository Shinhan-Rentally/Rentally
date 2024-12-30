<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.servletContext.contextPath}"
	scope="application"></c:set>
<!-- navbar -->
<div class="border-bottom">

	<div class="py-5">
		<div class="container">
			<div class="row w-100 align-items-center gx-lg-2 gx-0">
				<div class="col-xxl-2 col-lg-3 col-md-6 col-5">
					<a class="navbar-brand d-none d-lg-block" href="${path}/main">
						<img src="https://rentally.s3.ap-northeast-2.amazonaws.com/logo/RENTALLY_LOGO.png"
						alt="eCommerce HTML Template" style="width:200px; height:64px;" />
					</a>

				</div>
				<div class="col-xxl-5 col-lg-5 d-none d-lg-block">

					<div class="input-group">
						<input class="form-control rounded" type="search" name="query"
							id="searchInput" placeholder="Search for products"
							onkeydown="handleEnter(event)" /> <span
							class="input-group-append">
							<button onclick="performAjaxSearch()"
								class="btn bg-white border border-start-0 ms-n10 rounded-0 rounded-end"
								type="button">
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
									viewBox="0 0 24 24" fill="none" stroke="currentColor"
									stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
									class="feather feather-search">
                <circle cx="11" cy="11" r="8"></circle>
                <line x1="21" y1="21" x2="16.65" y2="16.65"></line>
            </svg>
							</button>
						</span>
					</div>


				</div>

				<!-- 위시리스트-->
				<div class="col-lg-2 col-xxl-2 text-end col-md-6 col-7">
					<div class="list-inline">
						<c:if test="${cust_id ne null}">
							<div class="list-inline-item me-5">
								<a href="${path}/wishlist/list/"
									class="text-muted position-relative"> <svg
										xmlns="http://www.w3.org/2000/svg" width="20" height="20"
										viewBox="0 0 24 24" fill="none" stroke="currentColor"
										stroke-width="2" stroke-linecap="round"
										stroke-linejoin="round" class="feather feather-heart">
									<path
											d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z">
									</path>
								</svg> <!-- 위시리스트 갯수 --> <span
									class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-success">
										${wishlist_count} <span class="visually-hidden">위시리스트</span>
								</span>
								</a>
							</div>
						</c:if>
						<c:if test="${cust_id eq null}">

							<div class="list-inline-item me-5">
								<a href="${path}/customer/login"
									class="text-muted position-relative"> <svg
										xmlns="http://www.w3.org/2000/svg" width="20" height="20"
										viewBox="0 0 24 24" fill="none" stroke="currentColor"
										stroke-width="2" stroke-linecap="round"
										stroke-linejoin="round" class="feather feather-heart">
									<path
											d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z">
									</path>
								</svg> <!-- 위시리스트 갯수 --> <span
									class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-success">
										0 <span class="visually-hidden">위시리스트</span>
								</span>
								</a>
							</div>
						</c:if>

						<!-- 유저 아이콘 -->
						<c:if test="${cust_id ne null}">
							<div class="list-inline-item me-5">
								<a href="${path}/customer/list" class="text-muted"
									data-bs-toggle="modal" data-bs-target="#userModal"> <svg
										xmlns="http://www.w3.org/2000/svg" width="20" height="20"
										viewBox="0 0 24 24" fill="none" stroke="currentColor"
										stroke-width="2" stroke-linecap="round"
										stroke-linejoin="round" class="feather feather-user">
									<path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
									<circle cx="12" cy="7" r="4"></circle>
								</svg>
								</a>
							</div>
						</c:if>

						<!-- 유저 아이콘 -->
						<c:if test="${cust_id eq null}">
							<div class="list-inline-item me-5">
								<a href="${path}/customer/login" class="text-muted"
									data-bs-toggle="modal" data-bs-target="#userModal"> <svg
										xmlns="http://www.w3.org/2000/svg" width="20" height="20"
										viewBox="0 0 24 24" fill="none" stroke="currentColor"
										stroke-width="2" stroke-linecap="round"
										stroke-linejoin="round" class="feather feather-user">
									<path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
									<circle cx="12" cy="7" r="4"></circle>
								</svg>
								</a>
							</div>
						</c:if>

						<c:if test="${cust_id ne null}">
							<div class="list-inline-item me-5 me-lg-0">
								<a class="text-muted position-relative"
									data-bs-toggle="offcanvas" data-bs-target="#offcanvasRight"
									href="${path}/cart/list" role="button"
									aria-controls="offcanvasRight"> <svg
										xmlns="http://www.w3.org/2000/svg" width="20" height="20"
										viewBox="0 0 24 24" fill="none" stroke="currentColor"
										stroke-width="2" stroke-linecap="round"
										stroke-linejoin="round" class="feather feather-shopping-bag">
									<path d="M6 2L3 6v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V6l-3-4z"></path>
									<line x1="3" y1="6" x2="21" y2="6"></line>
									<path d="M16 10a4 4 0 0 1-8 0"></path>
								</svg> <!-- 장바구니 갯수 --> <span
									class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-success">
										${cart_count}<span class="visually-hidden">장바구니</span>
								</span>
								</a>
							</div>
						</c:if>
						<c:if test="${cust_id eq null}">
							<div class="list-inline-item me-5 me-lg-0">
								<a class="text-muted position-relative"
									data-bs-toggle="offcanvas" data-bs-target="#offcanvasRight"
									href="${path}/customer/login" role="button"
									aria-controls="offcanvasRight"> <svg
										xmlns="http://www.w3.org/2000/svg" width="20" height="20"
										viewBox="0 0 24 24" fill="none" stroke="currentColor"
										stroke-width="2" stroke-linecap="round"
										stroke-linejoin="round" class="feather feather-shopping-bag">
									<path d="M6 2L3 6v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V6l-3-4z"></path>
									<line x1="3" y1="6" x2="21" y2="6"></line>
									<path d="M16 10a4 4 0 0 1-8 0"></path>
								</svg> <!-- 장바구니 갯수 --> <span
									class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-success">
										0<span class="visually-hidden">장바구니</span>
								</span>
								</a>
							</div>
						</c:if>

					</div>
				</div>
			</div>
		</div>
	</div>

	<nav
		class="navbar navbar-expand-lg navbar-light navbar-default py-0 pb-lg-4"
		aria-label="Offcanvas navbar large">
		<div class="container">
			<div class="offcanvas offcanvas-start" tabindex="-1"
				id="navbar-default" aria-labelledby="navbar-defaultLabel">
				<div class="offcanvas-header pb-1">
					<a href="./index.html"><img
						src="${path}/resources/images/logo/freshcart-logo.svg"
						alt="eCommerce HTML Template" /></a>
					<button type="button" class="btn-close" data-bs-dismiss="offcanvas"
						aria-label="Close"></button>
				</div>
				<div class="offcanvas-body">
					<div class="d-block d-lg-none mb-4">
						<form action="#">
							<div class="input-group">
								<input class="form-control rounded" type="search"
									placeholder="Search for products" /> <span
									class="input-group-append">
									<button
										class="btn bg-white border border-start-0 ms-n10 rounded-0 rounded-end"
										type="button">
										<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
											viewBox="0 0 24 24" fill="none" stroke="currentColor"
											stroke-width="2" stroke-linecap="round"
											stroke-linejoin="round" class="feather feather-search">
											<circle cx="11" cy="11" r="8"></circle>
											<line x1="21" y1="21" x2="16.65" y2="16.65"></line>
										</svg>
									</button>
								</span>
							</div>
						</form>
					</div>
					<div>
						<ul class="navbar-nav align-items-center d-flex">
							<!-- 기존 메뉴 -->
							<li class="nav-item w-100 w-lg-auto"><a class="nav-link"
								href="${path}/product/list?category_seq=1">TV</a></li>
							<li class="nav-item w-100 w-lg-auto"><a class="nav-link"
								href="${path}/product/list?category_seq=2">냉장고</a></li>
							<li class="nav-item w-100 w-lg-auto"><a class="nav-link"
								href="${path}/product/list?category_seq=3">건조기</a></li>
							<li class="nav-item w-100 w-lg-auto"><a class="nav-link"
								href="${path}/product/list?category_seq=4">세탁기</a></li>
							<li class="nav-item w-100 w-lg-auto"><a class="nav-link"
								href="${path}/product/list?category_seq=5">공기청정기</a></li>
							<li class="nav-item w-100 w-lg-auto"><a class="nav-link"
								href="${path}/product/list?category_seqseq=6">청소기</a></li>
							<li class="nav-item w-100 w-lg-auto"><a class="nav-link"
								href="${path}/product/list?category_seq=7">전자레인지</a></li>
							<li class="nav-item w-100 w-lg-auto"><a class="nav-link"
								href="${path}/product/list?category_seq=8">에어컨</a></li>
							<li class="nav-item w-100 w-lg-auto"><a class="nav-link"
								href="${path}/product/list?category_seq=9">스타일러</a></li>

							<!-- 조건부 DashBoard -->
							<c:if test="${cust_id ne null and cust_grade == 1}">
								<li class="nav-item w-100 w-lg-auto ml-auto"><a
									class="nav-link" href="${path}/admin/product/list">DashBoard</a></li>
							</c:if>

							<!-- 고객지원 -->
							<li class="nav-item w-100 w-lg-auto ml-auto"><a
								class="nav-link" href="#">고객지원</a></li>
						</ul>
					</div>


				</div>
			</div>
		</div>
	</nav>

</div>




<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<script src="${path}/resources/js/vendors/validation.js"></script>
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
			url : '${path}/product/list', // 검색 처리할 URL
			method : 'GET',
			data : {
				query : query
			}, // 검색어 전달
			success : function(response) {
				// 검색 결과를 DOM에 표시
				$('#productListContainer').html(response); // 반환된 결과로 DOM 업데이트
			},
			error : function(error) {
				console.error('검색 요청 실패:', error);
			}
		});
	}
</script>


