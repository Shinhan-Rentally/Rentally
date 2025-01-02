<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../common/headMeta.jsp" %>
<%@ include file="../common/headLinks.jsp" %>
<meta charset="UTF-8">
<title>Rentally</title>
</head>
<body>

  <!-- header -->
     <%@ include file="../common/header.jsp" %>

      <main>
         <!-- section -->
    <section class="my-lg-14 my-8">
   <div class="container">
      <!-- row -->
      <div class="row justify-content-center align-items-center">
         <div class="col-12 col-md-6 col-lg-4 order-lg-1 order-2">
            <!-- img -->
            <img src="${path}/resources/images/svg-graphics/signin-g.svg" alt="" class="img-fluid" />
         </div>
         <!-- col -->
         <div class="col-12 col-md-6 offset-lg-1 col-lg-4 order-lg-2 order-1">
            <div class="mb-lg-9 mb-5">
               <h1 class="mb-1 h2 fw-bold">로그인</h1>
               <p>렌탈리의 오신것을 환영합니다.</p>
            </div>

            <!-- Form with action and method -->
         <form
   class="needs-validation"
   action="${path}/customer/login"
   method="post"
   id="loginForm"
   novalidate
>
<div class="col-12">
   <label for="cust_id" class="form-label">ID</label>
<input
    type="text"
    class="form-control"
    id="cust_id"
    name="cust_id"
    placeholder="ID"
    value="" 
    required
/>
  
   <div class="invalid-feedback">ID를 입력하세요.</div>
</div>

<!-- Password -->
<div class="col-12">
   <div class="password-field position-relative">
      <label for="cust_pw" class="form-label">Password</label>
      <input
         type="password"
         class="form-control fakePassword"
         id="cust_pw"
         name="cust_pw"
         placeholder="*****"
         required
      />
      <div class="invalid-feedback">비밀번호를 입력하세요.</div>
   </div>
</div>

<!-- Options -->
<div class="col-12 d-flex justify-content-between align-items-center">
  <div class="form-check">
   <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault" />
   <label class="form-check-label" for="flexCheckDefault">ID 기억하기</label>
</div>

         <!-- 비밀번호찾기 -->
         <div>
          
         </div>
      </div>

      <!-- Submit Button -->
      <div class="col-12 d-grid">
         <button type="submit" class="btn btn-info">로그인</button>
      </div>

      <!-- Sign Up Link -->
      <div>
         Don’t have an account?
         <a href="${path}/customer/join">아직 Rentally 회원가입을 안하셨나요? 회원가입</a>
      </div>
</form>
   </div>

         
         </div>
      </div>
   
</section>
      </main>

      <!-- Footer -->
     <%@ include file="../common/footer.jsp" %>
    
      
      <script src="${path}/resources/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
		<script src="${path}/resources/libs/simplebar/dist/simplebar.min.js"></script>
      
      <script src="${path}/resources/js/vendors/password.js"></script>
      <script src="${path}/resources/js/vendors/validation.js"></script>


<script>
document.addEventListener("DOMContentLoaded", () => {
    const form = document.querySelector("#loginForm");
    const urlParams = new URLSearchParams(window.location.search);

    // URL에서 error 파라미터 값 확인
    if (urlParams.has("error")) {
        const error = urlParams.get("error");

        // 로그인 실패 시 alert
        if (error === "userNotFound") {
            alert("아이디가 존재하지 않습니다.");
        } else if (error === "wrongPassword") {
            alert("비밀번호가 맞지 않습니다.");
        } else if (error === "passwordMissing") {
            alert("비밀번호 정보가 누락되었습니다.");
        } else if (error === "unknownError") {
            alert("알 수 없는 오류가 발생했습니다. 다시 시도해주세요.");
        }
    }

    // 폼 유효성 검사 및 제출 처리
    form.addEventListener("submit", (event) => {
        let isValid = true;

        // ID 유효성 검사
        const custIdInput = document.getElementById("cust_id");
        if (!custIdInput.value.trim()) {
            isValid = false;
            custIdInput.classList.add("is-invalid");
            alert("ID를 입력해주세요."); // 유효성 검사 실패 시 alert
        } else {
            custIdInput.classList.remove("is-invalid");
        }

        // 비밀번호 유효성 검사
        const custPwInput = document.getElementById("cust_pw");
        if (!custPwInput.value.trim()) {
            isValid = false;
            custPwInput.classList.add("is-invalid");
            alert("비밀번호를 입력해주세요."); // 유효성 검사 실패 시 alert
        } else {
            custPwInput.classList.remove("is-invalid");
        }

        // 유효성 검사 실패 시 폼 제출 중단
        if (!isValid) {
            event.preventDefault(); // 폼 제출 중단
            event.stopPropagation(); // 이벤트 전파 중단
        }
    });

    // 입력 시 유효성 스타일 제거
    document.querySelectorAll("input").forEach((input) => {
        input.addEventListener("input", () => {
            input.classList.remove("is-invalid");
        });
    });
});
</script>
<!-- id 기억하기 script -->
<script>
    document.addEventListener("DOMContentLoaded", function() {
        // 페이지가 로드되면 로컬 스토리지에서 ID 값을 읽어옵니다.
        var savedId = localStorage.getItem("savedId");
        if (savedId) {
            document.getElementById("cust_id").value = savedId;
            document.getElementById("flexCheckDefault").checked = true; // 체크박스를 체크 상태로 설정
        }

        // "Remember me" 체크박스 상태에 따라 ID를 로컬 스토리지에 저장
        document.getElementById("flexCheckDefault").addEventListener("change", function() {
            var rememberMeChecked = this.checked;
            var userId = document.getElementById("cust_id").value;

            if (rememberMeChecked) {
                localStorage.setItem("rememberMe", "true");
                localStorage.setItem("savedId", userId);
            } else {
                localStorage.removeItem("rememberMe");
                localStorage.removeItem("savedId");
            }
        });
    });
</script>

</body>
</html>