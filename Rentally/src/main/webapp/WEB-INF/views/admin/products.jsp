<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <%@ include file="../common/headMeta.jsp" %>
    <%@ include file="../common/headLinks.jsp" %>
    <c:set var="page" value="products"/>
    <title>Products Dashboard eCommerce HTML Template - FreshCart</title>
    <style>
        th {
            text-align: center;
        }
        .product-name {
            text-align: left;
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
                    <div class="d-md-flex justify-content-between align-items-center">
                        <div>
                            <h2>상품 리스트</h2>
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb mb-0">
                                    <li class="breadcrumb-item"><a href="#">관리자</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">상품 리스트</li>
                                </ol>
                            </nav>
                        </div>
                        <div>
                            <a href="../product/add" class="btn btn-primary">상품 추가</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-xl-12 col-12 mb-5">
                    <div class="card h-100 card-lg">
                        <div class="px-6 py-6">
                            <div class="row justify-content-between">
                                <div class="col-lg-4 col-md-6 col-12 mb-2 mb-lg-0">
                                    <form class="d-flex" role="search">
                                        <input class="form-control" type="search" placeholder="상품 검색"
                                               aria-label="Search"/>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div class="card-body p-0">
                            <div class="table-responsive">
                                <table class="table table-centered table-hover text-nowrap table-borderless mb-0 product-table">
                                    <thead class="bg-light">
                                    <tr>
                                        <th></th>
                                        <th>상품명</th>
                                        <th>카테고리</th>
                                        <th>가격</th>
                                        <th>상품 등록일</th>
                                        <th>삭제</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${products}" var="product">
                                        <tr class="table">
                                            <td><img
                                                    src="https://rentally.s3.ap-northeast-2.amazonaws.com/${product.category_seq}/${product.product_img}"
                                                    width="48" height="48"></td>
                                            <td class="product-name">${product.product_name}</td>
                                            <td>${product.category_name}</td>
                                            <td><fmt:formatNumber value="${product.product_pay}" type="number"
                                                                  pattern="#,###"/>원
                                            </td>
                                            <td>${product.product_date}</td>
                                            <td class="text-center">
                                                <button class="btn btn-link p-0"
                                                        onclick="deleteProductBySeq(${product.product_seq})">
                                                    <i class="bi bi-trash me-3"></i>
                                                </button>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <c:set var="baseUrl" value="../product/list"/>
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
