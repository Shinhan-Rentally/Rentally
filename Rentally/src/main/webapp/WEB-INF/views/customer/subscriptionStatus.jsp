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
         <!-- section -->
         <section>
            <div class="container">
               <!-- row -->
               <div class="row">
				  <%@ include file="../common/myPageNavbar.jsp"%>
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
                                    <th></th>
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
	                                    <td class="align-middle border-top-0">
	                                    	<fmt:formatDate value="${sub.sub_enddate}" pattern="yyyy-MM-dd"/>
	                                    </td>
	                                    <td class="align-middle border-top-0">
	                                    <form action="${path}/subscribe/cancel" method="post" name="cancelForm">
	                                    	<input type="hidden" name="sub_name" value="${sub.product_name}">
											<input type="hidden" name="sub_seq" value="${sub.sub_seq}">
											<input type="hidden" name="sub_penalty" value="${sub.sub_penalty}">
	                                       	<button class="btn btn-danger btn-sm" id="cancel">해지신청</button>
	                                    </form>
	                                    </td>
	                                    <td class="align-middle border-top-0">
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
											<button class="btn btn-info btn-sm" id="upgrade" <c:if test="${sub.sub_isUpgrade != true}">disabled</c:if>>
												<c:if test="${sub.sub_upgrade == true}">업그레이드 완료</c:if>
												<c:if test="${sub.sub_upgrade != true}">업그레이드</c:if>
											</button>
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
	  <%@ include file="../common/bottomKakao.jsp" %>	
      <!-- Footer -->
      <%@ include file="../common/footer.jsp"%>
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