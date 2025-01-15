<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<footer class="footer">
  <div class="container">
    <div class="col-md-6">
      <span class="text-dark">Rentally</span><br>
      <span class="text-dark">소재지: 서울 마포구 월드컵북로4길 77(ANT빌딩), 1층 &nbsp;사업자등록번호: 000-000-0000</span><br>
      <span class="text-dark">대표번호: 02-6392-0044 &nbsp;이메일: rentally@gmail.com</span>
    </div>
    <!-- 결제수단 정보라인 -->
    <div class="border-top py-4">
      <div class="row align-items-center">
        <div class="col-lg-5 text-lg-start text-center mb-2 mb-lg-0">
          <ul class="list-inline mb-0">
            <li class="list-inline-item">Payment Partners</li>
            <li class="list-inline-item">
              <a href="#!"><img src="${path}/resources/images/payment/visa.svg" alt=""></a>
            </li>
            <li class="list-inline-item">
              <a href="#!"><img src="${path}/resources/images/payment/mastercard.svg" alt=""></a>
            </li>
          </ul>
        </div>
      </div>
    </div>
    <div class="border-top py-4">
      <div class="row align-items-center">
        <div class="col-md-6">
          <span class="small text-muted">© 2024 
            <span id="copyright">
              - <script>document.getElementById('copyright').appendChild(document.createTextNode(new Date().getFullYear()))</script>
            </span> 가전구독 서비스 Rentally. All rights reserved.
          </span>
        </div>
      <div class="col-md-6">
          <ul class="list-inline text-md-end mb-0 small mt-3 mt-md-0">
            <li class="list-inline-item text-muted">Follow us on</li>
            <li class="list-inline-item">
              	<img class="btn-social" src="https://d14b80fsv1tvpk.cloudfront.net/logo/kakao_gray.png?w=30&h=30&f=webp&q=80" style="width:30px; height:30px;"/>
            </li>
          </ul>
		</div>
      </div>
    </div>
  </div>
</footer>
