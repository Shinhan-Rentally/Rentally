<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta content="Codescandy" name="author">
<%@ include file="../common/headLinks.jsp"%>

<style>
#searchColor {
	color: blue;
	font-weight: bold;
}
#home {
	color: blue;
}
#offcanvasCategory .btn-info { 
	--fc-btn-bg: #001e2b; 
	--fc-btn-border-color: #001e2b; 
	--fc-btn-hover-bg: #C1C7C6; 
	--fc-btn-hover-border-color: #C1C7C6; 
	--fc-btn-active-bg: #C1C7C6; 
	--fc-btn-active-border-color: #C1C7C6; 
	--fc-btn-disabled-bg: #001e2b; 
	--fc-btn-disabled-border-color: #001e2b;
}
#offcanvasCategory .btn-outline-info { 
	--fc-btn-color: #001e2b;
	--fc-btn-border-color: #001e2b; 
	--fc-btn-hover-bg: #C1C7C6; 
	--fc-btn-hover-border-color: #C1C7C6; 
	--fc-btn-active-bg: #C1C7C6; 
	--fc-btn-active-border-color: #C1C7C6;
}
#category_box {
  	vertical-align:middle;
}
h2.category {
  white-space: nowrap; 
 
}
.btn-group-vertical .btn {
  width: 100%;
}
</style>

<title>카테고리 상품</title>
<%@ include file="../common/headMeta.jsp"%>
</head>
<body>
	<!-- 헤더 include -->
	<%@ include file="../common/header.jsp"%>
	<main>
		<div class="mt-4">
			<div class="container">
				<div class="row">
					<div class="col-12">
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb mb-0">
								<li class="breadcrumb-item"><a href="${path}/main"
									id="home">Home</a></li>
								<li class="breadcrumb-item active" id=category_name></li>
							</ol>
						</nav>
					</div>
				</div>
			</div>
		</div>
		<div class="mt-8 mb-lg-14 mb-8">
			<div class="container">
				<div class="row gx-10">
					<aside class="col-lg-3 col-md-4 mb-6 mb-md-0">
						<div class="offcanvas offcanvas-start offcanvas-collapse w-md-50"
							tabindex="-1" id="offcanvasCategory"
							aria-labelledby="offcanvasCategoryLabel">
							<div class="offcanvas-body ps-lg-2 pt-lg-0">
								<!-- 브랜드 필터 -->
								<div class="mb-8">
									<h5 class="mb-3">브랜드</h5>
									<div class="btn-group w-100" role="group"
										aria-label="Brand Filter">
										<button type="button" class="btn btn-outline-info"
											id="filterSamsung" onclick="toggleBrandFilter(this)"
											data-brand="삼성">삼성</button>
										<button type="button" class="btn btn-outline-info"
											id="filterLG" onclick="toggleBrandFilter(this)"
											data-brand="LG">LG</button>
									</div>
								</div>
								<!-- 가격대 필터 -->
								<div class="mb-8">
									<h5 class="mb-3">가격대</h5>
									<div id="priceRangeToggle" class="btn-group-vertical w-100"
										role="group">
										<button type="button" class="btn btn-outline-info"
											data-value="below10k" onclick="togglePriceRangeFilter(this)">0
											~ 10,000</button>
										<button type="button" class="btn btn-outline-info border-bottom-0"
											data-value="10kTo20k" onclick="togglePriceRangeFilter(this)">10,001
											~ 20,000</button>
										<button type="button" class="btn btn-outline-info"
											data-value="20kTo30k" onclick="togglePriceRangeFilter(this)">20,001
											~ 30,000</button>
										<button type="button" class="btn btn-outline-info border-bottom-0"
											data-value="30kTo40k" onclick="togglePriceRangeFilter(this)">30,001
											~ 40,000</button>
										<button type="button" class="btn btn-outline-info"
											data-value="40kTo50k" onclick="togglePriceRangeFilter(this)">40,001
											~ 50,000</button>
										<button type="button" class="btn btn-outline-info border-bottom-0"
											data-value="50kTo70k" onclick="togglePriceRangeFilter(this)">50,001
											~ 70,000</button>
										<button type="button" class="btn btn-outline-info"
											data-value="70kTo100k" onclick="togglePriceRangeFilter(this)">70,001
											~ 100,000</button>
										<button type="button" class="btn btn-outline-info"
											data-value="above100k" onclick="togglePriceRangeFilter(this)">100,000+</button>
									</div>
									<input type="hidden" id="selectedPriceRange" name="priceRange" value="">
								</div>
							</div>
						</div>
					</aside>
					<section class="col-lg-9 col-md-12">
						<div class="card mb-4 bg-light border-0">
							<div class="card-body p-7">
								<h2 class="mb-0 fs-1 category">&nbsp;</h2>
							</div>
						</div>
						<div class="d-lg-flex justify-content-between align-items-center">

							<div class="mb-3 mb-lg-0">
								<p class="mb-0">									
									총&nbsp;<span id="productlistsize">&nbsp;</span>개 제품
								</p>
							</div>
							<div class="d-lg-flex justify-content-between align-items-center">
								<div class="d-flex mt-2 mt-lg-0">
									<div>
										<!-- 정렬 기준 -->
										<select name="sort" class="form-select">
											<option value="Low to High">낮은 가격순</option>
											<option value="High to Low">높은 가격순</option>
											<option value="Release Date" selected>출시일</option>
											<option value="Avg. Rating">인기상품</option>
										</select>
									</div>
								</div>
							</div>
						</div>
						<div id="productListContainer"></div>
					</section>
				</div>
			</div>
		</div>
	</main>

	<!-- Footer -->
	<%@include file="../common/footer.jsp"%>
	<%@ include file="../common/bottomKakao.jsp"%>
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
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<script src="${path}/resources/js/main.js"></script>

	<script>
	// 전역 변수로 선택된 브랜드와 가격대 저장
	let selectedBrand = null;
	let selectedPriceRanges = [];
	let currentPage = 1;  // 현재 페이지 번호 (기본값 1)

