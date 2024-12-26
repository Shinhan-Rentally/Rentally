<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<head>
<%@ include file="../common/headMeta.jsp"%>
<title>Shop List eCommerce HTML Template - FreshCart</title>
<%@ include file="../common/headLinks.jsp"%>
<link href="${path}/resources/libs/tiny-slider/dist/tiny-slider.css" rel="stylesheet" />
<link href="${path}/resources/libs/nouislider/dist/nouislider.min.css" rel="stylesheet" />
</head>
<body>
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
               <div class="row gx-10">
                  <section class="col-lg-9 col-md-12">
                     <!-- card -->
                     <div class="card mb-4 bg-light border-0">
                        <!-- card body -->
                        <div class="card-body p-9">
                           <h2 class="mb-0 fs-1">업그레이드 가능 상품 목록</h2>
                        </div>
                     </div>
                     <!-- text -->
                     <div class="d-lg-flex justify-content-between align-items-center">
                        <div class="mb-3 mb-lg-0">
                           <p class="mb-0">
                              <span class="text-dark">24</span>
                              Products found
                           </p>
                        </div>
                     </div>
                     <!-- row -->
                     <div class="row g-4 row-cols-1 mt-2">
                     <c:forEach items="${upgradeProductlist}" var="upgrade" varStatus="status">
                        <div class="col">
                           <!-- card -->
                           <div class="card card-product">
                              <!-- card body -->
                              <div class="card-body">
                                 <div class="row align-items-center">
                                    <!-- col -->
                                    <div class="col-md-4 col-12">
                                       <div class="text-center position-relative">
                                             <!-- img -->
                                             <img src="https://rentally.s3.ap-northeast-2.amazonaws.com/${upgrade.category_seq}/${upgrade.product_img}" 
                                             alt="Grocery Ecommerce Template" class="mb-3 img-fluid" />
                                       </div>
                                    </div>
                                    <div class="col-md-8 col-12 flex-grow-1">
                                       <!-- heading -->
                                       <h2 class="fs-6">${upgrade.product_name}</h2>
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
                                       <div class="mt-6">
                                          <!-- price -->
                                          <div>
                                             <span class="text-dark">월 
                                               <fmt:formatNumber value="${upgrade.product_pay}" type="number" pattern="#,###"/>원
                                             </span>
                                          </div>
                                          <!-- btn -->
                                          <div class="mt-2">
                                             <a href="#!" class="btn btn-primary">업그레이드</a>
                                          </div>
                                       </div>
                                    </div>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </c:forEach>   
                     </div>
                     <!-- row -->
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
      <!-- Footer -->
      <!-- @@include("../partials/footer.html") -->
      <!-- Javascript-->
      <script src="${path}/resources/libs/nouislider/dist/nouislider.min.js"></script>
      <script src="${path}/resources/libs/wnumb/wNumb.min.js"></script>
      <!-- @@include("../partials/scripts.html") -->
      <script src="${path}/resources/libs/tiny-slider/dist/min/tiny-slider.js"></script>
      <script src="${path}/resources/js/vendors/tns-slider.js"></script>
      <script src="${path}/resources/js/vendors/zoom.js"></script>
</body>
</html>