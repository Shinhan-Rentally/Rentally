<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../common/headMeta.jsp"%>
<title>제품 비교하기 - Rentally</title>
<%@ include file="../common/headLinks.jsp"%>
<style>
.card-product img {
    width: 100%;
    height: 200px;  /* 원하는 높이로 설정 */
    object-fit: contain;  /* 비율을 유지하며 이미지가 잘리지 않도록 축소 */
}
</style>
</head>
<body>
	  <%@include file="../common/header.jsp"%>
      <main>
         <div class="mt-8 mb-lg-14 mb-8">
            <div class="container">
               <div class="row gx-10">
                  <section class="col-lg-12">
                     <div class="card mb-4 bg-light border-0">
                        <div class="card-body p-9">
                           <h2 class="mb-0 fs-1">선택한 제품 비교하기</h2>
                        </div>
                     </div>
                     <div class="row g-4 row-cols-xl-2 row-cols-lg-3 row-cols-2 row-cols-md-2 mt-2">
                     <c:forEach items="${compareList}" var="compare">
                        <div>
                           <div class="card card-product">
                              <div class="card-body">
                                 <div class="text-center position-relative">
                                    <a href="${path}/product/detail?product_seq=${compare.product_seq}">
                                    	<img src="https://rentally.s3.ap-northeast-2.amazonaws.com/${compare.category_seq}/${compare.product_img}" alt="${compare.product_name}" class="mb-3 img-fluid" />
                                    </a>
                                 </div>
                                 <h2 class="fs-5 text-center">
                                 	<a href="${path}/product/detail?product_seq=${compare.product_seq}" class="text-inherit text-decoration-none">${compare.product_name}</a>
                                 </h2>
                                 <div class="text-small mb-1 text-center">
                                    <small>${compare.product_serial}</small>
                                 </div>
                                 <div class="text-center mt-3">
                                    <div>
                                       <span class="text-dark">
                                       		월 <fmt:formatNumber value="${compare.product_pay}" type="number" pattern="#,###" />원
                                       </span>
                                    </div>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </c:forEach>
                     <c:if test="${fn:length(compareList) > 0}">
	                     <table class="table">
							<tbody>
								<tr>
									
									<td class="text-center">${compareList[0].product_brand}</td>
									<th class="text-center">브랜드</th>
									<td class="text-center">${compareList[1].product_brand}</td>
								</tr>
								<tr>
									
									<td class="text-center">${compareList[0].product_date}</td>
									<th class="text-center">출시날짜</th>
									<td class="text-center">${compareList[1].product_date}</td>
								</tr>
								<tr>
									<td class="text-center">${compareList[0].product_height}</td>
									<th class="text-center">크기</th>
									<td class="text-center">${compareList[1].product_height}</td>
								</tr>
								<tr>
									<td class="text-center">${compareList[0].product_weight}</td>
									<th class="text-center">무게</th>
									<td class="text-center">${compareList[1].product_weight}</td>
								</tr>
								<tr>
									<td class="text-center">${compareList[0].product_wh}</td>
									<th class="text-center">소비전력</th>
									<td class="text-center">${compareList[1].product_wh}</td>
								</tr>
								<tr>
									<td class="text-center">${compareList[0].product_color}</td>
									<th class="text-center">색상</th>
									<td class="text-center">${compareList[1].product_color}</td>
								</tr>
								<tr>
									<td class="text-center">${compareList[0].product_features}</td>
									<th class="text-center">특징</th>
									<td class="text-center">${compareList[1].product_features}</td>
								</tr>
							</tbody>
	                     </table>
                     </c:if>
                     </div>
                  </section>
               </div>
            </div>
         </div>
      </main>
	  <%@ include file="../common/bottomKakao.jsp" %>
      <%@ include file="../common/footer.jsp"%>
</body>
</html>