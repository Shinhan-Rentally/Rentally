<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../common/headMeta.jsp"%>
<title>Shop Checkout eCommerce HTML Template - FreshCart</title>
<%@ include file="../common/headLinks.jsp"%>

</head>

<body>
<%-- <%@ include file="../partials/navbar.html"%> --%>
<main>
		<!-- section-->
		<div class="mt-4">
			<div class="container">
				<!-- row -->
				<div class="row">
					<!-- col -->
					<div class="col-12">
						<!-- breadcrumb -->
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb mb-0">
								<li class="breadcrumb-item"><a href="#!">Home</a></li>
								<li class="breadcrumb-item"><a href="#!">Shop</a></li>
								<li class="breadcrumb-item active" aria-current="page">Shop Checkout</li>
							</ol>
						</nav>
					</div>
				</div>
			</div>
		</div>
		<!-- section -->
		<section class="mb-lg-14 mb-8 mt-8">
			<div class="container">
				<!-- row -->
				<div class="row">
					<!-- col -->
					<div class="col-12">
						<div>
							<div class="mb-8">
								<!-- text -->
								<h1 class="fw-bold mb-0">결제</h1>
							</div>
						</div>
					</div>
				</div>
				<div>
					<!-- row -->
					<div class="row">
						<div class="col-xl-7 col-lg-6 col-md-12">
							<!-- accordion -->
							<div class="accordion accordion-flush" id="accordionFlushExample">
								<!-- accordion item -->
								<div class="accordion-item py-4">
									<div class="d-flex justify-content-between align-items-center">
										<!-- heading one -->
										<a href="#" class="fs-5 text-inherit collapsed h4" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="true" aria-controls="flush-collapseOne">
											<i class="feather-icon icon-map-pin me-2 text-muted"></i>
											배송지
										</a>
										<!-- btn -->
										<a href="#" class="btn btn-outline-primary btn-sm" data-bs-toggle="modal" data-bs-target="#addAddressModal">주소지 추가</a>
										<!-- collapse -->
									</div>
									<div id="flush-collapseOne" class="accordion-collapse collapse show" data-bs-parent="#accordionFlushExample">
										<div class="mt-5">
											<div class="row">
												<div class="col-xl-6 col-lg-12 col-md-6 col-12 mb-4">
													<!-- form -->
													<div class="card card-body p-6">
														<div class="form-check mb-4">
															<input class="form-check-input" type="radio" name="flexRadioDefault" id="homeRadio" checked />
															<label class="form-check-label text-dark" for="homeRadio">사람이름1</label>
														</div>
														<!-- address -->
														<address>
															
															<br />

															4450 North Avenue Oakland,
															<br />

															Nebraska, United States,
															<br />

															<abbr title="Phone">P: 402-776-1106</abbr>
														</address>
														<span class="text-danger">Default address</span>
													</div>
												</div>
												<div class="col-xl-6 col-lg-12 col-md-6 col-12 mb-4">
													<!-- input -->
													<div class="card card-body p-6">
														<div class="form-check mb-4">
															<input class="form-check-input" type="radio" name="flexRadioDefault" id="officeRadio" />
															<label class="form-check-label text-dark" for="officeRadio">사람이름2</label>
														</div>
														<address>
															<br />
															3853 Coal Road,
															<br />
															Tannersville, Pennsylvania, 18372, USA,
															<br />

															<abbr title="Phone">P: 402-776-1106</abbr>
														</address>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<!-- accordion item -->
								<div class="accordion-item py-4">
									<a href="#" class="text-inherit h5" data-bs-toggle="collapse" data-bs-target="#flush-collapseFour" aria-expanded="false" aria-controls="flush-collapseFour">
										<i class="feather-icon icon-credit-card me-2 text-muted"></i>
										결제 방법
										<!-- collapse -->
									</a>
									<div id="flush-collapseFour" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
										<div class="mt-5">
											<div>
												<div class="card card-bordered shadow-none mb-2">
													<!-- card body -->
													<div class="card-body p-6">
														<div class="d-flex">
															
															<div>
																<!-- title -->
																<h5 class="mb-1 h6">카드 결제</h5>
																<p class="mb-0 small">정기 결제를 위한 카드결제만 가능합니다.</p>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- sidebar -->
						<div class="col-12 col-lg-4 col-md-5">
							<!-- card -->
							<div class="mb-5 card mt-6">
								<div class="card-body p-6">
									<!-- heading -->
									<h2 class="h5 mb-4">구독정보</h2>
									<div class="card mb-2">
										<!-- list group -->
										<ul class="list-group list-group-flush">
											<!-- list group item -->
											<li class="list-group-item d-flex justify-content-between align-items-start">
												<span id="productName">[LG] 트롬 오브제컬렉션 워시콤보 세탁기 25kg + 건조기 15kg + 미니워시 (스페이스 블랙)</span>
											</li>

											<!-- list group item -->
											<li class="list-group-item d-flex justify-content-between align-items-start">
												<div class="me-auto">
													<div class="fw-bold">매달 이용요금</div>
												</div>
												<span class="fw-bold" id="price">137,800원</span>
											</li>
										</ul>
									</div>
									<div class="d-grid mb-1 mt-4">
										<!-- btn -->
										<button class="btn btn-primary btn-lg d-flex justify-content-center align-items-center" type="submit" id="subscribe">
											구독하기
										</button>
									</div>
									<!-- text -->
									<p>
										<small>
											By placing your order, you agree to be bound by the Freshcart
											<a href="#!">Terms of Service</a>
											and
											<a href="#!">Privacy Policy.</a>
										</small>
									</p>
								</div>
							</div>
						</div>

					</div>
				</div>
			</div>
		</section>
	</main>

	<!-- Modal -->
	<div class="modal fade" id="addAddressModal" tabindex="-1" aria-labelledby="addAddressModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<!-- modal body -->
				<div class="modal-body p-6">
					<div class="d-flex justify-content-between mb-5">
						<!-- heading -->
						<div>
							<h5 class="h6 mb-1" id="addAddressModalLabel">New Shipping Address</h5>
							<p class="small mb-0">Add new shipping address for your order delivery.</p>
						</div>
						<div>
							<!-- button -->
							<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						</div>
					</div>
					<!-- row -->
					<div class="row g-3">
						<!-- col -->
						<div class="col-12">
							<input type="text" class="form-control" placeholder="First name" aria-label="First name" required="" />
						</div>
						<!-- col -->
						<div class="col-12">
							<input type="text" class="form-control" placeholder="Last name" aria-label="Last name" required="" />
						</div>
						<!-- col -->
						<div class="col-12">
							<input type="text" class="form-control" placeholder="Address Line 1" />
						</div>
						<div class="col-12">
							<!-- button -->
							<input type="text" class="form-control" placeholder="Address Line 2" />
						</div>
						<div class="col-12">
							<!-- button -->
							<input type="text" class="form-control" placeholder="City" />
						</div>
						<div class="col-12">
							<!-- button -->
							<select class="form-select">
								<option selected="">India</option>
								<option value="1">UK</option>
								<option value="2">USA</option>
								<option value="3">UAE</option>
							</select>
						</div>
						<div class="col-12">
							<!-- button -->
							<select class="form-select">
								<option selected="">Gujarat</option>
								<option value="1">Northern Ireland</option>
								<option value="2">Alaska</option>
								<option value="3">Abu Dhabi</option>
							</select>
						</div>
						<div class="col-12">
							<!-- button -->
							<input type="text" class="form-control" placeholder="Zip Code" />
						</div>
						<div class="col-12">
							<!-- button -->
							<input type="text" class="form-control" placeholder="Business Name" />
						</div>
						<div class="col-12">
							<div class="form-check">
								<input class="form-check-input" type="checkbox" value="" id="flexCheckDefault" />
								<!-- label -->
								<label class="form-check-label" for="flexCheckDefault">Set as Default</label>
							</div>
						</div>
						<!-- button -->
						<div class="col-12 text-end">
							<button type="button" class="btn btn-outline-primary" data-bs-dismiss="modal">Cancel</button>
							<button class="btn btn-primary" type="button">Save Address</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Footer -->
	<%-- <%@ include file="../partials/footer.html"%> --%>
	<!-- Javascript-->
 	<script src="${path}/resources/libs/flatpickr/dist/flatpickr.min.js"></script>
	<%-- <%@ include file="../partials/scripts.html"%> --%>
	<script src="${path}/resources/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
	<script src="${path}/resources/libs/simplebar/dist/simplebar.min.js"></script>
	<script src="${path}/resources/js/main.js"></script>
	
	<script src="${path}/resources/libs/imask/dist/imask.min.js"></script>
	<script src="${path}/resources/js/vendors/inputmask.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
	<script src="https://cdn.portone.io/v2/browser-sdk.js"></script>
	
	<script>
	let merchantUid;
	let year;
    let month;
    let day;
    let hours;
    let minutes;
    let seconds;
	
	$.ajax({
		  url: `${path}/payment/getSubseq`,
		  type: "GET", // 요청 유형
		  success: function(data) {
			merchantUid = data+1;
		    console.log(merchantUid); // 서버로부터 받은 데이터
		  },
		  error: function(jqXHR, textStatus, errorThrown) {
		    console.error("Error: " + textStatus, errorThrown); // 에러 처리
		  }
		});
    
    $("#subscribe").click(payment);
    //$("#subscribe").click(payment2);
    
    async function payment2(){
    	const issueResponse = PortOne.requestIssueBillingKey({
    	    storeId: "store-df220412-2eec-4989-8173-fdc3bfb8f541", // 고객사 storeId로 변경해주세요.
    	    channelKey: "channel-key-9dc1fb15-6f45-4b0f-8ced-8c35e312efa6", // 콘솔 결제 연동 화면에서 채널 연동 시 생성된 채널 키를 입력해주세요.
    	    billingKeyMethod: "CARD",
    	    issueId: "1",
    	    issueName: "테스트결제",
    	    customer: {
    	      fullName: "포트원",
    	      phoneNumber: "010-0000-1234",
    	      email: "test@portone.io",
    	    }
    	});

    	// 빌링키가 제대로 발급되지 않은 경우 에러 코드가 존재합니다
    	if (issueResponse.code !== undefined) {
    	  return alert(issueResponse.message);
    	}

    	// 고객사 서버에 빌링키를 전달합니다
    	const response = await fetch(`${path}/make-payment`, {
    	  method: "POST",
    	  header: { "Content-Type": "application/json" },
    	  body: JSON.stringify({
    	    billingKey: issueResponse.billingKey,
    	    // ...
    	  }),
    	});
    	if (!response.ok) throw new Error(`response: \${await response.json()}`);
    }

    function pad(number) {
        return number < 10 ? '0' + number : number;
    }

    // Function to display the current date and time
    function displayDateTime() {
        let now = new Date();

        // Get the current date
        year = now.getFullYear();
        month = pad(now.getMonth() + 1);
        day = pad(now.getDate());

        // Get the current time
        hours = pad(now.getHours());
        minutes = pad(now.getMinutes());
        seconds = pad(now.getSeconds());
        
        return year+month+day+hours+minutes+seconds;
    }
	
	function payment(){
		let nowDate = displayDateTime();
		console.log(nowDate);
		IMP.init("imp26414862");
		
		IMP.request_pay(
				  {
				    channelKey: "channel-key-32f7b4dd-ec84-4363-abb9-a8c3b5d5a071",
				    pay_method: "card", // 'card'만 지원됩니다.
				    //merchant_uid: merchantUid, // 상점에서 관리하는 주문 번호
				    merchant_uid: "order_004", // 상점에서 관리하는 주문 번호
				    name: $('#productName').text(),
				    amount: 100, // 결제창에 표시될 금액. 실제 승인이 이뤄지지는 않습니다.
				    customer_uid: `${cust_seq}\${nowDate}`, // 필수 입력.
				    //customer_uid: "003", // 필수 입력.
				    buyer_email: "test@portone.io",
				    buyer_name: "포트원",
				    buyer_tel: "02-1234-1234",
				  },
				  function (rsp) {
				    if (rsp.success) {
				      alert("빌링키 발급 성공");
				      
					    const paymentData = {
				                billingKey: rsp.customer_uid,  // Or whichever field contains the billing key
				                merchantUid: rsp.merchant_uid,
				                amount: 100 // Example amount, replace with actual payment amount
				            };

				            // Send the payment data to the server (Spring MVC)
				            fetch(`${path}/payment/process`, {
				                method: 'POST',
				                headers: {
				                    'Content-Type': 'application/json'
				                },
				                body: JSON.stringify(paymentData)
				            })
				            .then(response => response.json())
				            .then(data => {
				                if (data.success) {
				                    alert("결제 성공");
				                } else {
				                    alert("결제 실패");
				                }
				            })
				            .catch(error => {
				                console.error('Error:', error);
				                alert('결제 도중 오류 발생');
				            });
				    } else {
				      alert("빌링키 발급 실패");
				    }
				  },
				);
	}
	
	
	</script>
</body>
</html>