// URL category_seq 값을 추출
function getCategorySeqFromURL() {
    const params = new URLSearchParams(window.location.search); // URL의 쿼리스트링을 파싱
    let category_seq = params.get('category_seq'); // URL에서 category_seq 값을 가져옴

    if (!category_seq) {
    }
    return category_seq; // category_seq 값을 반환
}
// 페이지 번호 변경 시 호출되는 함수
function changePage(page) {
    currentPage = page;  // 페이지 번호 갱신
    applyFilters();  // 필터 적용
}
//브랜드 필터 토글 (하나만 선택 가능)
function toggleBrandFilter(button) {
    // 선택된 브랜드 처리
    if (button.classList.contains('btn-info')) {
        button.classList.remove('btn-info');
        button.classList.add('btn-outline-info');
        selectedBrand = null; // 선택 해제시 브랜드 필터 상태를 null로 설정
    } else {
        const buttons = document.querySelectorAll('.btn-group button');
        buttons.forEach(btn => {
            btn.classList.remove('btn-info');
            btn.classList.add('btn-outline-info');
        });
        button.classList.remove('btn-outline-info');
        button.classList.add('btn-info');
        selectedBrand = button.getAttribute('data-brand'); // 선택된 브랜드 업데이트
    }
    // 현재 가격대 필터 상태 확인
    selectedPriceRanges = Array.from(document.querySelectorAll('#priceRangeToggle button.btn-info'))
        .map(btn => btn.getAttribute('data-value'));
    // 필터 적용
    applyFilters();
   
}

// 가격대 필터 다중 선택 가능
function togglePriceRangeFilter(button) {
    // 선택된 가격대 처리
    button.classList.toggle('btn-info');
    button.classList.toggle('btn-outline-info');

    // 선택된 가격대 필터 상태
    selectedPriceRanges = Array.from(document.querySelectorAll('#priceRangeToggle button.btn-info'))
        .map(btn => btn.getAttribute('data-value'));

    // 필터 적용
    applyFilters();
    currentPage = 1
}

