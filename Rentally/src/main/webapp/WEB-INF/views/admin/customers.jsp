<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <%@ include file="../common/headMeta.jsp" %>
    <%@ include file="../common/headLinks.jsp" %>
    <c:set var="page" value="customers"/>
    <title>Customers Dashboard eCommerce HTML Template - FreshCart</title>
    <title>Customers Dashboard eCommerce HTML Template - FreshCart</title>
    <style>
        .customer-table {
            width: 100%;
            table-layout: fixed;
        }

        .customer-table th,
        .customer-table td {
            text-align: center;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }

        .customer-table th:nth-child(1),
        .customer-table td:nth-child(1) {
            width: 15%;
        }

        .customer-table th:nth-child(2),
        .customer-table td:nth-child(2) {
            width: 20%;
        }

        .customer-table th:nth-child(3),
        .customer-table td:nth-child(3) {
            width: 35%;
        }

        .customer-table th:nth-child(4),
        .customer-table td:nth-child(4) {
            width: 30%;
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
                        <h2>고객 리스트</h2>
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb mb-0">
                                <li class="breadcrumb-item"><a href="#">관리자</a></li>
                                <li class="breadcrumb-item active" aria-current="page">고객 리스트</li>
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
                                <table class="table table-centered table-hover table-borderless mb-0 customer-table text-nowrap">
                                    <thead class="bg-light">
                                    <tr>
                                        <th>ID</th>
                                        <th>이름</th>
                                        <th>Email</th>
                                        <th>Phone</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${customers}" var="customer">
                                        <tr class="customer-row">
                                            <td>${customer.cust_id}</td>
                                            <td>${customer.cust_name}</td>
                                            <td>${customer.cust_email}</td>
                                            <td>${customer.cust_phone}</td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <c:set var="baseUrl" value="../customer/list"/>
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
<script src="${path}/resources/css/theme.min.js"></script>
</body>
</html>
