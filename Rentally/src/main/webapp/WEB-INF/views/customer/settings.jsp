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
                      <input type="text" id="cust_name" class="form-control" value="${custInfo.cust_name}" />
                    </div>
                    <div class="mb-3">
                      <label class="form-label">이메일</label>
                      <input type="email" id="cust_email" class="form-control" value="${custInfo.cust_email}" />
                    </div>
                    <div class="mb-5">
                      <label class="form-label">전화번호</label>
                      <input type="text" id="cust_phone" class="form-control" value="${custInfo.cust_phone}" />
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

<!-- Javascript-->
<script src="${path}/resources/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<script src="${path}/resources/libs/simplebar/dist/simplebar.min.js"></script>
<script src="${path}/resources/js/main.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<%@ include file="../common/footer.jsp" %>
<%@ include file="../common/bottomKakao.jsp" %>
</body>
<script>
  let redirectUrl = null;

  function showModalMessage(message) {
    $('#alertModalMessage').text(message);
    $('#alertModal').modal('show');
  }

  $('#alertModalConfirm').off("click").on("click", function () {
    if (redirectUrl) {
      window.location.href = redirectUrl;
    } else if (isSuccess) {
      location.reload();
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
    custSeq = ${custInfo.cust_seq};

    $.ajax({
      url: `${path}/customer/delete`,
      type: 'post',
      data: {cust_seq:custSeq},
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
  function okPassword(str) {
    return /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{6,16}$/.test(str);
  }

  $("#newPw").on("keyup", function () {
    const newPw = $(this).val();
    if (newPw.length !== 0) {
      if (okPassword(newPw)) {
        $("#newPwFeedback").addClass("hide");
        $(this).removeClass("is-invalid").addClass("is-valid");
      } else {
        $("#newPwFeedback").removeClass("hide").text("비밀번호는 영문자, 숫자, 특수문자 조합으로 6~16글자로 입력해주세요.");
        $(this).removeClass("is-valid").addClass("is-invalid");
      }
    } else {
      $("#newPwFeedback").addClass("hide");
      $(this).removeClass("is-valid is-invalid");
    }
  });

  $("#updatePW").on("click", function (event) {
    event.preventDefault(); // 기본 동작 방지

    const currentPw = $("#currentPw").val();
    const newPw = $("#newPw").val();
    let isValid = true;

    // 현재 비밀번호 필드 검증
    if (!currentPw) {
      $("#currentPw").addClass("is-invalid");
      $("#currentPwFeedback").text("현재 비밀번호를 입력해주세요.");
      isValid = false;
    } else {
      $("#currentPw").removeClass("is-invalid").addClass("is-valid");
    }

    // 새로운 비밀번호 필드 검증
    if (!newPw || !okPassword(newPw)) {
      $("#newPw").addClass("is-invalid");
      $("#newPwFeedback").text("비밀번호는 영문자, 숫자, 특수문자 조합으로 6~16글자로 입력해주세요.");
      isValid = false;
    } else {
      $("#newPw").removeClass("is-invalid").addClass("is-valid");
    }

    if (!isValid) {
      return; // 필드 검증 실패 시 요청 중단
    }

    // 비밀번호 변경 요청
    $.ajax({
      url: `${path}/customer/updatepw`,
      type: "post",
      data: { currentPw, newPw },
      success: function (response) {
        if (response.success) {
          isSuccess = true;
          showModalMessage("비밀번호 변경에 성공했습니다.");
        } else if (response.error === "incorrect_password") {
          showModalMessage("현재 비밀번호가 일치하지 않습니다. 다시 시도해주세요.");
        } else {
          showModalMessage("비밀번호 변경에 실패했습니다. 다시 시도해주세요.");
        }
      },
      error: function (err) {
        showModalMessage("서버 오류로 비밀번호 변경에 실패했습니다.");
        console.error(err);
      },
    });
  });
</script>

</html>