// 필터와 정렬을 적용하는 함수
function applyFilters() {
	
    let sort = document.querySelector('.form-select').value; // 선택된 정렬 기준
    let category_seq = getCategorySeqFromURL(); // URL에서 category_seq 가져오기
    category_seq = category_seq ? parseInt(category_seq, 10) : 0;  // 없으면 0으로 설정
      
    const query = "${param.query}".trim(); // 검색어 확인
    
    // Ajax로 필터 및 정렬된 결과 요청
    $.ajax({
        url: '${path}/product/filter', // 서버 URL (실제 URL로 변경 필요)
        method: 'GET',
        data: {
            category_seq: category_seq, // 카테고리 정보
            brand: selectedBrand || '', // 선택된 브랜드 필터
            priceRange: selectedPriceRanges.join(',') || '', // 선택된 가격대 필터 (콤마로 구분된 문자열)
            sort: sort, // 정렬 기준
            query: query || '', // 검색어 (검색 상태인 경우에만 추가)
            page: currentPage,  // 현재 페이지 번호
        },
        success: function (response) {
            $('#productListContainer').html(response);  // 결과 업데이트
            $("#productlistsize").text($("#size").text());
            $("#category_name").text($("#categoryname").text());  // 카테고리 이름 업데이트
            if (query && query.trim() !== "") {
                // query 값이 있으면 검색 결과 표시
                $(".category").html("' "+`<span id="searchColor">${param.query}</span>` + " '검색결과");
            } else {
                // query 값이 없으면 카테고리 이름 표시
                $(".category").text(categoryName);
            }
            currentPage = 1;
        },
        error: function (error) {
        }
    });
}
// 페이지네이션 버튼 클릭 시 호출되는 함수
$(document).on("click", ".page-link", function (e) {
    e.preventDefault();  // 링크 기본 동작을 막음
    var page = $(this).data('page');  // 페이지 번호 가져오기
    changePage(page);  // 페이지 변경 함수 호출
});

$(function () {
    // 검색어 확인 및 기본값 처리
    var query = "${param.query != null ? fn:escapeXml(param.query) : ''}".trim();
    let sort = document.querySelector('.form-select').value; // 선택된 정렬 기준
  
    if (query === '') {
        applyFilters(); // 검색어가 없으면 초기 필터 및 정렬 적용
        return;
    }
    // 초기 페이지 설정
    let currentPage = 1;

    $.ajax({
        url: '${path}/product/searchResult', // 검색 처리할 URL
        method: 'GET',
        data: {
			query: query, // 검색어 (검색 상태인 경우에만 추가)
			brand: selectedBrand || '',
			priceRange: selectedPriceRanges.join(',') || '', // 선택된 가격대 필터 (콤마로 구분된 문자열)
			sort: sort, // 정렬 기준
			page: currentPage,  // 현재 페이지 번호
        },
        success: function (response) {
        	  if (query && query.trim() !== "") {
                  // query 값이 있으면 검색 결과 표시
                  $(".category").html("' "+`<span id="searchColor">${param.query}</span>`+ " '검색결과");
              } else {
                  // query 값이 없으면 카테고리 이름 표시
                  $(".category").text(categoryName);
              }
            // DOM 업데이트
            $('#productListContainer').html(response); // 반환된 결과로 DOM 업데이트
            $("#productlistsize").text($("#size").text());
            $("#producttotalsize").text($("#totalsize").text());
            $("#category_name").text(query);
        },
        error: function (error) {
        }
    });
});

	// 'select'가 변경될 때마다 정렬 적용
	document.querySelector('.form-select').addEventListener('change', function () {
	    applyFilters(); // 정렬 기준이 바뀔 때마다 필터와 함께 요청
	});

	// 필터 버튼 클릭 이벤트 처리 (이미 정의된 toggleBrandFilter, togglePriceRangeFilter 함수 사용)
	document.querySelectorAll('.btn-info').forEach(button => {
	    button.addEventListener('click', function () {
	        toggleBrandFilter(this);
	    });
	});

	document.querySelectorAll('#priceRangeToggle button.btn-info').forEach(button => {
	    button.addEventListener('click', function () {
	        togglePriceRangeFilter(this);
	    });
	});
	
	</script>

	<script>
	// URL 쿼리 파라미터에서 값을 가져오는 함수
	function getQueryParam(param) {
	    const urlParams = new URLSearchParams(window.location.search);
	    return urlParams.get(param);
	}
	// category_seq 값을 가져옴
	const category_seq = getQueryParam('category_seq');

	// category_seq에 따라 이름을 매핑
	const categoryNames = {
	    1: "TV",
	    2: "냉장고",
	    3: "건조기",
	    4: "세탁기",
	    5: "전자레인지",
	    6: "에어컨",
	    7: "공기청정기",
	    8: "청소기",
	    9: "스타일러",
	};

	const categoryName = categoryNames[category_seq] || "기타";

	// <title> 태그 동적으로 설정
	if (categoryName) {
	    document.title = `\${categoryName} - Rentally`;
	}
	</script>
</body>
</html>