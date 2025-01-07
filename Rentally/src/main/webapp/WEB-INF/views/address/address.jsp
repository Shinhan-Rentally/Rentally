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
<%@ include file="saveAddressModal.jsp" %>
<!-- star style -->
    <c:set var="page" value="address" />
</head>

<body data-path="${path}">
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
							<h2 class="mb-0">주소지</h2>
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
	<script src="${path}/resources/js/address.js"></script>
	<!-- 카카오 주소 API -->
	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

</body>
</html>
