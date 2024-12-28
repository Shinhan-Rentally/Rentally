<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- BootStrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
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
    <!-- star style -->
    <style>
        .star-rating {
            font-size: 1.5rem;
            cursor: pointer;
        }
        /* 비어 있는 별 스타일 */
        .star-rating .bi-star {
            color: #ccc; /* 회색 */
        }
        /* 채워진 별 스타일 */
        .star-rating .bi-star-fill {
            color: #ffcc00; /* 완전한 노란색 */
        }
    </style>
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
                                            <button type="button"
                                                    class="btn btn-info review-btn"
                                                    data-bs-toggle="modal"
                                                    data-bs-target="#reviewModal"
                                                    data-product="Haldiram's Nagpur Aloo Bhujia"
                                                    data-cust-seq="${order.cust_seq}"
                                                    data-product-name="${order.product_name}"
                                                    data-product-seq="${order.product_seq}">
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
<!-- modal -->

<div class="offcanvas offcanvas-start" tabindex="-1" id="offcanvasAccount" aria-labelledby="offcanvasAccountLabel">
    <!-- offcanvas header -->
    <div class="offcanvas-header">
        <h5 class="offcanvas-title" id="offcanvasAccountLabel">Offcanvas</h5>
        <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
    </div>
    <!-- offcanvas body -->
    <div class="offcanvas-body">
        <ul class="nav flex-column nav-pills nav-pills-dark">
            <!-- nav item -->
            <li class="nav-item">
                <a class="nav-link active" aria-current="page" href="account-orders.html">
                    <i class="feather-icon icon-shopping-bag me-2"></i>
                    Your Orders
                </a>
            </li>
            <!-- nav item -->
            <li class="nav-item">
                <a class="nav-link" href="account-settings.html">
                    <i class="feather-icon icon-settings me-2"></i>
                    Settings
                </a>
            </li>
            <!-- nav item -->
            <li class="nav-item">
                <a class="nav-link" href="account-address.html">
                    <i class="feather-icon icon-map-pin me-2"></i>
                    Address
                </a>
            </li>
            <!-- nav item -->
            <li class="nav-item">
                <a class="nav-link" href="account-payment-method.html">
                    <i class="feather-icon icon-credit-card me-2"></i>
                    Payment Method
                </a>
            </li>
            <!-- nav item -->
            <li class="nav-item">
                <a class="nav-link" href="account-notification.html">
                    <i class="feather-icon icon-bell me-2"></i>
                    Notification
                </a>
            </li>
        </ul>
        <hr class="my-6" />
        <div>
            <!-- nav  -->
            <ul class="nav flex-column nav-pills nav-pills-dark">
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
</div>
<!-- 리뷰 등록 모달 -->
<div class="modal fade" id="reviewModal" tabindex="-1" aria-labelledby="reviewModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="reviewModalLabel">Create Review</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="review/add" method="post">
                <div class="modal-body">
                    <div class="input-group mb-3">
                        <input type="text"
                               class="form-control" id="productInfo"
                               readonly>
                    </div>
                    <div class="mb-4">
                        <label class="form-label fw-bold">Overall rating</label>
                        <div class="star-rating">
                            <i class="bi bi-star" data-value="1"></i>
                            <i class="bi bi-star" data-value="2"></i>
                            <i class="bi bi-star" data-value="3"></i>
                            <i class="bi bi-star" data-value="4"></i>
                            <i class="bi bi-star" data-value="5"></i>
                        </div>
                    </div>
                    <!-- Textarea for Review -->
                    <div class="mb-3">
                        <label for="reviewText" class="form-label">Add a written review</label>
                        <textarea class="form-control" id="reviewText" rows="3" placeholder="상품과 관련된 리뷰를 작성해주세요."></textarea>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                    <button id="addReview" type="button" class="btn btn-info">리뷰 등록</button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Javascript-->
<!--@@include("../partials/scripts.html")-->
<script src="resources/js/vendors/jquery.min.js"></script>
<script src="resources/js/vendors/countdown.js"></script>
<script src="resources/libs/slick-carousel/slick/slick.min.js"></script>
<script src="resources/js/vendors/slick-slider.js"></script>
<script src="resources/libs/tiny-slider/dist/min/tiny-slider.js"></script>
<script src="resources/js/vendors/tns-slider.js"></script>
<script src="resources/js/vendors/zoom.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<!-- Footer -->
<%@ include file="../common/footer.jsp" %>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script>
    // 별점 컨테이너 가져오기
    const stars = document.querySelectorAll('.star-rating .bi');

    stars.forEach((star) => {
        star.addEventListener('click', (event) => {
            const value = parseInt(event.target.getAttribute('data-value'));

            // 별점 초기화 및 업데이트
            stars.forEach((s, index) => {
                if (index < value) {
                    s.classList.remove('bi-star'); // 비어 있는 별 제거
                    s.classList.add('bi-star-fill'); // 채워진 별 추가
                } else {
                    s.classList.remove('bi-star-fill'); // 채워진 별 제거
                    s.classList.add('bi-star'); // 비어 있는 별 추가
                }
            });
        });
    });
</script>
<script>
    document.addEventListener("DOMContentLoaded", function () {
        // 리뷰 버튼 클릭 시 데이터 설정
        const reviewButtons = document.querySelectorAll(".review-btn");

        reviewButtons.forEach(button => {
            button.addEventListener("click", function () {
                // 버튼의 data-* 속성 값 가져오기
                const custSeq = this.getAttribute("data-cust-seq");
                const productSeq = this.getAttribute("data-product-seq");
                const productName = this.getAttribute("data-product-name");

                // 모달에 데이터 설정
                const reviewModal = document.getElementById("reviewModal");
                reviewModal.setAttribute("data-cust-seq", custSeq);
                reviewModal.setAttribute("data-product-seq", productSeq);
                document.getElementById('productInfo').value = productName;

            });
        });

        // 리뷰 등록 버튼 클릭 이벤트
        document.getElementById("addReview").addEventListener("click", function (event) {
            event.preventDefault();

            // 모달에서 설정된 데이터 가져오기
            reviewModal = document.getElementById("reviewModal");
            custSeq = reviewModal.getAttribute("data-cust-seq");
            productSeq = reviewModal.getAttribute("data-product-seq");
            reviewContent = document.getElementById("reviewText").value;
            reviewRate = document.querySelectorAll(".bi-star-fill").length;

            // Ajax 요청 데이터
            // const reviewData = {
            //     cust_seq: custSeq,
            //     product_seq: productSeq,
            //     review_content: reviewContent,
            //     review_rate: reviewRate
            // };

            // Ajax 요청
            $.ajax({
                url: `/shinhan_war_exploded/review/${custSeq}/add`,
                type: "POST",
                contentType: "application/json",
                //data: JSON.stringify(reviewData),
                data: JSON.stringify({
                    cust_seq: custSeq,
                    product_seq: productSeq,
                    review_content: reviewContent,
                    review_rate: reviewRate
                }),
                success: function (response) {
                    alert("리뷰가 성공적으로 등록되었습니다!");
                    bootstrapModal = bootstrap.Modal.getInstance(reviewModal);
                    bootstrapModal.hide(); // 모달 닫기
                    location.reload(); // 페이지 새로고침
                },
                error: function (err) {
                    alert("리뷰 등록에 실패했습니다. 다시 시도해주세요.");
                    console.error(err);
                }
            });
        });
    });
</script>
</html>

