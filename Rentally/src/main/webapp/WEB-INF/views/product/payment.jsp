<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
															4450 North Avenue Oakland,<br>
															Nebraska, United States<br>
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
															3853 Coal Road<br>
															Tannersville, Pennsylvania, 18372, USA<br>
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
												<span id="productName">${productName}</span>
											</li>

											<!-- list group item -->
											<li class="list-group-item d-flex justify-content-between align-items-start">
												<div class="me-auto">
													<div class="fw-bold">매달 이용요금</div>
												</div>
												<span class="fw-bold" id="productPay">
													<fmt:formatNumber value="${productPay}" type="number" pattern="#,###"/>원
												</span>
											</li>
										</ul>
									</div>
									<div class="d-grid mb-1 mt-4">
										<!-- btn -->
										<button class="btn btn-primary btn-lg d-flex justify-content-center align-items-center" id="subscribe">
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
	
	$.ajax({
		  url: `${path}/payment/getSubseq`,
		  type: "GET", // 요청 유형
		  success: function(data) {
			merchantUid = data+1;
		  },
		  error: function(jqXHR, textStatus, errorThrown) {
		    console.error("Error: " + textStatus, errorThrown);
		  }
		});
    
    $("#subscribe").click(payment);
    //$("#subscribe").click(payment2);

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
	
	function payment(){
		let nowDate = displayDateTime();
		let nowDateStr = nowDate.replace(/[^\d]/g, '');

		IMP.init("imp26414862");
		
		IMP.request_pay(
				  {
				    channelKey: "channel-key-32f7b4dd-ec84-4363-abb9-a8c3b5d5a071",
				    pay_method: "card", 
				    merchant_uid: `\${merchantUid}_\${nowDateStr}`, 
				    name: $('#productName').text(),
				    amount: $('#productPay').text().replace(/[^\d]/g, ''), 
				    customer_uid: `${custSeq}_\${nowDateStr}`, 
				    buyer_email: `${custEmail}`,
				    buyer_name: `${custName}`,
				    buyer_tel: `${custPhone}`
				  },
				  function (rsp) {
				    if (rsp.success) {
				      alert("빌링키 발급 성공");
				      let subTotal = rsp.paid_amount;
				      let subCard = rsp.card_name;
				      console.log(rsp);
				      
					    const paymentData = {
				                billingKey: rsp.customer_uid,  
				                merchantUid: rsp.merchant_uid,
				                //amount: rsp.paid_amount // 실제 요청할 금액
				                amount: 100 // 테스트용 금액
				            };

				            fetch(`${path}/payment/process`, { // 서버로 결제 요청 전송
				                method: 'POST',
				                headers: {
				                    'Content-Type': 'application/json'
				                },
				                body: JSON.stringify(paymentData)
				            })
				            .then(response => response.json())
				            .then(data => {
				                if (data.success) {
				                    console.log(data);
				                	alert("결제 성공");
				                    
				                    const paymentResultData = {
				                    	sub_total: subTotal,
				                    	sub_card: subCard,
				                    	sub_date: nowDate
				                    };
				                    redirectToCompletePage(paymentResultData);
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
	
	function getSelectedAddress() {
		// 선택된 라디오 버튼을 찾습니다.
		const selectedRadio = document.querySelector('input[name="flexRadioDefault"]:checked');

		// 선택된 라디오 버튼을 포함하는 가장 가까운 .card 요소를 찾습니다.
		const selectedCard = selectedRadio.closest('.card');

		// .card 요소 내의 <address> 요소를 찾습니다.
		const addressElement = selectedCard.querySelector('address');

		// <address> 요소 내의 텍스트를 줄 단위로 분리합니다.
		const addressLines = addressElement.innerText.split('\n').map(line => line.trim()).filter(line => line !== '');

		// addressTitle과 addressDetail을 추출합니다.
		const addressTitle = addressLines[0];
		const addressDetail = addressLines[1];

		// 사람 이름을 추출합니다.
		const subName = selectedCard.querySelector('.form-check-label').innerText;

		// 전화번호를 추출합니다.
		const subPhone = selectedCard.querySelector('address abbr[title="Phone"]').innerText.replace('P: ', '');

		return { subName, subPhone, addressTitle, addressDetail };

	}
	
	function redirectToCompletePage(paymentResultData) {
	    const selectedAddress = getSelectedAddress();
	    if (!selectedAddress) {
	        alert('선택된 주소가 없습니다.');
	        return;
	    }

	    const form = document.createElement('form');
	    form.method = 'POST';
	    form.action = `${path}/subscribe/product`;

	    // Add payment data to form
	    for (const key in paymentResultData) {
	        if (paymentResultData.hasOwnProperty(key)) {
	            const input = document.createElement('input');
	            input.type = 'hidden';
	            input.name = key;
	            input.value = paymentResultData[key];
	            form.appendChild(input);
	        }
	    }

	    // Add selected address to form
	    const nameInput = document.createElement('input');
	    nameInput.type = 'hidden';
	    nameInput.name = 'sub_name';
	    nameInput.value = selectedAddress.subName;
	    form.appendChild(nameInput);

	    const addressTitleInput = document.createElement('input');
	    addressTitleInput.type = 'hidden';
	    addressTitleInput.name = 'sub_addrT';
	    addressTitleInput.value = selectedAddress.addressTitle;
	    form.appendChild(addressTitleInput);
	    
	    const addressDetailInput = document.createElement('input');
	    addressDetailInput.type = 'hidden';
	    addressDetailInput.name = 'sub_addrD';
	    addressDetailInput.value = selectedAddress.addressDetail;
	    form.appendChild(addressDetailInput);
	    
	    const phoneInput = document.createElement('input');
	    phoneInput.type = 'hidden';
	    phoneInput.name = 'sub_phone';
	    phoneInput.value = selectedAddress.subPhone;
	    form.appendChild(phoneInput);
	    
	    const productSeqInput = document.createElement('input');
	    productSeqInput.type = 'hidden';
	    productSeqInput.name = 'product_seq';
	    productSeqInput.value = ${productSeq};
	    form.appendChild(productSeqInput);
	    
	    const subPeriodInput = document.createElement('input');
	    subPeriodInput.type = 'hidden';
	    subPeriodInput.name = 'sub_period';
	    subPeriodInput.value = ${productPeriod};
	    form.appendChild(subPeriodInput);
	    
	    document.body.appendChild(form);
	    form.submit();
	}

	
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
	</script>
</body>
</html>