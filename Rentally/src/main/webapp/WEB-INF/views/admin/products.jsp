<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:set var="page" value="products"/>
<c:set var="path" value="${pageContext.servletContext.contextPath}" scope="application"></c:set>

<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta content="Codescandy" name="author">
    <title>Products Dashboard eCommerce HTML Template - FreshCart</title>
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
<%@ include file="../common/adminTopNavbar.jsp" %>
<div class="main-wrapper">
    <%@ include file="../common/adminNavbar.jsp" %>
    <!-- main -->
    <main class="main-content-wrapper">
        <div class="container">
            <div class="row mb-8">
                <div class="col-md-12">
                    <!-- page header -->
                    <div class="d-md-flex justify-content-between align-items-center">
                        <div>
                            <h2>Products</h2>
                            <!-- breacrumb -->
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb mb-0">
                                    <li class="breadcrumb-item"><a href="#" class="text-inherit">Dashboard</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Products</li>
                                </ol>
                            </nav>
                        </div>
                        <!-- button -->
                        <div>
                            <a href="../product/add" class="btn btn-primary">Add Product</a>
                        </div>
                    </div>
                </div>
            </div>
            <!-- row -->
            <div class="row">
                <div class="col-xl-12 col-12 mb-5">
                    <!-- card -->
                    <div class="card h-100 card-lg">
                        <div class="px-6 py-6">
                            <div class="row justify-content-between">
                                <!-- form -->
                                <div class="col-lg-4 col-md-6 col-12 mb-2 mb-lg-0">
                                    <form class="d-flex" role="search">
                                        <input class="form-control" type="search" placeholder="Search Products"
                                               aria-label="Search"/>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <!-- card body -->
                        <div class="card-body p-0">
                            <!-- table -->
                            <div class="table-responsive">
                                <table class="table table-centered table-hover text-nowrap table-borderless mb-0 table-with-checkbox">
                                    <thead class="bg-light">
                                    <tr>
                                        <th></th>
                                        <th>Proudct Name</th>
                                        <th>Category</th>
                                        <th>Price</th>
                                        <th>Create at</th>
                                        <th>Remove</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${products}" var="product">
                                        <tr class="table">
                                            <td><img
                                                    src="https://rentally.s3.ap-northeast-2.amazonaws.com/${product.category_seq}/${product.product_img}"
                                                    width="48" height="48"></td>
                                            <td>${product.product_name}</td>
                                            <td>${product.category_name}</td>
                                            <td><fmt:formatNumber value="${product.product_pay}" type="number"
                                                                  pattern="#,###"/>원
                                            </td>
                                            <td>${product.product_date}</td>
                                            <td class="text-center">
                                                <button class="btn btn-link p-0"
                                                        onclick="deleteProduct(${product.product_seq})">
                                                    <i class="bi bi-trash me-3"></i>
                                                </button>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="card-footer d-flex justify-content-between align-items-center p-4">
                            <span>Showing ${currentPage * 10 - 9} to ${currentPage * 10 > totalOrders ? totalOrders : currentPage * 10} of ${totalOrders} entries</span>
                            <nav>
                                <ul class="pagination mb-0">
                                    <!-- Previous Button -->
                                    <c:if test="${currentPage > 1}">
                                        <li class="page-item">
                                            <a class="page-link" href="../product/list?page=${currentPage - 1}&size=10">Previous</a>
                                        </li>
                                    </c:if>

                                    <!-- Page Numbers -->
                                    <c:forEach var="i" begin="1" end="${totalPages}">
                                        <li class="page-item ${currentPage == i ? 'active' : ''}">
                                            <a class="page-link" href="../product/list?page=${i}&size=10">${i}</a>
                                        </li>
                                    </c:forEach>

                                    <!-- Next Button -->
                                    <c:if test="${currentPage < totalPages}">
                                        <li class="page-item">
                                            <a class="page-link" href="../product/list?page=${currentPage + 1}&size=10">Next</a>
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
</div>

<!-- Libs JS -->
<!-- <script src="../assets/libs/jquery/dist/jquery.min.js"></script> -->
<script src="${path}/resources/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<script src="${path}/resources/libs/simplebar/dist/simplebar.min.js"></script>

<!-- Theme JS -->
<script src="${path}/resources/js/theme.min.js"></script>

</body>
</html>
