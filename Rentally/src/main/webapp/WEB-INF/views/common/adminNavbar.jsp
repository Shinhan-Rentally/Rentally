<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!-- Vertical Navbar -->
<nav class="navbar-vertical-nav d-none d-xl-block">
  <div class="navbar-vertical">
    <div class="px-4 py-5">
      <a href="${path}/main" class="navbar-brand">
        <img src="https://rentally.s3.ap-northeast-2.amazonaws.com/logo/RENTALLY_LOGO.png"
              style="width:200px; height:60px;"
        />
      </a>
    </div>
    <div class="navbar-vertical-content flex-grow-1" data-simplebar>
      <ul class="navbar-nav flex-column" id="sideNavbar">
        <li class="nav-item mt-6 mb-3">
          <span class="nav-label">Store Managements</span>
        </li>
        <li class="nav-item">
          <a class="nav-link ${page == 'products' ? 'active' : ''}" href="${path}/admin/product/list">
            <div class="d-flex align-items-center">
              <span class="nav-link-icon"><i class="bi bi-cart"></i></span>
              <span class="nav-link-text">상품 관리</span>
            </div>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link ${page == 'orders' ? 'active' : ''}" href="${path}/admin/order/list">
            <div class="d-flex align-items-center">
              <span class="nav-link-icon"><i class="bi bi-bag"></i></span>
              <span class="nav-link-text">주문 관리</span>
            </div>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link ${page == 'customers' ? 'active' : ''}"href="${path}/admin/customer/list">
            <div class="d-flex align-items-center">
              <span class="nav-link-icon"><i class="bi bi-people"></i></span>
              <span class="nav-link-text">고객 관리</span>
            </div>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link ${page == 'reviews' ? 'active' : ''}" href="${path}/admin/review/list">
            <div class="d-flex align-items-center">
              <span class="nav-link-icon"><i class="bi bi-star"></i></span>
              <span class="nav-link-text">리뷰 관리</span>
            </div>
          </a>
        </li>
      </ul>
    </div>
  </div>
</nav>

<!-- Offcanvas Navbar -->
<nav class="navbar-vertical-nav offcanvas offcanvas-start navbar-offcanvas" style="width: 279px;" tabindex="-1" id="offcanvasExample">
  <div class="navbar-vertical">
    <div class="px-4 py-5 d-flex justify-content-between align-items-center">
      <a href="${path}/main" class="navbar-brand">
        <img src="https://rentally.s3.ap-northeast-2.amazonaws.com/logo/RENTALLY_LOGO.png"
             style="width:200px; height:60px;"/>
      </a>
      <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
    </div>
    <div class="navbar-vertical-content flex-grow-1" data-simplebar>
      <ul class="navbar-nav flex-column">
        <li class="nav-item mt-6 mb-3">
          <span class="nav-label">Store Managements</span>
        </li>
        <!-- Shared Items -->
        <li class="nav-item">
          <a class="nav-link ${page == 'products' ? 'active' : ''}" href="${path}/admin/product/list">
            <div class="d-flex align-items-center">
              <span class="nav-link-icon"><i class="bi bi-cart"></i></span>
              <span class="nav-link-text">상품 관리</span>
            </div>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link ${page == 'orders' ? 'active' : ''}" href="${path}/admin/order/list">
            <div class="d-flex align-items-center">
              <span class="nav-link-icon"><i class="bi bi-bag"></i></span>
              <span class="nav-link-text">주문 관리</span>
            </div>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link ${page == 'customers' ? 'active' : ''}"href="${path}/admin/customer/list">
            <div class="d-flex align-items-center">
              <span class="nav-link-icon"><i class="bi bi-people"></i></span>
              <span class="nav-link-text">고객 관리</span>
            </div>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link ${page == 'reviews' ? 'active' : ''}" href="${path}/admin/review/list">
            <div class="d-flex align-items-center">
              <span class="nav-link-icon"><i class="bi bi-star"></i></span>
              <span class="nav-link-text">리뷰 관리</span>
            </div>
          </a>
        </li>
      </ul>
    </div>
  </div>
</nav>