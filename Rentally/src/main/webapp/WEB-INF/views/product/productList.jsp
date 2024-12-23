<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta content="Codescandy" name="author">
<!-- Favicon icon-->
<link rel="shortcut icon" type="image/x-icon" href="resources/images/favicon/favicon.ico">
<%@ include file="../common/headLinks.jsp"%>
<%@ include file="../common/headMeta.jsp"%>
<!-- Libs CSS -->
<link href="${path}/resources/libs/bootstrap-icons/font/bootstrap-icons.min.css" rel="stylesheet">
<link href="resources/libs/feather-webfont/dist/feather-icons.css" rel="stylesheet">
<link href="resources/libs/simplebar/dist/simplebar.min.css" rel="stylesheet">
<!-- Theme CSS -->

<link rel="stylesheet" href="resources/css/theme.css">
<!-- endbuild -->
<title>카테고리 상품</title>
</head>
<body>
          <!-- heading -->
                                 <div class="text-small mb-1">
                                    <a href="#!" class="text-decoration-none text-muted"><small>Snack & Munchies</small></a>
                          <!-- 헤더부분 include -->
      <%@ include file="../common/header.jsp"%>
      
      <main>
         <!-- section-->
         <div class="mt-4">
            <div class="container">
               <!-- row -->
               <div class="row">
                  <!-- col -->
                  <div class="col-12">
                     <!-- breadcrumb -->
                     <nav aria-label="breadcrumb">
                        <ol class="breadcrumb mb-0">
                           <li class="breadcrumb-item"><a href="#!">Home</a></li>
                           <li class="breadcrumb-item"><a href="#!">Shop</a></li>
                           <li class="breadcrumb-item active" aria-current="page">Snacks & Munchies</li>
                        </ol>
                     </nav>
                  </div>
               </div>
            </div>
         </div>
         <!-- section -->
         <div class="mt-8 mb-lg-14 mb-8">
            <!-- container -->
            <div class="container">
               <!-- row -->
               <div class="row gx-10">
                  <!-- col -->
                  <aside class="col-lg-3 col-md-4 mb-6 mb-md-0">
                     <div class="offcanvas offcanvas-start offcanvas-collapse w-md-50" tabindex="-1" id="offcanvasCategory" aria-labelledby="offcanvasCategoryLabel">
                        <div class="offcanvas-header d-lg-none">
                           <h5 class="offcanvas-title" id="offcanvasCategoryLabel">Filter</h5>
                           <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
                        </div>
                        <div class="offcanvas-body ps-lg-2 pt-lg-0">
                           <div class="mb-8">
                              <!-- title -->
                              <h5 class="mb-3">Categories</h5>
                              <!-- nav -->
                              <ul class="nav nav-category" id="categoryCollapseMenu">
                                 <li class="nav-item border-bottom w-100">
                                    <a href="#" class="nav-link collapsed" data-bs-toggle="collapse" data-bs-target="#categoryFlushOne" aria-expanded="false" aria-controls="categoryFlushOne">
                                       Dairy, Bread & Eggs
                                       <i class="feather-icon icon-chevron-right"></i>
                                    </a>
                                    <!-- accordion collapse -->
                                    <div id="categoryFlushOne" class="accordion-collapse collapse" data-bs-parent="#categoryCollapseMenu">
                                       <div>
                                          <!-- nav -->

                                          <ul class="nav flex-column ms-3">
                                             <!-- nav item -->
                                             <li class="nav-item"><a href="#!" class="nav-link">Milk</a></li>
                                            
                                          </ul>
                                       </div>
                                    </div>
                                 </li>
                                                     
                 
                              </ul>
                           </div>

                           <div class="mb-8">
                              <h5 class="mb-3">Stores</h5>
                        
                            
                              <!-- form check -->
                              <div class="form-check mb-2">
                                 <!-- input -->
                                 <input class="form-check-input" type="checkbox" value="" id="onlineGrocery" />
                                 <label class="form-check-label" for="onlineGrocery">Online Grocery</label>
                              </div>
                           </div>
                    
                           <!-- rating -->
                           <div class="mb-8">
                              <h5 class="mb-3">Rating</h5>
                              <div>
                                 <!-- form check -->
                                 <div class="form-check mb-2">
                                    <!-- input -->
                                    <input class="form-check-input" type="checkbox" value="" id="ratingFive" />
                                    <label class="form-check-label" for="ratingFive">
                                       <i class="bi bi-star-fill text-warning"></i>
                                       <i class="bi bi-star-fill text-warning"></i>
                                       <i class="bi bi-star-fill text-warning"></i>
                                       <i class="bi bi-star-fill text-warning"></i>
                                       <i class="bi bi-star-fill text-warning"></i>
                                    </label>
                                 </div>
                                 <!-- form check -->
                                 <div class="form-check mb-2">
                                    <!-- input -->
                                    <input class="form-check-input" type="checkbox" value="" id="ratingFour" checked />
                                    <label class="form-check-label" for="ratingFour">
                                       <i class="bi bi-star-fill text-warning"></i>
                                       <i class="bi bi-star-fill text-warning"></i>
                                       <i class="bi bi-star-fill text-warning"></i>
                                       <i class="bi bi-star-fill text-warning"></i>
                                       <i class="bi bi-star text-warning"></i>
                                    </label>
                                 </div>
                                 <!-- form check -->
                                 <div class="form-check mb-2">
                                    <!-- input -->
                                    <input class="form-check-input" type="checkbox" value="" id="ratingThree" />
                                    <label class="form-check-label" for="ratingThree">
                                       <i class="bi bi-star-fill text-warning"></i>
                                       <i class="bi bi-star-fill text-warning"></i>
                                       <i class="bi bi-star-fill text-warning"></i>
                                       <i class="bi bi-star text-warning"></i>
                                       <i class="bi bi-star text-warning"></i>
                                    </label>
                                 </div>
                                 <!-- form check -->
                                 <div class="form-check mb-2">
                                    <!-- input -->
                                    <input class="form-check-input" type="checkbox" value="" id="ratingTwo" />
                                    <label class="form-check-label" for="ratingTwo">
                                       <i class="bi bi-star-fill text-warning"></i>
                                       <i class="bi bi-star-fill text-warning"></i>
                                       <i class="bi bi-star text-warning"></i>
                                       <i class="bi bi-star text-warning"></i>
                                       <i class="bi bi-star text-warning"></i>
                                    </label>
                                 </div>
                                 <!-- form check -->
                                 <div class="form-check mb-2">
                                    <!-- input -->
                                    <input class="form-check-input" type="checkbox" value="" id="ratingOne" />
                                    <label class="form-check-label" for="ratingOne">
                                       <i class="bi bi-star-fill text-warning"></i>
                                       <i class="bi bi-star text-warning"></i>
                                       <i class="bi bi-star text-warning"></i>
                                       <i class="bi bi-star text-warning"></i>
                                       <i class="bi bi-star text-warning"></i>
                                    </label>
                                 </div>
                              </div>
                           </div>
                   
                        </div>
                     </div>
                  </aside>
                  <section class="col-lg-9 col-md-12">
                     <!-- card -->
                     <div class="card mb-4 bg-light border-0">
                        <!-- card body -->
                        <div class="card-body p-9">
                           <h2 class="mb-0 fs-1">Snacks & Munchies</h2>
                        </div>
                     </div>
                     <!-- list icon -->
                     <div class="d-lg-flex justify-content-between align-items-center">
                        <div class="mb-3 mb-lg-0">
                           <p class="mb-0">
                              <span class="text-dark">24</span>
                              Products found
                           </p>
                        </div>

                        <!-- icon -->
                        <div class="d-md-flex justify-content-between align-items-center">
                  

                           <div class="d-flex mt-2 mt-lg-0">
                              <div>
                                 <!-- select option -->
                                 <select class="form-select">
                                    <option selected>Sort by: Featured</option>
                                    <option value="Low to High">Price: Low to High</option>
                                    <option value="High to Low">Price: High to Low</option>
                                    <option value="Release Date">Release Date</option>
                                    <option value="Avg. Rating">Avg. Rating</option>
                                 </select>
                              </div>
                           </div>
                        </div>
                     </div>
                     <!-- row -->
                     <c:forEach items="${productlist}" var="productlist">
                     <div class="row g-4 row-cols-xl-4 row-cols-lg-3 row-cols-2 row-cols-md-2 mt-2">
                        <!-- col -->
                        <div class="col">
                           <!-- card -->
                           <div class="card card-product">
                              <div class="card-body">
                                 <!-- badge -->
                                 <div class="text-center position-relative">
                                    <div class="position-absolute top-0 start-0">
                                       <span class="badge bg-danger">Sale</span>
                                    </div>
                                    <a href="shop-single.html">
                                       <!-- img -->
                                       <img src="resources/images/products/${productlist.product_img}" alt="Grocery Ecommerce Template" class="mb-3 img-fluid" />
                                    </a>
                                    <!-- action btn -->
                                    <div class="card-product-action">
                                       <a href="#!" class="btn-action" data-bs-toggle="modal" data-bs-target="#quickViewModal">
                                          <i class="bi bi-eye" data-bs-toggle="tooltip" data-bs-html="true" title="Quick View"></i>
                                       </a>
                                       <a href="shop-wishlist.html" class="btn-action" data-bs-toggle="tooltip" data-bs-html="true" title="Wishlist"><i class="bi bi-heart"></i></a>
                                       <a href="#!" class="btn-action" data-bs-toggle="tooltip" data-bs-html="true" title="Compare"><i class="bi bi-arrow-left-right"></i></a>
                                    </div>
                               </div>
                                 <h2 class="fs-6"><a href="shop-single.html" class="text-inherit text-decoration-none">Haldiram's Sev Bhujia</a></h2>
                                 <div>
                                    <!-- rating -->
                                    <small class="text-warning">
                                       <i class="bi bi-star-fill"></i>
                                       <i class="bi bi-star-fill"></i>
                                       <i class="bi bi-star-fill"></i>
                                       <i class="bi bi-star-fill"></i>
                                       <i class="bi bi-star-half"></i>
                                    </small>
                                    <span class="text-muted small">4.5(149)</span>
                                 </div>
                                 <!-- price -->
                                 <div class="d-flex justify-content-between align-items-center mt-3">
                                    <div>
                                       <span class="text-dark">${productlist.product_pay}</span>
                                     
                                    </div>
                                    <!-- btn -->
                                    <div>
                                       <a href="#!" class="btn btn-primary btn-sm">
                                          <svg
                                             xmlns="http://www.w3.org/2000/svg"
                                             width="16"
                                             height="16"
                                             viewBox="0 0 24 24"
                                             fill="none"
                                             stroke="currentColor"
                                             stroke-width="2"
                                             stroke-linecap="round"
                                             stroke-linejoin="round"
                                             class="feather feather-plus">
                                             <line x1="12" y1="5" x2="12" y2="19"></line>
                                             <line x1="5" y1="12" x2="19" y2="12"></line>
                                          </svg>
                                          Add
                                       </a>
                                    </div>
                                 </div>
                              </div>
                           </div>
                        </div>
                      

                      </div>
                      </c:forEach>
                     <div class="row mt-8">
                        <div class="col">
                           <!-- nav -->
                           <nav>
                              <ul class="pagination">
                                 <li class="page-item disabled">
                                    <a class="page-link mx-1" href="#" aria-label="Previous">
                                       <i class="feather-icon icon-chevron-left"></i>
                                    </a>
                                 </li>
                                 <li class="page-item"><a class="page-link mx-1 active" href="#">1</a></li>
                                 <li class="page-item"><a class="page-link mx-1" href="#">2</a></li>

                                 <li class="page-item"><a class="page-link mx-1" href="#">...</a></li>
                                 <li class="page-item"><a class="page-link mx-1" href="#">12</a></li>
                                 <li class="page-item">
                                    <a class="page-link mx-1" href="#" aria-label="Next">
                                       <i class="feather-icon icon-chevron-right"></i>
                                    </a>
                                 </li>
                              </ul>
                           </nav>
                        </div>
                     </div>
                  </section>
               </div>
            </div>
         </div>
      </main>

      <!-- 상품 호버시 나오는 modal -->
<!--       @@include("../partials/modal-product.html") -->

      <!-- Footer -->
      <!-- @@include("../partials/footer.html") -->

      <!-- Javascript-->
      <script src="resources/libs/nouislider/dist/nouislider.min.js"></script>
      <script src="resources/libs/wnumb/wNumb.min.js"></script>
      <script src="resources/libs/tiny-slider/dist/min/tiny-slider.js"></script>
      <script src="resources/js/vendors/tns-slider.js"></script>
      <script src="resources/js/vendors/zoom.js"></script>
       <!-- Libs JS -->
		<script src="resources/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
		<script src="resources/libs/simplebar/dist/simplebar.min.js"></script>
	<!-- Theme JS -->

	<script src="resources/js/main.js"></script>
<!-- endbuild -->

</body>
</html>