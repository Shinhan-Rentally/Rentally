<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <%@ include file="../common/headMeta.jsp" %>
    <%@ include file="../common/headLinks.jsp" %>
    <c:set var="page" value="reviews"/>
    <title>리뷰 관리 - Rentally</title>
    <style>
        .review-table th,
        .review-table td {
            text-align: center;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }

        .review-table th:nth-child(1),
        .review-table td:nth-child(1) {
            width: 15%;
        }

        .review-table th:nth-child(2),
        .review-table td:nth-child(2) {
            width: 15%;
        }

        .review-table th:nth-child(3),
        .review-table td:nth-child(3) {
            width: 40%;
            text-align: left;
        }

        .review-table th:nth-child(4),
        .review-table td:nth-child(4) {
            width: 15%;
        }

        .review-table th:nth-child(5),
        .review-table td:nth-child(5) {
            width: 15%;
        }

        /* 리뷰 내용 길어지면 ...으로 표시 */
        .review-content {
            max-width: 300px;  /* 최대 너비 설정 */
            overflow: hidden;  /* 넘치는 부분 숨김 */
            text-overflow: ellipsis; /* '...' 표시 */
            white-space: nowrap; /* 줄바꿈 방지 */
        }

        .star-rating span {
            font-size: 1rem;
        }
    </style>
</head>
<body>
<%@ include file="../common/adminTopNavbar.jsp" %>
<div class="main-wrapper">
    <%@ include file="../common/adminNavbar.jsp" %>
    <main class="main-content-wrapper">
        <div class="container">
            <div class="row mb-4">
                <div class="col-md-12">
                    <h2>리뷰 관리</h2>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb mb-0">
                            <li class="breadcrumb-item"><a href="${path}/main">Home</a></li>
                            <li class="breadcrumb-item active" aria-current="page">리뷰</li>
                        </ol>
                    </nav>
                </div>
            </div>
            <div class="row">
                <div class="col-xl-12 col-12 mb-5">
                    <div class="card h-100 card-lg">
                        <div class="card-header p-4">
                            <div class="row justify-content-end">
                                <div class="col-md-4 col-12">
                                    <select class="form-select" onchange="filterByRating(this)">
                                        <option selected>별점</option>
                                        <option value="1">1점</option>
                                        <option value="2">2점</option>
                                        <option value="3">3점</option>
                                        <option value="4">4점</option>
                                        <option value="5">5점</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="card-body p-0">
                            <div class="table-responsive">
                                <table class="table table-centered table-hover table-borderless mb-0 review-table text-nowrap">
                                    <thead class="bg-light">
                                    <tr>
                                        <th>상품명</th>
                                        <th>ID</th>
                                        <th>리뷰 내용</th>
                                        <th>별점</th>
                                        <th>날짜</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:choose>
                                        <c:when test="${not empty reviews}">
                                            <c:forEach items="${reviews}" var="review">
                                                <tr>
                                                    <td>${review.product_seq}</td>
                                                    <td>${review.cust_id}</td>
                                                    <td class="review-content">${review.review_content}</td>
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
                                        </c:when>
                                        <c:otherwise>
                                            <tr>
                                                <td colspan="5" class="text-center">등록된 리뷰가 없습니다.</td>
                                            </tr>
                                        </c:otherwise>
                                    </c:choose>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <c:set var="baseUrl" value="../review/list"/>
                        <c:set var="currentPage" value="${currentPage}"/>
                        <c:set var="totalPages" value="${totalPages}"/>
                        <c:set var="totalDatas" value="${totalItems}"/>
                        <%@ include file="../common/pagination.jsp" %>
                    </div>
                </div>
            </div>
        </div>
    </main>
</div>
<script src="${path}/resources/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<script src="${path}/resources/libs/simplebar/dist/simplebar.min.js"></script>
<script src="${path}/resources/js/theme.min.js"></script>
</body>
</html>

