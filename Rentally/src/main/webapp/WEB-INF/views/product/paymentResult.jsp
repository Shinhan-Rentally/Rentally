<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../common/headMeta.jsp"%>
<title>Shop Checkout eCommerce HTML Template - FreshCart</title>
<%@ include file="../common/headLinks.jsp"%>
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
                           <h2 class="mb-0 fs-1">결제 완료</h2>
                        </div>
                     </div>
                     <!-- row -->
                     <div class="row g-4 row-cols-1 mt-2">
                        <div class="col">
                           <!-- card -->
                           <div class="card card-product">
                              <!-- card body -->
                              <div class="card-body">
                                 <div class="row align-items-center">
                                    <!-- col -->
                                    <div class="col-12">
                                       <div class="text-center position-relative">
                                             ${resultMessage}이 완료되었습니다.<br>
                                             상세 내역은 
                                             <a href="#">주문내역</a> /
                                             <a href="${path}/subscribe/list"> 구독현황</a>을 참고해주세요.
                                       </div>
                                    </div>
                                 </div>
                              </div>
                           </div>
                        </div> 
                     </div>
                  </section>
               </div>
            </div>
         </div>
      </main>
      <%@ include file="../common/footer.jsp"%>
</body>
</html>