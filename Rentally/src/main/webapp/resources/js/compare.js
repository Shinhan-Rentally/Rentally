// 버튼 요소 선택
let compareButton;

// data-path 속성 값 읽기
let path;

	// 비교하기 버튼 클릭 이벤트
	$(document).on("click", "#compareButton", function () {
	    const productSeq = $(this).data("product-seq");

	    path = document.getElementById("compareButton").getAttribute("data-path");
	
	    // AJAX 요청
	    $.ajax({
	        url: `${path}/product/addToCompare`,
	        type: "POST",
	        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
	        data: { productSeq: productSeq },
	        success: function (message) {
	        	// 성공 메시지 표시
	            $("#compareMessage").html(message);
	            $("#compareModal").modal("show");
	        },
	        error: function (xhr) {
	        	// 실패 메시지 표시
	            $("#compareMessage").html(xhr.responseText || "오류가 발생했습니다.");
	            $("#compareModal").modal("show");
	        }
	    });
	});
	
	// 비교함 이동 버튼 클릭 이벤트
	$("#moveCompare").on("click", function () {
	    // 비교함 페이지로 이동 (경로를 실제 비교함 페이지 URL로 수정)
	    window.location.href = `${path}/product/compare`;  // 비교함 페이지 경로로 변경
	});
	
	// 비교함 초기화 버튼 클릭 이벤트
	$("#clearCompare").on("click", function () {
	    // 세션 초기화 AJAX 요청
	    $.ajax({
	        url: `${path}/product/clearCompare`,
	        type: "POST",
	        success: function (message) {
	        	// 성공 메시지 표시
	            $("#compareMessage").html(message);
	        },
	        error: function (xhr) {
	        	// 실패 메시지 표시
	            $("#compareMessage").html(xhr.responseText || "오류가 발생했습니다.");
	        }
	    });
	});
