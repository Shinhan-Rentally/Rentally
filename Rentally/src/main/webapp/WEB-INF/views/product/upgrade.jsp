<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<head>
<%@ include file="../common/headMeta.jsp"%>
<title>업그레이드 가능 상품 목록 - Rentally</title>
<%@ include file="../common/headLinks.jsp"%>
<link href="${path}/resources/libs/tiny-slider/dist/tiny-slider.css" rel="stylesheet" />
<link href="${path}/resources/libs/nouislider/dist/nouislider.min.css" rel="stylesheet" />
</head>
<body>
      <%@ include file="../common/header.jsp"%>
      <main>
         <div class="mt-8 mb-lg-14 mb-8">
            <div class="container">
               <div class="row gx-10">
                  <section class="col-lg-12">
                     <div class="card mb-4 bg-light border-0">
                        <div class="card-body p-9">
                           <h2 class="mb-0 fs-1">업그레이드 가능 상품 목록</h2>
                        </div>
                     </div>
                     <div class="d-lg-flex justify-content-between align-items-center">
                        <div class="mb-3 mb-lg-0">
                           <p class="mb-0">
                              <span class="text-dark">${fn:length(upgradeProductlist)}</span>
                              개 상품
                           </p>
                        </div>
                     </div>
                     <div class="row g-4 row-cols-1 mt-2">
                     <c:forEach items="${upgradeProductlist}" var="upgrade" varStatus="status">
                        <div class="col">
                           <div class="card card-product">
                              <div class="card-body">
                                 <div class="row align-items-center">
                                    <div class="col-md-4 col-12">
                                       <div class="text-center position-relative">
                                             <img src="https://d14b80fsv1tvpk.cloudfront.net/${upgrade.category_seq}/${upgrade.product_img}?w=397&h=397&f=webp&q=80" width="397" height="397"
                                             alt="${upgrade.product_name}" class="mb-3 img-fluid" />
                                       </div>
                                    </div>
                                    <div class="col-md-8 col-12 flex-grow-1">
                                       <h2 class="fs-6">${upgrade.product_name}</h2>
                                       <small>${upgrade.product_features}</small>
                                       <div>
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
                                          <div>
                                             <span class="text-dark">월 
                                               <fmt:formatNumber value="${upgrade.product_pay}" type="number" pattern="#,###"/>원
                                             </span>
                                          </div>
                                          <div class="mt-2">
                                          <form action="${path}/payment" method="post">
	                                    	<input type="hidden" name="product_seq" value="${upgrade.product_seq}">
											<input type="hidden" name="sub_seq" value="${subSeq}">
											<input type="hidden" name="sub_total" value="${subTotal}">
											<input type="hidden" name="isUpgrade" value="true">
											<input type="hidden" name="sub_date" value="${subDate}">
											<input type="hidden" name="sub_period" value="${subPeriod}">
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
      <%@ include file="../common/bottomKakao.jsp" %>
      <%@ include file="../common/footer.jsp"%>

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