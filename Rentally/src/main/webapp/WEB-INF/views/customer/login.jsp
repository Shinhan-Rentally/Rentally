<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../common/headMeta.jsp"%>
<%@ include file="../common/headLinks.jsp"%>
<meta charset="UTF-8">
<title>Rentally</title>
</head>
<body>

	<%@ include file="../common/header.jsp"%>

	<main>
		<section class="my-lg-14 my-8">
			<div class="container">
				<div class="row justify-content-center align-items-center">
					<div class="col-12 col-md-6 col-lg-4 order-lg-1 order-2">
						<img src="${path}/resources/images/svg-graphics/signin-g.svg" alt="" class="img-fluid" />
					</div>
					<div class="col-12 col-md-6 offset-lg-1 col-lg-4 order-lg-2 order-1">
						<div class="mb-lg-9 mb-5">
							<h1 class="mb-1 h2 fw-bold">로그인</h1>
							<p>렌탈리의 오신것을 환영합니다.</p>
						</div>
						<form class="needs-validation" action="${path}/customer/login" method="post" id="loginForm" novalidate>
							<div class="col-12">
								<label for="cust_id" class="form-label">ID</label> <input type="text" class="form-control" id="cust_id" name="cust_id" placeholder="ID" value="" required />

								<div class="invalid-feedback">ID를 입력하세요.</div>
							</div>
							<div class="col-12">
								<div class="password-field position-relative">
									<label for="cust_pw" class="form-label">Password</label> <input type="password" class="form-control fakePassword" id="cust_pw" name="cust_pw" placeholder="*****" required />
									<div class="invalid-feedback">비밀번호를 입력하세요.</div>
								</div>
							</div>
							<div class="col-12 d-flex justify-content-between align-items-center">
								<div class="form-check">
									<input class="form-check-input" type="checkbox" value="" id="flexCheckDefault" /> <label class="form-check-label" for="flexCheckDefault">ID 기억하기</label>
								</div>
							</div>
							<div class="col-12 d-grid">
								<button type="submit" class="btn btn-info">로그인</button>
							</div>
							<div>
								아직 Rentally 회원가입을 안하셨나요? <a href="${path}/customer/identity">회원가입</a>
							</div>
						</form>
					</div>
				</div>
			</div>

		</section>

		<div class="modal fade" id="loginModal" tabindex="-1" aria-labelledby="alertModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="alertModalLabel">알림</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					</div>
					<div class="modal-body" id="loginModalMessage"></div>
					<div class="modal-footer">
						<button type="button" class="btn btn-info" data-bs-dismiss="modal">확인</button>
					</div>
				</div>
			</div>
		</div>
	</main>


	<%@ include file="../common/footer.jsp"%>
	<%@ include file="../common/bottomKakao.jsp"%>

	<script src="${path}/resources/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
	<script src="${path}/resources/libs/simplebar/dist/simplebar.min.js"></script>

	<script src="${path}/resources/js/vendors/password.js"></script>
	<script src="${path}/resources/js/vendors/validation.js"></script>


	<script>
