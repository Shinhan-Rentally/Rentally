<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <%@ include file="../common/headMeta.jsp" %>
  <title>설정 - Rentally</title>
  <%@ include file="../common/headLinks.jsp" %>
</head>
<body data-path="${path}">
<%@ include file="../common/header.jsp" %>
<c:set var="page" value="settings" />
<main>
  <section>
    <div class="container">
      <div class="row">
        <%@ include file="../common/myPageNavbar.jsp" %>
        <div class="col-lg-9 col-md-8 col-12">
          <div class="py-6 p-md-6 p-lg-10">
            <div class="mb-6">
              <h2 class="mb-0">설정</h2>
            </div>
            <div>
              <h5 class="mb-4">회원정보</h5>
              <div class="row">
                <div class="col-lg-5">
                  <form>
                    <div class="mb-3">
                      <label class="form-label">이름</label>
                      <input type="text" id="cust_name" class="form-control" style="background-color: #f0f0f0;" value="${custInfo.cust_name}" readonly/>
                    </div>
                    <div class="mb-3">
                      <label class="form-label">이메일</label>
                      <input type="email" id="cust_email" class="form-control" value="${custInfo.cust_email}" />
                      <div id="emailFeedback" class="invalid-feedback hide">
                        이메일 형식을 지켜주세요.
                      </div>
                    </div>
                    <div class="mb-5">
                      <label class="form-label">전화번호</label>
                      <input type="text" id="cust_phone" class="form-control" style="background-color: #f0f0f0;" value="${custInfo.cust_phone}" readonly/>
                    </div>
                    <div class="mb-3">
                      <button id="saveDetails" class="btn btn-info">회원정보 수정</button>
                    </div>
                  </form>
                </div>
              </div>
            </div>
            <hr class="my-10" />
            <div class="pe-lg-14">
              <h5 class="mb-4">비밀번호</h5>
              <form class="row row-cols-1 row-cols-lg-2">
                <div class="mb-3 col">
                  <input id="newPw" type="password" class="form-control" placeholder="새로운 비밀번호" required/>
                  <div id="newPwFeedback" class="invalid-feedback"></div>
                </div>
                <div class="mb-3 col">
                  <input id="currentPw" type="password" class="form-control" placeholder="현재 비밀번호" required/>
                  <div id="currentPwFeedback" class="invalid-feedback"></div>
                </div>
                <div class="col-12">
                  <p class="mb-4 text-nowrap">
                    새로운 비밀번호와 현재 비밀번호를 입력해주세요.
                  </p>
                  <p class="mb-4 text-nowrap">
                    비밀번호는 영문자, 숫자, 특수문자 조합으로 6~16글자로 입력해주세요.
                  </p>
                  <button id="updatePW" class="btn btn-info">비밀번호 수정</button>
                </div>
              </form>
            </div>
            <hr class="my-10" />
            <div>
              <h5 class="mb-4">계정 삭제</h5>
              <p class="mb-2">계정을 삭제하시겠습니까?</p>
              <p class="mb-5">계정을 삭제하면 해당 계정과 연관된 모든 주문 정보가 삭제됩니다.</p>
              <div class="mb-3">
                <button id="deleteAccount" class="btn btn-outline-danger">회원 탈퇴</button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</main>
<!-- 알림용 modal -->
<div class="modal fade" id="alertModal" tabindex="-1" aria-labelledby="alertModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="alertModalLabel">알림</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body" id="alertModalMessage"></div>
      <div class="modal-footer">
        <button type="button" id="alertModalConfirm" class="btn btn-info" data-bs-dismiss="modal">확인</button>
      </div>
    </div>
  </div>
</div>
<%@ include file="../common/footer.jsp" %>
<%@ include file="../common/bottomKakao.jsp" %>
<script src="${path}/resources/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<script src="${path}/resources/libs/simplebar/dist/simplebar.min.js"></script>
<script src="${path}/resources/js/main.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="${path}/resources/js/settings.js"></script>
</body>
</html>