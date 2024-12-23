<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 @@include("../partials/head/head-meta.html")
      <title>Sign up eCommerce HTML Template - FreshCart</title>
      @@include("../partials/head/head-links.html") @@include("../partials/head/analytics-code.html") @@include("../partials/head/clarity.html")</head>
<body>
 @@include("../partials/navbar-account.html")
      <main>
         <!-- section -->

         <section class="my-lg-14 my-8">
            <!-- container -->
            <div class="container">
               <!-- row -->
               <div class="row justify-content-center align-items-center">
                  <div class="col-12 col-md-6 col-lg-4 order-lg-1 order-2">
                     <!-- img -->
                     <img src="../assets/images/svg-graphics/signup-g.svg" alt="" class="img-fluid" />
                  </div>
                  <!-- col -->
                  <div class="col-12 col-md-6 offset-lg-1 col-lg-4 order-lg-2 order-1">
                     <div class="mb-lg-9 mb-5">
                        <h1 class="mb-1 h2 fw-bold">Get Start Shopping</h1>
                        <p>Welcome to FreshCart! Enter your email to get started.</p>
                     </div>
                     <!-- form -->
                     <form class="needs-validation" novalidate>
                        <div class="row g-3">
                           <!-- col -->
                           <div class="col">
                              <!-- input -->
                              <label for="formSignupfname" class="form-label visually-hidden">First Name</label>
                              <input type="text" class="form-control" id="formSignupfname" placeholder="First Name" required />
                              <div class="invalid-feedback">Please enter first name.</div>
                           </div>
                           <div class="col">
                              <!-- input -->
                              <label for="formSignuplname" class="form-label visually-hidden">Last Name</label>
                              <input type="text" class="form-control" id="formSignuplname" placeholder="First Name" required />
                              <div class="invalid-feedback">Please enter last name.</div>
                           </div>
                           <div class="col-12">
                              <!-- input -->
                              <label for="formSignupEmail" class="form-label visually-hidden">Email address</label>
                              <input type="email" class="form-control" id="formSignupEmail" placeholder="Email" required />
                              <div class="invalid-feedback">Please enter email.</div>
                           </div>
                           <div class="col-12">
                              <div class="password-field position-relative">
                                 <label for="formSignupPassword" class="form-label visually-hidden">Password</label>
                                 <div class="password-field position-relative">
                                    <input type="password" class="form-control fakePassword" id="formSignupPassword" placeholder="*****" required />
                                    <span><i class="bi bi-eye-slash passwordToggler"></i></span>
                                    <div class="invalid-feedback">Please enter password.</div>
                                 </div>
                              </div>
                           </div>
                           <!-- btn -->
                           <div class="col-12 d-grid"><button type="submit" class="btn btn-primary">Register</button></div>

                           <!-- text -->
                           <p>
                              <small>
                                 By continuing, you agree to our
                                 <a href="#!">Terms of Service</a>
                                 &
                                 <a href="#!">Privacy Policy</a>
                              </small>
                           </p>
                        </div>
                     </form>
                  </div>
               </div>
            </div>
         </section>
      </main>

      <!-- Footer -->
      @@include("../partials/footer.html")
      <!-- Javascript-->
      @@include("../partials/scripts.html")
      <script src="@@webRoot/assets/js/vendors/password.js"></script>

      <script src="@@webRoot/assets/js/vendors/validation.js"></script>
</body>
</html>