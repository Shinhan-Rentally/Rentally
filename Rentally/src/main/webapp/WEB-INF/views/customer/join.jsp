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
										id="formSignupId" name="cust_id" placeholder="ID를 입력해주세요"
										required />
									<div class="invalid-feedback">ID를 입력해주세요.</div>
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
									<div class="invalid-feedback">이름을 입력해주세요.</div>
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
										name="cust_email2" id="formSignupEmail2">
								</div>
								<div class="col-4">
									<select class="form-control" id="formSignupEmail3" required>
										<option id="directInput" value="">직접입력</option>
										<option value="@naver.com">&#64;naver.com</option>
										<option value="@gmail.com">&#64;gmail.com</option>
										<option value="@daum.net">&#64;daum.net</option>
										<option value="@hanmail.net">&#64;hanmail.net</option>
										<option value="@nate.com">&#64;nate.com</option>
									</select>
								</div>
								<div class="invalid-feedback">이메일을 입력해주세요.</div>
								<div class="invalidEmail-feedback hide">유효한 이메일 주소를 입력하세요.</div>
								<div class="col-12">
									<label for="formSignupPhone" class="form-label visually-hidden">
										Phone number
									</label>
									<input type="text" class="form-control" name="cust_phone"
										id="formSignupPhone" placeholder="핸드폰번호" required />
									<div class="invalid-feedback">핸드폰번호를 입력해주세요.</div>
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
											<div class="invalid-feedback">비밀번호를 입력해주세요.</div>
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
	<%@ include file="../common/footer.jsp" %>
	<%@ include file="../common/bottomKakao.jsp" %>
	<script src="${path}/resources/js/vendors/password.js"></script>
	<script src="${path}/resources/libs/simplebar/dist/simplebar.min.js"></script>
	<script src="${path}/resources/js/vendors/validation.js"></script>
	<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<script>
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
		
		//입력값이 비어있을 때 경고문구
		$("#join").on("click", function(){
			$(".form-control").each(function(){
				let input = $(this);
				let value = input.val().trim();
				let errorMessage = input.next('.invalid-feedback');
				if(value === ""){
					errorMessage.removeClass('hide');
				} else {
					errorMessage.addClass('hide');
				}
			});
		});
		
		// 회원가입시 값 입력됐는지 확인
		function checkValidation() {
			$('.needs-validation').each(function () {
		        $(this).on('submit', function (event) {
		            if (!this.checkValidity() || countUsingId != 0 || validDomain) {
		                event.preventDefault();
		                event.stopPropagation();
		            }
		            $(this).addClass('was-validated');
		        });
		    });
		}
		$("#join").on("click", checkValidation);
		
		//이메일 선택값
		$("#formSignupEmail3").on("change", function() {
			const selectEmail = $(this).val();
			const inputEmail = $("#formSignupEmail2");
			const emailMessage = $(".invalidEmail-feedback");
			const emailPattern = /[^\s@]+\.[^\s@]+$/;
			
			if (selectEmail === ''){
				$(this).removeAttr("required");
				inputEmail.prop("readonly", false);
				emailMessage.addClass("hide");
			} else {
				if(!emailPattern.test(selectEmail)){
					emailMessage.removeClass("hide");
					return;
				}
				inputEmail.val(selectEmail);
				inputEmail.prop("readonly", true);
				emailMessage.addClass("hide");
			}
		});
		
		// 직접 입력한 값을 select의 value로 설정 (select에는 '직접입력'이 계속 보이게)
		$("#formSignupEmail2").on("change", function () {
		    var inputEmail = $(this).val().trim();
		    var selectEmail = $("#formSignupEmail3");

		    if (selectEmail.val() === "") {
		        // "직접입력"을 선택한 상태에서 입력값을 select에 반영
		        $("#formSignupEmail3 option[value='']").val(inputEmail); // 선택된 값은 UI에 보이지 않음
		    }
		});

		
		//이메일 유효성 검사
		$("#formSignupEmail2").on("keyup", function(){
			const inputEmail = $(this).val();
			const emailMessage = $(".invalidEmail-feedback");
			const emailPattern = /[^\s@]+\.[^\s@]+$/;
			if(!emailPattern.test(inputEmail)){
				emailMessage.removeClass("hide");
			} else {
				emailMessage.addClass("hide");
			}
		});
		
		//비밀번호 유효성 검사
		let inputUserPw = document.querySelector("#formSignupPassword");
		let confirmUserPw = document.querySelector("#formSignupPasswordConfirm");
		let pwMessage = document.querySelector(".pw-feedback");
		let confirmMessage = document.querySelector(".mismatch-feedback");
		
		function okPassword(str){
			return /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/.test(str);
		}
		function confirm(pw1, pw2){
			return pw1 === pw2;
		}
		
		inputUserPw.onkeyup = function(){
			if(inputUserPw.value.length !== 0){
				if(okPassword(inputUserPw.value)){
					pwMessage.classList.add("hide");
				} else {
					pwMessage.classList.remove("hide");
				}
			} else {
				pwMessage.classList.add("hide");
			}
		};
		
		confirmUserPw.onkeyup = function(){
			if(confirmUserPw.value.length !== 0){
				if(confirm(inputUserPw.value, confirmUserPw.value)){
					confirmMessage.classList.add("hide");
					$("#formSignupPasswordConfirm").removeClass("is-invalid");
					$("#formSignupPasswordConfirm").addClass("is-valid");
				} else {
					confirmMessage.classList.remove("hide");
					$("#formSignupPasswordConfirm").addClass("is-invalid");
				}
			} else {
				confirmMessage.classList.add("hide");
			}
		};
		
		//ID유효성검사
		let inputUserId = document.querySelector("#formSignupId");
		let successMessage = document.querySelector(".success-feedback");
		let longMessage = document.querySelector(".long-feedback");
		let englishMessage = document.querySelector(".english-feedback");

		function idLength(value){
			//4~12이면 true
			return value.length >= 4 && value.length <=12
		}
		function onlyNumAndEng(str){
			return /^[A-Za-z0-9][A-Za-z0-9]*$/.test(str);
		}
		
		inputUserId.onkeyup = function(){
			let userId = inputUserId.value;
			//입력값 비어있을 때
			if(userId.length === 0){
				successMessage.classList.add("hide");
				longMessage.classList.add("hide");
				englishMessage.classList.add("hide");
				return;
			}
			
			//영문,숫자
			if(!onlyNumAndEng(userId)){
				successMessage.classList.add("hide");
				longMessage.classList.add("hide");
				englishMessage.classList.remove("hide");
				return;
			}
			
			//길이조건
			if(!idLength(userId)){
				successMessage.classList.add("hide");
				longMessage.classList.remove("hide");
				englishMessage.classList.add("hide");
				return;
			}
			//모든 조건을 만족할 때
			successMessage.classList.remove("hide");
			longMessage.classList.add("hide");
			englishMessage.classList.add("hide");
		};
		//아이디 중복체크
		$("#formSignupId").on("input", function(){
			let custId = $(this).val().trim();
			if(custId.length < 4){
				$(".check-feedback").addClass("hide");
				return;
			}
			$.ajax({
				url: "${path}/customer/id.check",
				type: "get",
				data: {cust_id : custId},
				success: function(response){
					if(response == "true"){
						//이미 사용중인 아이디
						$(".success-feedback").addClass("hide");
						$(".check-feedback").removeClass("hide");
					} else {
						//사용가능한 아이디
						$(".success-feedback").removeClass("hide");
						$(".check-feedback").addClass("hide");
					}
				},
				error: function(err){
					alert('id중복체크 실패');
				}
			});
		});
	</script>
</body>
</html>