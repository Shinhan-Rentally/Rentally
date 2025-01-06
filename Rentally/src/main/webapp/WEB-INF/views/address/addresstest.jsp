<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path"  value="${pageContext.servletContext.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../common/headMeta.jsp"%>
<title>주소 - Rentally</title>
<%@ include file="../common/headLinks.jsp"%>
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
																onclick="setDefault(${address.addr_seq}); return false;">기본 주소로 설정하기 </a>
														</c:otherwise>
													</c:choose>
													<br>
														<a href="#" class="text-inherit">수정</a>
														<a href="#" class="text-danger ms-3"
															data-bs-toggle="modal" data-bs-target="#deleteModal">삭제</a>
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

	<!-- Modal -->
	<div class="modal fade" id="deleteModal" tabindex="-1"
		aria-labelledby="deleteModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<!-- modal content -->
			<div class="modal-content">
				<!-- modal header -->
				<div class="modal-header">
					<h5 class="modal-title" id="deleteModalLabel">Delete address</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<!-- modal body -->
				<div class="modal-body">
					<h6>Are you sure you want to delete this address?</h6>
					<p class="mb-6">
						Jitu Chauhan <br /> 4450 North Avenue Oakland, <br /> Nebraska,
						United States, <br /> 402-776-1106
					</p>
				</div>
				<!-- modal footer -->
				<div class="modal-footer">
					<!-- btn -->
					<button type="button" class="btn btn-outline-gray-400"
						data-bs-dismiss="modal">Cancel</button>
					<button type="button" class="btn btn-danger">Delete</button>
				</div>
			</div>
		</div>
	</div>
	<!-- Modal -->
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
							<h5 class="mb-1" id="addAddressModalLabel">New Shipping
								Address</h5>
							<p class="small mb-0">Add new shipping address for your order
								delivery.</p>
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
							<input type="text" class="form-control" placeholder="First name"
								aria-label="First name" required="" />
						</div>
						<!-- col -->
						<div class="col-12">
							<!-- input -->
							<input type="text" class="form-control" placeholder="Last name"
								aria-label="Last name" required="" />
						</div>
						<!-- col -->
						<div class="col-12">
							<!-- input -->
							<input type="text" class="form-control"
								placeholder="Address Line 1" />
						</div>
						<!-- col -->
						<div class="col-12">
							<!-- input -->
							<input type="text" class="form-control"
								placeholder="Address Line 2" />
						</div>
						<!-- col -->
						<div class="col-12">
							<!-- input -->
							<input type="text" class="form-control" placeholder="City" />
						</div>
						<!-- col -->
						<div class="col-12">
							<!-- form select -->
							<select class="form-select">
								<option selected="">India</option>
								<option value="1">UK</option>
								<option value="2">USA</option>
								<option value="3">UAE</option>
							</select>
						</div>
						<!-- col -->
						<div class="col-12">
							<!-- form select -->
							<select class="form-select">
								<option selected="">Gujarat</option>
								<option value="1">Northern Ireland</option>
								<option value="2">Alaska</option>
								<option value="3">Abu Dhabi</option>
							</select>
						</div>
						<!-- col -->
						<div class="col-12">
							<!-- input -->
							<input type="text" class="form-control" placeholder="Zip Code" />
						</div>
						<!-- col -->
						<div class="col-12">
							<!-- input -->
							<input type="text" class="form-control"
								placeholder="Business Name" />
						</div>
						<!-- col -->
						<div class="col-12">
							<!-- form check -->
							<div class="form-check">
								<input class="form-check-input" type="checkbox" value=""
									id="flexCheckDefault" /> <label class="form-check-label"
									for="flexCheckDefault">Set as Default</label>
							</div>
						</div>
						<!-- col -->
						<div class="col-12 text-end">
							<button type="button" class="btn btn-outline-primary"
								data-bs-dismiss="modal">Cancel</button>
							<button class="btn btn-primary" type="button">Save
								Address</button>
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
	
	<script>
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
	</script>
</body>
</html>
