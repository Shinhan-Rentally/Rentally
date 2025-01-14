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

$("#cust_phone").on("input", function(){
    let value = $("#cust_phone").val().replace(/\D/g, '');
    if (value.length <= 3) {
        $("#cust_phone").val(value);
    } else if (value.length <= 7) {
        $("#cust_phone").val(value.slice(0, 3) + '-' + value.slice(3));
    } else {
        $("#cust_phone").val(value.slice(0, 3) + '-' + value.slice(3, 7) + '-' + value.slice(7, 11));
    }
});

$('#saveDetails').on("click", function (event){
    event.preventDefault();

    const custName = $('#cust_name').val().trim();
    const custEmail = $('#cust_email').val().trim();
    let custPhone = $('#cust_phone').val().trim();
    isValid = true;

    // 이름 유효성 검사
    if (!validateField(custName, "#nameFeedback", "#cust_name", "이름을 입력해주세요.")) {
        isValid = false;
    }

    // 이메일 유효성 검사
    if (!validateField(custEmail, "#emailFeedback", "#cust_email", "이메일을 입력해주세요.", "유효한 이메일을 입력해주세요.", emailPattern)) {
        isValid = false;
    }

    // 전화번호 자동 하이픈 추가
    custPhone = custPhone.replace(/\D/g, ''); // 숫자만 추출
    if (custPhone.length >= 4) {
        custPhone = custPhone.slice(0, 3) + '-' + custPhone.slice(3);
    }
    if (custPhone.length >= 8) {
        custPhone = custPhone.slice(0, 8) + '-' + custPhone.slice(8, 12);
    }

    // 전화번호 유효성 검사
    if (!validateField(custPhone, "#phoneFeedback", "#cust_phone", "전화번호를 입력해주세요.")) {
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
            cust_name : custName,
            cust_email : custEmail,
            cust_phone : custPhone
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