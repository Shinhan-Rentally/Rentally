<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <%@ include file="../common/headMeta.jsp" %>
  <title>설정 - Rentally</title>
  <%@ include file="../common/headLinks.jsp" %>
</head>
<body>
<%@ include file="../common/header.jsp" %>
<c:set var="page" value="settings" />
<main>
  <!-- section -->
  <section>
    <!-- container -->
    <div class="container">
      <!-- row -->
      <div class="row">
        <%@ include file="../common/myPageNavbar.jsp" %>
        <div class="col-lg-9 col-md-8 col-12">
          <div class="py-6 p-md-6 p-lg-10">
            <div class="mb-6">
              <!-- heading -->
              <h2 class="mb-0">설정</h2>
            </div>
            <div>
              <!-- heading -->
              <h5 class="mb-4">회원정보</h5>
              <div class="row">
                <div class="col-lg-5">
                  <!-- form -->
                  <form>
                    <!-- input -->
                    <div class="mb-3">
                      <label class="form-label">이름</label>
                      <input type="text" id="cust_name" class="form-control" value="${custInfo.cust_name}" />
                    </div>
                    <!-- input -->
                    <div class="mb-3">
                      <label class="form-label">이메일</label>
                      <input type="email" id="cust_email" class="form-control" value="${custInfo.cust_email}" />
                    </div>
                    <!-- input -->
                    <div class="mb-5">
                      <label class="form-label">전화번호</label>
                      <input type="text" id="cust_phone" class="form-control" value="${custInfo.cust_phone}" />
                    </div>
                    <!-- button -->
                    <div class="mb-3">
                      <button id="saveDetails" class="btn btn-info">회원정보 수정</button>
                    </div>
                  </form>
                </div>
              </div>
            </div>
            <hr class="my-10" />
            <div class="pe-lg-14">
              <!-- heading -->
              <h5 class="mb-4">비밀번호</h5>
              <form class="row row-cols-1 row-cols-lg-2">
                <!-- input -->
                <div class="mb-3 col">
                  <label class="form-label">새로운 비밀번호</label>
                  <input id="newPW" type="password" class="form-control" placeholder="**********" required/>
                  <div id="newPWFeedback" class="invalid-feedback"></div>
                </div>
                <!-- input -->
                <div class="mb-3 col">
                  <label class="form-label">현재 비밀번호</label>
                  <input id="currentPW" type="password" class="form-control" placeholder="**********" required/>
                  <div id="currentPWFeedback" class="invalid-feedback"></div>
                </div>
                <!-- input -->
                <div class="col-12">
                  <p class="mb-4 text-nowrap">
                    새로운 비밀번호와 현재 비밀번호를 입력해주세요.
                  </p>
                  <button id="updatePW" class="btn btn-info">비밀번호 수정</button>
                </div>
              </form>
            </div>
            <hr class="my-10" />
            <div>
              <!-- heading -->
              <h5 class="mb-4">계정 삭제</h5>
              <p class="mb-2">계정을 삭제하시겠습니까?</p>
              <p class="mb-5">계정을 삭제하면 해당 계정과 연관된 모든 주문 정보가 삭제됩니다.</p>
              <!-- btn -->
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

<!-- Javascript-->
<script src="${path}/resources/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<script src="${path}/resources/libs/simplebar/dist/simplebar.min.js"></script>
<script src="${path}/resources/js/main.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<%@ include file="../common/footer.jsp" %>
<!-- Footer -->
<%@ include file="../common/bottomKakao.jsp" %>
<!-- Javascript-->
</body>
<script>
  let redirectUrl = null;  // 전역 변수로 선언

  function showModalMessage(message) {
    $('#alertModalMessage').text(message);
    $('#alertModal').modal('show');
  }

  // 모달 확인 버튼 클릭 시 동작
  $('#alertModalConfirm').off("click").on("click", function () {
    if (redirectUrl) {
      window.location.href = redirectUrl; // 특정 URL로 리다이렉트
    } else if (isSuccess) {
      location.reload(); // 성공한 경우에만 새로고침
    }
  });
</script>
<script>
  $('#saveDetails').on("click", function (event){
    event.preventDefault();
    $.ajax({
      url: `${path}/customer/update`,
      type: 'post',
      data: {
        cust_name : $('#cust_name').val(),
        cust_email : $('#cust_email').val(),
        cust_phone : $('#cust_phone').val()
      },
      success: function (response){
        isSuccess = true;
        showModalMessage("회원정보 수정에 성공했습니다.");
      },
      error: function () {
        isSuccess = false;
        showModalMessage("회원정보 수정에 실패했습니다. 다시 시도해주세요.");
      }
    })

  })
  $("#deleteAccount").on("click", function (event) {
    event.preventDefault();
    cust_seq = ${custInfo.cust_seq};

    $.ajax({
      url: `${path}/customer/delete`,
      type: 'post',
      data: {cust_seq:cust_seq},
      success: function(response) {
        if (response === "1") {
          redirectUrl = `${path}/main`;  // 전역 변수를 설정
          showModalMessage("회원 탈퇴에 성공했습니다.");
        }
      },
      error: function (err) {
        isSuccess = false;
        showModalMessage("회원 탈퇴에 실패했습니다. 다시 시도해주세요.");
      }
    })
  })
</script>
<script>
  $("#updatePW").on("click", function (event) {
    event.preventDefault(); // 기본 동작 방지

    currentPW = $("#currentPW").val(); // 사용자가 입력한 현재 비밀번호
    newPW = $("#newPW").val(); // 사용자가 입력한 새로운 비밀번호

    let isValid = true; // 필드 검증 플래그

    // 필드 검증
    if (!currentPW) {
      $("#currentPW").addClass("is-invalid");
      $("#currentPWFeedback").text("현재 비밀번호를 입력해주세요.");
      isValid = false;
    } else {
      $("#currentPW").removeClass("is-invalid");
    }

    if (!newPW) {
      $("#newPW").addClass("is-invalid");
      $("#newPWFeedback").text("새로운 비밀번호를 입력해주세요.");
      isValid = false;
    } else {
      $("#newPW").removeClass("is-invalid");
    }

    if (!isValid) {
      return;
    }
    // 비밀번호 확인과 변경 요청을 한 번에 처리
    $.ajax({
      url: `${path}/customer/updatepw`, // 단일 요청 처리 API
      type: "post",
      data: {
        currentPW: currentPW,
        newPW: newPW,
      },
      success: function (response) {
        if (response.success) {
          isSuccess = true;
          showModalMessage("비밀번호 변경에 성공했습니다.");
        } else if (response.error === "incorrect_password") {
          isSuccess = false;
          showModalMessage("현재 비밀번호가 일치하지 않습니다. 다시 시도해주세요.");
        } else {
          isSuccess = false;
          showModalMessage("비밀번호 변경에 실패했습니다. 다시 시도해주세요.");
        }
      },
      error: function (err) {
        isSuccess = false;
        showModalMessage("서버 오류로 비밀번호 변경에 실패했습니다.");
        console.log(err);
      },
    });
  });
</script>
</html>
