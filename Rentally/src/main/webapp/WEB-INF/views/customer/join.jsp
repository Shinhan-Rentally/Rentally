<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../common/headMeta.jsp"%>
<%@ include file="../common/headLinks.jsp"%>
<title>회원가입 - Rentally</title>
<style>
	#formSignupEmail2:read-only, #formSignupName:read-only, #formSignupPhone:read-only{
		background-color: #EAEAEA;
	}
	.hide{
		display: none;
	}
</style>
</head>
<body>
	<%@ include file="../common/header.jsp" %>
	<main>
		<section class="my-lg-14 my-8">
			<div class="container">
				<div class="row justify-content-center align-items-center">
					<div class="col-12 col-md-6 col-lg-4 order-lg-1 order-2">
						<img src="${path}/resources/images/svg-graphics/signup-g.svg"
							alt="joinImg" class="img-fluid"/>
					</div>
					<div
						class="col-12 col-md-6 offset-lg-1 col-lg-4 order-lg-2 order-1">
						<div class="mb-lg-9 mb-5">
							<h1 class="mb-1 h2 fw-bold">회원가입</h1>
								<h6>Rentally에 오신 걸 환영합니다!</h6><br>
								<p>Rentally는 가전 구독 플랫폼으로 최신 제품을 부담 없이 간편하게 제공합니다.</p>
						</div>
						<form action="${path}/customer/join" method="post" class="needs-validation" novalidate>
							<div class="row g-3">
								<div class="col-12">
									<label for="formSignupId" class="form-label visually-hidden">
										cust_id
									</label>
									<input type="text" class="form-control" maxlength="12"
										id="formSignupId" name="cust_id" placeholder="ID"
										required />
									<div class="idinput-feedback hide">ID를 입력해주세요.</div>
									<div class="success-feedback hide">사용할 수 있는 ID 입니다.</div>
									<div class="check-feedback hide">이미 사용하는 ID 입니다.</div>
									<div class="long-feedback hide">아이디는 4~12글자 입니다.</div>
									<div class="english-feedback hide">영어 또는 숫자만 가능합니다.</div>
								</div>
								<div class="col-12">
									<label for="formSignupName" class="form-label visually-hidden">
										cust_name
									</label>
									<input type="text" class="form-control"
										id="formSignupName" name="cust_name" placeholder="이름" required />
								</div>
								<div class="col-4">
									<label for="formSignupEmail" class="form-label visually-hidden">
										cust_email
									</label>
									<input type="text" class="form-control"
										id="formSignupEmail" name="cust_email" placeholder="Email"
										required>
								</div>
								<div class="col-4">
									<input type="text" class="form-control"
										name="cust_email2" id="formSignupEmail2" required>
								</div>
								<div class="col-4">
									<select class="form-control" id="formSignupEmail3">
										<option id="directInput" value="">직접입력</option>
										<option value="@naver.com">&#64;naver.com</option>
										<option value="@gmail.com">&#64;gmail.com</option>
										<option value="@daum.net">&#64;daum.net</option>
										<option value="@hanmail.net">&#64;hanmail.net</option>
										<option value="@nate.com">&#64;nate.com</option>
									</select>
								</div>
								<div class="emailinput-feedback hide">이메일을 입력해주세요.</div>
								<div class="invalidEmail-feedback hide">유효한 이메일 주소를 입력하세요.</div>
								<div class="col-12">
									<label for="formSignupPhone" class="form-label visually-hidden">
										Phone number
									</label>
									<input type="text" class="form-control" name="cust_phone"
										id="formSignupPhone" placeholder="핸드폰번호" required />
									<div class="phoneinput-feedback hide">핸드폰번호를 입력해주세요.</div>
								</div>
								<div class="col-12">
									<div class="password-field position-relative">
										<label for="formSignupPassword"
											class="form-label visually-hidden"> Password </label>
										<div class="password-field position-relative">
											<input type="password" class="form-control fakePassword" 
												minlength="6" maxlength="16" name="cust_pw"
												id="formSignupPassword" placeholder="비밀번호" required />
											<span>
												<i class="bi bi-eye-slash passwordToggler"></i>
											</span>
											<div class="pwinput-feedback hide">비밀번호를 입력해주세요.</div>
											<div class="pw-feedback hide">영문자, 숫자, 특수문자 조합으로 6~16글자로 입력해주세요.</div>
										</div>
									</div>
								</div>
								<div class="col-12">
									<div class="password-field position-relative">
										<label for="formSignupPassword"
											class="form-label visually-hidden"> Password </label>
										<div class="password-field position-relative">
											<input type="password" class="form-control fakePassword" 
												minlength="6" maxlength="16" name="confirmCust_pw"
												id="formSignupPasswordConfirm" placeholder="비밀번호 확인" required />
											<span>
												<i class="bi bi-eye-slash passwordToggler"></i>
											</span>
											<div class="pwcinput-feedback hide">비밀번호를 입력해주세요.</div>
											<div class="mismatch-feedback hide">비밀번호가 일치하지 않습니다.</div>
										</div>
									</div>
								</div>
								<div class="col-12 d-grid">
									<button id="join" type="submit" class="btn btn-info">회원가입</button>
								</div>
							</div>
						</form>
						<input type="hidden" id="sessionName" value="${name}" />
						<input type="hidden" id="sessionPhone" value="${phone}" />
					</div>
				</div>
			</div>
		</section>
	</main>
	<!-- 알림용 modal -->
	<div class="modal fade" id="alertModal" tabindex="-1" aria-labelledby="alertModalLabel" aria-hidden="true">
	    <div class="modal-dialog">
	        <div class="modal-content">
	            <div class="modal-header">
	                <h5 class="modal-title" id="alertModalLabel">알림</h5>
	                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	            </div>
	            <div class="modal-body" id="alertModalMessage"></div>
	            <div class="modal-footer">
	                <button type="button" class="btn btn-info" data-bs-dismiss="modal">확인</button>
	            </div>
	        </div>
	    </div>
	</div>
	
	<%@ include file="../common/footer.jsp" %>
	<%@ include file="../common/bottomKakao.jsp" %>
	<script src="${path}/resources/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
	<script src="${path}/resources/js/vendors/password.js"></script>
	<script src="${path}/resources/libs/simplebar/dist/simplebar.min.js"></script>
	<script src="${path}/resources/js/vendors/validation.js"></script>
	<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<script>
		//모달
		function showModalMessage(message) {
	    	$('#alertModalMessage').text(message);
	    	$('#alertModal').modal('show');
		}

		//본인인증 후 값 가져오기
		var custName = $('#sessionName').val();
		var custPhone = $('#sessionPhone').val();
		function formPhone(phone){
			phone = phone.replace(/\D/g, '');
			return phone.replace(/^(\d{3})(\d{4})(\d{4})$/, '$1-$2-$3');
		}
		var formatPhone = formPhone(custPhone);
		$('#formSignupName').val(custName).attr('readonly', true);
		$('#formSignupPhone').val(formatPhone).attr('readonly', true);
		
		//유효성 검사 변수
		let isIdValid = false;
		let isPwValid = false;
		let isPwConfirmValid = false;
		let isEmailValid = false;

		//회원가입 클릭할 때
		$("#join").on("click", function(event){
			//유효성검사 통과 못하면 폼 제출을 막음
			if(!isIdValid || !isPwValid || !isPwConfirmValid || !isEmailValid){
				event.preventDefault();
				showModalMessage("모든 값을 정확히 입력해주세요.");
			}
		});
		$("form").on("submit", function(event){
			//유효성검사 통과 못하면 폼 제출을 막음
			if(!isIdValid || !isPwValid || !isPwConfirmValid || !isEmailValid){
				event.preventDefault();
				showModalMessage("모든 값을 정확히 입력해주세요.");
			}
		});
		
		//이메일 선택값
		let inputEmail = $("#formSignupEmail2");
		let emailMessage = $(".invalidEmail-feedback");
		let emailPattern = /[^\s@]+\.[^\s@]+$/;
		$("#formSignupEmail3").on("change", function() {
			let selectEmail = $(this).val();
			if (selectEmail === ''){
				$(this).removeAttr("required");
				inputEmail.prop("readonly", false);
				emailMessage.addClass("hide");
			} else {
				if(!emailPattern.test(selectEmail)){
					emailMessage.removeClass("hide");
					isEmailValid = false;
				} else {
					inputEmail.val(selectEmail);
					inputEmail.prop("readonly", true);
					emailMessage.addClass("hide");
					isEmailValid = true;
				}
			}
		});
		
		// 직접 입력한 값을 select의 value로 설정 (select에는 '직접입력'이 계속 보이게)
		$("#formSignupEmail2").on("change", function () {
		    var inputEmail = $(this).val().trim();
		    var selectEmail = $("#formSignupEmail3");
		    if (selectEmail.val() === "") {
		        // "직접입력"을 선택한 상태에서 입력값을 select에 반영
		        $("#formSignupEmail3 option[value='']").val(inputEmail);
		    }
		});

		//이메일 유효성 검사
		$("#formSignupEmail2").on("keyup", function(){
			let inputEmail = $(this).val();
			let emailMessage = $(".invalidEmail-feedback");
			let emailPattern = /[^\s@]+\.[^\s@]+$/;
			if(!emailPattern.test(inputEmail)){
				emailMessage.removeClass("hide");
				isEmailValid = false;
			} else {
				emailMessage.addClass("hide");
				isEmailValid = true;
			}
		});
		
		//비밀번호 유효성 검사
		function okPassword(str){
			return /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{6,}$/.test(str);
		}
		function confirm(pw1, pw2){
			return pw1 === pw2;
		}
		
		$("#formSignupPassword").on("keyup", function(){
			if($(this).val().length !== 0){
				$(".pwinput-feedback").addClass("hide");
				if(okPassword($(this).val())){
					$(".pw-feedback").addClass("hide");
					$(this).addClass("is-valid").removeClass("is-invalid");
					isPwValid = true;
				}else{
					$(".pw-feedback").removeClass("hide");
					$(this).addClass("is-invalid");
					isPwValid = false;
				}
			}else{
				$(".pwinput-feedback").removeClass("hide");
				$(".pw-feedback").addClass("hide");
				$(this).addClass("is-invalid");
				isPwValid = false;
			}
		});

		$("#formSignupPasswordConfirm").on("keyup", function(){
			if($(this).val().length !== 0){
				if(confirm($("#formSignupPassword").val(), $("#formSignupPasswordConfirm").val())){
					$(this).addClass("is-valid").removeClass("is-invalid");
					$(".pwcinput-feedback").addClass("hide");
					$(".mismatch-feedback").addClass("hide");
					isPwConfirmValid = true;
				}else{
					$(this).removeClass("is-valid").addClass("is-invalid");
					$(".pwcinput-feedback").addClass("hide");
					$(".mismatch-feedback").removeClass("hide");
					isPwConfirmValid = false;
				}
			}else{
				$(this).removeClass("is-valid").addClass("is-invalid");
				$(".pwcinput-feedback").removeClass("hide");
				$(".mismatch-feedback").addClass("hide");
				isPwConfirmValid = false;
			}
		});
		
		//ID유효성검사
		let inputUserId = document.querySelector("#formSignupId");
		let successMessage = document.querySelector(".success-feedback");
		let longMessage = document.querySelector(".long-feedback");
		let englishMessage = document.querySelector(".english-feedback");

		function idLength(value){
			return value.length >= 4 && value.length <=12
		}
		function onlyNumAndEng(str){
			return /^[A-Za-z0-9][A-Za-z0-9]*$/.test(str);
		}
		
		inputUserId.onkeyup = function(){
			let userId = inputUserId.value;
			if(userId.length === 0){
				$(this).addClass("is-invalid");
				successMessage.classList.add("hide");
				longMessage.classList.add("hide");
				englishMessage.classList.add("hide");
				$(".idinput-feedback").removeClass("hide");
				isIdValid = false;
				return;
			}
			if(!onlyNumAndEng(userId)){
				$(this).addClass("is-invalid");
				successMessage.classList.add("hide");
				longMessage.classList.add("hide");
				englishMessage.classList.remove("hide");
				isIdValid = false;
				return;
			}
			
			if(!idLength(userId)){
				$(this).addClass("is-invalid");
				successMessage.classList.add("hide");
				longMessage.classList.remove("hide");
				englishMessage.classList.add("hide");
				isIdValid = false;
				return;
			}
			//모든 조건을 만족할 때
			successMessage.classList.remove("hide");
			longMessage.classList.add("hide");
			englishMessage.classList.add("hide");
			$(this).addClass("is-valid");
			$(this).removeClass("is-invalid")
		};
		//아이디 중복체크
		$("#formSignupId").on("input", function(){
			let custId = $(this).val().trim();
			if(custId.length < 4){
				$(".check-feedback").addClass("hide");
				$(".idinput-feedback").addClass("hide");
				isIdValid = false;
				return;
			}
			$.ajax({
				url: "${path}/customer/id.check",
				type: "get",
				data: {cust_id : custId},
				success: function(response){
					if(response == "true"){
						$(".success-feedback").addClass("hide");
						$(".check-feedback").removeClass("hide");
						isIdValid = false;
						$(inputUserId).removeClass("is-valid").addClass("is-invalid");
					} else {
						if(idLength(custId) && onlyNumAndEng(custId)){
							$(".success-feedback").removeClass("hide");
							$(".check-feedback").addClass("hide");
							$(inputUserId).removeClass("is-invalid").addClass("is-valid");
							isIdValid = true;
						}
					}
				},
				error: function(err){
					showModalMessage('id중복체크 실패');
					isIdValid = false;
				}
			});
		});
	</script>
</body>
</html>