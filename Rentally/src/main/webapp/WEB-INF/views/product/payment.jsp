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
								<h1 class="fw-bold mb-0">Checkout</h1>
								<p class="mb-0">
									Already have an account? Click here to
									<a href="#!">Sign in</a>
									.
								</p>
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
											Add delivery address
										</a>
										<!-- btn -->
										<a href="#" class="btn btn-outline-primary btn-sm" data-bs-toggle="modal" data-bs-target="#addAddressModal">Add a new address</a>
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
															<label class="form-check-label text-dark" for="homeRadio">Home</label>
														</div>
														<!-- address -->
														<address>
															<strong>Jitu Chauhan</strong>
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
															<label class="form-check-label text-dark" for="officeRadio">Office</label>
														</div>
														<address>
															<strong>Nitu Chauhan</strong>
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
									<a href="#" class="text-inherit collapsed h5" data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo">
										<i class="feather-icon icon-clock me-2 text-muted"></i>
										Delivery time
									</a>
									<!-- collapse -->
									<div id="flush-collapseTwo" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
										<!-- nav -->
										<ul class="nav nav-pills nav-pills-light mb-3 nav-fill mt-5" id="pills-tab" role="tablist">
											<li class="nav-item" role="presentation">
												<!-- button -->
												<button
													class="nav-link active"
													id="pills-today-tab"
													data-bs-toggle="pill"
													data-bs-target="#pills-today"
													type="button"
													role="tab"
													aria-controls="pills-today"
													aria-selected="true"
												>
													Today
													<br />
													<small>Oct 3</small>
												</button>
											</li>
											<li class="nav-item" role="presentation">
												<!-- button -->
												<button
													class="nav-link"
													id="pills-monday-tab"
													data-bs-toggle="pill"
													data-bs-target="#pills-monday"
													type="button"
													role="tab"
													aria-controls="pills-monday"
													aria-selected="false"
												>
													Mon
													<br />
													<small>Oct 4</small>
												</button>
											</li>
											<li class="nav-item" role="presentation">
												<!-- button -->
												<button class="nav-link" id="pills-Tue-tab" data-bs-toggle="pill" data-bs-target="#pills-Tue" type="button" role="tab" aria-controls="pills-Tue" aria-selected="false">
													Tue
													<br />
													<small>Oct 5</small>
												</button>
											</li>
											<li class="nav-item" role="presentation">
												<!-- button -->
												<button class="nav-link" id="pills-Wed-tab" data-bs-toggle="pill" data-bs-target="#pills-Wed" type="button" role="tab" aria-controls="pills-Wed" aria-selected="false">
													Wed
													<br />
													<small>Oct 6</small>
												</button>
											</li>
											<li class="nav-item" role="presentation">
												<!-- button -->
												<button class="nav-link" id="pills-Thu-tab" data-bs-toggle="pill" data-bs-target="#pills-Thu" type="button" role="tab" aria-controls="pills-Thu" aria-selected="false">
													Thu
													<br />
													<small>Oct 7</small>
												</button>
											</li>
											<li class="nav-item" role="presentation">
												<!-- button -->
												<button class="nav-link" id="pills-Fri-tab" data-bs-toggle="pill" data-bs-target="#pills-Fri" type="button" role="tab" aria-controls="pills-Fri" aria-selected="false">
													Fri
													<br />
													<small>Oct 8</small>
												</button>
											</li>
											<li class="nav-item" role="presentation">
												<!-- button -->
												<button class="nav-link" id="pills-Sat-tab" data-bs-toggle="pill" data-bs-target="#pills-Sat" type="button" role="tab" aria-controls="pills-Sat" aria-selected="false">
													Sat
													<br />
													<small>Oct 9</small>
												</button>
											</li>
										</ul>
										<!-- tab content -->
										<div class="tab-content" id="pills-tabContent">
											<!-- tab pane -->
											<div class="tab-pane fade show active" id="pills-today" role="tabpanel" aria-labelledby="pills-today-tab" tabindex="0">
												<!-- list group -->
												<ul class="list-group list-group-flush mt-4">
													<!-- list group item -->
													<li class="list-group-item d-flex justify-content-between align-items-center px-0 py-3">
														<!-- col -->
														<div class="col-4">
															<div class="form-check">
																<!-- form check input -->
																<input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1" />
																<!-- label -->
																<label class="form-check-label" for="flexRadioDefault1">
																	<span>Within 2 Hours</span>
																</label>
															</div>
														</div>

														<!-- price -->
														<div class="col-3 text-center">$3.99</div>
														<!-- badge -->
														<div class="col-3 text-center"><span class="badge bg-danger">Paid</span></div>
														<!-- col -->
														<div class="col-2 text-end"><a href="#" class="btn btn-outline-gray-400 btn-sm text-muted">Choose</a></div>
													</li>
													<!-- list group item -->
													<li class="list-group-item d-flex justify-content-between align-items-center px-0 py-3">
														<!-- col -->
														<div class="col-4">
															<div class="form-check">
																<!-- form check input -->
																<input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault2" />
																<!-- label -->
																<label class="form-check-label" for="flexRadioDefault2">
																	<span>Within 3 Hours</span>
																</label>
															</div>
														</div>
														<!-- price -->
														<div class="col-3 text-center">$3.99</div>
														<div class="col-3 text-center"><span class="badge bg-danger">Paid</span></div>
														<!-- col -->
														<div class="col-2 text-end"><a href="#" class="btn btn-outline-gray-400 btn-sm text-muted">Choose</a></div>
													</li>
													<!-- list group item -->
													<li class="list-group-item d-flex justify-content-between align-items-center px-0 py-3">
														<!-- col -->
														<div class="col-4">
															<div class="form-check">
																<!-- form check input -->
																<input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault3" />
																<!-- label -->
																<label class="form-check-label" for="flexRadioDefault3">
																	<span>1pm - 2pm</span>
																</label>
															</div>
														</div>
														<!-- price -->
														<div class="col-3 text-center">$0.00</div>
														<div class="col-3 text-center"><span class="badge bg-success">Free</span></div>
														<!-- col -->
														<div class="col-2 text-end"><a href="#" class="btn btn-outline-gray-400 btn-sm text-muted">Choose</a></div>
													</li>
													<!-- list group item -->
													<li class="list-group-item d-flex justify-content-between align-items-center px-0 py-3">
														<!-- col -->
														<div class="col-4">
															<div class="form-check">
																<!-- form check input -->
																<input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault4" />
																<!-- label -->
																<label class="form-check-label" for="flexRadioDefault4">
																	<span>2pm - 3pm</span>
																</label>
															</div>
														</div>
														<!-- price -->
														<div class="col-3 text-center">$3.99</div>
														<!-- badge -->
														<div class="col-3 text-center"><span class="badge bg-danger">Paid</span></div>
														<!-- col -->
														<div class="col-2 text-end"><a href="#" class="btn btn-outline-gray-400 btn-sm text-muted">Choose</a></div>
													</li>
													<!-- list group item -->
													<li class="list-group-item d-flex justify-content-between align-items-center px-0 py-3">
														<!-- col -->
														<div class="col-4">
															<div class="form-check">
																<!-- form check input -->
																<input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault5" />
																<!-- label -->
																<label class="form-check-label" for="flexRadioDefault5">
																	<span>3pm - 4pm</span>
																</label>
															</div>
														</div>
														<!-- price -->
														<div class="col-3 text-center">$3.99</div>
														<!-- badge -->
														<div class="col-3 text-center"><span class="badge bg-danger">Paid</span></div>
														<!-- col -->
														<div class="col-2 text-end"><a href="#" class="btn btn-outline-gray-400 btn-sm text-muted">Choose</a></div>
													</li>
												</ul>
											</div>
											<div class="tab-pane fade" id="pills-monday" role="tabpanel" aria-labelledby="pills-monday-tab" tabindex="0">
												<ul class="list-group list-group-flush mt-4">
													<!-- list group item -->
													<li class="list-group-item d-flex justify-content-between align-items-center px-0 py-3">
														<!-- col -->
														<div class="col-4">
															<div class="form-check">
																<!-- form check input -->
																<input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault6" />
																<!-- label -->
																<label class="form-check-label" for="flexRadioDefault6">
																	<span>Within 2 Hours</span>
																</label>
															</div>
														</div>

														<!-- price -->
														<div class="col-3 text-center">$3.99</div>
														<div class="col-3 text-center"><span class="badge bg-danger">Paid</span></div>
														<!-- col -->
														<div class="col-2 text-end"><a href="#" class="btn btn-outline-gray-400 btn-sm text-muted">Choose</a></div>
													</li>
													<!-- list group item -->
													<li class="list-group-item d-flex justify-content-between align-items-center px-0 py-3">
														<!-- col -->
														<div class="col-4">
															<div class="form-check">
																<!-- form check input -->
																<input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault7" />
																<!-- label -->
																<label class="form-check-label" for="flexRadioDefault7">
																	<span>Within 2 Hours</span>
																</label>
															</div>
														</div>
														<!-- price -->
														<div class="col-3 text-center">$3.99</div>
														<div class="col-3 text-center"><span class="badge bg-danger">Paid</span></div>
														<!-- col -->
														<div class="col-2 text-end"><a href="#" class="btn btn-outline-gray-400 btn-sm text-muted">Choose</a></div>
													</li>
													<!-- list group item -->
													<li class="list-group-item d-flex justify-content-between align-items-center px-0 py-3">
														<!-- col -->
														<div class="col-4">
															<div class="form-check">
																<!-- form check input -->
																<input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault8" />
																<!-- label -->
																<label class="form-check-label" for="flexRadioDefault8">
																	<span>1pm - 2pm</span>
																</label>
															</div>
														</div>
														<!-- price -->
														<div class="col-3 text-center">$0.00</div>
														<div class="col-3 text-center"><span class="badge bg-success">Free</span></div>
														<!-- col -->
														<div class="col-2 text-end"><a href="#" class="btn btn-outline-gray-400 btn-sm text-muted">Choose</a></div>
													</li>
													<!-- list group item -->
													<li class="list-group-item d-flex justify-content-between align-items-center px-0 py-3">
														<!-- col -->
														<div class="col-4">
															<div class="form-check">
																<!-- form check input -->
																<input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault9" />
																<!-- label -->
																<label class="form-check-label" for="flexRadioDefault9">
																	<span>2pm - 3pm</span>
																</label>
															</div>
														</div>
														<!-- price -->
														<div class="col-3 text-center">$3.99</div>
														<div class="col-3 text-center"><span class="badge bg-danger">Paid</span></div>
														<!-- col -->
														<div class="col-2 text-end"><a href="#" class="btn btn-outline-gray-400 btn-sm text-muted">Choose</a></div>
													</li>
													<!-- list group item -->
													<li class="list-group-item d-flex justify-content-between align-items-center px-0 py-3">
														<!-- col -->
														<div class="col-4">
															<div class="form-check">
																<!-- form check input -->
																<input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault10" />
																<!-- label -->
																<label class="form-check-label" for="flexRadioDefault10">
																	<span>3pm - 4pm</span>
																</label>
															</div>
														</div>
														<!-- price -->
														<div class="col-3 text-center">$3.99</div>
														<div class="col-3 text-center"><span class="badge bg-danger">Paid</span></div>
														<!-- col -->
														<div class="col-2 text-end"><a href="#" class="btn btn-outline-gray-400 btn-sm text-muted">Choose</a></div>
													</li>
												</ul>
											</div>
											<div class="tab-pane fade" id="pills-Tue" role="tabpanel" aria-labelledby="pills-Tue-tab" tabindex="0">
												<ul class="list-group list-group-flush mt-4">
													<!-- list group item -->
													<li class="list-group-item d-flex justify-content-between align-items-center px-0 py-3">
														<!-- col -->
														<div class="col-4">
															<div class="form-check">
																<!-- form check input -->
																<input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault11" />
																<!-- label -->
																<label class="form-check-label" for="flexRadioDefault11">
																	<span>Within 2 Hours</span>
																</label>
															</div>
														</div>

														<!-- price -->
														<div class="col-3 text-center">$3.99</div>
														<div class="col-3 text-center"><span class="badge bg-danger">Paid</span></div>
														<!-- col -->
														<div class="col-2 text-end"><a href="#" class="btn btn-outline-gray-400 btn-sm text-muted">Choose</a></div>
													</li>
													<!-- list group item -->
													<li class="list-group-item d-flex justify-content-between align-items-center px-0 py-3">
														<!-- col -->
														<div class="col-4">
															<div class="form-check">
																<!-- form check input -->
																<input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault12" />
																<!-- label -->
																<label class="form-check-label" for="flexRadioDefault12">
																	<span>Within 2 Hours</span>
																</label>
															</div>
														</div>
														<!-- price -->
														<div class="col-3 text-center">$3.99</div>
														<div class="col-3 text-center"><span class="badge bg-danger">Paid</span></div>
														<!-- col -->
														<div class="col-2 text-end"><a href="#" class="btn btn-outline-gray-400 btn-sm text-muted">Choose</a></div>
													</li>
													<!-- list group item -->
													<li class="list-group-item d-flex justify-content-between align-items-center px-0 py-3">
														<!-- col -->
														<div class="col-4">
															<div class="form-check">
																<!-- form check input -->
																<input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault13" />
																<!-- label -->
																<label class="form-check-label" for="flexRadioDefault13">
																	<span>1pm - 2pm</span>
																</label>
															</div>
														</div>
														<!-- price -->
														<div class="col-3 text-center">$0.00</div>
														<div class="col-3 text-center"><span class="badge bg-success">Free</span></div>
														<!-- col -->
														<div class="col-2 text-end"><a href="#" class="btn btn-outline-gray-400 btn-sm text-muted">Choose</a></div>
													</li>
													<!-- list group item -->
													<li class="list-group-item d-flex justify-content-between align-items-center px-0 py-3">
														<!-- col -->
														<div class="col-4">
															<div class="form-check">
																<!-- form check input -->
																<input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault14" />
																<!-- label -->
																<label class="form-check-label" for="flexRadioDefault14">
																	<span>2pm - 3pm</span>
																</label>
															</div>
														</div>
														<!-- price -->
														<div class="col-3 text-center">$3.99</div>
														<div class="col-3 text-center"><span class="badge bg-danger">Paid</span></div>
														<!-- col -->
														<div class="col-2 text-end"><a href="#" class="btn btn-outline-gray-400 btn-sm text-muted">Choose</a></div>
													</li>
													<!-- list group item -->
													<li class="list-group-item d-flex justify-content-between align-items-center px-0 py-3">
														<!-- col -->
														<div class="col-4">
															<div class="form-check">
																<!-- form check input -->
																<input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault15" />
																<!-- label -->
																<label class="form-check-label" for="flexRadioDefault15">
																	<span>3pm - 4pm</span>
																</label>
															</div>
														</div>
														<!-- price -->
														<div class="col-3 text-center">$3.99</div>
														<div class="col-3 text-center"><span class="badge bg-danger">Paid</span></div>
														<!-- col -->
														<div class="col-2 text-end"><a href="#" class="btn btn-outline-gray-400 btn-sm text-muted">Choose</a></div>
													</li>
												</ul>
											</div>
											<div class="tab-pane fade" id="pills-Wed" role="tabpanel" aria-labelledby="pills-Wed-tab" tabindex="0">
												<ul class="list-group list-group-flush mt-4">
													<!-- list group item -->
													<li class="list-group-item d-flex justify-content-between align-items-center px-0 py-3">
														<!-- col -->
														<div class="col-4">
															<div class="form-check">
																<!-- form check input -->
																<input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault16" />
																<!-- label -->
																<label class="form-check-label" for="flexRadioDefault16">
																	<span>Within 2 Hours</span>
																</label>
															</div>
														</div>

														<!-- price -->
														<div class="col-3 text-center">$3.99</div>
														<div class="col-3 text-center"><span class="badge bg-danger">Paid</span></div>
														<!-- col -->
														<div class="col-2 text-end"><a href="#" class="btn btn-outline-gray-400 btn-sm text-muted">Choose</a></div>
													</li>
													<!-- list group item -->
													<li class="list-group-item d-flex justify-content-between align-items-center px-0 py-3">
														<!-- col -->
														<div class="col-4">
															<div class="form-check">
																<!-- form check input -->
																<input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault17" />
																<!-- label -->
																<label class="form-check-label" for="flexRadioDefault17">
																	<span>Within 2 Hours</span>
																</label>
															</div>
														</div>
														<!-- price -->
														<div class="col-3 text-center">$3.99</div>
														<div class="col-3 text-center"><span class="badge bg-danger">Paid</span></div>
														<!-- col -->
														<div class="col-2 text-end"><a href="#" class="btn btn-outline-gray-400 btn-sm text-muted">Choose</a></div>
													</li>
													<!-- list group item -->
													<li class="list-group-item d-flex justify-content-between align-items-center px-0 py-3">
														<!-- col -->
														<div class="col-4">
															<div class="form-check">
																<!-- form check input -->
																<input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault18" />
																<!-- label -->
																<label class="form-check-label" for="flexRadioDefault18">
																	<span>1pm - 2pm</span>
																</label>
															</div>
														</div>
														<!-- price -->
														<div class="col-3 text-center">$0.00</div>
														<div class="col-3 text-center"><span class="badge bg-success">Free</span></div>
														<!-- col -->
														<div class="col-2 text-end"><a href="#" class="btn btn-outline-gray-400 btn-sm text-muted">Choose</a></div>
													</li>
													<!-- list group item -->
													<li class="list-group-item d-flex justify-content-between align-items-center px-0 py-3">
														<!-- col -->
														<div class="col-4">
															<div class="form-check">
																<!-- form check input -->
																<input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault19" />
																<!-- label -->
																<label class="form-check-label" for="flexRadioDefault19">
																	<span>2pm - 3pm</span>
																</label>
															</div>
														</div>
														<!-- price -->
														<div class="col-3 text-center">$3.99</div>
														<div class="col-3 text-center"><span class="badge bg-danger">Paid</span></div>
														<!-- col -->
														<div class="col-2 text-end"><a href="#" class="btn btn-outline-gray-400 btn-sm text-muted">Choose</a></div>
													</li>
													<!-- list group item -->
													<li class="list-group-item d-flex justify-content-between align-items-center px-0 py-3">
														<!-- col -->
														<div class="col-4">
															<div class="form-check">
																<!-- form check input -->
																<input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault20" />
																<!-- label -->
																<label class="form-check-label" for="flexRadioDefault20">
																	<span>3pm - 4pm</span>
																</label>
															</div>
														</div>
														<!-- price -->
														<div class="col-3 text-center">$3.99</div>
														<div class="col-3 text-center"><span class="badge bg-danger">Paid</span></div>
														<!-- col -->
														<div class="col-2 text-end"><a href="#" class="btn btn-outline-gray-400 btn-sm text-muted">Choose</a></div>
													</li>
												</ul>
											</div>
											<div class="tab-pane fade" id="pills-Thu" role="tabpanel" aria-labelledby="pills-Thu-tab" tabindex="0">
												<ul class="list-group list-group-flush mt-4">
													<!-- list group item -->
													<li class="list-group-item d-flex justify-content-between align-items-center px-0 py-3">
														<!-- col -->
														<div class="col-4">
															<div class="form-check">
																<!-- form check input -->
																<input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault21" />
																<!-- label -->
																<label class="form-check-label" for="flexRadioDefault21">
																	<span>Within 2 Hours</span>
																</label>
															</div>
														</div>

														<!-- price -->
														<div class="col-3 text-center">$3.99</div>
														<div class="col-3 text-center"><span class="badge bg-danger">Paid</span></div>
														<!-- col -->
														<div class="col-2 text-end"><a href="#" class="btn btn-outline-gray-400 btn-sm text-muted">Choose</a></div>
													</li>
													<!-- list group item -->
													<li class="list-group-item d-flex justify-content-between align-items-center px-0 py-3">
														<!-- col -->
														<div class="col-4">
															<div class="form-check">
																<!-- form check input -->
																<input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault22" />
																<!-- label -->
																<label class="form-check-label" for="flexRadioDefault22">
																	<span>Within 2 Hours</span>
																</label>
															</div>
														</div>
														<!-- price -->
														<div class="col-3 text-center">$3.99</div>
														<!-- badge -->
														<div class="col-3 text-center"><span class="badge bg-danger">Paid</span></div>
														<!-- col -->
														<div class="col-2 text-end"><a href="#" class="btn btn-outline-gray-400 btn-sm text-muted">Choose</a></div>
													</li>
													<!-- list group item -->
													<li class="list-group-item d-flex justify-content-between align-items-center px-0 py-3">
														<!-- col -->
														<div class="col-4">
															<div class="form-check">
																<!-- form check input -->
																<input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault23" />
																<!-- label -->
																<label class="form-check-label" for="flexRadioDefault23">
																	<span>1pm - 2pm</span>
																</label>
															</div>
														</div>
														<!-- price -->
														<div class="col-3 text-center">$0.00</div>
														<div class="col-3 text-center"><span class="badge bg-success">Free</span></div>
														<!-- col -->
														<div class="col-2 text-end"><a href="#" class="btn btn-outline-gray-400 btn-sm text-muted">Choose</a></div>
													</li>
													<!-- list group item -->
													<li class="list-group-item d-flex justify-content-between align-items-center px-0 py-3">
														<!-- col -->
														<div class="col-4">
															<div class="form-check">
																<!-- form check input -->
																<input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault24" />
																<!-- label -->
																<label class="form-check-label" for="flexRadioDefault24">
																	<span>2pm - 3pm</span>
																</label>
															</div>
														</div>
														<!-- price -->
														<div class="col-3 text-center">$3.99</div>
														<div class="col-3 text-center"><span class="badge bg-danger">Paid</span></div>
														<!-- col -->
														<div class="col-2 text-end"><a href="#" class="btn btn-outline-gray-400 btn-sm text-muted">Choose</a></div>
													</li>
													<!-- list group item -->
													<li class="list-group-item d-flex justify-content-between align-items-center px-0 py-3">
														<!-- col -->
														<div class="col-4">
															<div class="form-check">
																<!-- form check input -->
																<input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault25" />
																<!-- label -->
																<label class="form-check-label" for="flexRadioDefault25">
																	<span>3pm - 4pm</span>
																</label>
															</div>
														</div>
														<!-- price -->
														<div class="col-3 text-center">$3.99</div>
														<div class="col-3 text-center"><span class="badge bg-danger">Paid</span></div>
														<!-- col -->
														<div class="col-2 text-end"><a href="#" class="btn btn-outline-gray-400 btn-sm text-muted">Choose</a></div>
													</li>
												</ul>
											</div>
											<div class="tab-pane fade" id="pills-Fri" role="tabpanel" aria-labelledby="pills-Fri-tab" tabindex="0">
												<ul class="list-group list-group-flush mt-4">
													<!-- list group item -->
													<li class="list-group-item d-flex justify-content-between align-items-center px-0 py-3">
														<!-- col -->
														<div class="col-4">
															<div class="form-check">
																<!-- form check input -->
																<input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault26" />
																<!-- label -->
																<label class="form-check-label" for="flexRadioDefault26">
																	<span>Within 2 Hours</span>
																</label>
															</div>
														</div>

														<!-- price -->
														<div class="col-3 text-center">$3.99</div>
														<div class="col-3 text-center"><span class="badge bg-danger">Paid</span></div>
														<!-- col -->
														<div class="col-2 text-end"><a href="#" class="btn btn-outline-gray-400 btn-sm text-muted">Choose</a></div>
													</li>
													<!-- list group item -->
													<li class="list-group-item d-flex justify-content-between align-items-center px-0 py-3">
														<!-- col -->
														<div class="col-4">
															<div class="form-check">
																<!-- form check input -->
																<input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault27" />
																<!-- label -->
																<label class="form-check-label" for="flexRadioDefault27">
																	<span>Within 2 Hours</span>
																</label>
															</div>
														</div>
														<!-- price -->
														<div class="col-3 text-center">$3.99</div>
														<div class="col-3 text-center"><span class="badge bg-danger">Paid</span></div>
														<!-- col -->
														<div class="col-2 text-end"><a href="#" class="btn btn-outline-gray-400 btn-sm text-muted">Choose</a></div>
													</li>
													<!-- list group item -->
													<li class="list-group-item d-flex justify-content-between align-items-center px-0 py-3">
														<!-- col -->
														<div class="col-4">
															<div class="form-check">
																<!-- form check input -->
																<input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault28" />
																<!-- label -->
																<label class="form-check-label" for="flexRadioDefault28">
																	<span>1pm - 2pm</span>
																</label>
															</div>
														</div>
														<!-- price -->
														<div class="col-3 text-center">$0.00</div>
														<div class="col-3 text-center"><span class="badge bg-success">Free</span></div>
														<!-- col -->
														<div class="col-2 text-end"><a href="#" class="btn btn-outline-gray-400 btn-sm text-muted">Choose</a></div>
													</li>
													<!-- list group item -->
													<li class="list-group-item d-flex justify-content-between align-items-center px-0 py-3">
														<!-- col -->
														<div class="col-4">
															<div class="form-check">
																<!-- form check input -->
																<input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault29" />
																<!-- label -->
																<label class="form-check-label" for="flexRadioDefault29">
																	<span>2pm - 3pm</span>
																</label>
															</div>
														</div>
														<!-- price -->
														<div class="col-3 text-center">$3.99</div>
														<div class="col-3 text-center"><span class="badge bg-danger">Paid</span></div>
														<!-- col -->
														<div class="col-2 text-end"><a href="#" class="btn btn-outline-gray-400 btn-sm text-muted">Choose</a></div>
													</li>
													<!-- list group item -->
													<li class="list-group-item d-flex justify-content-between align-items-center px-0 py-3">
														<!-- col -->
														<div class="col-4">
															<div class="form-check">
																<!-- form check input -->
																<input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault30" />
																<!-- label -->
																<label class="form-check-label" for="flexRadioDefault30">
																	<span>3pm - 4pm</span>
																</label>
															</div>
														</div>
														<!-- price -->
														<div class="col-3 text-center">$3.99</div>
														<div class="col-3 text-center"><span class="badge bg-danger">Paid</span></div>
														<!-- col -->
														<div class="col-2 text-end"><a href="#" class="btn btn-outline-gray-400 btn-sm text-muted">Choose</a></div>
													</li>
												</ul>
											</div>
											<div class="tab-pane fade" id="pills-Sat" role="tabpanel" aria-labelledby="pills-Sat-tab" tabindex="0">
												<ul class="list-group list-group-flush mt-4">
													<!-- list group item -->
													<li class="list-group-item d-flex justify-content-between align-items-center px-0 py-3">
														<!-- col -->
														<div class="col-4">
															<div class="form-check">
																<!-- form check input -->
																<input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault31" />
																<!-- label -->
																<label class="form-check-label" for="flexRadioDefault31">
																	<span>Within 2 Hours</span>
																</label>
															</div>
														</div>

														<!-- price -->
														<div class="col-3 text-center">$3.99</div>
														<div class="col-3 text-center"><span class="badge bg-danger">Paid</span></div>
														<!-- col -->
														<div class="col-2 text-end"><a href="#" class="btn btn-outline-gray-400 btn-sm text-muted">Choose</a></div>
													</li>
													<!-- list group item -->
													<li class="list-group-item d-flex justify-content-between align-items-center px-0 py-3">
														<!-- col -->
														<div class="col-4">
															<div class="form-check">
																<!-- form check input -->
																<input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault32" />
																<!-- label -->
																<label class="form-check-label" for="flexRadioDefault32">
																	<span>Within 2 Hours</span>
																</label>
															</div>
														</div>
														<!-- price -->
														<div class="col-3 text-center">$3.99</div>
														<div class="col-3 text-center"><span class="badge bg-danger">Paid</span></div>
														<!-- col -->
														<div class="col-2 text-end"><a href="#" class="btn btn-outline-gray-400 btn-sm text-muted">Choose</a></div>
													</li>
													<!-- list group item -->
													<li class="list-group-item d-flex justify-content-between align-items-center px-0 py-3">
														<!-- col -->
														<div class="col-4">
															<div class="form-check">
																<!-- form check input -->
																<input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault33" />
																<!-- label -->
																<label class="form-check-label" for="flexRadioDefault33">
																	<span>1pm - 2pm</span>
																</label>
															</div>
														</div>
														<!-- price -->
														<div class="col-3 text-center">$0.00</div>
														<div class="col-3 text-center"><span class="badge bg-success">Free</span></div>
														<!-- col -->
														<div class="col-2 text-end"><a href="#" class="btn btn-outline-gray-400 btn-sm text-muted">Choose</a></div>
													</li>
													<!-- list group item -->
													<li class="list-group-item d-flex justify-content-between align-items-center px-0 py-3">
														<!-- col -->
														<div class="col-4">
															<div class="form-check">
																<!-- form check input -->
																<input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault34" />
																<!-- label -->
																<label class="form-check-label" for="flexRadioDefault34">
																	<span>2pm - 3pm</span>
																</label>
															</div>
														</div>
														<!-- price -->
														<div class="col-3 text-center">$3.99</div>
														<div class="col-3 text-center"><span class="badge bg-danger">Paid</span></div>
														<!-- col -->
														<div class="col-2 text-end"><a href="#" class="btn btn-outline-gray-400 btn-sm text-muted">Choose</a></div>
													</li>
													<!-- list group item -->
													<li class="list-group-item d-flex justify-content-between align-items-center px-0 py-3">
														<!-- col -->
														<div class="col-4">
															<div class="form-check">
																<!-- form check input -->
																<input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault35" />
																<!-- label -->
																<label class="form-check-label" for="flexRadioDefault35">
																	<span>3pm - 4pm</span>
																</label>
															</div>
														</div>
														<!-- price -->
														<div class="col-3 text-center">$3.99</div>
														<div class="col-3 text-center"><span class="badge bg-danger">Paid</span></div>
														<!-- col -->
														<div class="col-2 text-end"><a href="#" class="btn btn-outline-gray-400 btn-sm text-muted">Choose</a></div>
													</li>
												</ul>
											</div>
										</div>
										<div class="mt-5 d-flex justify-content-end">
											<a href="#" class="btn btn-outline-gray-400 text-muted" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
												Prev
											</a>
											<a href="#" class="btn btn-primary ms-2" data-bs-toggle="collapse" data-bs-target="#flush-collapseThree" aria-expanded="false" aria-controls="flush-collapseThree">Next</a>
										</div>
									</div>
								</div>
								<!-- accordion item -->
								<div class="accordion-item py-4">
									<a href="#" class="text-inherit h5" data-bs-toggle="collapse" data-bs-target="#flush-collapseThree" aria-expanded="false" aria-controls="flush-collapseThree">
										<i class="feather-icon icon-shopping-bag me-2 text-muted"></i>
										Delivery instructions
										<!-- collapse -->
									</a>
									<div id="flush-collapseThree" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
										<div class="mt-5">
											<label for="DeliveryInstructions" class="form-label sr-only">Delivery instructions</label>
											<textarea class="form-control" id="DeliveryInstructions" rows="3" placeholder="Write delivery instructions "></textarea>
											<p class="form-text">Add instructions for how you want your order shopped and/or delivered</p>
											<div class="mt-5 d-flex justify-content-end">
												<a href="#" class="btn btn-outline-gray-400 text-muted" data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo">
													Prev
												</a>
												<a href="#" class="btn btn-primary ms-2" data-bs-toggle="collapse" data-bs-target="#flush-collapseFour" aria-expanded="false" aria-controls="flush-collapseFour">Next</a>
											</div>
										</div>
									</div>
								</div>
								<!-- accordion item -->
								<div class="accordion-item py-4">
									<a href="#" class="text-inherit h5" data-bs-toggle="collapse" data-bs-target="#flush-collapseFour" aria-expanded="false" aria-controls="flush-collapseFour">
										<i class="feather-icon icon-credit-card me-2 text-muted"></i>
										Payment Method
										<!-- collapse -->
									</a>
									<div id="flush-collapseFour" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
										<div class="mt-5">
											<div>
												<div class="card card-bordered shadow-none mb-2">
													<!-- card body -->
													<div class="card-body p-6">
														<div class="d-flex">
															<div class="form-check">
																<!-- checkbox -->
																<input class="form-check-input" type="radio" name="flexRadioDefault" id="paypal" />
																<label class="form-check-label ms-2" for="paypal"></label>
															</div>
															<div>
																<!-- title -->
																<h5 class="mb-1 h6">Payment with Paypal</h5>
																<p class="mb-0 small">You will be redirected to PayPal website to complete your purchase securely.</p>
															</div>
														</div>
													</div>
												</div>
												<!-- card -->
												<div class="card card-bordered shadow-none mb-2">
													<!-- card body -->
													<div class="card-body p-6">
														<div class="d-flex mb-4">
															<div class="form-check">
																<!-- input -->
																<input class="form-check-input" type="radio" name="flexRadioDefault" id="creditdebitcard" />
																<label class="form-check-label ms-2" for="creditdebitcard"></label>
															</div>
															<div>
																<h5 class="mb-1 h6">Credit / Debit Card</h5>
																<p class="mb-0 small">Safe money transfer using your bank accou k account. We support Mastercard tercard, Visa, Discover and Stripe.</p>
															</div>
														</div>
														<div class="row g-2">
															<div class="col-12">
																<!-- input -->
																<div class="mb-3">
																	<label for="card-mask" class="form-label">Card Number</label>
																	<input type="text" class="form-control" id="card-mask" placeholder="xxxx-xxxx-xxxx-xxxx" required />
																</div>
															</div>
															<div class="col-md-6 col-12">
																<!-- input -->
																<div class="mb-3 mb-lg-0">
																	<label class="form-label" for="nameoncard">Name on card</label>
																	<input type="text" class="form-control" placeholder="Enter name" id="nameoncard" />
																</div>
															</div>
															<div class="col-md-3 col-12">
																<!-- input -->
																<div class="mb-3 mb-lg-0 position-relative">
																	<label class="form-label" for="expirydate">Expiry date</label>
																	<input type="text" class="form-control" id="expirydate" placeholder="MM/YY" />
																</div>
															</div>
															<div class="col-md-3 col-12">
																<!-- input -->
																<div class="mb-3 mb-lg-0">
																	<label for="digit-mask" class="form-label">
																		CVV Code
																		<i class="fe fe-help-circle ms-1" data-bs-toggle="tooltip" data-placement="top" title="A 3 - digit number, typically printed on the back of a card."></i>
																	</label>
																	<input type="password" class="form-control" name="digit-mask" id="digit-mask" placeholder="xxx" maxlength="3" inputmode="numeric" required />
																</div>
															</div>
														</div>
													</div>
												</div>
												<!-- card -->
												<div class="card card-bordered shadow-none mb-2">
													<!-- card body -->
													<div class="card-body p-6">
														<!-- check input -->
														<div class="d-flex">
															<div class="form-check">
																<input class="form-check-input" type="radio" name="flexRadioDefault" id="payoneer" />
																<label class="form-check-label ms-2" for="payoneer"></label>
															</div>
															<div>
																<!-- title -->
																<h5 class="mb-1 h6">Pay with Payoneer</h5>
																<p class="mb-0 small">You will be redirected to Payoneer website to complete your purchase securely.</p>
															</div>
														</div>
													</div>
												</div>
												<!-- card -->
												<div class="card card-bordered shadow-none">
													<div class="card-body p-6">
														<!-- check input -->
														<div class="d-flex">
															<div class="form-check">
																<input class="form-check-input" type="radio" name="flexRadioDefault" id="cashonDelivery" />
																<label class="form-check-label ms-2" for="cashonDelivery"></label>
															</div>
															<div>
																<!-- title -->
																<h5 class="mb-1 h6">Cash on Delivery</h5>
																<p class="mb-0 small">Pay with cash when your order is delivered.</p>
															</div>
														</div>
													</div>
												</div>
												<!-- Button -->
												<div class="mt-5 d-flex justify-content-end">
													<a
														href="#"
														class="btn btn-outline-gray-400 text-muted"
														data-bs-toggle="collapse"
														data-bs-target="#flush-collapseThree"
														aria-expanded="false"
														aria-controls="flush-collapseThree"
													>
														Prev
													</a>
													<a id="pay" href="#" class="btn btn-primary ms-2">Place Order</a>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="col-md-12 offset-xl-1 col-xl-4 col-lg-6">
							<div class="mt-4 mt-lg-0">
								<div class="card shadow-sm">
									<h5 class="px-6 py-4 bg-transparent mb-0">Order Details</h5>
									<ul class="list-group list-group-flush">
										<!-- list group item -->
										<li class="list-group-item px-4 py-3">
											<div class="row align-items-center">
												<div class="col-2 col-md-2">
													<img src="../assets/images/products/product-img-1.jpg" alt="Ecommerce" class="img-fluid" />
												</div>
												<div class="col-5 col-md-5">
													<h6 class="mb-0">Haldiram's Sev Bhujia</h6>
													<span><small class="text-muted">.98 / lb</small></span>
												</div>
												<div class="col-2 col-md-2 text-center text-muted">
													<span>1</span>
												</div>
												<div class="col-3 text-lg-end text-start text-md-end col-md-3">
													<span class="fw-bold">$5.00</span>
												</div>
											</div>
										</li>
										<!-- list group item -->
										<li class="list-group-item px-4 py-3">
											<div class="row align-items-center">
												<div class="col-2 col-md-2">
													<img src="../assets/images/products/product-img-2.jpg" alt="Ecommerce" class="img-fluid" />
												</div>
												<div class="col-5 col-md-5">
													<h6 class="mb-0">NutriChoice Digestive</h6>
													<span><small class="text-muted">250g</small></span>
												</div>
												<div class="col-2 col-md-2 text-center text-muted">
													<span>1</span>
												</div>
												<div class="col-3 text-lg-end text-start text-md-end col-md-3">
													<span class="fw-bold">$20.00</span>
													<div class="text-decoration-line-through text-muted small">$26.00</div>
												</div>
											</div>
										</li>
										<!-- list group item -->
										<li class="list-group-item px-4 py-3">
											<div class="row align-items-center">
												<div class="col-2 col-md-2">
													<img src="../assets/images/products/product-img-3.jpg" alt="Ecommerce" class="img-fluid" />
												</div>
												<div class="col-5 col-md-5">
													<h6 class="mb-0">Cadbury 5 Star Chocolate</h6>
													<span><small class="text-muted">1 kg</small></span>
												</div>
												<div class="col-2 col-md-2 text-center text-muted">
													<span>1</span>
												</div>
												<div class="col-3 text-lg-end text-start text-md-end col-md-3">
													<span class="fw-bold">$15.00</span>
													<div class="text-decoration-line-through text-muted small">$20.00</div>
												</div>
											</div>
										</li>
										<!-- list group item -->
										<li class="list-group-item px-4 py-3">
											<div class="row align-items-center">
												<div class="col-2 col-md-2">
													<img src="../assets/images/products/product-img-4.jpg" alt="Ecommerce" class="img-fluid" />
												</div>
												<div class="col-5 col-md-5">
													<h6 class="mb-0">Onion Flavour Potato</h6>
													<span><small class="text-muted">250g</small></span>
												</div>
												<div class="col-2 col-md-2 text-center text-muted">
													<span>1</span>
												</div>
												<div class="col-3 text-lg-end text-start text-md-end col-md-3">
													<span class="fw-bold">$15.00</span>
													<div class="text-decoration-line-through text-muted small">$20.00</div>
												</div>
											</div>
										</li>

										<!-- list group item -->
										<li class="list-group-item px-4 py-3">
											<div class="d-flex align-items-center justify-content-between mb-2">
												<div>Item Subtotal</div>
												<div class="fw-bold">$70.00</div>
											</div>
											<div class="d-flex align-items-center justify-content-between">
												<div>
													Service Fee
													<i class="feather-icon icon-info text-muted" data-bs-toggle="tooltip" title="Default tooltip"></i>
												</div>
												<div class="fw-bold">$3.00</div>
											</div>
										</li>
										<!-- list group item -->
										<li class="list-group-item px-4 py-3">
											<div class="d-flex align-items-center justify-content-between fw-bold">
												<div>Subtotal</div>
												<div>$73.00</div>
											</div>
										</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</main>

	<!-- Modal -->
	<div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="deleteModalLabel">Delete address</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<h6>Are you sure you want to delete this address?</h6>
					<p class="mb-6">
						Jitu Chauhan
						<br />

						4450 North Avenue Oakland,
						<br />

						Nebraska, United States,
						<br />

						402-776-1106
					</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-outline-gray-400" data-bs-dismiss="modal">Cancel</button>
					<button type="button" class="btn btn-danger">Delete</button>
				</div>
			</div>
		</div>
	</div>

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
 	<script src="${path}/resources/js/vendors/flatpickr.min.js"></script>
	<%-- <%@ include file="../partials/scripts.html"%> --%>
	<script src="${path}/resources/js/vendors/imask.min.js"></script>
	<script src="${path}/resources/js/vendors/inputmask.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
	<script src="https://cdn.portone.io/v2/browser-sdk.js"></script>
	
	<script>
	IMP.init("imp26414862");
	
	IMP.request_pay(
			  {
			    channelKey: "channel-key-32f7b4dd-ec84-4363-abb9-a8c3b5d5a071",
			    pay_method: "card", // 'card'만 지원됩니다.
			    merchant_uid: "order_monthly_0003", // 상점에서 관리하는 주문 번호
			    name: "최초인증결제",
			    amount: 100, // 결제창에 표시될 금액. 실제 승인이 이뤄지지는 않습니다.
			    customer_uid: "2", // 필수 입력.
			    buyer_email: "test@portone.io",
			    buyer_name: "포트원",
			    buyer_tel: "02-1234-1234",
			  },
			  function (rsp) {
			    if (rsp.success) {
			      alert("빌링키 발급 성공");
			      
				    const paymentData = {
			                billingKey: rsp.customer_uid,  // Or whichever field contains the billing key
			                merchant_uid: rsp.merchant_uid,
			                amount: 100 // Example amount, replace with actual payment amount
			            };

				    console.log(paymentData);
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
			                    alert("Payment processed successfully");
			                } else {
			                    alert("Payment failed");
			                }
			            })
			            .catch(error => {
			                console.error('Error:', error);
			                alert('An error occurred while processing the payment');
			            });
			    } else {
			      alert("빌링키 발급 실패");
			    }
			  },
			);
	
	</script>
	
	
	
	
	
	
	
