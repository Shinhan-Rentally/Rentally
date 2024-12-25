<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../common/headMeta.jsp" %>
<%@ include file="../common/headLinks.jsp" %>
<meta charset="UTF-8">
<title>로그인 페이지</title>
</head>
<body>
<!-- navigation -->
<div class="border-bottom shadow-sm">
  <nav class="navbar navbar-light py-2">
    <div class="container justify-content-center justify-content-lg-between">
      <a class="navbar-brand" href="main">
        <img src="resources/images/logo/freshcart-logo.svg" alt="" class="d-inline-block align-text-top">
      </a>
      <span class="navbar-text">
        이미 계정을 갖고계신가요? <a href="#">Sign in</a>
      </span>
    </div>
  </nav>
</div>
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
               <h1 class="mb-1 h2 fw-bold">Sign in to 렌탈리</h1>
               <p>렌탈리의 오신것을 환영합니다.</p>
            </div>

            <!-- Form with action and method -->
         <form
   class="needs-validation"
   action="/rentally/customer/login"
   method="post"
   id="loginForm"
   novalidate
>
   <div class="row g-3">
      <!-- ID -->
      <div class="col-12">
         <label for="cust_id" class="form-label visually-hidden">ID</label>
         <input
            type="text"
            class="form-control"
            id="cust_id"
            name="cust_id"
            placeholder="ID"
            required
         />
         <div class="invalid-feedback">ID를 입력하세요.</div>
      </div>

      <!-- Password -->
      <div class="col-12">
         <div class="password-field position-relative">
            <label for="cust_pw" class="form-label visually-hidden">Password</label>
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
      <div class="d-flex justify-content-between">
         <div class="form-check">
            <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault" />
            <label class="form-check-label" for="flexCheckDefault">Remember me</label>
         </div>
         <div>
            Forgot password?
            <a href="#">Reset It</a>
         </div>
      </div>

      <!-- Submit Button -->
      <div class="col-12 d-grid">
         <button type="submit" class="btn btn-primary">Sign In</button>
      </div>

      <!-- Sign Up Link -->
      <div>
         Don’t have an account?
         <a href="/customer/join">Sign Up</a>
      </div>
   </div>
</form>
         
         </div>
      </div>
   </div>
</section>n>
      </main>

      <!-- Footer -->
     <%@ include file="../common/footer.jsp" %>
    
      
      <script src="resources/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
		<script src="resources/libs/simplebar/dist/simplebar.min.js"></script>
      
      <script src="resources/js/vendors/password.js"></script>
      <script src="resources/js/vendors/validation.js"></script>


<script>
document.addEventListener("DOMContentLoaded", () => {
	   const form = document.querySelector("#loginForm");
	   const urlParams = new URLSearchParams(window.location.search);

	   // 로그인 실패 시 alert
	   if (urlParams.has("error") && urlParams.get("error") === "true") {
	      alert("로그인에 실패했습니다. ID와 비밀번호를 확인하세요.");
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
	         event.preventDefault();
	         event.stopPropagation();
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

</body>
</html>