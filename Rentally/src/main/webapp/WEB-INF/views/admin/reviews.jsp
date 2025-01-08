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

        .review-content {
            max-width: 300px;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
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
                                    <select class="form-select" id="rating">
                                    <option value="0" selected>별점</option>
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
                                <table id="board_dataTable"
                                       class="table table-centered table-hover table-borderless mb-0 review-table text-nowrap">
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
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div id="pagingBar" class="card-footer d-flex justify-content-between align-items-center p-4">
                            <span id="pagingCount"></span>
                            <nav>
                                <ul class="pagination justify-content-center" id="pagingUl"></ul>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="${path}/resources/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<script src="${path}/resources/libs/simplebar/dist/simplebar.min.js"></script>
<script src="${path}/resources/js/theme.min.js"></script>
<script src="${path}/resources/js/admin/initializePagination.js"></script>
<script src="${path}/resources/js/admin/loadData.js"></script>
<script src="${path}/resources/js/admin/pagination.js"></script>
<script>
    initializeRatingPagination('${path}');
</script>
</body>
</html>

