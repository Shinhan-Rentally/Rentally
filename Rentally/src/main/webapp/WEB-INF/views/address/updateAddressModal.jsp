<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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