<!-- 	<script>
		$("#pay").click(requestBillingKey);
		
		function requestBillingKey() {
            try {
                const issueResponse = PortOne.requestIssueBillingKey({
    			    storeId: "store-df220412-2eec-4989-8173-fdc3bfb8f541", // 고객사 storeId로 변경해주세요.
    			    channelKey: "channel-key-9dc1fb15-6f45-4b0f-8ced-8c35e312efa6", // 콘솔 결제 연동 화면에서 채널 연동 시 생성된 채널 키를 입력해주세요.
    			    billingKeyMethod: "CARD",
    			    issueId: "test-1",
    			    issueName: "빌링키 발급",
    			    customer: {
    			      fullName: "포트원",
    			      phoneNumber: "010-0000-1234",
    			      email: "test@portone.io",
    			    },
    			  });

             	// 빌링키가 제대로 발급되지 않은 경우 에러 코드가 존재합니다
                if (issueResponse.code !== undefined) {
                    return alert(issueResponse.message);
                }

                console.log("Billing Key:", issueResponse.billingKey);
                console.log("code:", issueResponse.code);
                
             	// 고객사 서버에 빌링키를 전달합니다
                $.ajax({
                    url: "http://localhost:9999/rentally/billings",
                    type: "POST",
                    contentType: "application/json",
                    data: JSON.stringify({
                        billingKey: issueResponse.billingKey,
                    }),
                    success: function(response) {
                        alert('Billing key sent successfully.');
                        console.log(response);
                    },
                    error: function(jqXHR, textStatus, errorThrown) {
                        console.error('Error:', textStatus, errorThrown);
                        alert('An error occurred. Please try again.');
                    }
                });
            } catch (error) {
                console.error('Error:', error);
                alert('An error occurred. Please try again.');
            }
        }
		
