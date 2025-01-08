<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../common/headMeta.jsp"%>
<%@ include file="../common/headLinks.jsp"%>
<title>회원가입 - Rentally</title>
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
						<img src="${path}/resources/images/svg-graphics/signup-g.svg"
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
						
							<div class="row g-3">
								<!-- btn -->
								<div class="col-12 d-grid">
									<button id="identity" class="btn btn-info">간편 본인인증</button>
								</div>
							</div>
						
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
	<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<script>
		//본인인증
		$('#identity').click(identity);

		let merchantUid;
			 

		function pad(number) {
	        return number < 10 ? '0' + number : number;
	    }
	    function displayDateTime() {
	        let now = new Date();

	        let year = now.getFullYear();
	        let month = pad(now.getMonth() + 1);
	        let day = pad(now.getDate());

	        let hours = pad(now.getHours());
	        let minutes = pad(now.getMinutes());
	        let seconds = pad(now.getSeconds());
	        
	        return `\${year}-\${month}-\${day} \${hours}:\${minutes}:\${seconds}`;
	    }
		function identity(){
			let nowDate = displayDateTime();
			let nowDateStr = nowDate.replace(/[^\d]/g, '');
			
			IMP.init("imp26414862");
			IMP.certification(
				{
				    channelKey: "channel-key-0968e548-13b5-40fc-8874-b4335e73b862",
				    merchant_uid: `\${merchantUid}`, // 주문 번호
				    popup: true
				},
				function(rsp){
					//callback
					if(rsp.success){
						//인증 성공 시 jQuery로 HTTP요청
						$.ajax({
							url: "${path}/customer/identity",
							method: "POST",
							headers: { "Content-Type": "application/json" },
							data: JSON.stringify({ imp_uid: rsp.imp_uid }),
							success: function(data){
								if(data.error){
									alert('본인인증 중 오류 발생!!');
								} else {
									const custName = data.name;
									const custPhone = data.phone;
									
									//인증성공시 데이터 전송
									$.ajax({
										url: "${path}/customer/getData",
										type: "POST",
										contentType: "application/json",
										data: JSON.stringify({
											name: custName,
											phone: custPhone
										}),
										success: function(){
											window.location.href = '${path}/customer/join';
										},
										error: function(xhr, status, error){
											console.error('세션 저장 실패 >> ', error);
										}
									});
								}
							},
							error: function(xhr, status, error){
								console.error('요청실패 >> ', error);
							}
						});
					} else {
						alert("인증에 실패하였습니다.");
					}
				}
			);

		}
	
		
		
		
		
		
	</script>
</body>
</html>