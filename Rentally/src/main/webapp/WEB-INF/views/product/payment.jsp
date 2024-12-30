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
<%@ include file="../common/header.jsp"%>
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
										<a href="#" class="btn btn-outline-info btn-sm" data-bs-toggle="modal" data-bs-target="#addAddressModal">주소지 추가</a>
										<!-- collapse -->
									</div>
									<div id="flush-collapseOne" class="accordion-collapse collapse show" data-bs-parent="#accordionFlushExample">
										<div class="mt-5">
											<div class="row">
											<c:forEach items="${addressList}" var="addr">
												<div class="col-xl-6 col-lg-12 col-md-6 col-12 mb-4">
													<!-- form -->
													<div class="card card-body p-6">
														<div class="form-check mb-4">
															<input class="form-check-input" type="radio" name="flexRadioDefault" id="homeRadio" <c:if test="${addr.addr_default == true}">checked</c:if> />
															<label class="form-check-label text-dark" for="homeRadio">${addr.addr_name}</label>
														</div>
														<!-- address -->
														<address>
															${addr.addr_title}<br>
															${addr.addr_detail}<br>
															<abbr title="Phone">P: ${addr.addr_phone}</abbr>
														</address>
														<c:if test="${addr.addr_default == true}">
															<span class="text-danger">Default address</span>
														</c:if>
													</div>
												</div>
											</c:forEach>
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
								<div>
									<div class="card card-bordered shadow-none mb-2 mt-2">
										<!-- card body -->
										<div class="card-body p-6">
											<div class="d-flex">
												<div>
													<!-- title -->
													<h5 class="mb-1 h6">※ 배송 유의사항</h5>
													<ul>
														<li class="small">제주도/도서산간 지역 및 특정 요일만 설치 가능한 지역은 배송 일정이 변경될 수 있으며, 일부 지역은 실제 배송이 되지 않아 주문 취소가 될 수 있습니다.</li>
														<li class="small">제주 지역은 금요일 오후 3시 이후 결제 시, 차주 화요일부터 배송이 가능합니다.</li>
														<li class="small">제품은 배송 전에 등록하신 번호로 배송 당일에 설치기사가 연락 드립니다.</li>
														<li class="small">설치 관련 자세한 문의는 고객센터로 연락 부탁드립니다.</li>
														<li class="small">전문기사설치 제품은 대면설치가 기본이며, 고객 요청에 의한 비대면 설치에 따른 책임은 당사에 있지 않습니다.</li>
													</ul>
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
											<c:if test="${isUpgrade}">
												<!-- list group item -->
												<li class="list-group-item d-flex justify-content-between align-items-start">
													<div class="me-auto">
														<div>이전 매달 이용요금</div>
													</div>
													<span>
														<fmt:formatNumber value="${subTotal}" type="number" pattern="#,###"/>원
													</span>
												</li>
											</c:if>
											
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
										<button class="btn btn-info btn-lg d-flex justify-content-center align-items-center" id="subscribe">
											<c:if test="${isUpgrade}">
											</c:if>
											<c:choose>
											    <c:when test="${isUpgrade}">
											        업그레이드 신청하기
											    </c:when>
											    <c:otherwise>
											        구독하기
											    </c:otherwise>
											</c:choose>
										</button>
									</div>
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
	<%@ include file="../common/footer.jsp"%>
	<!-- Javascript-->
 	<script src="${path}/resources/libs/flatpickr/dist/flatpickr.min.js"></script>
	<script src="${path}/resources/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
	<script src="${path}/resources/libs/simplebar/dist/simplebar.min.js"></script>
	<script src="${path}/resources/js/main.js"></script>
	
	<script src="${path}/resources/libs/imask/dist/imask.min.js"></script>
	<script src="${path}/resources/js/vendors/inputmask.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
	
	<script>
	let merchantUid;
	console.log("isUpgrade:"+${isUpgrade});
	$.ajax({
		  url: `${path}/payment/getSubseq`,
		  type: "GET",
		  success: function(data) {
			merchantUid = data+1;
		  },
		  error: function(jqXHR, textStatus, errorThrown) {
		    console.error("Error: " + textStatus, errorThrown);
		  }
		});
    
    $("#subscribe").click(payment);

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
				    customer_uid: `${cust_seq}_\${nowDateStr}`, 
				    buyer_email: `${custEmail}`,
				    buyer_name: `${custName}`,
				    buyer_tel: `${custPhone}`
				  },
				  function (rsp) {
				    if (rsp.success) {
				      alert("빌링키 발급 성공");
				      let subTotal = rsp.paid_amount;
				      let subCard = rsp.card_name;
				      
					    const paymentData = {
				                billingKey: rsp.customer_uid,  
				                merchantUid: rsp.merchant_uid,
				                amount: rsp.paid_amount,
				                name: `${custName}`
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

	    const $selectedRadio = $('input[name="flexRadioDefault"]:checked');
	    const $selectedCard = $selectedRadio.closest('.card');
	    const $addressElement = $selectedCard.find('address');
	    const addressLines = $addressElement.text().split('\n').map(line => $.trim(line)).filter(line => line !== '');

	    const addressTitle = addressLines[0];
	    const addressDetail = addressLines[1];

	    const subName = $selectedCard.find('.form-check-label').text();
	    const subPhone = $selectedCard.find('address abbr[title="Phone"]').text().replace('P: ', '');

	    return { subName, subPhone, addressTitle, addressDetail };
	}

	
	function redirectToCompletePage(paymentResultData) {
	    const selectedAddress = getSelectedAddress();
	    if (!selectedAddress) {
	        alert('선택된 주소가 없습니다.');
	        return;
	    }

	    const $form = $('<form></form>');
	    $form.attr('method', 'POST');

	    for (const key in paymentResultData) {
	        if (paymentResultData.hasOwnProperty(key)) {
	            const $input = $('<input type="hidden">');
	            $input.attr('name', key);
	            $input.val(paymentResultData[key]);
	            $form.append($input);
	        }
	    }

	    const $nameInput = $('<input type="hidden" name="sub_name">').val(selectedAddress.subName);
	    $form.append($nameInput);

	    const $addressTitleInput = $('<input type="hidden" name="sub_addrT">').val(selectedAddress.addressTitle);
	    $form.append($addressTitleInput);

	    const $addressDetailInput = $('<input type="hidden" name="sub_addrD">').val(selectedAddress.addressDetail);
	    $form.append($addressDetailInput);

	    const $phoneInput = $('<input type="hidden" name="sub_phone">').val(selectedAddress.subPhone);
	    $form.append($phoneInput);

	    const $productSeqInput = $('<input type="hidden" name="product_seq">').val(${productSeq});
	    $form.append($productSeqInput);

	    if(${isUpgrade}){
	    	const $subSeqInput = $('<input type="hidden" name="sub_seq">').val(${subSeq});
		    $form.append($subSeqInput);
	    	
		    $form.attr('action', `${path}/subscribe/product/update`);
	    } else {
	    	const $subPeriodInput = $('<input type="hidden" name="sub_period">').val(${productPeriod});
		    $form.append($subPeriodInput);
		    
		    $form.attr('action', `${path}/subscribe/product`);
	    }

	    $('body').append($form);
	    $form.submit();
	}

	</script>
</body>
</html>