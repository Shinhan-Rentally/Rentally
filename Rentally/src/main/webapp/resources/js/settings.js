// jsp에서의 데이터 받을 수 있는 연결 패스
const path = document.body.getAttribute('data-path');
if (!path) {
    console.error("Path is not defined. Please check your JSP configuration.");
}

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

/// 입력값 유효성 검사 함수
function validateField(value, feedbackSelector, inputSelector, emptyMessage, invalidMessage = null, pattern = null) {
    if (value === "" || (pattern && !pattern.test(value))) {
        $(feedbackSelector).removeClass("hide").text(
            value === "" ? emptyMessage : invalidMessage
        );
        $(inputSelector).addClass("is-invalid").removeClass("is-valid");
        return false;
    } else {
        $(feedbackSelector).addClass("hide");
        $(inputSelector).addClass("is-valid").removeClass("is-invalid");
        return true;
    }
}

const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

$('#saveDetails').on("click", function (event){
    event.preventDefault();

    const custEmail = $('#cust_email').val().trim();
    isValid = true;

    // 이메일 유효성 검사
    if (!validateField(custEmail, "#emailFeedback", "#cust_email", "이메일을 입력해주세요.", "유효한 이메일을 입력해주세요.", emailPattern)) {
        isValid = false;
    }

    // 유효하지 않으면 요청 중단
    if (!isValid) {
        return;
    }

    $.ajax({
        url: `${path}/customer/update`,
        type: 'post',
        data: {
            cust_email : custEmail
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

    $.ajax({
        url: `${path}/customer/delete`,
        type: 'post',
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
    if (!validateField(currentPw, "#currentPwFeedback", "#currentPw", "현재 비밀번호를 입력해주세요.")) {
        isValid = false;
    }

    // 새로운 비밀번호 필드 검증
    if (!validateField(newPw, "#newPwFeedback", "#newPw", "새로운 비밀번호를 입력해주세요.", "비밀번호는 영문자, 숫자, 특수문자 조합으로 6~16글자로 입력해주세요.", okPassword)) {
        isValid = false;
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