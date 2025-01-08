<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value="${pageContext.servletContext.contextPath}"
	scope="application"></c:set>








<!-- navbar -->
<div class="border-bottom">

	<div class="py-5">
		<div class="container">
			<div class="row w-100 align-items-center gx-lg-2 gx-0">
				<div class="col-xxl-2 col-lg-3 col-md-6 col-5">
					<a class="navbar-brand d-none d-lg-block" href="${path}/main">

						<img
						src="https://rentally.s3.ap-northeast-2.amazonaws.com/logo/RENTALLY_LOGO.png"
						alt="eCommerce HTML Template" style="width: 200px; height: 64px;" />
					</a>

				</div>
				<div
					class="col-xxl-5 col-lg-5 d-none d-lg-block mx-auto text-center">
					<div class="input-group">
						<input class="form-control rounded" type="search" name="query"
							value="${param.query}" placeholder="Search for products"
							onkeydown="handleEnter(event)" /> <span
							class="input-group-append">
							<button id="btnSearch"
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
								<a href="${path}/wishlist/list"
									class="text-muted position-relative"> <svg
										xmlns="http://www.w3.org/2000/svg" width="20" height="20"
										viewBox="0 0 24 24" fill="none" stroke="currentColor"
										stroke-width="2" stroke-linecap="round"
										stroke-linejoin="round" class="feather feather-heart">
									<path
											d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z">
									</path>
								</svg> <!-- 위시리스트 갯수 --> <span id="wishlistCount"
									class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-success">
										${wishlistCount}<span class="visually-hidden">위시리스트</span>
								</span>
								</a>
							</div>
						</c:if>
						<!-- 로그인 안한상태 -->
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
								<a href="${path}/order/list" class="text-muted">
									<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20"
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
								<a href="${path}/customer/login" class="text-muted">
									<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20"
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
								<a class="text-muted position-relative" href="${path}/cart/list"
									role="button"> <svg xmlns="http://www.w3.org/2000/svg"
										width="20" height="20" viewBox="0 0 24 24" fill="none"
										stroke="currentColor" stroke-width="2" stroke-linecap="round"
										stroke-linejoin="round" class="feather feather-shopping-cart">
            <circle cx="9" cy="21" r="1"></circle>
            <circle cx="20" cy="21" r="1"></circle>
            <path
											d="M1 1h4l2.68 13.39a2 2 0 0 0 2 1.61h9.72a2 2 0 0 0 2-1.61L23 6H6"></path>
        </svg> <!-- 장바구니 갯수 --> <span id="cartCount"
									class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-success">
										${cartCount}<span class="visually-hidden">장바구니</span>
								</span>
								</a>
							</div>
						</c:if>
						<c:if test="${cust_id eq null}">
							<div class="list-inline-item me-5 me-lg-0">
								<a class="text-muted position-relative"
									href="${path}/customer/login" role="button"> <svg
										xmlns="http://www.w3.org/2000/svg" width="20" height="20"
										viewBox="0 0 24 24" fill="none" stroke="currentColor"
										stroke-width="2" stroke-linecap="round"
										stroke-linejoin="round" class="feather feather-shopping-cart">
            <circle cx="9" cy="21" r="1"></circle>
            <circle cx="20" cy="21" r="1"></circle>
            <path
											d="M1 1h4l2.68 13.39a2 2 0 0 0 2 1.61h9.72a2 2 0 0 0 2-1.61L23 6H6"></path>
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
		<div class="container ms-auto">


			<div>

				<div>
					<ul class="navbar-nav align-items-center">
						<li class="nav-item w-100 w-lg-auto"><a class="nav-link"
							href="${path}/product/list?category_seq=1">TV</a></li>
						<li class="nav-item w-100 w-lg-auto"><a class="nav-link"
							href="${path}/product/list?category_seq=2">냉장고</a></li>
						<li class="nav-item w-100 w-lg-auto"><a class="nav-link"
							href="${path}/product/list?category_seq=3">건조기</a></li>
						<li class="nav-item w-100 w-lg-auto"><a class="nav-link"
							href="${path}/product/list?category_seq=4">세탁기</a></li>
						<li class="nav-item w-100 w-lg-auto"><a class="nav-link"
							href="${path}/product/list?category_seq=5">전자레인지</a></li>
						<li class="nav-item w-100 w-lg-auto"><a class="nav-link"
							href="${path}/product/list?category_seq=6">에어컨</a></li>
						<li class="nav-item w-100 w-lg-auto"><a class="nav-link"
							href="${path}/product/list?category_seq=7">공기청정기</a></li>
						<li class="nav-item w-100 w-lg-auto"><a class="nav-link"
							href="${path}/product/list?category_seq=8">청소기</a></li>
						<li class="nav-item w-100 w-lg-auto"><a class="nav-link"
							href="${path}/product/list?category_seq=9">스타일러</a></li>

					</ul>

				</div>


			</div>
			<ul class="navbar-nav align-items-center">
				<c:if test="${cust_id ne null and cust_grade==1}">
					<li class="nav-item w-100 w-lg-auto"><a class="nav-link"
						href="${path}/admin/product/list">관리자페이지</a></li>
				</c:if>
				<!-- 고객지원 -->
				<li class="nav-item w-100 w-lg-auto ms-auto"><a
					class="nav-link" href="${path}/faq/list">고객지원</a></li>
			</ul>
		</div>
	</nav>
</div>






<script src="${path}/resources/js/vendors/validation.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script>
    $(function(){
    	$("#btnSearch").click(function(event){
    		event.preventDefault();
    		 
    		performAjaxSearch();
    	});
    });

	//검색기능
	// Enter 키 처리 함수
	function handleEnter(event) {
		if (event.key === "Enter") {
			event.preventDefault(); // 기본 폼 제출 동작 방지
	performAjaxSearch();// 검색 함수 호출
			 
		}
	}
	// 검색 처리 함수

	// AJAX로 검색 수행
	 
	function performAjaxSearch() {
		const query = $('[name="query"]').val().trim();
		if (query === "") {
			alert("검색어를 입력해주세요.");
			return;
		}
		// contextPath 가져오기
		 
		location.href = `${path}/product/list?query=\${query}`;
		
	}
</script>

<script>
    // 로그인 사용자 ID를 가져오는 함수 (예: 세션에서 userId 저장됨)
    const cust_id = "${sessionScope.cust_id}"; // 서버에서 세션값으로 userId 전달받는다고 가정

    
    
    // 장바구니와 위시리스트 갯수를 업데이트하는 함수
    function updateCounts() {
        $.ajax({
            url: "${path}/customer/updateCount", // Controller의 API 경로
            type: "GET",
            data: {
                cust_id: cust_id // 사용자 ID 전달
            },
            success: function (response) {
                // 성공적으로 데이터를 가져오면 헤더 영역 업데이트
                $("#cartCount").text(response.cart_count);
                $("#wishlistCount").text(response.wishlist_count);
            },
            beforeSend: function () {
                // 응답이 오기 전 임시 로딩 표시
                $("#cartCount").text("...");
                $("#wishlistCount").text("...");
            },
            error: function (xhr, status, error) {
                console.error("갯수 업데이트 실패:", error);
            }
        });
    }

    // 페이지 로드 시 한 번 실행
    $(document).ready(function () {
    	  // cust_id가 null이 아니고 빈 문자열도 아닐 때만 실행
        if (cust_id && cust_id.trim() !== "") {
            updateCounts();
        } else {
            console.log("로그인되지 않은 사용자입니다.");
        }
      
    });
</script>


