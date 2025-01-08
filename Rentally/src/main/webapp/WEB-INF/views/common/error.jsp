<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<head>
<%@ include file="../common/headMeta.jsp"%>
<title>Error - Rentally</title>
<%@ include file="../common/headLinks.jsp"%>
</head>
</head>
<body>
      <main>
         <!-- section -->
         <section>
            <div class="container d-flex flex-column">
               <!-- row -->
               <div class="row min-vh-100 justify-content-center align-items-center">
                  <!-- col -->
                  <div class="offset-lg-1 col-lg-10 py-8 py-xl-0">
                     
                     <div class="row justify-content-center align-items-center">
                        <!-- content -->
                        <div class="col-md-3">
                           <div>
                              <!-- img -->
                              <svg xmlns="http://www.w3.org/2000/svg" width="200" height="200" fill="currentColor" class="bi bi-exclamation-triangle-fill" viewBox="0 0 16 16">
								  <path d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5m.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2"/>
							  </svg>
                           </div>
                        </div>
                        <div class="col-md-5">
                           <div class="mb-6 mb-lg-0">
                              <h1>불편을 드려 죄송합니다.</h1>
                              <p class="mb-8">비정상적인 경로로 접근하였습니다.</p>
                              <!-- btn -->
                              <button type="button" class="btn btn-info col-md-10">홈으로</button>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </section>
      </main>
      
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
      <script>
      	$('button').on('click',function(){
      		window.location.href = '${path}/main';
      	});
      </script>
</body>
</html>