document.addEventListener("DOMContentLoaded", () => {
    const form = document.querySelector("#loginForm");
    const urlParams = new URLSearchParams(window.location.search);
	
    // blockUser 값을 JSP에서 JavaScript로 전달
    var blockUser = ${blockUser};
    
  	//모달 띄우는 함수
    function loginModal(message) {
        $("#loginModalMessage").text(message);
        $("#loginModal").modal("show"); // 모달 표시
    }

    // URL에서 error 파라미터 값 확인
    if (urlParams.has("error")) {
        const error = urlParams.get("error");

        // 로그인 실패 시 모달 띄우기
        if (error === "userNotFound") {
        	loginModal("아이디가 존재하지 않습니다.");
        } else if (error === "wrongPassword") {
        	loginModal("비밀번호가 맞지 않습니다.");
        } else if (error === "passwordMissing") {
        	loginModal("비밀번호 정보가 누락되었습니다.");
        } else if (error === "unknownError") {
        	loginModal("알 수 없는 오류가 발생했습니다. 다시 시도해주세요.");
        }
    }

    // blockUser 값이 true일 경우 모달을 띄운다.
    if (blockUser) {
        $(document).ready(function() {
        	loginModal("로그인이 필요한 서비스입니다."); // 유효성 검사 실패 시 모달 띄우기
        });
    }
    
 // 폼 유효성 검사 및 제출 처리
    form.addEventListener("submit", (event) => {
        let isValid = true; // 기본적으로 유효하다고 설정

        // ID 유효성 검사
        const custIdInput = document.getElementById("cust_id");
        if (!custIdInput.value.trim()) {
            if (isValid) { // 최초로 유효성 검사 실패 시에만 모달 띄우기
            	loginModal("ID를 입력해주세요."); 
            }
            isValid = false; // 유효하지 않음으로 설정
            custIdInput.classList.add("is-invalid");
        } else {
            custIdInput.classList.remove("is-invalid");
        }

        // 비밀번호 유효성 검사
        const custPwInput = document.getElementById("cust_pw");
        if (!custPwInput.value.trim()) {
            if (isValid) { // 이전에 이미 유효성 검사 실패했다면 모달 띄우지 않음
            	loginModal("비밀번호를 입력해주세요."); 
            }
            isValid = false; // 유효하지 않음으로 설정
            custPwInput.classList.add("is-invalid");
        } else {
            custPwInput.classList.remove("is-invalid");
        }

        // 유효성 검사 실패 시 폼 제출 중단
        if (!isValid) {
            event.preventDefault(); // 폼 제출 중단
            event.stopPropagation(); // 이벤트 전파 중단
        }
    });

    // 입력 시 유효성 스타일 제거
    document.querySelectorAll("input").forEach((input) => {
        input.addEventListener("input", () => {
            input.classList.remove("is-invalid");
        });
    });
});

</script>
<!-- id 기억하기 script -->
	<script>
	document.addEventListener("DOMContentLoaded", function () {
	    // 페이지 로드 시, 로컬 스토리지에서 ID 값을 읽어옵니다.
	    const savedId = localStorage.getItem("savedId");
	    const rememberMeChecked = localStorage.getItem("rememberMe") === "true";

	    const userIdInput = document.getElementById("cust_id");
	    const rememberMeCheckBox = document.getElementById("flexCheckDefault");

	    // 저장된 값이 있으면 입력 필드와 체크박스 초기화
	    if (rememberMeChecked && savedId) {
	        userIdInput.value = savedId;
	        rememberMeCheckBox.checked = true;
	    } else {
	        userIdInput.value = ""; // 저장된 값이 없으면 빈 상태 유지
	        rememberMeCheckBox.checked = false;
	    }

	    // 체크박스 변경 이벤트 핸들러
	    rememberMeCheckBox.addEventListener("change", function () {
	        const userId = userIdInput.value.trim();

	        if (this.checked) {
	            if (userId) {
	                // 체크박스가 활성화되면 현재 입력된 아이디 저장
	                localStorage.setItem("rememberMe", "true");
	                localStorage.setItem("savedId", userId);
	            }
	        } else {
	            // 체크박스 비활성화 시 로컬 스토리지 데이터 제거
	            localStorage.removeItem("rememberMe");
	            localStorage.removeItem("savedId");
	        }
	    });

	    // 아이디 입력 필드 변경 시 로컬 스토리지 동기화
	    userIdInput.addEventListener("input", function () {
	        const userId = this.value.trim();

	        if (rememberMeCheckBox.checked) {
	            if (userId) {
	                // 입력값이 있으면 로컬 스토리지 업데이트
	                localStorage.setItem("savedId", userId);
	            } else {
	                // 입력값이 없으면 로컬 스토리지에서 ID 제거
	                localStorage.removeItem("savedId");
	            }
	        }
	    });
	});

</script>

</body>
</html>