<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
         <!-- section -->
         <div class="mt-8 mb-lg-14 mb-8">
            <!-- container -->
            <div class="container">
               <div class="row gx-10">
                  <section class="col-lg-12">
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
                              <span class="text-dark">${fn:length(upgradeProductlist)}</span>
                              개 상품
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
                                             alt="${upgrade.product_name}" class="mb-3 img-fluid" />
                                       </div>
                                    </div>
                                    <div class="col-md-8 col-12 flex-grow-1">
                                       <!-- heading -->
                                       <h2 class="fs-6">${upgrade.product_name}</h2>
                                       <div>
                                          <!-- rating -->
                                          <small class="text-warning">
			                                <c:forEach var="i" begin="1" end="5">
			                                    <c:choose>
			                                        <c:when test="${i <= (upgrade.review_avg)}">
			                                            <i class="bi bi-star-fill"></i>
			                                        </c:when>
			                                        <c:when test="${i - 0.5 <= upgrade.review_avg}">
			                                            <i class="bi bi-star-half"></i>
			                                        </c:when>
			                                        <c:otherwise>
			                                            <i class="bi bi-star"></i>
			                                        </c:otherwise>
			                                    </c:choose>
			                                </c:forEach>
                                          </small>
                                          <span class="text-muted small"><fmt:formatNumber value="${upgrade.review_avg}" type="number" maxFractionDigits="2" />(${upgrade.review_count})</span>
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
                                          <form action="${path}/payment" method="post">
	                                    	<input type="hidden" name="product_seq" value="${upgrade.product_seq}">
											<input type="hidden" name="sub_seq" value="${subSeq}">
											<input type="hidden" name="sub_total" value="${subTotal}">
											<input type="hidden" name="isUpgrade" value="true">
	                                       	<button class="btn btn-info btn-sm" id="upgrade">업그레이드</button>
	                                      </form>
                                          </div>
                                       </div>
                                    </div>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </c:forEach>   
                     </div>
                  </section>
               </div>
            </div>
         </div>
      </main>
      <!-- Footer -->
      <%@ include file="../common/footer.jsp"%>
      <!-- Javascript-->
      <script src="${path}/resources/libs/nouislider/dist/nouislider.min.js"></script>
      <script src="${path}/resources/libs/wnumb/wNumb.min.js"></script>
      <script src="${path}/resources/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
	  <script src="${path}/resources/libs/simplebar/dist/simplebar.min.js"></script>
	  <script src="${path}/resources/js/main.js"></script>
      <script src="${path}/resources/libs/tiny-slider/dist/min/tiny-slider.js"></script>
      <script src="${path}/resources/js/vendors/tns-slider.js"></script>
      <script src="${path}/resources/js/vendors/zoom.js"></script>
</body>
</html>