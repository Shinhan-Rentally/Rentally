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
</head>
   <body>
      <%-- <%@ include file="../partials/navbar.html"%> --%>
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
                              <a class="nav-link" href="../index.html">
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
	                                       <a href="#"><img src="${path}/resources/images/products/product-img-1.jpg" alt="Ecommerce" class="icon-shape icon-xl" /></a>
	                                    </td>
	                                    <td class="align-middle border-top-0">
	                                       <a href="#" class="fw-semibold text-inherit">
	                                          <h6 class="mb-0">${sub.product_name}</h6>
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
	                                    <form action="" method="post">
											<input type="hidden" name="" value="">
	                                       	<button class="btn btn-danger">해지신청</button>
	                                    </form>
	                                    </td>
	                                    <td class="align-middle border-top-0">
	                                    <form action="" method="post">
											<input type="hidden" name="" value="">
											<button class="btn btn-primary">업그레이드</button>
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

      <!-- Footer -->
      <%-- <%@ include file="../partials/footer.html"%> --%>
      <!-- Javascript-->
      <%-- <%@ include file="../partials/scripts.html"%> --%>
   </body>
</html>