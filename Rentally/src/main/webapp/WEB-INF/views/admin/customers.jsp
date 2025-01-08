<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <%@ include file="../common/headMeta.jsp" %>
    <%@ include file="../common/headLinks.jsp" %>
    <c:set var="page" value="customers"/>
    <title>고객 관리 - Rentally</title>
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
                        <h2>고객 관리</h2>
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb mb-0">
                                <li class="breadcrumb-item"><a href="${path}/main">Home</a></li>
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
                                <table id="board_dataTable" class="table table-centered table-hover table-borderless mb-0 customer-table text-nowrap">
                                    <thead class="bg-light">
                                    <tr>
                                        <th>ID</th>
                                        <th>이름</th>
                                        <th>Email</th>
                                        <th>Phone</th>
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
<script src="${path}/resources/css/theme.min.js"></script>
<script src="${path}/resources/js/admin/customers.js"></script>
<script src="${path}/resources/js/admin/initializePagination.js"></script>
<script src="${path}/resources/js/admin/loadData.js"></script>
<script src="${path}/resources/js/admin/pagination.js"></script>
<script>
    initializeDefaultPagination('${path}',loadCustomerData);
</script>
</body>
</html>
