<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <%@ include file="../common/headMeta.jsp" %>
    <%@ include file="../common/headLinks.jsp" %>
    <c:set var="page" value="products"/>
    <title>상품 관리 - Rentally</title>
    <style>
        th, td {
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
                            <h2>상품 관리</h2>
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb mb-0">
                                    <li class="breadcrumb-item"><a href="${path}/main">Home</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">상품 리스트</li>
                                </ol>
                            </nav>
                        </div>
                        <div>
                            <a href="${path}/admin/product/add" class="btn btn-info">Add Product</a>
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
                                        <input class="form-control" id="searchKeyWord" placeholder="Search"/>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div class="card-body p-0">
                            <div class="table-responsive">
                                <table class="table table-centered table-hover text-nowrap table-borderless mb-0 product-table"
                                       id="board_dataTable">
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
<!-- 알림용 modal -->
<div class="modal fade" id="alertModal" tabindex="-1" aria-labelledby="alertModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="alertModalLabel">알림</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body" id="alertModalMessage"></div>
            <div class="modal-footer">
                <button type="button" id="alertModalConfirm" class="btn btn-info" data-bs-dismiss="modal">확인</button>
            </div>
        </div>
    </div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="${path}/resources/js/admin/paging.js"></script>
<script src="${path}/resources/js/admin/productSearch.js"></script>
<script src="${path}/resources/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<script src="${path}/resources/libs/simplebar/dist/simplebar.min.js"></script>
<script>
    let page = 0;
    let searchKeyWord;

    $('#features').on('input', function () {
        let lines = $(this).val().split("\n").slice(0, 3);
        $(this).val(lines.join("\n"));
    });

    function showModalMessage(message) {
        $('#alertModalMessage').text(message);
        $('#alertModal').modal('show');
    }

    $("#searchKeyWord").on("input", function () {
        page = 0;
        search('${path}', page);
    });


    $("#pagingBar").on("click", "a", function () {
        page = $(this).data("page");
        search('${path}', page);
    })

    $(document).ready(function () {
        search('${path}', page);
    });

    function deleteProduct(productSeq) {
        $.ajax({
            url: `${path}/admin/\${productSeq}/delete`,
            type: "post",
            success: function (responseData) {
                isSuccess = true;
                showModalMessage(`삭제에 성공했습니다.`);
                search('${path}', page);
            },
            error: function (err) {
                isSuccess = false;
                showModalMessage(`삭제에 성공했습니다.`);
            }
        });
    }
</script>
</body>
</html>
