<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <%@ include file="../common/headMeta.jsp" %>
    <%@ include file="../common/headLinks.jsp" %>
    <c:set var="page" value="orders"/>
    <title>주문 관리 - Rentally</title>
    <style>
        .order-table {
            text-align: center;
        }
    </style>
</head>
<body>
<%@ include file="../common/adminTopNavbar.jsp" %>
<div class="main-wrapper">
    <%@ include file="../common/adminNavbar.jsp" %>
    <main class="main-content-wrapper">
        <div class="container">
            <div class="row mb-8">
                <div class="col-md-12">
                    <div>
                        <h2>주문 관리</h2>
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb mb-0">
                                <li class="breadcrumb-item"><a href="${path}/main">Home</a></li>
                                <li class="breadcrumb-item active" aria-current="page">주문 리스트</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-xl-12 col-12 mb-5">
                    <div class="card h-100 card-lg">
                        <div class="card-body p-0">
                            <div class="table-responsive">
                                <table class="table table-centered table-hover table-borderless mb-0 order-table text-nowrap">
                                    <thead class="bg-light">
                                    <tr>
                                        <th></th>
                                        <th>상품 ID</th>
                                        <th>고객명</th>
                                        <th>주문일</th>
                                        <th>결제 수단</th>
                                        <th>결제 금액</th>
                                        <th>구독일</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${orders}" var="order">
                                    <tr class="table">
                                        <td><img src="https://rentally.s3.ap-northeast-2.amazonaws.com/${order.category_seq}/${order.product_img}" width="48" height="48"></td>
                                        <td>${order.product_serial}</td>
                                        <td>${order.cust_name}</td>
                                        <td>${order.formattedSubDate}</td>
                                        <td>${order.sub_card}</td>
                                        <td><fmt:formatNumber value="${order.sub_total}" type="number" pattern="#,###"/>원</td>
                                        <td>${order.end_date}</td>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <c:set var="baseUrl" value="../order/list"/>
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
<script src="${path}/resources/css/theme.css"></script>
</body>
</html>
