<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../common/headMeta.jsp"%>
<title>Orders eCommerce HTML Template - FreshCart</title>
<%@ include file="../common/headLinks.jsp"%>
<style>
	.product-name {
		white-space: pre-wrap; /* 줄바꿈 문자를 인식하도록 설정 */
	}
</style>
</head>
   <body>
      <%@ include file="../common/header.jsp"%>
      <main>
         <!-- section -->
         <section>
            <div class="container">
               <!-- row -->
               <div class="row">
                  <!-- col -->
<!--                   <div class="col-12">
                     <div class="d-flex justify-content-between align-items-center d-md-none py-4">
                        heading
                        <h3 class="fs-5 mb-0">Account Setting</h3>
                        button
                        <button
                           class="btn btn-outline-gray-400 text-muted d-md-none btn-icon btn-sm ms-3"
                           type="button"
                           data-bs-toggle="offcanvas"
                           data-bs-target="#offcanvasAccount"
                           aria-controls="offcanvasAccount">
                           <i class="bi bi-text-indent-left fs-3"></i>
                        </button>
                     </div>
                  </div> -->
                  <!-- col -->
                  <div class="col-lg-3 col-md-4 col-12 border-end d-none d-md-block">
                     <div class="pt-10 pe-lg-10">
                        <!-- nav -->
                        <ul class="nav flex-column nav-pills nav-pills-dark">
                           <!-- nav item -->
                           <li class="nav-item">
                              <a class="nav-link" href="">
                                 <i class="feather-icon icon-shopping-bag me-2"></i>
                                 주문내역
                              </a>
                           </li>
                           <!-- nav item -->
                           <li class="nav-item">
                              <a class="nav-link active" aria-current="page" href="${path}/subscribe/list">
                                 <i class="feather-icon icon-shopping-bag me-2"></i>
                                 구독현황
                              </a>
                           </li>
                           <!-- nav item -->
                           <li class="nav-item">
                              <a class="nav-link" href="">
                                 <i class="feather-icon icon-settings me-2"></i>
                                 설정
                              </a>
                           </li>
                           <!-- nav item -->
                           <li class="nav-item">
                              <a class="nav-link" href="">
                                 <i class="feather-icon icon-map-pin me-2"></i>
                                 주소
                              </a>
                           </li>
                           <!-- nav item -->
                           <li class="nav-item">
                              <hr />
                           </li>
                           <!-- nav item -->
                           <li class="nav-item">
                              <a class="nav-link" href="">
                                 <i class="feather-icon icon-log-out me-2"></i>
                                 Log out
                              </a>
                           </li>
                        </ul>
                     </div>
                  </div>
                  <div class="col-lg-9 col-md-8 col-12">
                     <div class="py-6 p-md-6 p-lg-10">
                        <!-- heading -->
                        <h2 class="mb-6">구독현황</h2>

                        <div class="table-responsive-xxl border-0">
                           <!-- Table -->
                           <table class="table mb-0 text-nowrap table-centered">
                              <!-- Table Head -->
                              <thead class="bg-light">
                                 <tr>
                                    <th>&nbsp;</th>
                                    <th>상품명</th>
                                    <th>만료일</th>
                                    <th>해지</th>
                                    <th>업그레이드</th>
                                    <th>구독료</th>
                                 </tr>
                              </thead>
                              <tbody>
                                 <!-- Table body -->
                                 <c:forEach items="${subscribeList}" var="sub" varStatus="status">
	                                 <tr>
	                                    <td class="align-middle border-top-0 w-0">
	                                    
	                                       <a href="#"><img src="https://rentally.s3.ap-northeast-2.amazonaws.com/${sub.category_seq}/${sub.product_img}" alt="${sub.product_name}" class="icon-shape icon-xl" /></a>
	                                    </td>
	                                    <td class="align-middle border-top-0">
	                                       <a href="#" class="fw-semibold text-inherit">
	                                          <h6 class="mb-0 product-name">${sub.product_name}</h6>
	                                       </a>
	                                       <span>
	                                       	<small class="text-muted">
	                                       	<c:if test="${sub.sub_period >= 12}">
	                                       		<fmt:formatNumber value="${sub.sub_period/12}" type="number"/>년
	                                       	</c:if>
	                                       	<c:if test="${sub.sub_period < 12}">
	                                       		${sub.sub_period}개월
	                                       	</c:if>
	                                       	</small>
	                                       </span>
	                                    </td>
	                                    <td class="align-middle border-top-0">${sub.sub_enddate}</td>
	                                    <td class="align-middle border-top-0">
	                                    <form action="${path}/subscribe/cancel" method="post" name="cancelForm">
	                                    	<input type="hidden" name="sub_name" value="${sub.product_name}">
											<input type="hidden" name="sub_seq" value="${sub.sub_seq}">
											<input type="hidden" name="sub_penalty" value="${sub.sub_penalty}">
	                                       	<button class="btn btn-danger btn-sm" id="cancel">해지신청</button>
	                                    </form>
	                                    </td>
	                                    <td class="align-middle border-top-0">
	                                    <form action="${path}/product/upgrade/list" method="get" name="upgradeForm">
											<input type="hidden" name="product_brand" value="${sub.product_brand}">
											<input type="hidden" name="product_grade" value="${sub.product_grade}">
											<input type="hidden" name="product_date" value="${sub.product_date}">
											<input type="hidden" name="category_seq" value="${sub.category_seq}">
											<button class="btn btn-primary btn-sm" id="upgrade" <c:if test="${sub.sub_isUpgrade != true}">disabled</c:if>>업그레이드</button>
										</form>
	                                    </td>
	                                    <td class="align-middle border-top-0">
	                                    	<fmt:formatNumber value="${sub.sub_total}" type="number" pattern="#,###"/>원
	                                    </td>
	                                 </tr>
                                 </c:forEach>
                              </tbody>
                           </table>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </section>
      </main>
	  <!-- Modal -->
	  <div id="confirmationModal" class="modal" tabindex="-1" role="dialog">
	    <div class="modal-dialog" role="document">
	      <div class="modal-content">
	        <div class="modal-header">
	          <h5 class="modal-title">해지 신청</h5>
	        </div>
	        <div class="modal-body">
	          <p>아래와 같이 해지하시겠습니까? <br>
	          	 상품명: <span id="productNameValue"></span><br>
	          	 위약금: <span id="penaltyValue"></span></p>
	        </div>
	        <div class="modal-footer">
	          <button type="button" id="closeModal" class="btn btn-secondary" data-dismiss="modal">취소</button>
	          <button type="button" id="confirmCancel" class="btn btn-primary">해지</button>
	        </div>
	      </div>
	    </div>
	  </div>	
      <!-- Footer -->
      <%-- <%@ include file="../partials/footer.html"%> --%>
      <!-- Javascript-->
      <script src="${path}/resources/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
	  <script src="${path}/resources/libs/simplebar/dist/simplebar.min.js"></script>
	  <script src="${path}/resources/js/main.js"></script>
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
      <script>
      var formToSubmit;
      
      $('form[name="cancelForm"]').on('submit', function(e) {
    	  e.preventDefault(); 
    	  var penaltyValue = $(this).find('input[name="sub_penalty"]').val();
    	  var productNameValue = $(this).find('input[name="sub_name"]').val();
    	  var formattedPenaltyValue = new Intl.NumberFormat('en-US').format(penaltyValue);
    	  $('#penaltyValue').text(formattedPenaltyValue);
    	  $('#productNameValue').text(productNameValue);
    	  $('#confirmationModal').modal('show');
    	  formToSubmit = this;
          });
      
      $('#confirmCancel').on('click', function() {
          $('#confirmationModal').modal('hide');
          formToSubmit.submit();
        });

      $('#closeModal').on('click', function() {
    	  $('#confirmationModal').modal('hide');
    	  });
      </script>
   </body>
</html>