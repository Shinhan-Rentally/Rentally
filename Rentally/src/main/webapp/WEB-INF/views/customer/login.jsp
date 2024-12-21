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
                     <img src="resource/images/svg-graphics/signin-g.svg" alt="" class="img-fluid" />
                  </div>
                  <!-- col -->
                  <div class="col-12 col-md-6 offset-lg-1 col-lg-4 order-lg-2 order-1">
                     <div class="mb-lg-9 mb-5">
                        <h1 class="mb-1 h2 fw-bold">Sign in to 렌탈리</h1>
                        <p>렌탈리의 오신것을 환영합니다.</p>
                     </div>

                     <form class="needs-validation" novalidate>
                        <div class="row g-3">
                           <!-- row -->

                           <div class="col-12">
                              <!-- input -->
                              <label for="formSigninEmail" class="form-label visually-hidden">ID</label>
                              <input type="text" class="form-control" id="cust_id" name="cust_id" placeholder="ID" required />
                              <div class="invalid-feedback">Please enter name.</div>
                           </div>
                           <div class="col-12">
                              <!-- input -->
                              <div class="password-field position-relative">
                                 <label for="formSigninPassword" class="form-label visually-hidden">Password</label>
                                 <div class="password-field position-relative">
                                    <input type="password" class="form-control fakePassword" id="cust_pw" placeholder="*****" required />
                                    <span><i class="bi bi-eye-slash passwordToggler"></i></span>
                                    <div class="invalid-feedback">Please enter password.</div>
                                 </div>
                              </div>
                           </div>
                           <div class="d-flex justify-content-between">
                              <!-- form check -->
                              <div class="form-check">
                                 <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault" />
                                 <!-- label -->
                                 <label class="form-check-label" for="flexCheckDefault">Remember me</label>
                              </div>
                              <div>
                                 Forgot password?
                                 <a href="#">Reset It</a>
                              </div>
                           </div>
                           <!-- btn -->
                           <div class="col-12 d-grid"><button type="submit" class="btn btn-primary">Sign In</button></div>
                           <!-- link -->
                           <div>
                              Don’t have an account?
                              <a href="#">Sign Up</a>
                           </div>
                        </div>
                     </form>
                  </div>
               </div>
            </div>
         </section>
      </main>

      <!-- Footer -->
     
    
      
      <script src="resources/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
		<script src="resources/libs/simplebar/dist/simplebar.min.js"></script>
      
      <script src="resources/js/vendors/password.js"></script>
      <script src="resources/js/vendors/validation.js"></script>
</body>
</html>