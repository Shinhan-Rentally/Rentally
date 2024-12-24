<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../common/headMeta.jsp"%>
<%@ include file="../common/headLinks.jsp"%>
<title>Rentally</title>
<style>
	#formSignupEmail2:read-only{
		background-color: #EAEAEA;
	}
</style>
</head>
<body>
	<!-- header 화면 불러오기 -->

	<main>
		<!-- section -->
		<section class="my-lg-14 my-8">
			<!-- container -->
			<div class="container">
				<!-- row -->
				<div class="row justify-content-center align-items-center">
					<div class="col-12 col-md-6 col-lg-4 order-lg-1 order-2">
						<!-- img -->
						<img src="../resources/images/svg-graphics/signup-g.svg"
							alt="joinImg" class="img-fluid" />
					</div>
					<!-- col -->
					<div
						class="col-12 col-md-6 offset-lg-1 col-lg-4 order-lg-2 order-1">
						<div class="mb-lg-9 mb-5">
							<h1 class="mb-1 h2 fw-bold">Rentally 회원가입</h1>
							
								<h6>Rentally에 오신 걸 환영합니다!</h6><br>
								<p>Rentally는 가전 구독 플랫폼으로 최신 제품을 부담 없이 간편하게 제공합니다.</p>
								
						</div>
						<!-- form -->
						<form class="needs-validation" novalidate>
							<div class="row g-3">
								<!-- col -->
								<div class="col-12">
									<!-- input ID -->
									<label for="formSignupId" class="form-label visually-hidden">
										cust_id
									</label>
									<input type="text" class="form-control"
										id="formSignupId" name="cust_id" placeholder="ID를 입력해주세요"
										required />
									<div class="invalid-feedback">ID를 입력해주세요.</div>
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
									<select class="form-control" id="formSignupEmail" required>
										<option value="">직접입력</option>
										<option value="@naver.com">&#64;naver.com</option>
										<option value="@gmail.com">&#64;gmail.com</option>
										<option value="@daum.net">&#64;daum.net</option>
										<option value="@hanmail.net">&#64;hanmail.net</option>
										<option value="@nate.com">&#64;nate.com</option>
									</select>
									<div class="invalid-feedback">이메일을 입력해주세요.</div>
								</div>
								<div class="col-12">
									<!-- input -->
									<label for="formSignupPhone" class="form-label visually-hidden">
										Phone number
									</label>
									<input type="text" class="form-control"
										id="formSignupPhone" placeholder="핸드폰번호" required />
									<div class="invalid-feedback">핸드폰번호를 입력해주세요.</div>
								</div>
								<div class="col-12">
									<div class="password-field position-relative">

										<label for="formSignupPassword"
											class="form-label visually-hidden"> Password </label>
										<div class="password-field position-relative">
											<input type="password" class="form-control fakePassword"
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
									<button type="submit" class="btn btn-primary">회원가입</button>
								</div>

								<!-- text -->
								<p>
									<small> By continuing, you agree to our <a href="#!">Terms
											of Service</a> &amp; <a href="#!">Privacy Policy</a>
									</small>
								</p>
							</div>
						</form>
					</div>
				</div>
			</div>
		</section>
	</main>

	<!-- Footer -->
	<!-- @@include("../partials/footer.html") -->
	<!-- Javascript-->
	<script src="resources/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
	<script src="resources/js/vendors/password.js"></script>
	<script src="resources/libs/simplebar/dist/simplebar.min.js"></script>
	<script src="resources/js/vendors/validation.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<script>
		$("select").on("change", function() {
			if ($(this).val()) {
				$("#formSignupEmail2").attr("readonly", true);
				$("#formSignupEmail2").val($(this).val());
			} else {
				$("#formSignupEmail2").val("");
				$("#formSignupEmail2").attr("readonly", false);
			}
		});
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
		
	</script>
</body>
</html>