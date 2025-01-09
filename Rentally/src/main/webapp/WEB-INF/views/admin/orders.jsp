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
                                <table class="table table-centered table-borderless mb-0 order-table text-nowrap"
                                       id="board_dataTable">
                                    <thead class="bg-light">
                                    <tr>
                                        <th></th>
                                        <th>상품 번호</th>
                                        <th>고객명</th>
                                        <th>주문일</th>
                                        <th>결제 수단</th>
                                        <th>월 구독료</th>
                                        <th>구독일</th>
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
<script src="${path}/resources/css/theme.css"></script>
<script src="${path}/resources/js/admin/paging.js"></script>
<script src="${path}/resources/js/admin/orders.js"></script>
<script>
    let page = 0;

    $("#pagingBar").on("click", "a", function () {
        page = $(this).data("page");
        orders('${path}', page);
    })

    $(document).ready(function () {
        orders('${path}', page);
    });
</script>
</body>
</html>
