<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="page" value="reviews" />
<c:set var="path" value="${pageContext.servletContext.contextPath}" scope="application"></c:set>

<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta content="Codescandy" name="author">
    <title>Reviews Dashboard eCommerce HTML Template - FreshCart</title>
    <!-- Favicon icon-->
    <link rel="shortcut icon" type="image/x-icon" href="../assets/images/favicon/favicon.ico">

    <!-- Libs CSS -->
    <link href="${path}/resources/libs/bootstrap-icons/font/bootstrap-icons.min.css" rel="stylesheet">
    <link href="${path}/resources/libs/feather-webfont/dist/feather-icons.css" rel="stylesheet">
    <link href="${path}/resources/libs/simplebar/dist/simplebar.min.css" rel="stylesheet">

    <!-- Theme CSS -->
    <link rel="stylesheet" href="${path}/resources/css/theme.css">
</head>

<body>
<!-- navbar -->
<%@ include file="../common/adminTopNavbar.jsp" %>
<div class="main-wrapper">
    <%@ include file="../common/adminNavbar.jsp" %>

    <main class="main-content-wrapper">
        <div class="container">
            <div class="row mb-4">
                <div class="col-md-12">
                    <h2>Reviews</h2>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb mb-0">
                            <li class="breadcrumb-item"><a href="#" class="text-inherit">Dashboard</a></li>
                            <li class="breadcrumb-item active" aria-current="page">Reviews</li>
                        </ol>
                    </nav>
                </div>
            </div>

            <!-- Review Filter & Table -->
            <div class="row">
                <div class="col-xl-12 col-12 mb-5">
                    <div class="card h-100 card-lg">
                        <!-- Card Header with Filter -->
                        <div class="card-header p-4">
                            <div class="row justify-content-end">
                                <div class="col-md-4 col-12">
                                    <!-- Filter by Rating -->
                                    <select class="form-select" onchange="filterByRating(this)">
                                        <option selected value="">Select Rating</option>
                                        <option value="1">One</option>
                                        <option value="2">Two</option>
                                        <option value="3">Three</option>
                                        <option value="4">Four</option>
                                        <option value="5">Five</option>
                                    </select>
                                </div>
                            </div>
                        </div>

                        <!-- Card Body with Table -->
                        <div class="card-body p-0">
                            <div class="table-responsive">
                                <table class="table table-centered table-hover table-borderless mb-0 text-nowrap">
                                    <thead class="bg-light">
                                    <tr>
                                        <th>Product</th>
                                        <th>ID</th>
                                        <th>Reviews</th>
                                        <th>Rating</th>
                                        <th>Date</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${reviews}" var="review">
                                        <tr class="table">
                                            <td>${review.product_seq}</td>
                                            <td>${review.cust_id}</td>
                                            <td>${review.review_content}</td>
                                            <td>
                                                <div class="star-rating">
                                                    <c:forEach begin="1" end="5" var="i">
                                                        <span class="${i <= review.review_rate ? 'text-warning' : 'text-light'}">
                                                            <i class="bi bi-star-fill"></i>
                                                        </span>
                                                    </c:forEach>
                                                </div>
                                            </td>
                                            <td>${review.review_date}</td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>

                        <!-- Pagination -->
                        <div class="card-footer d-flex justify-content-between align-items-center p-4">
                            <span>Showing ${currentPage * 10 - 9} to ${currentPage * 10 > totalReviews ? totalReviews : currentPage * 10} of ${totalReviews} entries</span>
                            <nav>
                                <ul class="pagination mb-0">
                                    <!-- Previous Button -->
                                    <c:if test="${currentPage > 1}">
                                        <li class="page-item">
                                            <a class="page-link" href="../review/list?page=${currentPage - 1}&size=10">Previous</a>
                                        </li>
                                    </c:if>

                                    <!-- Page Numbers -->
                                    <c:forEach var="i" begin="1" end="${totalPages}">
                                        <li class="page-item ${currentPage == i ? 'active' : ''}">
                                            <a class="page-link" href="../review/list?page=${i}&size=10">${i}</a>
                                        </li>
                                    </c:forEach>

                                    <!-- Next Button -->
                                    <c:if test="${currentPage < totalPages}">
                                        <li class="page-item">
                                            <a class="page-link" href="../review/list?page=${currentPage + 1}&size=10">Next</a>
                                        </li>
                                    </c:if>
                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>

    <script>
        // 평점을 선택하면 URL을 갱신하여 필터링된 리뷰만 가져오기
        function filterByRating(select) {
            var rating = select.value;
            var url = '../review/list';
            if (rating) {
                url += '?rating=' + rating;
            }
            window.location.href = url;
        }
    </script>


<!-- Libs JS -->
<!-- <script src="../assets/libs/jquery/dist/jquery.min.js"></script> -->
<script src="../assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<script src="../assets/libs/simplebar/dist/simplebar.min.js"></script>

<!-- Theme JS -->
<script src="../assets/js/theme.min.js"></script>

</body>
</html>

