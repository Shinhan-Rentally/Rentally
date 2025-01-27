<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- 마이페이지 내 왼쪽 메뉴 -->
<div class="col-lg-3 col-md-4 col-12 border-end d-none d-md-block">
   <div class="pt-10 pe-lg-10">
      <ul class="nav flex-column nav-pills nav-pills-dark">
         <li class="nav-item">
            <a class="nav-link ${page == 'order' ? 'active' : ''}" href="${path}/order/list">
               <i class="feather-icon icon-file-minus me-2"></i>
               주문내역
            </a>
         </li>
         <li class="nav-item">
            <a class="nav-link ${page == 'subscribe' ? 'active' : ''}" href="${path}/subscribe/list">
               <i class="feather-icon icon-check-square me-2"></i>
               구독현황
            </a>
         </li>
         <li class="nav-item">
            <a class="nav-link ${page == 'wishlist' ? 'active' : ''}" href="${path}/wishlist/list">
               <i class="feather-icon icon-heart me-2"></i>
               위시리스트
            </a>
         </li>
         <li class="nav-item">
            <a class="nav-link ${page == 'cart' ? 'active' : ''}" href="${path}/cart/list">
               <i class="feather-icon icon-shopping-cart me-2"></i>
               장바구니
            </a>
         </li>
         <li class="nav-item">
            <a class="nav-link ${page == 'settings' ? 'active' : ''}" href="${path}/customer/list">
               <i class="feather-icon icon-settings me-2"></i>
               설정
            </a>
         </li>
         <li class="nav-item">
            <a class="nav-link ${page == 'address' ? 'active' : ''}" href="${path}/address/list">
               <i class="feather-icon icon-map-pin me-2"></i>
               주소지
            </a>
         </li>
         <li class="nav-item">
            <hr />
         </li>
         <li class="nav-item">
            <a class="nav-link" href="${path}/customer/logout">
               <i class="feather-icon icon-log-out me-2"></i>
               로그아웃
            </a>
         </li>
      </ul>
   </div>
</div>