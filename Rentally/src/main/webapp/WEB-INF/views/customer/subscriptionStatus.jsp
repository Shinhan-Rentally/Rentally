<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../common/headMeta.jsp"%>
<title>구독현황 - Rentally</title>
<%@ include file="../common/headLinks.jsp"%>
<c:set var="page" value="subscribe" />
<style>
	.product-name {
		white-space: pre-wrap; /* 줄바꿈 문자를 인식하도록 설정 */
	}
</style>
</head>
   <body>
      <%@ include file="../common/header.jsp"%>
      <main>
         <section>
            <div class="container">
               <div class="row">
				  <%@ include file="../common/myPageNavbar.jsp"%>
                  <div class="col-lg-9 col-md-8 col-12">
                     <div class="py-6 p-md-6 p-lg-10">
                        <h2 class="mb-6">구독현황</h2>
						<p>${fn:length(subscribeList)}개의 상품을 구독하고 있습니다.</p>
                        <div class="table-responsive-xxl border-0">
                           <table class="table mb-0 text-nowrap table-centered">
                              <thead class="bg-light">
                                 <tr>
                                    <th></th>
                                    <th class="text-center">상품명</th>
                                    <th class="text-center">만료일</th>
                                    <th class="text-center">월 구독료</th>
                                    <th class="text-center">업그레이드</th>
                                    <th class="text-center">해지</th>
                                 </tr>
                              </thead>
                              <tbody>
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
	                                       	<small class="text-muted">${sub.sub_period}개월</small>
	                                       </span>
	                                    </td>
	                                    <td class="align-middle border-top-0 text-center">
	                                    	<fmt:formatDate value="${sub.sub_enddate}" pattern="yyyy-MM-dd"/>
	                                    </td>
	                                    <td class="align-middle border-top-0 text-center">
	                                    	<fmt:formatNumber value="${sub.sub_total}" type="number" pattern="#,###"/>원
	                                    </td>
	                                    <td class="align-middle border-top-0 text-center">
	                                    <form action="${path}/product/upgrade/list" method="post" name="upgradeForm">
	                                    	<input type="hidden" name="sub_seq" value="${sub.sub_seq}">
	                                    	<input type="hidden" name="product_seq" value="${sub.product_seq}">
											<input type="hidden" name="product_brand" value="${sub.product_brand}">
											<input type="hidden" name="product_grade" value="${sub.product_grade}">
											<input type="hidden" name="product_date" value="${sub.product_date}">
											<input type="hidden" name="category_seq" value="${sub.category_seq}">
											<input type="hidden" name="sub_total" value="${sub.sub_total}">
											<input type="hidden" name="sub_date" value="${sub.sub_date}">
											<input type="hidden" name="sub_period" value="${sub.sub_period}">
											
											<c:if test="${sub.sub_isUpgrade == true}">
												<button class="btn btn-info btn-sm" id="upgrade" style="width: 99.11px;">
													<c:if test="${sub.sub_upgrade != true}">업그레이드</c:if>
												</button>
											</c:if>
											<c:if test="${sub.sub_isUpgrade != true}">
												<c:if test="${sub.sub_upgrade == true}">
													<button class="btn btn-info btn-sm" id="upgrade" disabled>
														업그레이드 완료
													</button>
												</c:if>
												<c:if test="${sub.sub_upgrade != true}">
													<button class="btn btn-secondary btn-sm" id="upgrade" disabled>
														업그레이드 불가
													</button>
												</c:if>
											</c:if>
										</form>
	                                    </td>
	                                    <td class="align-middle border-top-0 text-center">
	                                    <form action="${path}/subscribe/cancel" method="post" name="cancelForm">
	                                    	<input type="hidden" name="sub_name" value="${sub.product_name}">
											<input type="hidden" name="sub_seq" value="${sub.sub_seq}">
											<input type="hidden" name="sub_penalty" value="${sub.sub_penalty}">
	                                       	<button class="btn btn-danger btn-sm" id="cancel">해지신청</button>
	                                    </form>
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

	  <div id="confirmationModal" class="modal" tabindex="-1" role="dialog">
	    <div class="modal-dialog" role="document">
	      <div class="modal-content">
	        <div class="modal-header">
	          <h5 class="modal-title">해지 신청</h5>
	        </div>
	        <div class="modal-body">
	          <p>아래와 같이 해지하시겠습니까? <br><br>
	          	 상품명: <span id="productNameValue"></span><br>
	          	 위약금: <span id="penaltyValue"></span><br><br>
	          	 <small class="text-muted">※ 위약금과 관련된 상세 정보는 <a href="${path}/faq/list">FAQ</a>를 확인해주세요.</small>
	          </p>
	        </div>
	        <div class="modal-footer">
	          <button type="button" id="closeModal" class="btn btn-secondary" data-dismiss="modal">취소</button>
	          <button type="button" id="confirmCancel" class="btn btn-info">해지</button>
	        </div>
	      </div>
	    </div>
	  </div>
	  <%@ include file="../common/bottomKakao.jsp" %>	
      <%@ include file="../common/footer.jsp" %>

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
    	  $('#penaltyValue').text(formattedPenaltyValue+'원');
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