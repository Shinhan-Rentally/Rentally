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
<%@ include file="updateAddressModal.jsp" %>
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
