<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.servletContext.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../common/headMeta.jsp"%>
<title>주소 - Rentally</title>
<%@ include file="../common/headLinks.jsp"%>
<!-- star style -->
    <c:set var="page" value="address" />
</head>

<body>
	<%@ include file="../common/header.jsp"%>
	<main>
		<!-- section -->
		<section>
			<!-- container -->
			<div class="container">
				<!-- row -->
				<div class="row">
					<%@ include file="../common/myPageNavbar.jsp"%>
					<!-- col -->
					<div class="col-lg-9 col-md-8 col-12">
						<div class="py-6 p-md-6 p-lg-10">
							<!-- heading -->
							<h2 class="mb-0">주소</h2>
							<br>
							<!-- button -->
							<div style="text-align: right;">
								<a href="#" class="btn btn-info btn-sm" data-bs-toggle="modal"
									data-bs-target="#addAddressModal">새로운 주소 추가</a>
							</div>
							<div class="row">
								<!-- col -->
								<c:forEach var="address" items="${addressList}">
									<div class="col-xl-5 col-lg-6 col-xxl-4 col-12 mb-4">
										<!-- form -->
										<div class="card">
											<div class="card-body p-6">
												<div class="form-check mb-4">
													<label class="form-check-label text-dark fw-semibold"
														for="homeRadio">${address.addr_name}</label>
												</div>

												<!-- address -->
												<p class="mb-6">
													${address.addr_title}<br> ${address.addr_detail}<br>
													${address.addr_phone}<br>
												</p>

												<!-- btn -->
												<div class="mt-4">
													<c:choose>
														<c:when test="${address.addr_default}">
															<a href="#" class="btn btn-info btn-sm"> 기본 주소 </a>
														</c:when>
														<c:otherwise>
															<a href="setDefault" class="link-primary"
																onclick="setDefault(${address.addr_seq}); return false;">기본
																주소로 설정하기 </a>
														</c:otherwise>
													</c:choose>
													<br> <a href="#" class="text-inherit"
														data-bs-toggle="modal" data-bs-target="#editAddressModal"
														onclick="updateModal('${address.addr_seq}', '${address.addr_title}', '${address.addr_name}', '${address.addr_phone}', '${address.addr_detail}', '${address.addr_default}')">
														수정 </a>
														<a href="#" class="text-danger ms-3 delete-address-btn"
														data-bs-toggle="modal" data-bs-target="#deleteModal" data-addr-seq = "${address.addr_seq}">삭제</a>
												</div>

											</div>
										</div>
									</div>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</main>


	<!-- 주소 등록 Modal -->
	<div class="modal fade" id="addAddressModal" tabindex="-1"
		aria-labelledby="addAddressModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<!-- modal content -->
			<div class="modal-content">
				<!-- modal body -->
				<div class="modal-body p-6">
					<div class="d-flex justify-content-between mb-5">
						<div>
							<!-- heading -->
							<h5 class="mb-1" id="addAddressModalLabel">새로운 주소 등록</h5>
							<p class="small mb-0">배송받을 주소를 입력해주세요.</p>
						</div>
						<div>
							<!-- button -->
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
					</div>
					<!-- row -->
					<div class="row g-3">
						<!-- col -->
						<div class="col-12">
							<!-- input -->
							<input type="text" class="form-control" id="postcode"
								name="postcode" placeholder="우편번호" aria-label="First name"
								required />
						</div>
						<!-- col -->
						<div class="col-12 text-end">
							<button class="btn btn-info btn-sm" type="button"
								onclick="findPostcode()">우편번호 찾기</button>
						</div>
						<!-- col -->
						<div class="col-12">
							<!-- input -->
							<input type="text" class="form-control" id="address"
								name="address" placeholder="주소" aria-label="Last name" required />
						</div>
						<!-- col -->
						<div class="col-12">
							<!-- input -->
							<input type="text" class="form-control" placeholder="상세 주소"
								id="detailAddress" name="detailAddress" required />
						</div>
						<!-- col -->
						<div class="col-12">
							<!-- input -->
							<input type="text" class="form-control" placeholder="추가 주소"
								id="extraAddress" name="extraAddress" required />
						</div>
						<!-- col -->
						<div class="col-12">
							<!-- input -->
							<input type="text" class="form-control" placeholder="받는이"
								id="recipName" name="recipName" required />
						</div>
						<!-- col -->
						<div class="col-12">
							<!-- input -->
							<input type="text" class="form-control" placeholder="번호"
								id="recipPhone" name="recipPhone" required />
						</div>
						<!-- col -->
						<div class="col-12">
							<!-- form check -->
							<div class="form-check">
								<input class="form-check-input" type="checkbox" value=""
									id="addrDefault" name="addrDefault" /> <label
									class="form-check-label" for="addrDefault">기본 주소로 설정</label>
							</div>
						</div>
						<!-- col -->
						<div class="col-12 text-end">
							<button type="button" class="btn btn-info btn-sm"
								data-bs-dismiss="modal">취소</button>
							<button class="btn btn-info btn-sm" id="saveAddress"
								type="button">주소 저장</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 주소 수정 Modal -->
	<div class="modal fade" id="editAddressModal" tabindex="-1"
		aria-labelledby="editAddressModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<!-- modal content -->
			<div class="modal-content">
				<!-- modal body -->
				<div class="modal-body p-6">
					<div class="d-flex justify-content-between mb-5">
						<div>
							<!-- heading -->
							<h5 class="mb-1" id="editAddressModalLabel">주소 수정</h5>
							<p class="small mb-0">주소를 수정해주세요.</p>
						</div>
						<div>
							<!-- button -->
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								onclick="closeModal()"
								aria-label="Close"></button>
						</div>
					</div>
					<!-- row -->
					<div class="row g-3">
						<!-- col -->
						<input type="hidden" id="editAddrSeq" name="addrSeq"/>
						<!-- col -->
						<div class="col-12">
							<!-- input -->
							<input type="text" class="form-control" id="editPostcode"
								name="postcode" placeholder="우편번호" aria-label="First name"
								required />
						</div>
						<!-- col -->
						<div class="col-12 text-end">
							<button class="btn btn-info btn-sm" type="button"
								onclick="findPostcode()">우편번호 찾기</button>
						</div>
						<!-- col -->
						<div class="col-12">
							<!-- input -->
							<input type="text" class="form-control" id="editAddress"
								name="address" placeholder="주소" aria-label="Last name" required />
						</div>
						<!-- col -->
						<div class="col-12">
							<!-- input -->
							<input type="text" class="form-control" placeholder="상세 주소"
								id="editDetailAddress" name="detailAddress" required />
						</div>
						<!-- col -->
						<div class="col-12">
							<!-- input -->
							<input type="text" class="form-control" placeholder="받는이"
								id="editRecipName" name="recipName" required />
						</div>
						<!-- col -->
						<div class="col-12">
							<!-- input -->
							<input type="text" class="form-control" placeholder="번호"
								id="editRecipPhone" name="recipPhone" required />
						</div>
						<!-- col -->
						<div class="col-12">
							<!-- form check -->
							<div class="form-check">
								<input class="form-check-input" type="checkbox" value=""
									id="editAddrDefault" name="addrDefault" /> <label
									class="form-check-label" for="addrDefault">기본 주소로 설정</label>
							</div>
						</div>
						<!-- col -->
						<div class="col-12 text-end">
							<button type="button" class="btn btn-info btn-sm"
								data-bs-dismiss="modal" onclick="closeModal()">취소</button>
							<button class="btn btn-info btn-sm" id="updateAddress"
								type="button">주소 저장</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- modal -->
	<div class="offcanvas offcanvas-start" tabindex="-1"
		id="offcanvasAccount" aria-labelledby="offcanvasAccountLabel">
		<!-- offcanvac header -->
		<div class="offcanvas-header">
			<h5 class="offcanvas-title" id="offcanvasAccountLabel">Offcanvas</h5>
			<button type="button" class="btn-close" data-bs-dismiss="offcanvas"
				aria-label="Close"></button>
		</div>
		<!-- offcanvac body -->
		<div class="offcanvas-body">
			<!-- nav -->
			<ul class="nav flex-column nav-pills nav-pills-dark">
				<!-- nav item -->
				<li class="nav-item"><a class="nav-link" aria-current="page"
					href="account-orders.html"> <i
						class="feather-icon icon-shopping-bag me-2"></i> Your Orders
				</a></li>
				<!-- nav item -->
				<li class="nav-item"><a class="nav-link"
					href="account-settings.html"> <i
						class="feather-icon icon-settings me-2"></i> Settings
				</a></li>
				<!-- nav item -->
				<li class="nav-item"><a class="nav-link active"
					href="account-address.html"> <i
						class="feather-icon icon-map-pin me-2"></i> Address
				</a></li>
				<!-- nav item -->
				<li class="nav-item"><a class="nav-link"
					href="account-payment-method.html"> <i
						class="feather-icon icon-credit-card me-2"></i> Payment Method
				</a></li>
				<!-- nav item -->
				<li class="nav-item"><a class="nav-link"
					href="account-notification.html"> <i
						class="feather-icon icon-bell me-2"></i> Notification
				</a></li>
			</ul>
			<hr class="my-6" />
			<div>
				<!-- nav -->
				<ul class="nav flex-column nav-pills nav-pills-dark">
					<!-- nav item -->
					<li class="nav-item"><a class="nav-link" href="../index.html">
							<i class="feather-icon icon-log-out me-2"></i> Log out
					</a></li>
				</ul>
			</div>
		</div>
	</div>
	<%@ include file="../common/bottomKakao.jsp"%>

	<!-- Footer -->
	<%@ include file="../common/footer.jsp"%>

	<!-- Javascript-->
	<script src="${path}/resources/libs/flatpickr/dist/flatpickr.min.js"></script>
	<script
		src="${path}/resources/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
	<script src="${path}/resources/libs/simplebar/dist/simplebar.min.js"></script>
	<script src="${path}/resources/js/main.js"></script>

	<script src="${path}/resources/libs/imask/dist/imask.min.js"></script>
	<script src="${path}/resources/js/vendors/inputmask.js"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
	<!-- 카카오 주소 API -->
	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

	<script>
	// 주소 수정 숫자 유효성 검사
	$("#editRecipPhone").on("input", function(){
		let value = $("#editRecipPhone").val().replace(/\D/g, '');
	    if (value.length <= 3) {
	    	$("#editRecipPhone").val(value);
	    } else if (value.length <= 7) {
	    	$("#editRecipPhone").val(value.slice(0, 3) + '-' + value.slice(3));
	    } else {
	    	$("#editRecipPhone").val(value.slice(0, 3) + '-' + value.slice(3, 7) + '-' + value.slice(7, 11));
	    }
	});
	
	// 주소 등록 숫자 유효성 검사
	$("#recipPhone").on("input", function(){
		let value = $("#recipPhone").val().replace(/\D/g, '');
	    if (value.length <= 3) {
	    	$("#recipPhone").val(value);
	    } else if (value.length <= 7) {
	    	$("#recipPhone").val(value.slice(0, 3) + '-' + value.slice(3));
	    } else {
	    	$("#recipPhone").val(value.slice(0, 3) + '-' + value.slice(3, 7) + '-' + value.slice(7, 11));
	    }
	});
	
	// 수정 모달 열기
	function updateModal(seq, title, name, phone, address, isDefault) {
        const postcodeMatch = address.match(/\d{5}/);
        const postcode = postcodeMatch ? postcodeMatch[0] : ' ';
        console.log(postcode);
        
        const modalElement = document.getElementById('editAddressModal');
        
        document.getElementById('editAddrSeq').value = seq;
        document.getElementById('editPostcode').value = postcode;
        document.getElementById('editAddress').value = title;
        document.getElementById('editDetailAddress').value = address;
        document.getElementById('editRecipName').value = name;
        document.getElementById('editRecipPhone').value = phone;
        document.getElementById('editAddrDefault').checked = isDefault === 'true';
		
    	 // Bootstrap 모달 열기
        const modalInstance = new bootstrap.Modal(modalElement);
        modalInstance.show();
        
    }
	
	// 모달 닫기
	function closeModal() {
		// 모달 요소 가져오기
	    const modalElement = document.getElementById('editAddressModal');
	    const modalInstance = bootstrap.Modal.getInstance(modalElement);
	    
	    // Bootstrap 모달 인스턴스가 있으면 닫기
	    if (modalInstance) {
	        modalInstance.hide();
	    }

	    // 강제로 백드롭 제거
	    document.querySelectorAll('.modal-backdrop').forEach((backdrop) => backdrop.remove());

	    // 모달 스타일 강제 초기화
	    modalElement.style.display = 'none';
	    modalElement.classList.remove('show');

	    // 페이지 스크롤 복원
	    document.body.classList.remove('modal-open');
	    document.body.style.overflow = 'auto';
	    document.body.style.paddingRight = '0';
	}
	
	// update Address 코드
    $('#updateAddress').on("click", function (event) {
        event.preventDefault(); // 기본 폼 제출 동작 방지

        // 필요한 데이터 수집
        const addrSeq = $('#editAddrSeq').val();
        const postcode = $('#editPostcode').val();
        const address = $('#editAddress').val();
        const detailAddress = $('#editDetailAddress').val();
        const recipName = $('#editRecipName').val();
        const recipPhone = $('#editRecipPhone').val();
        const addrDefault = $('#editAddrDefault').is(':checked');


        var data = {
                "addr_title":address,
                "addr_detail": `\${detailAddress}( \${postcode})`,
                "addr_name":recipName,
                "addr_phone":recipPhone,
               "addr_default": addrDefault,              
                "addr_seq":addrSeq
            };
        console.log(data);
        // AJAX 요청
        $.ajax({
            url: "${path}/address/update", // 서버의 업데이트 엔드포인트
            type: "POST",
            data: data,
            success: function (response) {
                // 성공 응답 처리
                if (response.status === "success") {
                    alert(response.message);
                    location.reload(); // 페이지 새로고침
                } else {
                    alert(response.message);
                }
            },
            error: function (xhr, status, error) {
                // 실패 응답 처리
                console.error("Error:", error);
                alert("주소 수정 중 오류가 발생했습니다.");
            }
        });
    });
	
	// 기본 주소 설정
	function setDefault(addrSeq) {
	    $.ajax({
	        url: '${path}/address/setDefault',
	        type: 'POST',
	        data: { addrSeq: addrSeq },
	        success: function(data) {
	            if (data.status === 'success') {
	                alert(data.message);
	                location.reload(); // 페이지 새로고침
	            } else {
	                alert(data.message);
	            }
	        },
	        error: function(xhr, status, error) {
	            console.error('Error:', error);
	            alert('기본 주소 설정 중 오류가 발생했습니다.');
	        }
	    });
	}
	
	// 주소 등록 Jquery
	$('#saveAddress').on("click", function (event) {
    event.preventDefault();

    const formData = $('#addAddressModal').find('input, select').serialize();

    $.ajax({
        url: "${path}/address/add",
        type: "POST",
        data: formData,
        success: function (response) {
            if (response.status === "error") {
                alert(response.message);
            } else if (response.status === "success") {
                alert(response.message);
                location.reload(); // 페이지 새로고침
            }
        },
        error: function (xhr, status, error) {
            console.error("Error:", error);
            alert("주소 저장 중 오류가 발생했습니다.");
        }
    });
});
	
	// 주소 삭제
	$(document).on("click", ".delete-address-btn", function (event) {
    event.preventDefault(); // 기본 동작 방지

    const addrSeq = $(this).data("addr-seq"); // data-addr-seq 속성에서 addr_seq 값 가져오기

    if (!addrSeq) {
        alert("주소 식별자가 유효하지 않습니다.");
        return;
    }
    
    if (confirm("정말로 이 주소를 삭제하시겠습니까?")) {
        $.ajax({
            url: `${path}/address/delete`, // 서버의 삭제 엔드포인트
            type: "POST",
            data: { addrSeq: addrSeq },
            success: function (response) {
                if (response && response.status === "success") {
                    alert(response.message);
                    location.reload(); // 페이지 새로고침
                } else {
                    alert(response?.message || "삭제 중 오류가 발생했습니다.");
                }
            },
            error: function (xhr, status, error) {
                console.error("Error:", error);
                alert("주소 삭제 중 오류가 발생했습니다.");
            }
        });
    }
});
	
	
	// 우편 번호 및 주소값 조회
		function findPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							var addr = ''; // 주소 변수
							var extraAddr = ''; // 참고항목 변수

							//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
							if (data.userSelectedType === 'R') {
								addr = data.roadAddress;
							} else {
								addr = data.jibunAddress;
							}

							// 참고항목 조합
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							if (data.userSelectedType === 'R') {
								if (data.bname !== ' '
										&& /[동|로|가]$/g.test(data.bname)) {
									extraAddr += data.bname;
								}
								if (data.buildingName !== ' '
										&& data.apartment === 'Y') {
									extraAddr += (extraAddr !== ' ' ? ', '
											+ data.buildingName
											: data.buildingName);
								}
								if (extraAddr !== ' ') {
									extraAddr = ' (' + extraAddr + ')';
								}
								document.getElementById("extraAddress").value = extraAddr;
							} else {
								document.getElementById("extraAddress").value = '';
							}

							 const postcodeElem = document.getElementById("postcode");
					            if (postcodeElem) {
					                postcodeElem.value = data.zonecode;
					            }

					            const editPostcodeElem = document.getElementById("editPostcode");
					            if (editPostcodeElem) {
					                editPostcodeElem.value = data.zonecode;
					            }

					            const addressElem = document.getElementById("address");
					            if (addressElem) {
					                addressElem.value = addr;
					            }

					            const editAddressElem = document.getElementById("editAddress");
					            if (editAddressElem) {
					                editAddressElem.value = addr;
					            }

					            const detailAddressElem = document.getElementById("detailAddress");
					            if (detailAddressElem) {
					                detailAddressElem.focus();
					            }
							
						}
					}).open();
		}
	</script>
</body>
</html>
