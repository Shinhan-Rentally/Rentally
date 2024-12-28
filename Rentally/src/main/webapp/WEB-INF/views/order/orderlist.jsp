<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Favicon icon-->
    <link rel="shortcut icon" type="image/x-icon" href="resources/images/favicon/favicon.ico">
    <!-- Theme CSS -->
    <!-- build:css @@webRoot/assets/css/theme.min.css -->
    <link rel="stylesheet" href="resources/css/theme.css">
    <link href="resources/libs/slick-carousel/slick/slick.css" rel="stylesheet" />
    <link href="resources/libs/slick-carousel/slick/slick-theme.css" rel="stylesheet" />
    <link href="resources/libs/tiny-slider/dist/tiny-slider.css" rel="stylesheet" />

    <meta charset="UTF-8">
    <%@ include file="../common/headMeta.jsp" %>
    <title>주문내역</title>
    <%@ include file="../common/headLinks.jsp" %>
    <!-- @@include("../partials/head/head-links.html") @@include("../partials/head/analytics-code.html") @@include("../partials/head/clarity.html") -->
</head>

<body>
<%@ include file="../common/header.jsp" %>
<main>
    <!-- section -->
    <section>
        <div class="container">
            <!-- row -->
            <div class="row">
                <!-- col -->
                <div class="col-12">
                    <div class="d-flex justify-content-between align-items-center d-md-none py-4">
                        <!-- heading -->
                        <h3 class="fs-5 mb-0">Account Setting</h3>
                        <!-- button -->
                        <button
                                class="btn btn-outline-gray-400 text-muted d-md-none btn-icon btn-sm ms-3"
                                type="button"
                                data-bs-toggle="offcanvas"
                                data-bs-target="#offcanvasAccount"
                                aria-controls="offcanvasAccount">
                            <i class="bi bi-text-indent-left fs-3"></i>
                        </button>
                    </div>
                </div>
                <!-- col -->
                <div class="col-lg-3 col-md-4 col-12 border-end d-none d-md-block">
                    <div class="pt-10 pe-lg-10">
                        <!-- nav item -->
                        <ul class="nav flex-column nav-pills nav-pills-dark">
                            <li class="nav-item">
                                <a class="nav-link active" aria-current="page" href="account-orders.html">
                                    <i class="feather-icon icon-shopping-bag me-2"></i>
                                    주문내역
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" aria-current="page" href="account-orders.html">
                                    <i class="feather-icon icon-shopping-bag me-2"></i>
                                    구독현황
                                </a>
                            </li>
                            <!-- nav item -->
                            <li class="nav-item">
                                <a class="nav-link" href="account-settings.html">
                                    <i class="feather-icon icon-settings me-2"></i>
                                    설정
                                </a>
                            </li>
                            <!-- nav item -->
                            <li class="nav-item">
                                <a class="nav-link" href="account-address.html">
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
                        <h2 class="mb-6">Your Orders</h2>

                        <div class="table-responsive-xxl border-0">
                            <!-- Table -->
                            <table class="table mb-0 text-nowrap table-centered">
                                <!-- Table Head -->
                                <thead class="bg-light">
                                <tr>
                                    <th>&nbsp;</th>
                                    <th>Product</th>
                                    <th>Order</th>
                                    <th>Date</th>
                                    <th>Amount</th>
                                    <th>리뷰등록</th>

                                    <th></th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="order" items="${myOrders}">
                                    <tr>
                                        <td class="align-middle border-top-0 w-0">
                                            <a href="#"><img
                                                    src="https://rentally.s3.ap-northeast-2.amazonaws.com/${order.category_seq}/${order.product_img}"
                                                    width="64"
                                                    height="64"
                                                    style="object-fit: cover;"
                                            /></a>
                                        </td>
                                        <td class="align-middle border-top-0">
                                            <a href="#" class="fw-semibold text-inherit">
                                                <h6 class="mb-0">${order.product_name}</h6>
                                            </a>
                                            <span><small class="text-muted">${order.product_features}</small></span>
                                        </td>
                                        <td class="align-middle border-top-0">
                                            <a href="#" class="text-inherit">${order.product_serial}</a>
                                        </td>
                                        <td class="align-middle border-top-0">${order.sub_date}</td>
                                        <td class="align-middle border-top-0">${order.product_pay}</td>
                                        <td class="align-middle border-top-0">
                                            <button type="button" class="btn btn-info review-btn" data-bs-toggle="modal" data-bs-target="#reviewModal" data-product="Haldiram's Nagpur Aloo Bhujia">
                                                리뷰작성
                                            </button>
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

<!-- Javascript-->
<!--@@include("../partials/scripts.html")-->
<script src="resources/js/vendors/jquery.min.js"></script>
<script src="resources/js/vendors/countdown.js"></script>
<script src="resources/libs/slick-carousel/slick/slick.min.js"></script>
<script src="resources/js/vendors/slick-slider.js"></script>
<script src="resources/libs/tiny-slider/dist/min/tiny-slider.js"></script>
<script src="resources/js/vendors/tns-slider.js"></script>
<script src="resources/js/vendors/zoom.js"></script>
<!-- Footer -->
<%@ include file="../common/footer.jsp" %>
</body>
<script>
    document.addEventListener("DOMContentLoaded", function () {
        // 모든 "리뷰작성" 버튼 가져오기
        const reviewButtons = document.querySelectorAll(".review-btn");
        // 모달의 상품 정보 표시 영역
        const productInfo = document.getElementById("productInfo");

        reviewButtons.forEach(button => {
            button.addEventListener("click", function () {
                // 버튼의 data-product 속성 값 가져오기
                const productName = this.getAttribute("data-product");
                // 모달에 상품 정보 표시
                productInfo.textContent = `상품명: ${productName}`;
            });
        });
    });
</script>
</html>

