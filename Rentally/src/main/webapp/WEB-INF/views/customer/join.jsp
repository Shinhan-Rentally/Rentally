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
	#formSignupEmail2:read-only{
		background-color: #EAEAEA;
	}
	.hide{
		display: none;
	}
</style>
</head>
<body>
	<!-- header 화면 불러오기 -->
	<%@ include file="../common/header.jsp" %>
	<main>
		<!-- section -->
		<section class="my-lg-14 my-8">
			<!-- container -->
			<div class="container">
				<!-- row -->
				<div class="row justify-content-center align-items-center">
					<div class="col-12 col-md-6 col-lg-4 order-lg-1 order-2">
						<!-- img -->
						<img src="${path }/resources/images/svg-graphics/signup-g.svg"
							alt="joinImg" class="img-fluid" />
					</div>
					<!-- col -->
					<div
						class="col-12 col-md-6 offset-lg-1 col-lg-4 order-lg-2 order-1">
						<div class="mb-lg-9 mb-5">
							<h1 class="mb-1 h2 fw-bold">회원가입</h1>
							
								<h6>Rentally에 오신 걸 환영합니다!</h6><br>
								<p>Rentally는 가전 구독 플랫폼으로 최신 제품을 부담 없이 간편하게 제공합니다.</p>
								
						</div>
						<!-- form -->
						<form action="${path}/customer/join" method="post" class="needs-validation" novalidate>
							<div class="row g-3">
								<!-- col -->
								<div class="col-12">
									<!-- input ID -->
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
									<!-- input 이름 -->
									<label for="formSignupName" class="form-label visually-hidden">
										cust_name
									</label>
									<input type="text" class="form-control"
										id="formSignupName" name="cust_name" placeholder="이름" required />
									<div class="invalid-feedback">이름을 입력해주세요.</div>
								</div>
								<div class="col-4">
									<!-- input 이메일 -->
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
										<option value="">직접입력</option>
										<option value="@naver.com">&#64;naver.com</option>
										<option value="@gmail.com">&#64;gmail.com</option>
										<option value="@daum.net">&#64;daum.net</option>
										<option value="@hanmail.net">&#64;hanmail.net</option>
										<option value="@nate.com">&#64;nate.com</option>
									</select>
								</div>
								<div class="invalid-feedback">이메일을 입력해주세요.</div>
								<div class="col-12">
									<!-- input -->
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
												id="formSignupPassword" placeholder="*****" required />
											<span>
												<i class="bi bi-eye-slash passwordToggler"></i>
											</span>
											<div class="invalid-feedback">비밀번호를 입력해주세요.</div>
										</div>
									</div>
								</div>
								<!-- btn -->
								<div class="col-12 d-grid">
									<button id="join" type="submit" class="btn btn-info">회원가입</button>
								</div>

								
							</div>
						</form>
					</div>
				</div>
			</div>
		</section>
	</main>

	<!-- Footer -->
	<%@ include file="../common/footer.jsp" %>
	<%@ include file="../common/bottomKakao.jsp" %>
	<!-- Javascript-->
	<%-- <script src="${path}/resources/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script> --%>
	<script src="${path}/resources/js/vendors/password.js"></script>
	<script src="${path}/resources/libs/simplebar/dist/simplebar.min.js"></script>
	<script src="${path}/resources/js/vendors/validation.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<script>
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
		
		//이메일 선택값
		$("select").on("change", function() {
			if ($(this).val()) {
				$("#formSignupEmail2").attr("readonly", true);
				$("#formSignupEmail2").val($(this).val());
			} else {
				$("#formSignupEmail2").val("");
				$("#formSignupEmail2").attr("readonly", false);
			}
		});
		//핸드폰번호 유효성검사
		$("#formSignupPhone").on("input", function(){
			let value = $("#formSignupPhone").val().replace(/\D/g, '');

		    if (value.length <= 3) {
		    	$("#formSignupPhone").val(value);
		    } else if (value.length <= 7) {
		    	$("#formSignupPhone").val(value.slice(0, 3) + '-' + value.slice(3));
		    } else {
		    	$("#formSignupPhone").val(value.slice(0, 3) + '-' + value.slice(3, 7) + '-' + value.slice(7, 11));
		    }
		});
		//이름 유효성검사
		$("#formSignupName").on("keyup", function (e) {
		    const nameValue = $("#formSignupName").val().trim();
		    if (/^[ㄱ-ㅎ]+$/.test(nameValue) || nameValue === '') {
		      e.preventDefault();
		      $('.invalid-feedback').show();
		      $('#formSignupName').focus();
		    } else {
		      $('.invalid-feedback').hide();
		    }
		  });
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