/* 		function requestIssueBillingKey() {
			const issueResponse = PortOne.requestIssueBillingKey({
			    storeId: "store-df220412-2eec-4989-8173-fdc3bfb8f541", // 고객사 storeId로 변경해주세요.
			    channelKey: "channel-key-9dc1fb15-6f45-4b0f-8ced-8c35e312efa6", // 콘솔 결제 연동 화면에서 채널 연동 시 생성된 채널 키를 입력해주세요.
			    billingKeyMethod: "CARD",
			    issueId: "test-1",
			    issueName: "빌링키 발급",
			    customer: {
			      fullName: "포트원",
			      phoneNumber: "010-0000-1234",
			      email: "test@portone.io",
			    },
			  });
				// 빌링키가 제대로 발급되지 않은 경우 에러 코드가 존재합니다
				if (issueResponse.code !== undefined) {
				  return alert(issueResponse.message);
				}

				// 고객사 서버에 빌링키를 전달합니다
				const response = await fetch(`${path}/billings`, {
				  method: "POST",
				  header: { "Content-Type": "application/json" },
				  body: JSON.stringify({
				    billingKey: issueResponse.billingKey,
				    // ...
				  }),
				});
				if (!response.ok) throw new Error(`response: \${await response.json()}`);
		} */

		 

	</script> -->
</body>
</html>